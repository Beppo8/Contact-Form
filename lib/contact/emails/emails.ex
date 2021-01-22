defmodule Contact.Emails do
  import Bamboo.Email

  alias Contact.Emails.ContactForm

  def contact_email(%ContactForm{email: email, message: message}) do
    new_email()
    |> to("beppo2488@gmail.com")
    |> from("beppo2488sm@gmail.com")
    |> subject("Contact email")
    |> html_body("<p>Email: #{email} Message: #{message}</p>")
    |> text_body("Email: #{email} Message: #{message}")
  end
end
