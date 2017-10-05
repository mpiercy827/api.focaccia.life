# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api_focaccia_life,
  ecto_repos: [ApiFocacciaLife.Repo]

# Configures the endpoint
config :api_focaccia_life, ApiFocacciaLifeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3qWoncu0NDYnERMToTnv7UUqjOIy/6l6K9qzhdeA00kXgcTE3oLguJIhjEVDF80n",
  render_errors: [view: ApiFocacciaLifeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ApiFocacciaLife.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
