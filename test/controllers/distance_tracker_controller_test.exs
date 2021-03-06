defmodule DistanceTracker.TrackerControllerTest do
  alias DistanceTracker.{ConnCase, Factory, TrackerView, ErrorView}
  use ConnCase
  import Factory

  test "#index renders a list of trackers" do
    conn = build_conn()
    tracker = insert(:tracker)

    conn = get conn, tracker_path(conn, :index)

    assert json_response(conn, 200) ==
      render_json("index.json", trackers: [tracker])
  end

  test "#show renders given tracker when it was found" do
    conn = build_conn()
    tracker = insert(:tracker)

    conn = get conn, tracker_path(conn, :show, tracker.uuid)

    assert json_response(conn, 200) ==
      render_json("show.json", tracker: tracker)
  end

  test "#show renders 404 when not found" do
    conn = build_conn()

    conn = get conn, tracker_path(conn, :show, UUID.uuid4())

    assert json_response(conn, 404) ==
      render_error("404.json")
  end

  test "#create renders newly created tracker when successful" do
    conn = build_conn()
    payload = %{
      "activity" => "climbing",
      "distance" => 150,
      "completed_at" => "2017-03-21T14:00:00Z"
    }

    conn = post conn, tracker_path(conn, :create), Poison.encode!(payload)

    assert json_response(conn, 201) ==
      render_json("show.json", nil)
  end

  defp render_error(template) do
    ErrorView.render(template, [])
    |> Poison.encode!
    |> Poison.decode!
  end

  defp render_json(template, assigns) do
    TrackerView.render(template, Map.new(assigns))
    |> Poison.encode!
    |> Poison.decode!
  end
end
