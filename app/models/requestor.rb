class Requestor < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 250}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :phone_number, numericality: true, allow_blank: true
  validates :biography, length: { maximum: 1000}, allow_blank: true

  # 1:n relation with space request
  has_many :space_requests

  # Callback to create space request
  after_create :create_space_request

  def create_space_request
    self.space_requests.create
  end
end