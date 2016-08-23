defmodule Ectoservice.ProductController do
    use Ectoservice.Web, :controller
    def index(conn, _params) do
      render conn, "new.html"
    end

end
