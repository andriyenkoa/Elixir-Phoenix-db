# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :get_flights,
  ecto_repos: [GetFlights.Repo]

# Configures the endpoint
config :get_flights, GetFlightsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QxZTZbb85hnhO/TXiROUQkE9eqa5GOARCxyRJVE5Rt9ArsVaBHU1JOCHtUcufARA",
  render_errors: [view: GetFlightsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GetFlights.PubSub,
  live_view: [signing_salt: "0rMVrwmn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
