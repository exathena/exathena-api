import Config

config :exathena_api, ExAthenaApiWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
