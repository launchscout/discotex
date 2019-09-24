use Mix.Config

config :discotex_bot, DiscotexBot.SimpleResponder, enabled: true

config :nostrum, token: System.fetch_env!("DISCORD_BOT_TOKEN")
