defmodule ExAthenaApi.CharServer.Party do
  use Ecto.Schema

  @primary_key {:party_id, :id, autogenerate: true}
  schema "party" do
    field :name, :string, default: ""
    field :exp, :integer, default: 0
    field :item, :integer, default: 0
    field :leader_id, :integer, default: 0
    field :leader_char, :integer, default: 0
  end
end
