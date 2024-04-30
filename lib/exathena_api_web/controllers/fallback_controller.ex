defmodule ExAthenaApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use ExAthenaApiWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:bad_request)
    |> text("Error")
    |> halt()
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> text("Error")
    |> halt()
  end

  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(:bad_request)
    |> text("Error")
    |> halt()
  end
end
