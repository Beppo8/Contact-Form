defmodule Contact.Repo do
  use Ecto.Repo,
    otp_app: :contact,
    adapter: Ecto.Adapters.Postgres
end
