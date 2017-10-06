defmodule ApiFocacciaLife.Repo.Migrations.CreateCacces do
  use Ecto.Migration

  def change do
    create table(:cacces) do
      add :caccer_id, references(:users)
      add :caccee_id, references(:users)
      timestamps()
    end

  end
end
