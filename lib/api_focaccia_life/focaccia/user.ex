defmodule ApiFocacciaLife.Focaccia.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiFocacciaLife.Focaccia.{Cacc, User}


  schema "users" do
    field :email, :string
    field :name, :string
    field :session_token, :string

    has_many :cacces_performed, Cacc, foreign_key: :caccer_id
    has_many :cacces_received, Cacc, foreign_key: :caccee_id

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :session_token])
    |> cast_assoc(:cacces_performed, required: true)
    |> cast_assoc(:cacces_received, required: true)
    |> unique_constraint(:email)
    |> validate_required([:name, :email, :session_token])
  end
end
