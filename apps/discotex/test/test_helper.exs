Mox.defmock(Discotex.TeamApp.RubberDuckClient, for: Discotex.TeamApp.ClientType)

{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Discotex.Repo, :manual)
