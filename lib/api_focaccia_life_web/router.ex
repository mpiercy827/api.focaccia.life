defmodule ApiFocacciaLifeWeb.Router do
  use ApiFocacciaLifeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ApiFocacciaLifeWeb do
    pipe_through :api

    get "/users", UserController, :index
    post "/users", UserController, :create
    get "/cacces", CaccController, :index
  end
end
