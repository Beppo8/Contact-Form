defmodule ContactWeb.ContactController do
  use ContactWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, _params) do
    redirect(conn, to: Routes.contact_path(conn, :index))
  end

end
