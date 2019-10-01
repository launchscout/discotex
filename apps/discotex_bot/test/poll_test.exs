defmodule PollTest do
  use ExUnit.Case

  alias DiscotexBot.Dispatch
  alias Nostrum.Struct.{Message, User}

  doctest Dispatch

  @user_id "Rit Tomney1233533"
  test "Discotex can start and evaluate a basic poll" do
    bot = %Nostrum.Struct.User{id: 1, username: "Friendly Frank"}

    message = %Message{
      author: %Nostrum.Struct.User{id: 150, username: "Pollster McPollface"},
      channel_id: 42,
      content: "Poll: 💯 or <:oof:502166950818873365>",
      id: 234
    }

    assert Dispatch.handle_message_create(message, bot) ==
             {:reaction_add, "🗳", message.channel_id, message.id}

    poll_with_votes = %{
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

    results_request_message = %Message{
      author: %Nostrum.Struct.User{id: 150, username: "Pollster McPollface"},
      channel_id: 42,
      content: "<@#{bot.id}> poll results",
      mentions: [bot],
      id: 245
    }

    assert Dispatch.handle_message_create(results_request_message, bot) ==
             {:message_create, "💯 is the winning vote", message.channel_id}
  end
end
