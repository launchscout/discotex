import Config

config :logger, level: :warning

config :discotex_bot, DiscotexBot.DiscordClient, enabled: true
config :discotex_bot, DiscotexBot.ConversationManager, enabled: true

config :nostrum, token: System.get_env("DISCORD_BOT_TOKEN")
