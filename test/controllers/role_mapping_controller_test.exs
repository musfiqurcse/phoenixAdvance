defmodule Ectoservice.RoleMappingControllerTest do
  use Ectoservice.ConnCase

  alias Ectoservice.RoleMapping
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, role_mapping_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing rolemappings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, role_mapping_path(conn, :new)
    assert html_response(conn, 200) =~ "New role mapping"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, role_mapping_path(conn, :create), role_mapping: @valid_attrs
    assert redirected_to(conn) == role_mapping_path(conn, :index)
    assert Repo.get_by(RoleMapping, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, role_mapping_path(conn, :create), role_mapping: @invalid_attrs
    assert html_response(conn, 200) =~ "New role mapping"
  end

  test "shows chosen resource", %{conn: conn} do
    role_mapping = Repo.insert! %RoleMapping{}
    conn = get conn, role_mapping_path(conn, :show, role_mapping)
    assert html_response(conn, 200) =~ "Show role mapping"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, role_mapping_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    role_mapping = Repo.insert! %RoleMapping{}
    conn = get conn, role_mapping_path(conn, :edit, role_mapping)
    assert html_response(conn, 200) =~ "Edit role mapping"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    role_mapping = Repo.insert! %RoleMapping{}
    conn = put conn, role_mapping_path(conn, :update, role_mapping), role_mapping: @valid_attrs
    assert redirected_to(conn) == role_mapping_path(conn, :show, role_mapping)
    assert Repo.get_by(RoleMapping, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    role_mapping = Repo.insert! %RoleMapping{}
    conn = put conn, role_mapping_path(conn, :update, role_mapping), role_mapping: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit role mapping"
  end

  test "deletes chosen resource", %{conn: conn} do
    role_mapping = Repo.insert! %RoleMapping{}
    conn = delete conn, role_mapping_path(conn, :delete, role_mapping)
    assert redirected_to(conn) == role_mapping_path(conn, :index)
    refute Repo.get(RoleMapping, role_mapping.id)
  end
end
