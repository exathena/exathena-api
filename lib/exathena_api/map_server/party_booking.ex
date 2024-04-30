defmodule ExAthenaApi.MapServer.PartyBooking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "party_bookings" do
    field :world_name, :string
    field :account_id, :integer
    field :char_id, :integer
    field :char_name, :string
    field :purpose, :integer, default: 0
    field :assist, :integer, default: 0
    field :damagedealer, :integer, default: 0
    field :healer, :integer, default: 0
    field :tanker, :integer, default: 0
    field :minimum_level, :integer
    field :maximum_level, :integer
    field :comment, :string, default: ""

    timestamps(updated_at: false, inserted_at: :created)
  end

  @doc false
  def changeset(party_booking, attrs) do
    party_booking
    |> cast(attrs, [
      :world_name,
      :account_id,
      :char_id,
      :char_name,
      :purpose,
      :assist,
      :damagedealer,
      :healer,
      :tanker,
      :minimum_level,
      :maximum_level,
      :comment,
      :created
    ])
    |> validate_required([
      :world_name,
      :account_id,
      :char_id,
      :char_name,
      :purpose,
      :assist,
      :damagedealer,
      :healer,
      :tanker,
      :minimum_level,
      :maximum_level,
      :comment,
      :created
    ])
  end
end
