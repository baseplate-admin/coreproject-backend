defmodule Coreproject.Repo do
  use Ecto.Repo,
    otp_app: :coreproject,
    adapter: Ecto.Adapters.Postgres
end
