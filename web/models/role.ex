defmodule Ectoservice.Role do
  use Ectoservice.Web, :model

  schema "roles" do
    field :name, :string
    has_many :role_mapping, Ectoservice.RoleMapping
    has_many :permission_page, Ectoservice.PermissionPage

    #timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
