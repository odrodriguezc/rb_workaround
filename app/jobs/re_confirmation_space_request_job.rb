class ReConfirmationSpaceRequestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    #find request and send emails
    @space_request = SpaceRequest.last
    RequestorMailer.with(space_request: @space_request).confirmation_email.deliver_now
  end
end
