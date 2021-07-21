require 'sidekiq-scheduler'

class ReConfirmationSpaceRequestJob < ApplicationJob
  # include Sidekiq::Worker

  def perform(*args)
    #find request and send emails
    @space_requests = SpaceRequest.confirmed.older_than(1.minutes.ago).order(:created_at)
    @space_requests.each_with_index do |space_request, index |
      RequestorMailer.with(space_request: space_request, place: (index + 1)).re_confirmation_email.deliver_later
      space_request.expired!
    end
  end
end
