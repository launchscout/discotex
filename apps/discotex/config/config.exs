# Since configuration is shared in umbrella projects, this file
# should only configure the :discotex application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :discotex,
  ecto_repos: [Discotex.Repo]

import_config "#{Mix.env()}.exs"
