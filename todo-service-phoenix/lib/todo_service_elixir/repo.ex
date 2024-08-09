defmodule TodoServiceElixir.Repo do
    use Ecto.Repo,
        otp_app: :todo_service_elixir,
        adapter: Ecto.Adapters.Postgres
end
