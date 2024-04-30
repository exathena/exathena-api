defmodule ExAthenaApi.MapRepo do
  use Ecto.Repo,
    otp_app: :exathena_api,
    adapter: Ecto.Adapters.MyXQL
end
