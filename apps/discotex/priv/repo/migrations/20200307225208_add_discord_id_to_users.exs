defmodule Discotex.Repo.Migrations.AddDiscordIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :discord_id, :bigint
      add :invitation_code, :binary
    end

    create unique_index(:users, [:invitation_code], name: :unique_invitation_code)
  end
end
