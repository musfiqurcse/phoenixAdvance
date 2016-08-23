defmodule Ectoservice.PageController do
  use Ectoservice.Web, :controller

  def index(conn, _params) do
    IO.inspect "Here we go"
    render conn, "index.html"
  end
end
