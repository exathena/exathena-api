import Config

config :exathena_api, ExAthenaApi.CharRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok_test",
  log: false,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :exathena_api, ExAthenaApi.LoginRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok_test",
  log: false,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :exathena_api, ExAthenaApi.MapRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok_test",
  log: false,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :exathena_api, ExAthenaApi.WebRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok_test",
  log: false,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :exathena_api, ExAthenaApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 8889],
  secret_key_base: "H8HlR4FtUVz8XpPva8VudaZt/GExoyX50gRYlP+WNXzmFJgNIFQ3IqSic9Db1zp3",
  server: false

config :logger, level: :warning
config :phoenix, :plug_init_mode, :runtime
