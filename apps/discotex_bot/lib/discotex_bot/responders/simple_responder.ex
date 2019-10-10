defmodule DiscotexBot.Responders.SimpleResponder do
  @moduledoc """
  A module to handle simple regex call/response interactions
  """

  # remove Discord Struct references
  alias Nostrum.Struct.{Message, User}

  @message_types [
    {~r/\bayy lmao\b/i, :ayy_lmao},
    {~r/\bchoir can\b/i, :choir_can},
    {~r/\bhi\b/i, :hi},
    {~r/\bbees\b/i, :bees},
    {~r/\bdance,? Haley\b/i, :dance_haley},
    {~r/\bdrop the bass\b/i, :drop_the_bass},
    {~r/\bnot saying it.*aliens\b/i, :aliens},
    {~r/^you're welcome$/i, :welcome}
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

  defp do_reply({:aliens, message = %Message{}}) do
    {:message_create, "https://imgflip.com/i/src90", message.channel_id}
  end

  defp do_reply({:ayy_lmao, message = %Message{}}) do
    {:message_create, "https://gph.is/1Fc3HJw", message.channel_id}
  end

  defp do_reply({:choir_can, message = %Message{}}) do
    {:message_create,
     "https://loldamn.com/wp-content/uploads/2017/01/Beer-can-choir-holiday-decoration.jpg",
     message.channel_id}
  end

  defp do_reply({:drop_the_bass, message = %Message{}}) do
    {:message_create, "http://i.imgur.com/yy4QHgx.gif", message.channel_id}
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

  defp do_reply({:welcome, message}) do
    {:message_create, "https://giphy.com/gifs/hqg-tXTqLBYNf0N7W", message.channel_id}
  end

  defp map_message(message = %Message{content: content}) do
    {_, type} =
      Enum.find(@message_types, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end
end
