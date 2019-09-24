defmodule DiscotexBot.SimpleResponder do
  @moduledoc """
  A simple responder module that connects to discord and listens for events

  Event handling is done in dispatchers
  """

  use Nostrum.Consumer

  alias DiscotexBot.Dispatch
  alias Nostrum.Api
  alias Nostrum.Cache.Me
  alias Nostrum.Struct.Message

  require Logger

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, message = %Message{}, _ws_state}) do
    respond(Dispatch.handle_message_create(message, Me.get()))
  end

  def handle_event(event) do
    Logger.info("Unhandled event: #{inspect(event)}")
  end

  defp respond({:message_create, message, channel_id}) do
    Api.create_message(channel_id, message)
  end
end
