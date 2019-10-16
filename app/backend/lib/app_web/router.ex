defmodule AppWeb.Router do
  use AppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", AppWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show]
    resources "/atendees", AtendeeController, only: [:index, :new, :edit]
    resources "/events", EventController, only: [:index, :new, :edit, :show]
    resources "/lists", ListController, only: [:index, :new, :edit, :show]
  end
end