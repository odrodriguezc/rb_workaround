class Requestor < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 250}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :phone_number, length: {minimum: 7, maximum: 20}, allow_blank: true
  validates :biography, length: { maximum: 1000}, allow_blank: true

  # 1:n relation with space request
  has_many :space_requests, dependent: :destroy
  # 1:n relation with contracts
  has_many :contracts, dependent: :destroy

  # Callback to create space request automatically
  after_create :create_space_request

  def create_space_request
    @space_request = self.space_requests.create(countdown_start_at: DateTime.now)
    if @space_request
      RequestorMailer.with(space_request: @space_request).confirmation_email.deliver_now
    end
  end
end