defmodule DistanceTracker.Factory do
  use ExMachina.Ecto, repo: DistanceTracker.Repo

  def tracker_factory do
    %DistanceTracker.Tracker{
      uuid: UUID.uuid4(),
      distance: 1500,
      activity: "swimming",
      completed_at: DateTime.utc_now()
    }
  end
end
