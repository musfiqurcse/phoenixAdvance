defmodule Ectoservice.PermissionPage do
  use Ectoservice.Web, :model

  schema "permissionpages" do
    field :controllerName, :string
    field :actionName, :string
    field :permission, :boolean, default: false
    belongs_to :role, Ectoservice.Role

    #timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:controllerName, :actionName, :permission])
    |> validate_required([:controllerName, :actionName, :permission])
  end
end
