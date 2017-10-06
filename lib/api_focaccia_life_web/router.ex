defmodule ApiFocacciaLifeWeb.Router do
  use ApiFocacciaLifeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ApiFocacciaLifeWeb do
    pipe_through :api

    post "/users", UserController, :create
  end
end
