defmodule DiscotexBot.DiscordClient do
  @moduledoc """
  Chat client adapter for Discord
  """

  use Nostrum.Consumer

  require Logger

  alias DiscotexBot.Dispatch
  alias Nostrum.Api
  alias Nostrum.Cache.Me
  alias Nostrum.Struct.Message

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def send_message(content, channel_id) do
    Api.create_message(channel_id, content)
  end

  def add_reaction(_emoji, _channel_id, _message_id) do
  end

  def get_channel_message(channel_id, message_id) do
    Api.get_channel_message(channel_id, message_id)
  end

  def handle_event(event = {:MESSAGE_CREATE, message = %Message{}, _ws_state}) do
    Logger.info("Event: #{inspect(event)}")
    respond(Dispatch.handle_message_create(message, Me.get()))
  end

  def handle_event(event) do
    Logger.info("Unhandled event: #{inspect(event)}")
  end

  defp respond({:message_create, message, channel_id}) do
    DiscotexBot.send_message(message, channel_id)
  end

  defp respond(:no_action), do: nil
end
