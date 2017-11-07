defmodule DistanceTracker.TrackerViewTest do
  alias DistanceTracker.{ModelCase, TrackerView, Factory}
  use ModelCase
  import Factory

  test "renders index.json with data" do
    tracker = build(:tracker)

    assert TrackerView.render("index.json", %{trackers: [tracker]}) ==
      rendered_trackers([tracker])
  end

  test "renders index.json without data" do
    assert TrackerView.render("index.json", %{trackers: []}) ==
      rendered_trackers([])
  end

  test "renders show.json with data" do
    tracker = build(:tracker)

    assert TrackerView.render("show.json", %{tracker: tracker}) ==
      rendered_tracker(tracker)
  end

  test "renders show.json without data" do
    assert TrackerView.render("show.json", %{tracker: nil}) ==
      rendered_tracker(nil)
  end

  def rendered_tracker(tracker) do
    %{
      data: rendered_data(tracker)
    }
  end

  def rendered_trackers(trackers) do
    %{
      data: Enum.map(trackers, &rendered_data/1)
    }
  end

  defp rendered_data(nil), do: nil
  defp rendered_data(tracker) do
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
