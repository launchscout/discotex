# Since configuration is shared in umbrella projects, this file
# should only configure the :discotex_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :discotex_web, DiscotexWeb.Endpoint,
  http: [port: 4001],
  server: true

config :discotex, :sql_sandbox, true

config :wallaby,
  driver: Wallaby.Chrome,
  # chromedriver: [
  #   headless: false
  # ],
  otp_app: :discotex_web,
  screenshot_on_failure: true
