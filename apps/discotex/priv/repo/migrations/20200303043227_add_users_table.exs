defmodule Discotex.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :avatar, :string
      add :email, :string
      add :github_id, :string
      add :username, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:users, [:username], name: :unique_username)
    create unique_index(:users, [:email], name: :unique_email)
  end
end
