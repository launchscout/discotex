defmodule Discotex.Repo do
  use Ecto.Repo,
    otp_app: :discotex,
    adapter: Ecto.Adapters.Postgres
end
