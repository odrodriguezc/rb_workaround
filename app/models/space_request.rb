class SpaceRequest < ApplicationRecord
  # Create 'magics' methods to set the status value an to filter by status
  enum status: [:unconfirmed, :confirmed, :accepted, :expired]

  # n:1 Relation with requestor
  belongs_to :requestor

  # Callback to create contract on space_request accepted
  after_save :create_contract

  # Method to modify status (call enum magi method) with another name (accept instead of accepted)
  def accept!
    accepted!
  end

  def create_contract
    if self.confirmed? && self.saved_change_to_status?
      @contract = self.requestor.contracts.create(start_at: DateTime.now, renewed_every_as_days: 30)
    end
    if @contract
      #todo send email ...
      logger.info('bingo!')
    end
  end

  def find_status_and_created_at
    #todo status confirmed and created_at - now = 3 months
  end
end
