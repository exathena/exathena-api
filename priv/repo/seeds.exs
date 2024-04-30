alias ExAthenaApi.LoginServer

ExAthenaApi.LoginRepo.insert!(%LoginServer.Login{
  account_id: 1,
  userid: "s1",
  user_pass: "p1",
  sex: :S,
  email: "athena@athena.com"
})
