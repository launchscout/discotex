defmodule DiscotexBot.Dispatch do
  @moduledoc """
  Handles events and (eventually) dispatches to other handlers when Discotext becomes sophisticated and stuff
  """

  alias Nostrum.Struct.{Message, User}

  @message_types [{~r/\bhi\b/i, :hi}, {~r/\bbees\b/i, :bees}, {~r/dance Haley/, :dance_haley}]

  def handle_message_create(%Message{author: %User{id: user_id}}, _me = %User{id: user_id}),
    do: :ok

  def handle_message_create(message = %Message{}, _me) do
    message |> parse() |> do_reply()
  end

  defp parse(message = %Message{content: content}) do
    {_, type} =
      Enum.find(@message_types, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end

  defp do_reply({:hi, message = %Message{author: user = %User{}}}) do
    {:message_create, "Hi, #{user}", message.channel_id}
  end

  defp do_reply({:bees, message}) do
    {:message_create, "http://i.imgur.com/qrLEV.gif", message.channel_id}
  end

  defp do_reply({:dance_haley, message}) do
    {:message_create, "http://i.imgur.com/92H3YUk.gif", message.channel_id}
  end

  defp do_reply(_) do
    :no_action
  end
end
