defmodule ExAthenaApi.WebServer.GuildEmblem do
  use Ecto.Schema
  import Ecto.Changeset

  @initial_version 1

  @primary_key {:world_name, :string, autogenerate: false}
  @primary_key {:guild_id, :id, autogenerate: false}

  schema "guild_emblems" do
    field :file_type, Ecto.Enum, values: [:BMP, :GIF]
    field :file_data, :binary
    field :version, :integer, default: @initial_version
  end

  @doc false
  def changeset(guild_emblem, attrs) do
    guild_emblem
    |> cast(attrs, [:world_name, :guild_id, :file_type, :file_data])
    |> validate_required([:world_name, :guild_id, :file_type, :file_data, :version])
    |> validate_number(:guild_id, greater_than: 0)
    |> validate_number(:version, greater_or_equal_than: 0)
    |> validate_emblem_size()
  end

  @doc false
  def update_emblem_changeset(user_config, attrs) do
    user_config
    |> cast(attrs, [:file_type, :file_data])
    |> update_change(:version, &(&1 + 1))
    |> validate_required([:file_type, :file_data, :version])
    |> validate_emblem_size()
  end

  # Max size is 50kb for gif
  @max_gif_emblem_size 50000

  # Min size is 14kb for bitmaps
  @min_bmp_emblem_size 50000

  defp validate_emblem_size(changeset) do
    data = get_field(changeset, :data)
    file_type = get_field(changeset, :file_type)

    case {data, file_type} do
      {nil, _} ->
        changeset

      {_, nil} ->
        changeset

      {data, :GIF} ->
        if byte_size(data) > @max_gif_emblem_size do
          add_error(changeset, :data, "file size is too large for GIFs")
        else
          changeset
        end

      {data, :BMP} ->
        if byte_size(data) < @min_bmp_emblem_size do
          add_error(changeset, :data, "file size is too short for BMPs")
        else
          changeset
        end
    end
  end
end
