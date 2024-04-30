defmodule ExathenaApiWeb.LoginControllerTest do
  use ExathenaApiWeb.ConnCase

  import ExathenaApi.LoginServerFixtures

  alias ExathenaApi.LoginServer.Login

  @create_attrs %{
    state: 42,
    account_id: 42,
    userid: 42,
    user_pass: "some user_pass",
    sex: "some sex",
    email: "some email",
    unban_time: 42,
    expiration_time: 42,
    logincount: 42,
    lastlogin: ~N[2024-04-28 21:55:00],
    last_ip: "some last_ip",
    birthdate: ~D[2024-04-28],
    character_slots: 42,
    pincode: "some pincode",
    pincode_change: 42,
    vip_time: 42,
    old_group: 42,
    web_auth_token: "some web_auth_token",
    web_auth_token_enabled: 42
  }
  @update_attrs %{
    state: 43,
    account_id: 43,
    userid: 43,
    user_pass: "some updated user_pass",
    sex: "some updated sex",
    email: "some updated email",
    unban_time: 43,
    expiration_time: 43,
    logincount: 43,
    lastlogin: ~N[2024-04-29 21:55:00],
    last_ip: "some updated last_ip",
    birthdate: ~D[2024-04-29],
    character_slots: 43,
    pincode: "some updated pincode",
    pincode_change: 43,
    vip_time: 43,
    old_group: 43,
    web_auth_token: "some updated web_auth_token",
    web_auth_token_enabled: 43
  }
  @invalid_attrs %{state: nil, account_id: nil, userid: nil, user_pass: nil, sex: nil, email: nil, unban_time: nil, expiration_time: nil, logincount: nil, lastlogin: nil, last_ip: nil, birthdate: nil, character_slots: nil, pincode: nil, pincode_change: nil, vip_time: nil, old_group: nil, web_auth_token: nil, web_auth_token_enabled: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all login", %{conn: conn} do
      conn = get(conn, ~p"/api/login")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create login" do
    test "renders login when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/login", login: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/login/#{id}")

      assert %{
               "id" => ^id,
               "account_id" => 42,
               "birthdate" => "2024-04-28",
               "character_slots" => 42,
               "email" => "some email",
               "expiration_time" => 42,
               "last_ip" => "some last_ip",
               "lastlogin" => "2024-04-28T21:55:00",
               "logincount" => 42,
               "old_group" => 42,
               "pincode" => "some pincode",
               "pincode_change" => 42,
               "sex" => "some sex",
               "state" => 42,
               "unban_time" => 42,
               "user_pass" => "some user_pass",
               "userid" => 42,
               "vip_time" => 42,
               "web_auth_token" => "some web_auth_token",
               "web_auth_token_enabled" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/login", login: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update login" do
    setup [:create_login]

    test "renders login when data is valid", %{conn: conn, login: %Login{id: id} = login} do
      conn = put(conn, ~p"/api/login/#{login}", login: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/login/#{id}")

      assert %{
               "id" => ^id,
               "account_id" => 43,
               "birthdate" => "2024-04-29",
               "character_slots" => 43,
               "email" => "some updated email",
               "expiration_time" => 43,
               "last_ip" => "some updated last_ip",
               "lastlogin" => "2024-04-29T21:55:00",
               "logincount" => 43,
               "old_group" => 43,
               "pincode" => "some updated pincode",
               "pincode_change" => 43,
               "sex" => "some updated sex",
               "state" => 43,
               "unban_time" => 43,
               "user_pass" => "some updated user_pass",
               "userid" => 43,
               "vip_time" => 43,
               "web_auth_token" => "some updated web_auth_token",
               "web_auth_token_enabled" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, login: login} do
      conn = put(conn, ~p"/api/login/#{login}", login: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete login" do
    setup [:create_login]

    test "deletes chosen login", %{conn: conn, login: login} do
      conn = delete(conn, ~p"/api/login/#{login}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/login/#{login}")
      end
    end
  end

  defp create_login(_) do
    login = login_fixture()
    %{login: login}
  end
end
