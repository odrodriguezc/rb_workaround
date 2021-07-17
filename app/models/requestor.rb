class Requestor < ApplicationRecord
  has_many :space_requests

  after_create :create_space_request

  def create_space_request
    self.space_requests.create
  end
end