defmodule ExAthenaApi.CharRepo.Migrations.CreateParty do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:party, primary_key: false, engine: :MyISAM) do
      add :party_id, :"int(11) unsigned", null: false, primary_key: true, auto_increment: true
      add :name, :string, size: 24, null: false, default: ""
      add :exp, :"tinyint(11) unsigned", null: false, default: 0
      add :item, :"tinyint(11) unsigned", null: false, default: 0
      add :leader_id, :"int(11) unsigned", null: false, default: 0
      add :leader_char, :"int(11) unsigned", null: false, default: 0
    end
  end
end
