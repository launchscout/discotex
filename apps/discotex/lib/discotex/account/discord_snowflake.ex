defmodule Discotex.DiscordSnowflake do
  use Ecto.Type
  def type, do: :bigint

  @typedoc """
  A discord unique identifier, 64 bit unsigned integer
  """
  @type t :: integer()

  def cast(snowflake) when is_integer(snowflake) do
    {:ok, snowflake}
  end

  def cast(_), do: :error

  def load(snowflake) when is_integer(snowflake) do
    {:ok, snowflake}
  end

  def dump(snowflake) when is_integer(snowflake), do: {:ok, snowflake}
  def dump(_), do: :error
end
