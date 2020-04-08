defmodule DiscotexBot.RollResponderTest do
  use ExUnit.Case

  alias DiscotexBot.Dispatch
  alias Nostrum.Struct.{Message, User}

  doctest Dispatch

  test "Discotex responds to roll 1d20" do
    message = %Message{content: "roll 1d20", channel_id: 5}

    assert {:message_create, number, 5} = Dispatch.handle_message_create(message, nil)
    assert String.to_integer(number) in 1..20
  end

  test "Discotex responds to roll 1d20+2" do
    message = %Message{content: "roll 1d20+2", channel_id: 5}

    assert {:message_create, number, 5} = Dispatch.handle_message_create(message, nil)
    assert String.to_integer(number) in 3..22
  end

  test "Discotex responds to roll over" do
    message = %Message{content: "roll over", channel_id: 5}

    assert Dispatch.handle_message_create(message, nil) ==
             {:message_create, "I don't know how to roll that.", 5}
  end
end
