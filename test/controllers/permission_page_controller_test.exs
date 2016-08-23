defmodule Ectoservice.PermissionPageControllerTest do
  use Ectoservice.ConnCase

  alias Ectoservice.PermissionPage
  @valid_attrs %{actionName: "some content", controllerName: "some content", permission: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, permission_page_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing permissionpages"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, permission_page_path(conn, :new)
    assert html_response(conn, 200) =~ "New permission page"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, permission_page_path(conn, :create), permission_page: @valid_attrs
    assert redirected_to(conn) == permission_page_path(conn, :index)
    assert Repo.get_by(PermissionPage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, permission_page_path(conn, :create), permission_page: @invalid_attrs
    assert html_response(conn, 200) =~ "New permission page"
  end

  test "shows chosen resource", %{conn: conn} do
    permission_page = Repo.insert! %PermissionPage{}
    conn = get conn, permission_page_path(conn, :show, permission_page)
    assert html_response(conn, 200) =~ "Show permission page"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, permission_page_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    permission_page = Repo.insert! %PermissionPage{}
    conn = get conn, permission_page_path(conn, :edit, permission_page)
    assert html_response(conn, 200) =~ "Edit permission page"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    permission_page = Repo.insert! %PermissionPage{}
    conn = put conn, permission_page_path(conn, :update, permission_page), permission_page: @valid_attrs
    assert redirected_to(conn) == permission_page_path(conn, :show, permission_page)
    assert Repo.get_by(PermissionPage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    permission_page = Repo.insert! %PermissionPage{}
    conn = put conn, permission_page_path(conn, :update, permission_page), permission_page: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit permission page"
  end

  test "deletes chosen resource", %{conn: conn} do
    permission_page = Repo.insert! %PermissionPage{}
    conn = delete conn, permission_page_path(conn, :delete, permission_page)
    assert redirected_to(conn) == permission_page_path(conn, :index)
    refute Repo.get(PermissionPage, permission_page.id)
  end
end
