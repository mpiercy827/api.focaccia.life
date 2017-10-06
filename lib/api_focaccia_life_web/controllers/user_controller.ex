defmodule ApiFocacciaLifeWeb.UserController do
  use ApiFocacciaLifeWeb, :controller

  import Joken

  alias ApiFocacciaLife.Focaccia
  alias ApiFocacciaLife.Focaccia.User

  action_fallback ApiFocacciaLifeWeb.FallbackController

  def index(conn, _params) do
    users = Focaccia.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"token" => token}) do
    with {:ok, %User{} = user} <- Focaccia.create_user(token) do
      jwt =
        %{
          email: user.email,
          name: user.name,
          session_token: user.session_token
        }
        |> token
        |> with_signer(hs256(System.get_env("JWT_SIGNING_TOKEN")))
        |> sign
        |> get_compact

      conn
      |> put_status(:created)
      |> render("show.json", token: jwt)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Focaccia.get_user!(id)
    render(conn, "show.json", user: user)
  end

end
