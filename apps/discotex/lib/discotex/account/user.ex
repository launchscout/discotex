defmodule Discotex.Account.User do
  @moduledoc """
  This module contains functions and Ecto schema related to a user account.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{
          avatar: binary(),
          email: binary(),
          github_id: binary(),
          username: binary(),
          name: binary()
        }

  schema "users" do
    field(:avatar, :string)
    field(:email, :string)
    field(:github_id, :string)
    field(:username, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:avatar, :email, :github_id, :username, :name])
    |> validate_required([:email, :username, :github_id])
    |> unique_constraint(:username, name: :unique_username)
    |> unique_constraint(:email, name: :unique_email)
  end
end
