defmodule ExAthenaApi.LoginRepo.Migrations.CreateLogin do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:login, primary_key: false, engine: :MyISAM) do
      add :account_id, :"int(11) unsigned",
        null: false,
        primary_key: true,
        start_value: 2_000_000,
        auto_increment: true

      add :userid, :string, size: 23, null: false, default: ""
      add :user_pass, :string, size: 32, null: false, default: ""
      add :sex, :string, size: 1, null: false, default: "M"
      add :email, :string, size: 39, null: false, default: ""
      add :group_id, :tinyint, size: 3, null: false, default: 0
      add :state, :"int(11) unsigned", null: false, default: 0
      add :unban_time, :"int(11) unsigned", null: false, default: 0
      add :expiration_time, :"int(11) unsigned", null: false, default: 0
      add :logincount, :"mediumint(9) unsigned", null: false, default: 0
      add :lastlogin, :utc_datetime
      add :last_ip, :string, size: 100, null: false, default: ""
      add :birthdate, :date
      add :character_slots, :"tinyint(3) unsigned", null: false, default: 0
      add :pincode, :string, size: 4, null: false, default: ""
      add :pincode_change, :integer, null: false, default: 0
      add :vip_time, :"int(11) unsigned", null: false, default: 0
      add :old_group, :tinyint, size: 3, null: false, default: 0
      add :web_auth_token, :string, size: 17
      add :web_auth_token_enabled, :integer, null: false, default: 0
    end

    create index(:login, [:userid])
    create unique_index(:login, [:web_auth_token], name: :web_auth_token_key)
  end
end
