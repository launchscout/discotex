defmodule DiscotexBot do
  @moduledoc false
  def send_message(content, channel_id) do
    chat_client().send_message(content, channel_id)
  end

  def add_reaction(emoji, channel_id, message_id) do
    chat_client().add_reaction(emoji, channel_id, message_id)
  end

  def get_channel_message(channel_id, message_id) do
    chat_client().get_channel_message(channel_id, message_id)
  end

  def list_guild_emojis(guild_id) do
    chat_client().list_guild_emojis(guild_id)
  end

  defp chat_client do
    case Application.get_env(:discotex_bot, DiscotexBot.ChatClient) do
      nil -> DiscotexBot.DiscordClient
      opts -> Keyword.get(opts, :adapter)
    end
  end
end
