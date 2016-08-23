defmodule Ectoservice.User do
  use Ectoservice.Web, :model
  #before definie the database there we need to design the model
  #defstruct
  schema "users" do
      field :name, :string
      field :username, :string
      field :age, :integer
      field :details, :string
      field :password, :string, virtual: true
      field :password_hash, :string
      has_many :role_Mapping, Ectoservice.RoleMapping
      timestamps
  end

  def changeset(model,params \\ :empty) do
    model
    |> cast(params, ~w(name username age details), [])
    #validation works in here
    |> validate_length(:username, min: 1,max: 20)
  end
  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 4, max: 255)
    |> put_pass_hash()
  end
  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset
    end
  end
end
