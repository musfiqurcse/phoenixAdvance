defmodule Ectoservice.Repo.Migrations.UpdatesTable do
  use Ecto.Migration
#here changing items, change the corresponding model first
  def change do
    alter table (:users) do
      #rename table(:users), :name, to: :summary
      add :details, :string
end
end
end
