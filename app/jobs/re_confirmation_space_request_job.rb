class ReConfirmationSpaceRequestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    #find request and send emails
    @space_requests = SpaceRequest.where(status: 1, countdown_start_at:  ..1.minutes.ago).order(:created_at)
    @space_requests.each do |key, space_request |
      RequestorMailer.with(space_request: space_request, place: key).re_confirmation_email.deliver_later
      space_request.expired!
    end
  end
end
