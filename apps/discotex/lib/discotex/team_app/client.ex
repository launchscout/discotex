defmodule Discotex.TeamApp.Client do
  @behaviour Discotex.TeamApp.ClientType

  @impl true
  def missing_timesheets() do
    with {:ok, resp} <-
           HTTPoison.get(
             "https://team.gaslight.co/missing_timesheets",
             [{"X_API_KEY", "#{api_key()}"}]
           ),
         {:ok, parsed_body} <- Jason.decode(resp.body) do
      parsed_body["people"]
    end
  end

  def api_key() do
    Application.get_env(:discotex, :team_app_api_key, "")
  end
end
