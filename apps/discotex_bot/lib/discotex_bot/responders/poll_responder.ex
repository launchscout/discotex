defmodule DiscotexBot.Responders.PollResponder do
  @moduledoc """
  Handle stateful (per channel) polls
  """

  alias DiscotexBot.ChannelState
  # remove Discord Struct references
  alias Nostrum.Struct.Message

  @message_types [
    {~r/^poll:.*$/i, :create_poll},
    {~r/poll results$/i, :show_poll_results}
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
    pid = get_channel_state(message.channel_id)
    ChannelState.put(pid, :poll_message_id, message.id)
    {:reaction_add, "🗳", message.channel_id, message.id}
  end

  defp do_reply({:show_poll_results, %{channel_id: channel_id}}) do
    pid = get_channel_state(channel_id)
    message_id = ChannelState.get(pid, :poll_message_id)

    {:ok, message = %Nostrum.Struct.Message{reactions: reactions}} =
      DiscotexBot.get_channel_message(channel_id, message_id)

    name = process_reactions(reactions)

    {:message_create, "#{name} is the winning vote", message.channel_id}
  end

  # def get_poll_results(channel_id, message_id) do
  #   {:ok, %Nostrum.Struct.Message{reactions: reactions}} =
  #     DiscotexBot.get_channel_message(channel_id, message_id)

  #   {name, id} = process_reactions(reactions)
  #   {:ok, %{content: "#{} is the winning reaction"}}
  # end

  defp process_reactions(reactions) do
    %Nostrum.Struct.Message.Reaction{emoji: emoji} =
      Enum.max_by(reactions, fn reaction -> reaction.count end)

    emoji.name
  end

  defp map_message(message = %Message{content: content}) do
    {_, type} =
      Enum.find(@message_types, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end

  defp get_channel_state(channel_id) do
    case Registry.lookup(Registry.ChannelContexts, channel_id) do
      [] -> create_channel_state(channel_id)
      [{pid, _name}] -> pid
    end
  end

  defp create_channel_state(channel_id) do
    name = {:via, Registry, {Registry.ChannelContexts, channel_id}}
    {:ok, pid} = ChannelState.start_link(name: name)
    pid
  end
end
