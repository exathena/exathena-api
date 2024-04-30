defmodule ExAthenaApi.LoginServer.Login do
  use Ecto.Schema

  @primary_key {:account_id, :id, autogenerate: true}
  schema "login" do
    field :userid, :string, default: ""
    field :user_pass, :string, default: ""
    field :sex, Ecto.Enum, values: [:M, :F, :S], default: :M
    field :email, :string, default: ""
    field :group_id, :integer, default: 0
    field :state, :integer, default: 0
    field :unban_time, :integer, default: 0
    field :expiration_time, :integer, default: 0
    field :logincount, :integer, default: 0
    field :lastlogin, :utc_datetime
    field :last_ip, :string, default: ""
    field :birthdate, :date
    field :character_slots, :integer, default: 0
    field :pincode, :string, default: ""
    field :pincode_change, :integer, default: 0
    field :vip_time, :integer, default: 0
    field :old_group, :integer, default: 0
    field :web_auth_token, :string
    field :web_auth_token_enabled, :integer, default: 0
  end
end
