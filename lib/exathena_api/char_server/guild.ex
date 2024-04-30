defmodule ExAthenaApi.CharServer.Guild do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guild" do
    field :name, :string
    field :exp, :integer
    field :master, :string
    field :guild_id, :integer
    field :char_id, :integer
    field :guild_lv, :integer
    field :connect_member, :integer
    field :max_member, :integer
    field :average_lv, :integer
    field :next_exp, :integer
    field :skill_point, :integer
    field :mes1, :string
    field :mes2, :string
    field :emblem_len, :integer
    field :emblem_id, :integer
    field :emblem_data, :binary
    field :last_master_change, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(guild, attrs) do
    guild
    |> cast(attrs, [:guild_id, :name, :char_id, :master, :guild_lv, :connect_member, :max_member, :average_lv, :exp, :next_exp, :skill_point, :mes1, :mes2, :emblem_len, :emblem_id, :emblem_data, :last_master_change])
    |> validate_required([:guild_id, :name, :char_id, :master, :guild_lv, :connect_member, :max_member, :average_lv, :exp, :next_exp, :skill_point, :mes1, :mes2, :emblem_len, :emblem_id, :emblem_data, :last_master_change])
  end
end
