defmodule GetFlights.Repo.Migrations.CreateFlights do
  use Ecto.Migration

  def change do
    create table(:flights) do
      add :flight_id, :integer
      add :origin, :string
      add :destination, :string
      add :departuredate, :integer
      add :departuretime, :integer
      add :arrivaldate, :integer
      add :arrivaltime, :integer
      add :number, :string

      timestamps()
    end

  end
end
