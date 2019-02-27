defmodule DiscotexWeb.PageController do
  use DiscotexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
