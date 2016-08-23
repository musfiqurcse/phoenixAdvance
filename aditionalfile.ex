#you can add a layout to the controller like:
#```
defmodule Example.PageController do
  use Example.Web, :controller

  plug :put_layout, :other_layout

  def index(conn, _params) do
    render conn, "index.html"
  end
end
#```
#or to a single action like:
  def index(conn, _params) do
    conn
    |> put_layout(:other_layout)
    |> render("index.html")
  end
