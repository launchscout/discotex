ExUnit.start()

{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:hound)
{:ok, _} = Application.ensure_all_started(:bypass)

Ecto.Adapters.SQL.Sandbox.mode(Discotex.Repo, :manual)
