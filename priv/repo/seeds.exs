# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirTrustlyctf.Repo.insert!(%ElixirTrustlyctf.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ElixirTrustlyctf.Repo
Repo.insert!(%ElixirTrustlyctf.Content{name: "Per", data: "This is a test"})
Repo.insert!(%ElixirTrustlyctf.Content{name: "Dimitrios", data: "I made this"})
Repo.insert!(%ElixirTrustlyctf.Content{name: "Nick", data: "The Greek"})
Repo.insert!(%ElixirTrustlyctf.Content{name: "flag", data: "flag{lego}"})
