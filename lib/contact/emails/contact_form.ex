defmodule Contact.Emails.ContactForm do
  import Ecto.Changeset

  alias Contact.{Mailer, Emails}

  defstruct [:email, :message]

  @types %{
    email: :string,
    message: :string
  }

  def changeset(attrs \\ %{}) do
    {%__MODULE__{}, @types}
    |> cast(attrs, [:email, :message])
    |> validate_required([:email, :message])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:message, min: 5)
  end

  def send(changeset) do
    case apply_action(changeset, :insert) do
      {:ok, contact_form} ->
        changeset.data
        |> Emails.contact_email()
        |> Mailer.deliver_now()

        {:ok, contact_form}
      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
