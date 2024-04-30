defmodule ExathenaApi.LoginServerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExathenaApi.LoginServer` context.
  """

  @doc """
  Generate a login.
  """
  def login_fixture(attrs \\ %{}) do
    {:ok, login} =
      attrs
      |> Enum.into(%{
        account_id: 42,
        birthdate: ~D[2024-04-28],
        character_slots: 42,
        email: "some email",
        expiration_time: 42,
        last_ip: "some last_ip",
        lastlogin: ~N[2024-04-28 21:55:00],
        logincount: 42,
        old_group: 42,
        pincode: "some pincode",
        pincode_change: 42,
        sex: "some sex",
        state: 42,
        unban_time: 42,
        user_pass: "some user_pass",
        userid: 42,
        vip_time: 42,
        web_auth_token: "some web_auth_token",
        web_auth_token_enabled: 42
      })
      |> ExathenaApi.LoginServer.create_login()

    login
  end
end
