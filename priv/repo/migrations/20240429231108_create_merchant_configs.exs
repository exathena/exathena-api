defmodule ExAthenaApi.WebRepo.Migrations.CreateMerchantConfigs do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:merchant_configs, primary_key: false, engine: :MyISAM) do
      add :world_name, :string, size: 32, null: false, primary_key: true
      add :account_id, :"int(11) unsigned", null: false, primary_key: true
      add :char_id, :"int(11) unsigned", null: false, primary_key: true
      add :store_type, :"tinyint(3) unsigned", null: false, default: 0, primary_key: true
      add :data, :longtext, null: false
    end
  end
end
