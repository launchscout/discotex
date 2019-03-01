defmodule DiscotexBotTest do
  use ExUnit.Case
  doctest DiscotexBot

  test "greets the world" do
    assert DiscotexBot.hello() == :world
  end
end
