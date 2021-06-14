defmodule GetFlights.Management.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "flights" do
    field :arrivaldate, :integer
    field :arrivaltime, :integer
    field :departuredate, :integer
    field :departuretime, :integer
    field :destination, :string
    field :flight_id, :integer
    field :number, :string
    field :origin, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:flight_id, :origin, :destination, :departuredate, :departuretime, :arrivaldate, :arrivaltime, :number])
    |> validate_required([:flight_id, :origin, :destination, :departuredate, :departuretime, :arrivaldate, :arrivaltime, :number])
  end
end
