defmodule ExAthenaApiWeb.MerchantStoreController do
  use ExAthenaApiWeb, :controller

  alias ExAthenaApi.WebServer

  def show(conn, params) do
    with {:ok, merchant_store} <- WebServer.fetch_merchant_config(params) do
      conn |> put_status(:ok) |> json(merchant_store.data)
    end
  end

  def create(conn, params) do
    with {:ok, merchant_store} <- WebServer.save_merchant_config(params) do
      conn |> put_status(:ok) |> json(merchant_store.data)
    end
  end
end
