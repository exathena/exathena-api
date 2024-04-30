defmodule ExathenaApi.LoginServerTest do
  use ExathenaApi.DataCase

  alias ExathenaApi.LoginServer

  describe "login" do
    alias ExathenaApi.LoginServer.Login

    import ExathenaApi.LoginServerFixtures

    @invalid_attrs %{state: nil, account_id: nil, userid: nil, user_pass: nil, sex: nil, email: nil, unban_time: nil, expiration_time: nil, logincount: nil, lastlogin: nil, last_ip: nil, birthdate: nil, character_slots: nil, pincode: nil, pincode_change: nil, vip_time: nil, old_group: nil, web_auth_token: nil, web_auth_token_enabled: nil}

    test "list_login/0 returns all login" do
      login = login_fixture()
      assert LoginServer.list_login() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert LoginServer.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{state: 42, account_id: 42, userid: 42, user_pass: "some user_pass", sex: "some sex", email: "some email", unban_time: 42, expiration_time: 42, logincount: 42, lastlogin: ~N[2024-04-28 21:55:00], last_ip: "some last_ip", birthdate: ~D[2024-04-28], character_slots: 42, pincode: "some pincode", pincode_change: 42, vip_time: 42, old_group: 42, web_auth_token: "some web_auth_token", web_auth_token_enabled: 42}

      assert {:ok, %Login{} = login} = LoginServer.create_login(valid_attrs)
      assert login.state == 42
      assert login.account_id == 42
      assert login.userid == 42
      assert login.user_pass == "some user_pass"
      assert login.sex == "some sex"
      assert login.email == "some email"
      assert login.unban_time == 42
      assert login.expiration_time == 42
      assert login.logincount == 42
      assert login.lastlogin == ~N[2024-04-28 21:55:00]
      assert login.last_ip == "some last_ip"
      assert login.birthdate == ~D[2024-04-28]
      assert login.character_slots == 42
      assert login.pincode == "some pincode"
      assert login.pincode_change == 42
      assert login.vip_time == 42
      assert login.old_group == 42
      assert login.web_auth_token == "some web_auth_token"
      assert login.web_auth_token_enabled == 42
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LoginServer.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{state: 43, account_id: 43, userid: 43, user_pass: "some updated user_pass", sex: "some updated sex", email: "some updated email", unban_time: 43, expiration_time: 43, logincount: 43, lastlogin: ~N[2024-04-29 21:55:00], last_ip: "some updated last_ip", birthdate: ~D[2024-04-29], character_slots: 43, pincode: "some updated pincode", pincode_change: 43, vip_time: 43, old_group: 43, web_auth_token: "some updated web_auth_token", web_auth_token_enabled: 43}

      assert {:ok, %Login{} = login} = LoginServer.update_login(login, update_attrs)
      assert login.state == 43
      assert login.account_id == 43
      assert login.userid == 43
      assert login.user_pass == "some updated user_pass"
      assert login.sex == "some updated sex"
      assert login.email == "some updated email"
      assert login.unban_time == 43
      assert login.expiration_time == 43
      assert login.logincount == 43
      assert login.lastlogin == ~N[2024-04-29 21:55:00]
      assert login.last_ip == "some updated last_ip"
      assert login.birthdate == ~D[2024-04-29]
      assert login.character_slots == 43
      assert login.pincode == "some updated pincode"
      assert login.pincode_change == 43
      assert login.vip_time == 43
      assert login.old_group == 43
      assert login.web_auth_token == "some updated web_auth_token"
      assert login.web_auth_token_enabled == 43
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = LoginServer.update_login(login, @invalid_attrs)
      assert login == LoginServer.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = LoginServer.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> LoginServer.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = LoginServer.change_login(login)
    end
  end
end
