defmodule ApiFocacciaLife.Focaccia.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiFocacciaLife.Focaccia.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :session_token, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :session_token])
    |> unique_constraint(:email)
    |> validate_required([:name, :email, :session_token])
  end
end
