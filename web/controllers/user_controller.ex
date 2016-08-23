defmodule Ectoservice.UserController do
  use Ectoservice.Web, :controller
  #plug :authenticate when action in [:new]

  alias Ectoservice.User
  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "you need to login first to access this page")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
  def allUser(conn, _params)do
    json conn,Poison.Encode.encode!(Repo.all(User))
  end

  def index(conn, _params) do
    #case authenticate conn do
      # %Plug.Conn{halted: true} =conn ->
      #   conn
      #   conn ->
          users=Repo.all(User)
          IO.inspect Map.get(Map.get(conn, :private), :phoenix_action)
          IO.inspect Map.get(Map.get(conn, :private), :phoenix_controller)
          render conn, "index.html", users: users
    # end
  end

  def new(conn, _params) do
    changeset=User.changeset(%User{})
    #IO.inspect conn
    render conn, "new.html", changeset: changeset
  #  redirect conn, external: "/"
  end

  def create(conn, %{"user" => user_param}) do
    #IO.inspect user_param
    changeset=User.registration_changeset(%User{}, user_param)
    #IO.inspect changeset
    case Repo.insert(changeset) do
    {:ok, user} ->
    conn
    |> Ectoservice.Auth.login(user)
    |> put_flash(:info, "#{user.name} created!")
    |> redirect(to: user_path(conn, :index))
    {:error, changeset} ->
      render conn, "new.html", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    #IO.inspect  id
      user= Repo.get_by!(User, id: id )
      IO.inspect user.name
      #IO.inspect  Map.get(@user,"name")
    render  conn, "show.html", user: %{ "name"=> user.name,"id" => user.id, "details" => user.details}
  end

  def index(conn, _params) do
    users= Repo.all(User)
    render conn, "index.html", users: users
  end

end
