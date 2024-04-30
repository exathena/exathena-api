defmodule ExAthenaApi.MapRepo.Migrations.CreatePartyBookings do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:party_bookings, primary_key: false, engine: :MyISAM) do
      add :world_name, :string, size: 32, null: false, primary_key: true
      add :account_id, :"int(11) unsigned", null: false, primary_key: true
      add :char_id, :"int(11) unsigned", null: false, primary_key: true
      add :char_name, :string, size: 23, null: false
      add :purpose, :"smallint(5) unsigned", null: false, default: 0
      add :assist, :"tinyint(3) unsigned", null: false, default: 0
      add :damagedealer, :"tinyint(3) unsigned", null: false, default: 0
      add :healer, :"tinyint(3) unsigned", null: false, default: 0
      add :tanker, :"tinyint(3) unsigned", null: false, default: 0
      add :minimum_level, :"smallint(5) unsigned", null: false
      add :maximum_level, :"smallint(5) unsigned", null: false
      add :comment, :string, size: 255, null: false, default: ""

      timestamps(updated_at: false, inserted_at: :created)
    end
  end
end
