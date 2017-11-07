defmodule DistanceTracker.TrackerView do
  use DistanceTracker.Web, :view

  def render("index.json", %{trackers: trackers}) do
    %{
      data: trackers |> render_many(DistanceTracker.TrackerView, "tracker.json")
    }
  end

  def render("show.json", %{tracker: tracker}) do
    %{
      data: tracker |> render_one(DistanceTracker.TrackerView, "tracker.json")
    }
  end

  def render("tracker.json", %{tracker: tracker}) do
    %{
      uuid: tracker.uuid,
      activity: tracker.activity,
      distance: tracker.distance,
      completed_at: tracker.completed_at,
      inserted_at: tracker.inserted_at,
      updated_at: tracker.updated_at
    }
  end
end
