defmodule DiscotexBot.ChatClient do
  @moduledoc """
  behaviour definition for a chat client adapter (Discord, mock, etc)
  """

  @callback add_reaction(binary(), integer(), integer()) :: atom()
  @callback create_dm(integer()) :: {atom(), map()}
  @callback get_channel_message(integer(), integer()) :: {atom(), map()}
  @callback send_message(binary(), integer()) :: atom()
  @callback list_guild_emojis(integer()) :: list()
end
