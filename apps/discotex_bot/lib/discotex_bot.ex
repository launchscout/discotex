defmodule DiscotexBot do
  @moduledoc false
  def get_poll_results(channel_id, message_id) do
    {:ok, %Nostrum.Struct.Message{reactions: reactions}} = Nostrum.Api.get_channel_message(channel_id, message_id)
    {name, id} = process_reactions(reactions)
    {:ok, %{content: "#{} is the winning reaction"}}
  end

  defp process_reactions(reactions) do
    %Nostrum.Struct.Message.Reaction{ emoji: emoji } = Enum.max_by(reactions, fn reaction -> reaction.count end)
    %Nostrum.Struct.Emoji{ name: name, id: id } = emoji
    {name, id}
  end

end
