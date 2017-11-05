defmodule DistanceTracker.TrackerViewTest do
  alias DistanceTracker.{ModelCase, TrackerView, Factory}
  use ModelCase
  import Factory

  test "renders index.json" do
    tracker = build(:tracker)

    assert TrackerView.render("index.json", %{trackers: [tracker]}) ==
      rendered_trackers(%{trackers: [tracker]})
  end

  def rendered_tracker(%{tracker: tracker}) do
    %{
      data: render_data(tracker)
    }
  end

  def rendered_trackers(%{trackers: trackers}) do
    %{
      data: Enum.map(trackers, &render_data/1)
    }
  end

  def render_data(tracker) do
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
