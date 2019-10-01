use Mix.Config

config :discotex_bot, DiscotexBot.SimpleResponder, enabled: true

config :nostrum,
  token: System.get_env("DISCORD_DEV_TOKEN")
