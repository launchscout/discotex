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

  test "Discotex responds to Hi" do
    message = %Message{content: "Hi", author: %User{id: @user_id}, channel_id: 5}

    assert Dispatch.handle_message_create(message, nil) ==
             {:message_create, "Hi, <@#{@user_id}>", 5}
  end

  @bees_url "http://i.imgur.com/qrLEV.gif"
  test "Discotex responds to bees" do
    message = %Message{content: "bees", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @bees_url, 5}
  end

  test "Discotex responds to BEES" do
    message = %Message{content: "BEES", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @bees_url, 5}
  end

  @haley_url "http://i.imgur.com/92H3YUk.gif"
  test "responds to dance Haley" do
    message = %Message{content: "dance Haley", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @haley_url, 5}
  end
end
