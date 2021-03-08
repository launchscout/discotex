defmodule Discotex.Account.User do
  @moduledoc """
  This module contains functions and Ecto schema related to a user account.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Discotex.DiscordSnowflake

  @type t :: %__MODULE__{
    avatar: binary(),
    invitation_code: Ecto.UUID.t(),
    email: binary(),
    discord_id: integer(),
    github_id: binary(),
    github_email: binary(),
    username: binary(),
    name: binary()
  }

  schema "users" do
    field(:avatar, :string)
    field(:discord_id, DiscordSnowflake)
    field(:email, :string)
    field(:github_id, :string)
    field(:github_email, :string)
    field(:name, :string)
    field(:username, :string)
    field(:invitation_code, Ecto.UUID)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:avatar, :email, :github_id, :github_email, :username, :name, :discord_id, :invitation_code])
    |> validate_required([:email])
    |> unique_constraint(:username, name: :unique_username)
    |> unique_constraint(:email, name: :unique_email)
    |> unique_constraint(:invitation_code, name: :unique_invitation_code)
  end
end
