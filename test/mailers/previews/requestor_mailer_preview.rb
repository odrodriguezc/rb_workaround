# Preview all emails at http://localhost:3000/rails/mailers/requestor_mailer
class RequestorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/requestor_mailer/confirmation_email
  def confirmation_email
    RequestorMailer.with(space_request: @space_request).confirmation_email.deliver_now
  end
end
