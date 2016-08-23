defmodule Ectoservice.RoleMappingController do
  use Ectoservice.Web, :controller

  alias Ectoservice.RoleMapping

  def index(conn, _params) do
    rolemappings = Repo.all(RoleMapping)
    render(conn, "index.html", rolemappings: rolemappings)
  end

  def new(conn, _params) do
    changeset = RoleMapping.changeset(%RoleMapping{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role_mapping" => role_mapping_params}) do
    changeset = RoleMapping.changeset(%RoleMapping{}, role_mapping_params)

    case Repo.insert(changeset) do
      {:ok, _role_mapping} ->
        conn
        |> put_flash(:info, "Role mapping created successfully.")
        |> redirect(to: role_mapping_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    role_mapping = Repo.get!(RoleMapping, id)
    render(conn, "show.html", role_mapping: role_mapping)
  end

  def edit(conn, %{"id" => id}) do
    role_mapping = Repo.get!(RoleMapping, id)
    changeset = RoleMapping.changeset(role_mapping)
    render(conn, "edit.html", role_mapping: role_mapping, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role_mapping" => role_mapping_params}) do
    role_mapping = Repo.get!(RoleMapping, id)
    changeset = RoleMapping.changeset(role_mapping, role_mapping_params)

    case Repo.update(changeset) do
      {:ok, role_mapping} ->
        conn
        |> put_flash(:info, "Role mapping updated successfully.")
        |> redirect(to: role_mapping_path(conn, :show, role_mapping))
      {:error, changeset} ->
        render(conn, "edit.html", role_mapping: role_mapping, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    role_mapping = Repo.get!(RoleMapping, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(role_mapping)

    conn
    |> put_flash(:info, "Role mapping deleted successfully.")
    |> redirect(to: role_mapping_path(conn, :index))
  end
end
