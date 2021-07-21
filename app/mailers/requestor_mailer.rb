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
    mail(to: @space_request.requestor.email, subject: 'Confirmation')
  end

  def re_confirmation_email
    @space_request = params[:space_request]
    @place = params[:place]
    mail(to: @space_request.requestor.email, subject: 'Re Confirmation')
  end

  def contract_created_email
    @contract = params[:contract]
    mail(to: @contract.requestor.email, subject: 'New contract')
  end

  def renew_contract_email
    @contract = params[:contract]
    mail(to: @contract.requestor.email, subject: 'Renew contract')
  end
end
