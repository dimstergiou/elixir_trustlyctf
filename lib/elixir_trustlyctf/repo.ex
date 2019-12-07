defmodule ElixirTrustlyctf.Repo do
  use Ecto.Repo,
    otp_app: :elixir_trustlyctf,
    adapter: Ecto.Adapters.Postgres
end
