# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GetFlights.Repo.insert!(%GetFlights.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GetFlights.Repo
alias GetFlights.Management.Project

defmodule GetFlights.Seeds do

  def store_it(row) do
    changeset = Project.changeset(%Project{}, row)
    Repo.insert!(changeset)
  end

end

File.stream!("C:/Users/vukap/phx_projects/get_flights/priv/repo/flights.csv")
|> Stream.drop(1)
|> CSV.decode(headers: [:flight_id, :origin, :destination, :departuredate, :departuretime, :arrivaldate, :arrivaltime, :number])
|> Enum.each(&GetFlights.Seeds.store_it/1)


#File.stream!("C:/Users/vukap/phx_projects/flights_list/priv/repo/flights.csv")
#|> Stream.drop(1)
#|> CSV.decode(headers: [:Id, :Origin, :Destination, :DepartureDate, :DepartureTime, :ArrivalDate, :ArrivalTime, :Number])
#|> Enum.each(fn (map) ->
#  Flights.changeset(
#    %Flights{},
#    %{Id: map[:Id], Origin: map[:Origin], Destination: map[:Destination], DepartureDate: map[:DepartureDate], DepartureTime: map[:DepartureTime], ArrivalDate: map[:ArrivalDate], ArrivalTime: map[:ArrivalTime], Number: map[:Number]}
#  )
#  |> Repo.insert!()
#end)
