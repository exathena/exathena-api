defmodule ExAthenaApi.WebServer.UserConfig do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:world_name, :string, autogenerate: false}
  @primary_key {:account_id, :id, autogenerate: false}

  schema "user_configs" do
    field :data, :map
  end

  @doc false
  def changeset(user_config, attrs) do
    user_config
    |> cast(attrs, [:world_name, :account_id, :data])
    |> validate_required([:world_name, :account_id, :data])
    |> validate_number(:account_id, greater_than: 0)
  end

  def update_data_changeset(user_config, attrs) do
    user_config
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
