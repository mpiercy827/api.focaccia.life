# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiFocacciaLife.Repo.insert!(%ApiFocacciaLife.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
ApiFocacciaLife.Repo.insert!(
  %ApiFocacciaLife.Focaccia.User{
    name: "Matt",
    email: "matt@lob.com",
    session_token: "test"
  }
)

ApiFocacciaLife.Repo.insert!(
  %ApiFocacciaLife.Focaccia.User{
    name: "Matt Piercy",
    email: "mpiercy@gmail.com",
    session_token: "test2"
  }
)

ApiFocacciaLife.Repo.insert!(
  %ApiFocacciaLife.Focaccia.Cacc{
    caccee_id: 1,
    caccer_id: 2
  }
)
