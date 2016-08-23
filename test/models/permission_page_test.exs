defmodule Ectoservice.PermissionPageTest do
  use Ectoservice.ModelCase

  alias Ectoservice.PermissionPage

  @valid_attrs %{actionName: "some content", controllerName: "some content", permission: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PermissionPage.changeset(%PermissionPage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PermissionPage.changeset(%PermissionPage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
