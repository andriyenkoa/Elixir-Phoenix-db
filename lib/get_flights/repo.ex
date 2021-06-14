defmodule GetFlights.Repo do
  use Ecto.Repo,
    otp_app: :get_flights,
    adapter: Ecto.Adapters.Postgres
end
