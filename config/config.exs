# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :contact,
  ecto_repos: [Contact.Repo]

# Configures the endpoint
config :contact, ContactWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5nYxq13BnAaedAlRAVV8vOWWQNCF/Evrie7L+srVhcPMFl58x7G6jrEAHZ0Do09B",
  render_errors: [view: ContactWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Contact.PubSub,
  live_view: [signing_salt: "BDXszzc+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
