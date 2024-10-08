# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo_service_elixir,
       ecto_repos: [TodoServiceElixir.Repo],
       generators: [binary_id: true]

# Configures the endpoint
config :todo_service_elixir, TodoServiceElixirWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "oVNqDsxVTTeARYWbqsbXJsu6IfpQEkQ0kX+lUmhMXSPrYDhYyTNZ2n9a7CPt+fGB",
       render_errors: [view: TodoServiceElixirWeb.ErrorView, accepts: ~w(json), layout: false],
       pubsub_server: TodoServiceElixir.PubSub,
       live_view: [signing_salt: "f35kkwFk"]

# Configures Elixir's Logger
config :logger, :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
