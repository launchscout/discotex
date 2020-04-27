defmodule DiscotexBot.SimpleResponderTest do
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

  test "Discotex does not respond to high" do
    message = %Message{content: "high", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == :no_action
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

  test "Discotex does not respond to beeswax" do
    message = %Message{content: "beeswax", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == :no_action
  end

  @welcome_gif "https://giphy.com/gifs/hqg-tXTqLBYNf0N7W"
  test "Discotex responds to you're welcome" do
    message = %Message{content: "you're welcome", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @welcome_gif, 5}
  end

  test "Discotex doesn't respond to you're welcome along with other stuff in the message" do
    message = %Message{
      content: "hello you're welcome",
      author: %User{id: @user_id},
      channel_id: 5
    }

    assert Dispatch.handle_message_create(message, nil) == :no_action
  end

  @haley_url "http://i.imgur.com/92H3YUk.gif"
  test "responds to dance Haley" do
    message = %Message{content: "dance Haley", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @haley_url, 5}
  end

  test "responds to dance, Haley" do
    message = %Message{content: "dance, Haley", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @haley_url, 5}
  end

  test "responds to DANCE, HALEY!!" do
    message = %Message{content: "DANCE, HALEY!!", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @haley_url, 5}
  end

  test "doesn't respond to badance Haleyyyy" do
    message = %Message{content: "badance Haleyyyy", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == :no_action
  end

  @tim_url "https://media.giphy.com/media/VJrZER9jC0RY4WA8DJ/giphy.gif"
  test "responds to dance tim" do
    message = %Message{content: "dance tim", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @tim_url, 5}
  end

  test "responds to dance, Tim" do
    message = %Message{content: "dance, Tim", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @tim_url, 5}
  end

  @gir_url "https://tenor.com/view/dancing-gir-dog-invader-zim-gif-9005622"
  test "responds to dance gir" do
    message = %Message{content: "dance Gir", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @gir_url, 5}
  end

  test "responds to dance, Gir" do
    message = %Message{content: "dance, Gir", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @gir_url, 5}
  end

  test "responds to DANCE, GIR!!" do
    message = %Message{content: "DANCE, GIR!!", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == {:message_create, @gir_url, 5}
  end

  test "doesn't respond to badance Girrrrr" do
    message = %Message{content: "badance Girrrrr", author: %User{id: @user_id}, channel_id: 5}
    assert Dispatch.handle_message_create(message, nil) == :no_action
  end

  test "responds to not saying it's aliens" do
    message = %Message{
      content: "not saying it's aliens",
      author: %User{id: @user_id},
      channel_id: 5
    }

    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to ayy lmao" do
    message = %Message{content: "ayy lmao", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to drop the bass" do
    message = %Message{content: "drop the bass", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to catbug me" do
    message = %Message{content: "catbug me", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to enlighten me" do
    message = %Message{content: "enlighten me", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to choir can" do
    message = %Message{content: "choir can", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to gob it" do
    message = %Message{content: "gob it", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to heavy breathing" do
    message = %Message{content: "heavy breathing", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to jackie chan" do
    message = %Message{content: "jackie chan", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to kitten me" do
    message = %Message{content: "jackie chan", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to no ragrets" do
    message = %Message{content: "no ragrets", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to thanks obama" do
    message = %Message{content: "thanks obama", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to pizza me" do
    message = %Message{content: "pizza me", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to ship it" do
    message = %Message{content: "ship it", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to this is fine" do
    message = %Message{content: "this is fine", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to validate me" do
    message = %Message{content: "validate me", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to visible confusion" do
    message = %Message{content: "visible confusion", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to shred the gnar" do
    message = %Message{content: "shred the gnar", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end

  test "responds to where's the pizza" do
    message = %Message{content: "where's the pizza", author: %User{id: @user_id}, channel_id: 5}
    {:message_create, _, 5} = assert Dispatch.handle_message_create(message, nil)
  end
end
