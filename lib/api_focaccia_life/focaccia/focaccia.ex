defmodule ApiFocacciaLife.Focaccia do
  @moduledoc """
  The Focaccia context.
  """

  import Ecto.Query, warn: false
  alias ApiFocacciaLife.Repo

  alias ApiFocacciaLife.Focaccia.User

  @google_url_base "https://www.googleapis.com/oauth2/v3/tokeninfo"

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(token) do
    body = authenticate_google(token)

    if body do
      body = Poison.decode!(body)

      attrs = %{
        email: body["email"],
        name: body["name"],
        session_token: body["sub"]
      }

      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()
    end
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  defp authenticate_google(token) do
    response = HTTPoison.get("#{@google_url_base}?id_token=#{token}")

    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
        nil
      _ -> nil
    end
  end


  alias ApiFocacciaLife.Focaccia.Cacc

  @doc """
  Returns the list of cacces.

  ## Examples

      iex> list_cacces()
      [%Cacc{}, ...]

  """
  def list_cacces do
    Repo.all(from c in Cacc, preload: [:caccee, :caccer])
  end

  @doc """
  Gets a single cacc.

  Raises `Ecto.NoResultsError` if the Cacc does not exist.

  ## Examples

      iex> get_cacc!(123)
      %Cacc{}

      iex> get_cacc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cacc!(id), do: Repo.get!(Cacc, id, preload: [:caccee, :caccer])

  @doc """
  Creates a cacc.

  ## Examples

      iex> create_cacc(%{field: value})
      {:ok, %Cacc{}}

      iex> create_cacc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cacc(attrs \\ %{}) do
    %Cacc{}
    |> Cacc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cacc.

  ## Examples

      iex> update_cacc(cacc, %{field: new_value})
      {:ok, %Cacc{}}

      iex> update_cacc(cacc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cacc(%Cacc{} = cacc, attrs) do
    cacc
    |> Cacc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cacc.

  ## Examples

      iex> delete_cacc(cacc)
      {:ok, %Cacc{}}

      iex> delete_cacc(cacc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cacc(%Cacc{} = cacc) do
    Repo.delete(cacc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cacc changes.

  ## Examples

      iex> change_cacc(cacc)
      %Ecto.Changeset{source: %Cacc{}}

  """
  def change_cacc(%Cacc{} = cacc) do
    Cacc.changeset(cacc, %{})
  end
end
