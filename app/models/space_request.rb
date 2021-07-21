class SpaceRequest < ApplicationRecord
  include Countdownable

  # Create 'magics' methods to set the status value an to filter by status
  enum status: [:unconfirmed, :confirmed, :accepted, :expired]

  #token
  has_secure_token

  # n:1 Relation with requestor
  belongs_to :requestor

  # Callback to create contract on space_request accepted
  after_save :create_contract

  # Method to modify status (call enum magi method) with another name (accept instead of accepted)
  def accept!
    accepted!
  end

  def create_contract
    if self.accepted? && self.saved_change_to_status?
      @contract = self.requestor.contracts.create(countdown_start_at: DateTime.now)
    end
    if @contract
      #todo send email ...
      logger.info('bingo!')
    end
  end
end
