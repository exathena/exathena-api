defmodule ExAthenaApi.WebServer.MerchantConfig do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:world_name, :string, autogenerate: false}
  @primary_key {:guild_id, :id, autogenerate: false}
  @primary_key {:char_id, :id, autogenerate: false}
  @primary_key {:store_type, :id, autogenerate: false}

  schema "merchant_configs" do
    field :data, :map
  end

  @doc false
  def changeset(merchant_config, attrs) do
    merchant_config
    |> cast(attrs, [:world_name, :account_id, :char_id, :store_type, :data])
    |> validate_required([:world_name, :account_id, :char_id, :store_type, :data])
    |> validate_number(:account_id, greater_than: 0)
    |> validate_number(:char_id, greater_than: 0)
  end

  @doc false
  def update_data_changeset(merchant_config, attrs) do
    merchant_config
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
