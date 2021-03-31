defmodule DiscotexWeb.FeatureCase do
  @moduledoc false

  use ExUnit.CaseTemplate
  alias Wallaby.Browser

  alias Discotex.Repo
  alias DiscotexWeb.{Endpoint, FakeOAuthServer}
  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Wallaby.DSL
      import Wallaby.Feature

      alias Discotex.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Discotex.Factory
      import DiscotexWeb.Router.Helpers
    end
  end

  setup tags do
    {:ok, session} = Wallaby.start_session(window_size: [width: 1400, height: 900])

    :ok = Sandbox.checkout(Repo)

    unless tags[:async] do
      Sandbox.mode(Repo, {:shared, self()})
    end

    auth_server = FakeOAuthServer.open()

    settings =
      Application.get_env(:discotex, Discotex.OAuth.GitHub)
      |> Keyword.merge(
        client_id: "BOBBY TABLES WAS HERE",
        client_secret: "MR. T WAS HERE",
        site: "http://localhost:#{auth_server.port}",
        authorize_url: "http://localhost:#{auth_server.port}/authorize",
        token_url: "http://localhost:#{auth_server.port}/access_token",
        redirect_uri: "http://localhost:4001/auth/github/callback"
      )

    Application.put_env(:discotex, Discotex.OAuth.GitHub, settings)

    IO.inspect(Application.get_env(:discotex, Discotex.OAuth.GitHub), label: "HERE!")

    {:ok, auth_server: auth_server, session: session}
  end
end
