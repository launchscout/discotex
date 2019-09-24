defmodule DispatchTest do
  use ExUnit.Case

  alias DiscotexBot.Dispatch
  alias Nostrum.Struct.{Message, User}

  doctest Dispatch

  @user_id "Rit Tomney1233533"
  test "Discotex responds to hi" do
    message = %Message{content: "hi", author: %User{id: @user_id}, channel_id: 5}

    assert Dispatch.handle_message_create(message, nil) ==
             {:message_create, "Hi, <@#{@user_id}>", 5}
  end

  @bees_url "http://i.imgur.com/qrLEV.gif"
  test "Discotex responds to bees" do
    message = %Message{content: "bees", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @bees_url, 5}
  end
end
