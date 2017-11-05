defmodule DistanceTracker.TrackerController do
  use DistanceTracker.Web, :controller

  alias DistanceTracker.{Repo, Tracker}

  def index(conn, _params) do
    render conn, "index.json", trackers: Repo.all(Tracker)
  end
end
