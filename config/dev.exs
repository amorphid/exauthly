use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :newline, Newline.Web.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: ["node_modules/.bin/exit_on_eof", "npm run dev",
    cd: Path.expand("../client", __DIR__)
  ]],
  client_endpoint: "http://localhost:8080"
  # watchers: [npm: ["run", "watch", cd: Path.expand("../assets", __DIR__)]]
  # watchers: [npm: ["run", "start", cd: Path.expand("../assets", __DIR__)]]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# command from your terminal:
#
#     openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout priv/server.key -out priv/server.pem
#
# The `http:` config above can be replaced with:
#
#     https: [port: 4000, keyfile: "priv/server.key", certfile: "priv/server.pem"],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :newline, Newline.Web.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/newline/web/views/.*(ex)$},
      ~r{lib/newline/web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :newline, Newline.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  # database: "newline_dev",
  hostname: "localhost",
  # pool_size: 10
  # username: System.get_env("DATA_DB_USER"),
  # password: System.get_env("DATA_DB_PASS"),
  # hostname: System.get_env("DATA_DB_HOST"),
  database: "newline_dev",
  pool_size: 10


# Configure Guardian secret_key
# Configure Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Newline",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: "pSvhS9/LBddw5CwJGT74UYoyXQSA49kR55IllTzUJHhUMX8pXBYBjsnSzR7W7rrP",
  serializer: Newline.GuardianSerializer
