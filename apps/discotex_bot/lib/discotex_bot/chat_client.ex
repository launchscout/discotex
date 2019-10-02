defmodule DiscotexBot.ChatClient do
  @callback send_message(binary(), integer()) :: atom()
  @callback add_reaction(binary(), integer(), integer()) :: atom()
  @callback get_channel_message(integer(), integer()) :: {atom(), any()}
end
