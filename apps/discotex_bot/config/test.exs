use Mix.Config

config :discotex_bot, DiscotexBot.SimpleResponder, enabled: false

config :discotex_bot, DiscotexBot.ChatClient, adapter: DiscotexBox.RubberDuckClient

config :nostrum,
  token: "",
  enabled: false
