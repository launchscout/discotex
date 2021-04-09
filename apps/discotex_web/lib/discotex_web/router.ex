defmodule DiscotexWeb.Router do
  use DiscotexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(DiscotexWeb.Auth, repo: Discotex.Repo)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DiscotexWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/discord_invite", PageController, :invite_discord_user
  end

  scope "/auth", DiscotexWeb do
    pipe_through(:browser)

    get("/:provider", AuthController, :index)
    get("/:provider/callback", AuthController, :callback)
    delete("/logout", AuthController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", DiscotexWeb do
  #   pipe_through :api
  # end
end
