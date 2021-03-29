defmodule DiscotexWeb.PageController do
  use DiscotexWeb, :controller

  alias Discotex.Account
  alias Discotex.Account.User

  def index(conn, _params) do
    changeset = Account.change_discord_invite(%User{})
    render(conn, "index.html", changeset: changeset)
  end

  def invite_discord_user(
        conn,
        %{"user" => %{"discord_id" => discord_id, "email" => email}}
      ) do
    case discord_id
         |> String.to_integer()
         |> Account.invite_discord_user(email) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Invite sent!")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{}} ->
        conn
        |> put_flash(:error, "Something went wrong!")
        |> redirect(to: "/")
    end
  end
end
