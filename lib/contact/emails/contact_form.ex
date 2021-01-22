defmodule Contact.Emails.ContactForm do
  import Ecto.Changeset

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
end
