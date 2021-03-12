defmodule DiscotexWeb.Page do
  @moduledoc false

  use Wallaby.DSL

  import Wallaby.Query
  import ExUnit.Assertions

  def flash_info do
    css("[data-test='flash_info']")
  end

  def login(session, user) do
    session
    |> visit("/")
    |> click(css("[data-test='login']"))
  end

  def assert_logged_in(session, user) do
    assert_has(session, css("[data-test='current_user']", text: user.name))
  end
end
