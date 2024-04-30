defmodule ExAthenaApiWeb.AuthPlug do
  use Plug.Builder

  def init(options), do: options

  def call(conn, _options) do
    with :ok <- validate_parameters(conn),
         {:ok, login} <- authenticate(conn) do
      assign(conn, :login, login)
    else
      _ -> bad_request(conn)
    end
  end

  defp validate_parameters(%Plug.Conn{params: params}) do
    if is_map_key(params, "AuthToken") or is_map_key(params, "AID") do
      :ok
    else
      :error
    end
  end

  defp authenticate(%Plug.Conn{params: params}) do
    if login = ExAthenaApi.LoginServer.authenticate(params) do
      {:ok, login}
    else
      :error
    end
  end

  defp bad_request(conn) do
    ExAthenaApiWeb.FallbackController.call(conn, {:error, :bad_request})
  end
end
