defmodule DiscotexWeb.AssociatingAccountsTest do
  use DiscotexWeb.FeatureCase

  alias DiscotexWeb.FakeOAuthServer
  alias DiscotexWeb.Page

  setup %{auth_server: auth_server, session: session} do
    user = insert(:user)
    FakeOAuthServer.set_user_response(auth_server, user)

    {:ok, user: user}
  end

  feature "Logging in", %{user: user, session: session} do
    session
    |> Page.login(user)
    |> Page.assert_logged_in(user)
  end
end
