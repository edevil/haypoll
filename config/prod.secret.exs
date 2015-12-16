use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :haypoll, Haypoll.Endpoint,
  secret_key_base: "zKd7Uakx5n9e2c+5wFeZkEBAYy96pdLMyqY072o/B37aYWF9wO7fQK9Yf0mYBv6M"

# Configure your database
config :haypoll, Haypoll.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: System.get_env("DB_PASS"),
  hostname: System.get_env("DB_HOST"),
  parameters: [tcp_keepalives_idle: "30"],
  database: "haypoll_prod",
  pool_size: 20
