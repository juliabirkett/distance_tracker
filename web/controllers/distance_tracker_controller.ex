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

  def create(conn, params) do
    {:ok, date, _} = DateTime.from_iso8601(params["completed_at"])

    changeset = Tracker.changeset(%Tracker{}, params)

    with {:ok, tracker} <- Repo.insert(changeset) do
      conn
      |> put_status(201)
      |> render("show.json", tracker: tracker)
    else
      {:error, _error} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", [])
    end
  end
end
