use Mix.Config

# Configure your database
config :haypoll, Haypoll.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "haypoll_dev",
  password: System.get_env("DB_PASS"),
  hostname: System.get_env("DB_HOST"),
  parameters: [tcp_keepalives_idle: "30"],
  pool_size: 10
