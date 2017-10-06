defmodule ApiFocacciaLifeWeb.CaccController do
  use ApiFocacciaLifeWeb, :controller

  alias ApiFocacciaLife.Focaccia
  alias ApiFocacciaLife.Focaccia.Cacc

  action_fallback ApiFocacciaLifeWeb.FallbackController

  def index(conn, _params) do
    cacces = Focaccia.list_cacces()
    render(conn, "index.json", cacces: cacces)
  end

  def create(conn, %{"cacc" => cacc_params}) do
    with {:ok, %Cacc{} = cacc} <- Focaccia.create_cacc(cacc_params) do
      conn
      |> put_status(:created)
      |> render("show.json", cacc: cacc)
    end
  end

  def show(conn, %{"id" => id}) do
    cacc = Focaccia.get_cacc!(id)
    render(conn, "show.json", cacc: cacc)
  end

  def update(conn, %{"id" => id, "cacc" => cacc_params}) do
    cacc = Focaccia.get_cacc!(id)

    with {:ok, %Cacc{} = cacc} <- Focaccia.update_cacc(cacc, cacc_params) do
      render(conn, "show.json", cacc: cacc)
    end
  end

  def delete(conn, %{"id" => id}) do
    cacc = Focaccia.get_cacc!(id)
    with {:ok, %Cacc{}} <- Focaccia.delete_cacc(cacc) do
      send_resp(conn, :no_content, "")
    end
  end
end
