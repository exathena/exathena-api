defmodule ExAthenaApi.LoginServer do
  @moduledoc """
  The Login Server context
  """
  alias ExAthenaApi.LoginRepo, as: Repo
  alias ExAthenaApi.LoginServer

  def authenticate(%{"AID" => account_id, "AuthToken" => token}) do
    Repo.get_by(LoginServer.Login, account_id: account_id, web_auth_token: token)
  end
end
