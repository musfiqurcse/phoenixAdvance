defmodule Ectoservice.Product do
  use Ectoservice.Web, :model
  schema "products" do
    field :name, :string
    field :description, :string
    timestamps
    
  end
end
