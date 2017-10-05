defmodule ApiFocacciaLifeWeb.PageController do
  use ApiFocacciaLifeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
