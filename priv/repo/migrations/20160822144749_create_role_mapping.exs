defmodule Ectoservice.Repo.Migrations.CreateRoleMapping do
  use Ecto.Migration

  def change do
    create table(:rolemappings) do
      add :user_id, references(:users, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)

      #timestamps()
    end
    
    create index(:rolemappings, [:user_id])
    create index(:rolemappings, [:role_id])

  end
end
