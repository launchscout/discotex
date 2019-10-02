defmodule PollTest do
  use ExUnit.Case

  import Mox

  alias DiscotexBot.Dispatch
  alias Nostrum.Struct.{Message, User}

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  doctest Dispatch

  @channel_id 4234
  @poll_message_id 2334
  test "Discotex can start and evaluate a basic poll" do
    bot = %Nostrum.Struct.User{id: 1, username: "Friendly Frank"}

    message = %Message{
      author: %Nostrum.Struct.User{id: 150, username: "Pollster McPollface"},
      channel_id: @channel_id,
      content: "Poll: 💯 or <:oof:502166950818873365>",
      id: @poll_message_id
    }

    poll_message_with_votes = %{
      message
      | reactions: [
        %Nostrum.Struct.Message.Reaction{
          count: 2,
          emoji: %Nostrum.Struct.Emoji{id: nil, name: "💯"}
},
        %Nostrum.Struct.Message.Reaction{
          count: 1,
          emoji: %Nostrum.Struct.Emoji{id: 243, name: "oof"}
        }
      ]
    }

    DiscotexBot.RubberDuckClient
    |> expect(:add_reaction, fn "🗳", @channel_id, @poll_message_id -> :ok end)
    |> expect(:get_channel_message, fn @channel_id, @poll_message_id -> {:ok, poll_message_with_votes} end)
    |> expect(:send_message, fn "💯 is the winning vote", @channel_id -> :ok end)
    assert Dispatch.handle_message_create(message, bot) ==
             {:reaction_add, "🗳", message.channel_id, message.id}


    results_request_message = %Message{
      author: %Nostrum.Struct.User{id: 150, username: "Pollster McPollface"},
      channel_id: @channel_id,
      content: "<@#{bot.id}> poll results",
      mentions: [bot],
      id: 245
    }

    assert Dispatch.handle_message_create(results_request_message, bot) ==
             {:message_create, "💯 is the winning vote", message.channel_id}
  end
end
