defmodule DiscotexBot.Responders.PollResponder do
  # remove Discord Struct references
  alias Nostrum.Struct.Message

  @message_types [
    {~r/^poll:.*$/i, :create_poll},
    {~r/poll results$/i, :show_poll_results},
  ]

  def responds_to?(message) do
    case map_message(message) do
      {:unknown, _} -> false
      _ -> true
    end
  end

  def handle_message(message) do
    message |> map_message() |> do_reply()
  end

  defp do_reply({:create_poll, message}) do
    {:reaction_add, "🗳", message.channel_id, message.id}
  end

  defp do_reply({:show_poll_results, message}) do
    :no_action
  end

  # def get_poll_results(channel_id, message_id) do
  #   {:ok, %Nostrum.Struct.Message{reactions: reactions}} =
  #     DiscotexBot.get_channel_message(channel_id, message_id)

  #   {name, id} = process_reactions(reactions)
  #   {:ok, %{content: "#{} is the winning reaction"}}
  # end

  # defp process_reactions(reactions) do
  #   %Nostrum.Struct.Message.Reaction{emoji: emoji} =
  #     Enum.max_by(reactions, fn reaction -> reaction.count end)

  #   %Nostrum.Struct.Emoji{name: name, id: id} = emoji
  #   {name, id}
  # end

  defp map_message(message = %Message{content: content}) do
    {_, type} =
      Enum.find(@message_types, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end
end
