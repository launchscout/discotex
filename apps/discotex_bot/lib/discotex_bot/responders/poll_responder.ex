defmodule DiscotexBot.Responders.PollResponder do
  @moduledoc """
  Handle stateful (per channel) polls
  """

  alias DiscotexBot.ChannelState
  # remove Discord Struct references
  alias Nostrum.Struct.{Emoji, Message}

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

  def message_types, do: @message_types

  defp do_reply({:create_poll, message}) do
    pid = get_channel_state(message.channel_id)
    ChannelState.put(pid, :poll_message_id, message.id)
    {:reaction_add, get_emojis_from_message(message.content), message.channel_id, message.id}
  end

  defp do_reply({:show_poll_results, %{channel_id: channel_id}}) do
    pid = get_channel_state(channel_id)
    message_id = ChannelState.get(pid, :poll_message_id)

    {:ok, message = %Message{reactions: reactions}} =
      DiscotexBot.get_channel_message(channel_id, message_id)

    name = process_reactions(reactions)

    {:message_create, "#{name} is the winning vote", message.channel_id}
  end

  defp get_emojis_from_message(message_content) when is_binary(message_content) do
    system_emojis = get_system_emojis_list(message_content)
    custom_emojis = get_custom_emojis_list(message_content)

    system_emojis ++ custom_emojis
  end

  defp get_system_emojis_list(message) do
    message
    |> find_system_emojis()
    |> List.flatten()
  end

  defp find_system_emojis(string), do: Regex.scan(~r/[^[:ascii:]]/u, string)

  defp get_custom_emojis_list(message) do
    message
    |> find_custom_emojis()
    |> List.flatten()
  end

  defp find_custom_emojis(string), do: Regex.scan(~r/<:\w+:\d+>/, string)

  # def get_poll_results(channel_id, message_id) do
  #   {:ok, %Nostrum.Struct.Message{reactions: reactions}} =
  #     DiscotexBot.get_channel_message(channel_id, message_id)

  #   {name, id} = process_reactions(reactions)
  #   {:ok, %{content: "#{} is the winning reaction"}}
  # end

  defp process_reactions(reactions) do
    reactions
    |> Enum.max_by(fn reaction -> reaction.count end)
    |> get_emoji_string()
  end

  defp get_emoji_string(%Message.Reaction{emoji: %Emoji{id: nil, name: name}}), do: name

  defp get_emoji_string(%Message.Reaction{emoji: %Emoji{id: id, name: name}}),
    do: "<:#{name}:#{id}>"

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
