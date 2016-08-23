defmodule Ectoservice.SessionController do
  use Ectoservice.Web, :controller
  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Ectoservice.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome Back")
        |> redirect(external: "/users")
      {:error, _reason, conn} ->
          conn
          |> put_flash(:error, "Invalid Username and Password combination")
          |> render("new.html")
    end
  end
   def delete(conn, _) do
     conn
     |> Ectoservice.Auth.logout()
     |> redirect(to: page_path(conn, :index))
   end
end
