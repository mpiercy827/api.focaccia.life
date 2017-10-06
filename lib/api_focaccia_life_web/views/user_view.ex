defmodule ApiFocacciaLifeWeb.UserView do
  use ApiFocacciaLifeWeb, :view
  alias ApiFocacciaLifeWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{token: jwt}) do
    %{jwt: jwt}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      session_token: user.session_token}
  end
end
