defmodule DistanceTracker.TrackerControllerTest do
  alias DistanceTracker.{ConnCase, Factory, TrackerView}
  use ConnCase
  import Factory

  test "#index renders a list of trackers" do
    conn = build_conn()
    tracker = insert(:tracker)

    conn = get conn, tracker_path(conn, :index)

    assert json_response(conn, 200) ==
      render_json("index.json", trackers: [tracker])
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    TrackerView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end
