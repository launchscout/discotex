defmodule DiscotexWeb.AssociatingAccountsTest do
  use DiscotexWeb.FeatureCase

  alias DiscotexWeb.FakeOAuthServer
  alias DiscotexWeb.Page

  setup %{auth_server: auth_server, session: session} do
    user = insert(:user)
    FakeOAuthServer.set_user_response(auth_server, user)

    session
    |> Page.login(user)

    {:ok, user: user}
  end

  test "Logging in", %{user: user} do
    assert user != nil
  end
end
