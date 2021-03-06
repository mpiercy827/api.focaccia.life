defmodule ApiFocacciaLifeWeb.UserView do
  use ApiFocacciaLifeWeb, :view
  alias ApiFocacciaLifeWeb.UserView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{token: jwt}) do
    %{jwt: jwt}
  end

  def render("user.json", %{user: user}) do
    IO.inspect user.cacces_performed
    IO.inspect user.cacces_received
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      session_token: user.session_token,
      cacces_performed: length(user.cacces_performed),
      cacces_received: length(user.cacces_received)
    }
  end
end
