defmodule ApiFocacciaLifeWeb.CaccController do
  use ApiFocacciaLifeWeb, :controller

  alias ApiFocacciaLife.Focaccia
  alias ApiFocacciaLife.Focaccia.Cacc

  action_fallback ApiFocacciaLifeWeb.FallbackController

  def index(conn, _params) do
    cacces = Focaccia.list_cacces()
    render(conn, "index.json", cacces: cacces)
  end

  def create(conn, cacc_params) do
    result = Focaccia.create_cacc(cacc_params)
    case result do
      {:ok, %Cacc{} = cacc} ->
        conn
        |> put_status(:created)
        |> render("show.json", cacc: cacc)
      {:error, status_code} ->
        conn
        |> put_status(status_code)
    end
  end

end
