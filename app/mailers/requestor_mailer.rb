class RequestorMailer < ApplicationMailer
  default from: 'contacts@workaround.dev'
  layout 'mailer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.requestor_mailer.confirmation_email.subject
  #
  def confirmation_email
    @space_request = params[:space_request]
    mail(to: @space_request.requestor.email,
         subject: 'Confirmation')
  end

  def re_confirmation_email
    @space_request = params[:space_request]
    @place = params[:place]
    mail(to: @space_request.requestor.email,
         subject: 'Confirmation')
  end
end
