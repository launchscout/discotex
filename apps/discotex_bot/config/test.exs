import Config

config :discotex_bot, DiscotexBot.DiscordClient, enabled: false
config :discotex_bot, DiscotexBot.ConversationManager, enabled: false
config :discotex_bot, DiscotexBot.ChatClient, adapter: DiscotexBot.RubberDuckClient
