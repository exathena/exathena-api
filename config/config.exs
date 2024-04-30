import Config

config :exathena_api,
  namespace: ExAthenaApi,
  ecto_repos: [
    ExAthenaApi.CharRepo,
    ExAthenaApi.LoginRepo,
    ExAthenaApi.MapRepo,
    ExAthenaApi.WebRepo
  ]

config :exathena_api, ExAthenaApi.CharRepo, priv: "priv/repo"
config :exathena_api, ExAthenaApi.LoginRepo, priv: "priv/repo"
config :exathena_api, ExAthenaApi.MapRepo, priv: "priv/repo"
config :exathena_api, ExAthenaApi.WebRepo, priv: "priv/repo"

config :exathena_api, ExAthenaApiWeb.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  url: [host: "localhost"],
  render_errors: [formats: [json: ExAthenaApiWeb.ErrorJSON]],
  pubsub_server: ExAthenaApi.PubSub,
  drainer: [shutdown: 1000],
  live_view: [signing_salt: "sSkY28Di"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
