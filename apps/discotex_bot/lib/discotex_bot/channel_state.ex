defmodule DiscotexBot.ChannelState do
  @moduledoc """
  Agent to store per-channel key-value pairs
  """

  use Agent

  def start_link(opts) do
    Agent.start_link(fn -> %{} end, name: Keyword.get(opts, :name))
  end

  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
end
