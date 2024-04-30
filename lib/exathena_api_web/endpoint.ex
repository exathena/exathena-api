defmodule ExAthenaApiWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :exathena_api

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug ExAthenaApiWeb.Router
end
