defmodule Ectoservice.PermissionPageController do
  use Ectoservice.Web, :controller

  alias Ectoservice.PermissionPage
  alias Ectoservice.Role

  def index(conn, _params) do
    permissionpages = Repo.all(PermissionPage)
    render(conn, "index.html", permissionpages: permissionpages)
  end

  def new(conn, _params) do
    changeset = PermissionPage.changeset(%PermissionPage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create_permission(conn, _params) do
    permissionpages = Repo.all(PermissionPage)
    roles=Repo.all(Role)

    render conn,  "create_file.html" , permissionpages: permissionpages, roles: roles
  end
  def submit_permission(conn, %{"session" => %{"permission" => _params , "roleid" => roleid}}) do
  #  IO.inspect Map.to_list(_params)
  listItem=for i <- _params do
  IO.inspect  elem(i,1)
  end
    redirect conn, to: permission_page_path(conn, :index)
  end

  def create(conn, %{"permission_page" => permission_page_params}) do
    changeset = PermissionPage.changeset(%PermissionPage{}, permission_page_params)

    case Repo.insert(changeset) do
      {:ok, _permission_page} ->
        conn
        |> put_flash(:info, "Permission page created successfully.")
        |> redirect(to: permission_page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    permission_page = Repo.get!(PermissionPage, id)
    render(conn, "show.html", permission_page: permission_page)
  end

  def edit(conn, %{"id" => id}) do
    permission_page = Repo.get!(PermissionPage, id)
    changeset = PermissionPage.changeset(permission_page)
    render(conn, "edit.html", permission_page: permission_page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "permission_page" => permission_page_params}) do
    permission_page = Repo.get!(PermissionPage, id)
    changeset = PermissionPage.changeset(permission_page, permission_page_params)

    case Repo.update(changeset) do
      {:ok, permission_page} ->
        conn
        |> put_flash(:info, "Permission page updated successfully.")
        |> redirect(to: permission_page_path(conn, :show, permission_page))
      {:error, changeset} ->
        render(conn, "edit.html", permission_page: permission_page, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    permission_page = Repo.get!(PermissionPage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(permission_page)

    conn
    |> put_flash(:info, "Permission page deleted successfully.")
    |> redirect(to: permission_page_path(conn, :index))
  end
end
