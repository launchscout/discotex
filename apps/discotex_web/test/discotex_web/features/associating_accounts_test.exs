defmodule AssociatingAccountsTest do
  use DiscotexWeb.FeatureCase

  alias DiscotexWeb.FakeOAuthServer
  alias DiscotexWeb.Page

  setup %{auth_server: auth_server} do
    user = insert(:user)
    FakeOAuthServer.set_user_response(auth_server, user)
    Page.login(user)

    {:ok, user: user}
  end

  test "Logging in", %{user: user} do
    assert user != nil
  end
end
