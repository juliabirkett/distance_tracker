defmodule DistanceTracker.TrackerController do
  use DistanceTracker.Web, :controller

  alias DistanceTracker.{Repo, Tracker, ErrorView}

  def index(conn, _params) do
    render conn, "index.json", trackers: Repo.all(Tracker)
  end

  def show(conn, %{"id" => id}) do
    with tracker = %Tracker{} <- Repo.get(Tracker, id) do
      render conn, "show.json", tracker: tracker
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", [])
    end
  end
end
