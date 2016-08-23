defmodule Ectoservice.Auth do
  import Plug.Conn
  import Comeonin.Bcrypt
  def init(opts) do
    Keyword.fetch!(opts, :repo )
  end
  def login_by_username_and_pass(conn, username, givenpass, opts) do
    repo= Keyword.fetch!(opts, :repo)
    user=repo.get_by(Ectoservice.User, username: username)
    cond do
      user&&checkpw(givenpass, user.password_hash) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def call(conn, repo) do
    user_id=get_session conn, :user_id
    user =user_id&&repo.get(Ectoservice.User, user_id)
    assign conn, :current_user, user
  end
  def login(conn,user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end
  def logout(conn) do
    configure_session conn, drop: true  
  end

end
