defmodule DiscotexBot.Application do
  @moduledoc false

  use Application

  alias DiscotexBot.ConversationManager
  alias DiscotexBot.DiscordClient

  def start(type, args) do
    if should_start?(DiscotexBot.DiscordClient) do
      Nostrum.Application.start(type, args)
    end

    Supervisor.start_link(children(), strategy: :one_for_one, name: DiscotexBot.Supervisor)
  end

  defp children do
    [
      maybe_start_child(DiscordClient),
      {Registry, keys: :unique, name: Registry.ChannelContexts},
      maybe_start_child(ConversationManager)
    ]
    |> List.flatten()
  end

  defp maybe_start_child(process) do
    if should_start?(process) do
      process
    else
      []
    end
  end

  defp should_start?(process) do
    Application.get_env(:discotex_bot, process, [])[:enabled] == true
  end
end
