defmodule SalarioApp.Repo do
  use Ecto.Repo,
    otp_app: :salario_app,
    adapter: Ecto.Adapters.Postgres
end
