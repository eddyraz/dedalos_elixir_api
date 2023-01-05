defmodule DedalosElixirApi.Repo do
  use Ecto.Repo,
    otp_app: :dedalos_elixir_api,
    adapter: Ecto.Adapters.Postgres
end
