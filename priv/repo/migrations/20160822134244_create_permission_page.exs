defmodule Ectoservice.Repo.Migrations.CreatePermissionPage do
  use Ecto.Migration

  def change do
    create table(:permissionpages) do
      add :controllerName, :string
      add :actionName, :string
      add :permission, :boolean, default: false, null: false
      add :role_id, references(:roles, on_delete: :nothing)

      #timestamps()
    end
    create index(:permissionpages, [:role_id])

  end
end
