ExUnit.start()

{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:wallaby)
{:ok, _} = Application.ensure_all_started(:bypass)

Application.put_env(:wallaby, :base_url, DiscotexWeb.Endpoint.url())
