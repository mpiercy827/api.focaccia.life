defmodule ApiFocacciaLifeWeb.UserController do
  use ApiFocacciaLifeWeb, :controller

  alias ApiFocacciaLife.Focaccia
  alias ApiFocacciaLife.Focaccia.User

  action_fallback ApiFocacciaLifeWeb.FallbackController

  def index(conn, _params) do
    users = Focaccia.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Focaccia.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Focaccia.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Focaccia.get_user!(id)

    with {:ok, %User{} = user} <- Focaccia.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Focaccia.get_user!(id)
    with {:ok, %User{}} <- Focaccia.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
