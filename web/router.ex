defmodule DistanceTracker.Router do
  use DistanceTracker.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DistanceTracker do
    pipe_through :api

    resources "/", TrackerController, only: [:index, :show, :create]
  end
end
