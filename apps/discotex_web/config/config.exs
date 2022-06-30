# Since configuration is shared in umbrella projects, this file
# should only configure the :discotex_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
import Config

# General application configuration
config :discotex_web,
  ecto_repos: [Discotex.Repo],
  generators: [context_app: :discotex]

# Configures the endpoint
config :discotex_web, DiscotexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XlE5lmFvHYjjJzqeBdLh4wyjapo/iiu1zpFF9WCWezdYXCYtIh0s2tJDb8TVs/DN",
  render_errors: [view: DiscotexWeb.ErrorView, accepts: ~w(html json)],
  live_view: [
    signing_salt: "LzVbjmMJyi7fO4b3gM+r4ILzQmnn5wLe"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
