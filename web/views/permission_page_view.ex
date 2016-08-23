defmodule Ectoservice.PermissionPageView do
  use Ectoservice.Web, :view
  alias Ectoservice.Role 
  def roleItems(roles)do
    listItem=for i <- roles do
      {i.name, i.id}
    end
    IO.inspect listItem
  end
end
