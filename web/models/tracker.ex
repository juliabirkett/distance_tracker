defmodule DistanceTracker.Tracker do
  use DistanceTracker.Web, :model

  @timestamps_opts [type: :utc_datetime, usec: true]
  @primary_key {:uuid, :binary_id, [autogenerate: true]}

  schema "distance_tracker" do
    field :distance, :integer
    field :activity, :string
    field :completed_at, :utc_datetime

    timestamps()
  end

  def changeset(tracker, params \\ %{}) do
    tracker
    |> cast(params, [:completed_at, :activity, :uuid, :distance])
    |> validate_required([:completed_at, :activity])
  end
end
