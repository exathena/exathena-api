import Config

config :exathena_api, ExAthenaApi.CharRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :exathena_api, ExAthenaApi.LoginRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :exathena_api, ExAthenaApi.MapRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :exathena_api, ExAthenaApi.WebRepo,
  username: "ragnarok",
  password: "ragnarok",
  hostname: "localhost",
  database: "ragnarok",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :exathena_api, ExAthenaApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 8888],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "unXP8AQTgmXxn/mABWiVuD8vYujMUA5IlffN86fDJasOvZ8o+CIai7ZFWk0a46Q2"

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
