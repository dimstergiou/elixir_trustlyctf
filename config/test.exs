use Mix.Config

# Configure your database
config :elixir_trustlyctf, ElixirTrustlyctf.Repo,
  username: "postgres",
  password: "postgres",
  database: "elixir_trustlyctf_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_trustlyctf, ElixirTrustlyctfWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
