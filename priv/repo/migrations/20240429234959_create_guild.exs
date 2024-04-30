defmodule ExAthenaApi.CharRepo.Migrations.CreateGuild do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:guild, primary_key: false, engine: :MyISAM) do
      add :guild_id, :"int(11) unsigned", null: false, primary_key: true, auto_increment: true
      add :name, :string, size: 24, null: false, default: ""
      add :char_id, :"int(11) unsigned", null: false, primary_key: true
      add :master, :string, size: 24, null: false, default: ""
      add :guild_lv, :"tinyint(6) unsigned", null: false, default: 0
      add :connect_member, :"tinyint(6) unsigned", null: false, default: 0
      add :max_member, :"tinyint(6) unsigned", null: false, default: 0
      add :average_lv, :"smallint(6) unsigned", null: false, default: 1
      add :exp, :"bigint(20) unsigned", null: false, default: 0
      add :next_exp, :"bigint(20) unsigned", null: false, default: 0
      add :skill_point, :"tinyint(11) unsigned", null: false, default: 0
      add :mes1, :string, size: 60, null: false, default: ""
      add :mes2, :string, size: 120, null: false, default: ""
      add :emblem_len, :"int(11) unsigned", null: false, default: 0
      add :emblem_id, :"int(11) unsigned", null: false, default: 0
      add :emblem_data, :blob
      add :last_master_change, :utc_datetime
    end

    create index(:guild, [:char_id])
    create unique_index(:guild, [:guild_id], name: :guild_id)
  end
end
