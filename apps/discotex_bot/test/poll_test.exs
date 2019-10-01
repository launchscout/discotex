defmodule PollTest do
  use ExUnit.Case

  alias DiscotexBot.Dispatch
  alias Nostrum.Struct.{Message, User}

  doctest Dispatch

  @user_id "Rit Tomney1233533"
  test "Discotex keeps a running count of reactions" do
    message = %Message{
      content: "hi",
      author: %User{id: @user_id},
      channel_id: 5,
      id: 6,
      reactions: [
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

    assert DiscotexBot.get_poll_results(message.channel_id, message.id) ==
             {:ok, %{content: "💯 is the winning reaction"}}
  end
end
