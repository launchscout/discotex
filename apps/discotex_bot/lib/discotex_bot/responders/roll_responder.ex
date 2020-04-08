defmodule DiscotexBot.Responders.RollResponder do
  @moduledoc """
  A responder that rolls dice for you
  """

  alias Nostrum.Struct.Message

  @message_type [
    {~r/^roll .+/, :roll_dice}
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

  defp do_reply({:roll_dice, %Message{content: content} = message}) do
    {:message_create, create_response(content), message.channel_id}
  end

  @roller_regex ~r/(?<number>\d+)d(?<type>\d+)[\+(?<modifier>\d+)]?/
  defp create_response(message) do
    with captures when is_map(captures) <- Regex.named_captures(@roller_regex, message) do
      captures
      |> Enum.map(fn {k, v} -> {k, String.to_integer(v)} end)
      |> roll_dice()
      |> to_string()
    else
      _ -> "I don't know how to roll that."
    end
  end

  defp roll_dice([{"number", number}, {"type", type}, {"modifier", modifier}]) do
    %{"type" => type, "number" => number}
    |> roll_dice()
    |> Kernel.+(modifier)
  end

  defp roll_dice([{"number", number}, {"type", type}]) do
    1..number
    |> Enum.map(fn _ -> Enum.random(1..type) end)
    |> Enum.sum()
  end

  defp map_message(%Message{content: content} = message) do
    {_, type} =
      Enum.find(@message_type, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end
end
