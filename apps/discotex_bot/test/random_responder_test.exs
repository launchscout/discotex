defmodule DiscotexBot.RandomResponderTest do
  use ExUnit.Case

  alias DiscotexBot.Dispatch
  alias Nostrum.Struct.{Message, User}

  doctest Dispatch

  test "Discotex responds to adventure me" do
    channel_id = 5
    message = %Message{content: "adventure me", author: %User{id: 5}, channel_id: channel_id}
    assert {:message_create, "http" <> _, ^channel_id} = Dispatch.handle_message_create(message, nil)
  end
end
