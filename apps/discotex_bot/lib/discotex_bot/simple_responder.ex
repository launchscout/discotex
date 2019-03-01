defmodule DiscotexBot.SimpleResponder do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias Nostrum.Struct.{Message, User}

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, {message = %Message{}}, _ws_state}) do
    handle_message_create(message, Nostrum.Cache.Me.get())
  end

  def handle_event(event) do
    IO.inspect(event)
  end

  def handle_message_create(%Message{author: %User{id: user_id}}, _me = %User{id: user_id}), do: :ok
  def handle_message_create(message = %Message{}, _me = %User{}) do
    Api.create_message(message.channel_id, message.content)
  end
end
