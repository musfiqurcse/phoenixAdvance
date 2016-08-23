defmodule Ectoservice.RoleMappingTest do
  use Ectoservice.ModelCase

  alias Ectoservice.RoleMapping

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RoleMapping.changeset(%RoleMapping{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RoleMapping.changeset(%RoleMapping{}, @invalid_attrs)
    refute changeset.valid?
  end
end
