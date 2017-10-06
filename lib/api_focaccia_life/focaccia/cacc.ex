defmodule ApiFocacciaLife.Focaccia.Cacc do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiFocacciaLife.Focaccia.{Cacc, User}

  schema "cacces" do
    belongs_to :caccer, User
    belongs_to :caccee, User
    timestamps()
  end

  @doc false
  def changeset(%Cacc{} = cacc, attrs) do
    cacc
    |> cast(attrs, [])
    |> cast_assoc(:caccer, required: true)
    |> cast_assoc(:caccee, required: true)
    |> validate_required([])
  end
end
