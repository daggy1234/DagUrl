defmodule Dagurl.Repo do
  use Ecto.Repo,
    otp_app: :dagurl,
    adapter: Ecto.Adapters.Postgres
end
