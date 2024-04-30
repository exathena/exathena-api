defmodule ExAthenaApi.WebServer do
  @moduledoc """
  The Web Server context
  """
  import Ecto.Query, warn: false

  alias ExAthenaApi.WebRepo, as: Repo
  alias ExAthenaApi.WebServer

  def fetch_char_config(%{"AID" => account_id, "GID" => char_id, "WorldName" => world_name}) do
    query =
      from(WebServer.CharConfig,
        where: [account_id: ^account_id, char_id: ^char_id, world_name: ^world_name]
      )

    if char_config = Repo.one(query) do
      {:ok, char_config}
    else
      {:error, :not_found}
    end
  end

  def fetch_char_config(_attrs), do: {:error, :bad_request}

  def save_char_config(attrs) do
    case fetch_char_config(attrs) do
      {:ok, char_config} -> update_char_config(char_config, attrs)
      {:error, :not_found} -> create_char_config(attrs)
    end
  end

  defp update_char_config(char_config, %{"data" => data}) do
    data = Map.merge(char_config.data, data)

    char_config
    |> WebServer.CharConfig.update_data_changeset(%{data: data})
    |> Repo.update()
  end

  defp create_char_config(attrs) do
    attrs = Map.put_new(attrs, "data", %{"Type" => 1})

    %WebServer.CharConfig{}
    |> WebServer.CharConfig.changeset(attrs)
    |> Repo.insert()
  end

  def fetch_merchant_config(%{
        "AID" => account_id,
        "GID" => char_id,
        "WorldName" => world_name,
        "Type" => store_type
      }) do
    query =
      from(WebServer.MerchantConfig,
        where: [
          account_id: ^account_id,
          char_id: ^char_id,
          world_name: ^world_name,
          store_type: ^store_type
        ]
      )

    if merchant_config = Repo.one(query) do
      {:ok, merchant_config}
    else
      {:error, :not_found}
    end
  end

  def fetch_merchant_config(_attrs), do: {:error, :bad_request}

  def save_merchant_config(attrs) do
    case fetch_merchant_config(attrs) do
      {:ok, merchant_config} -> update_merchant_config(merchant_config, attrs)
      {:error, :not_found} -> create_merchant_config(attrs)
    end
  end

  defp update_merchant_config(merchant_config, %{"data" => data}) do
    data = Map.merge(merchant_config.data, data)

    merchant_config
    |> WebServer.MerchantConfig.update_data_changeset(%{data: data})
    |> Repo.update()
  end

  defp create_merchant_config(attrs) do
    attrs = Map.put_new(attrs, "data", %{})

    %WebServer.MerchantConfig{}
    |> WebServer.MerchantConfig.changeset(attrs)
    |> Repo.insert()
  end

  def fetch_guild_emblem(%{"GDID" => guild_id, "WorldName" => world_name}) do
    query = from(WebServer.GuildEmblem, where: [guild_id: ^guild_id, world_name: ^world_name])

    if guild_emblem = Repo.one(query) do
      {:ok, guild_emblem}
    else
      {:error, :not_found}
    end
  end

  def fetch_guild_emblem(_attrs), do: {:error, :bad_request}

  def save_guild_emblem(attrs) do
    case fetch_guild_emblem(attrs) do
      {:ok, guild_emblem} -> update_guild_emblem(guild_emblem, attrs)
      {:error, :not_found} -> create_guild_emblem(attrs)
    end
  end

  defp update_guild_emblem(guild_emblem, %{"data" => data}) do
    guild_emblem
    |> WebServer.GuildEmblem.update_emblem_changeset(%{data: data})
    |> Repo.update()
  end

  defp create_guild_emblem(attrs) do
    %WebServer.GuildEmblem{}
    |> WebServer.GuildEmblem.changeset(attrs)
    |> Repo.insert()
  end
end
