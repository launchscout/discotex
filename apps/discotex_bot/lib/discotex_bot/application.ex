defmodule DiscotexBot.Application do
  @moduledoc false

  use Application

  alias DiscotexBot.SimpleResponder

  def start(_type, _args) do
    children = [SimpleResponder]

    Supervisor.start_link(children, strategy: :one_for_one, name: DiscotexBot.Supervisor)
  end
end
