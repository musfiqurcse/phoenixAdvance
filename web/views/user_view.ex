defmodule Ectoservice.UserView do
     use Ectoservice.Web, :view
     alias FirstProject.User
    @doc """
      def first_name( %User{name: name} ) do
      name
      |> String.split(" ")
      |> Enum.at(0)
      end
      """
end
