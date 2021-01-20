defmodule ContactWeb.ContactController do
  use ContactWeb, :controller

  alias Contact.{Mailer, Emails}

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    params
    |> Emails.contact_email()
    |> Mailer.deliver_now()

    conn
    |> put_flash(:info, "Message sent")
    |> redirect(to: Routes.contact_path(conn, :index))
  end

end
