defmodule Ectoservice.RoleMapping do
  use Ectoservice.Web, :model

  schema "rolemappings" do
    belongs_to :user, Ectoservice.User
    belongs_to :role, Ectoservice.Role

    #timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
