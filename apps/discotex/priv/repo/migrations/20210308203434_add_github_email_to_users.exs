defmodule Discotex.Repo.Migrations.AddGithubEmailToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :github_email, :string
    end
  end
end
