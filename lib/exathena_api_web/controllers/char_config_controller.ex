defmodule ExAthenaApiWeb.CharConfigController do
  use ExAthenaApiWeb, :controller

  alias ExAthenaApi.WebServer

  def show(conn, params) do
    with {:ok, char_config} <- WebServer.fetch_char_config(params) do
      render_data(conn, char_config)
    end
  end

  def create(conn, params) do
    with {:ok, char_config} <- WebServer.save_char_config(params) do
      render_data(conn, char_config)
    end
  end

  defp render_data(conn, %WebServer.CharConfig{data: data}) do
    data = Map.put(data, "Type", 1)
    conn |> put_status(:ok) |> json(data)
  end
end
