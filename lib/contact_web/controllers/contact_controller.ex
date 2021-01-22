defmodule ContactWeb.ContactController do
  use ContactWeb, :controller

  alias Contact.Emails.ContactForm
  def index(conn, _params) do
    changeset = ContactForm.changeset()
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"contact_form" => contact_params}) do
    changeset = ContactForm.changeset(contact_params)

    case ContactForm.send(changeset) do
      {:ok, _contact_form} ->
        conn
        |> put_flash(:info, "Message sent")
        |> redirect(to: Routes.contact_path(conn, :index))

      {:error, changeset} ->
        render(conn, "index.html", changeset: changeset)
    end

  end

end
