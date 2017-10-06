defmodule ApiFocacciaLifeWeb.CaccView do
  use ApiFocacciaLifeWeb, :view
  alias ApiFocacciaLifeWeb.CaccView

  def render("index.json", %{cacces: cacces}) do
    %{data: render_many(cacces, CaccView, "cacc.json")}
  end

  def render("show.json", %{cacc: cacc}) do
    %{data: render_one(cacc, CaccView, "cacc.json")}
  end

  def render("cacc.json", %{cacc: cacc}) do
    %{
      id: cacc.id,
      caccer: %{
        name: cacc.caccer.name,
        email: cacc.caccer.email
      },
      caccee: %{
        name: cacc.caccee.name,
        email: cacc.caccee.email
      }
    }
  end
end
