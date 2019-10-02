defmodule DiscotexBot.ChatClient do
  @moduledoc """
  behaviour definition for a chat client adapter (Discord, mock, etc)
  """

  @callback send_message(binary(), integer()) :: atom()
  @callback add_reaction(binary(), integer(), integer()) :: atom()
  @callback get_channel_message(integer(), integer()) :: {atom(), map()}
end
