defmodule ExAthenaApi.WebRepo.Migrations.CreateGuildEmblems do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:guild_emblems, primary_key: false, engine: :MyISAM) do
      add :world_name, :string, size: 32, null: false, primary_key: true
      add :guild_id, :"int(11) unsigned", null: false, primary_key: true
      add :file_type, :string, size: 255, null: false
      add :file_data, :blob
      add :version, :"int(11) unsigned", default: 0, null: false
    end
  end
end
