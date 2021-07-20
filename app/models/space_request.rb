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
    if self.accepted? && self.saved_change_to_status?
      @contract = self.requestor.contracts.create(countdown_start_at: DateTime.now)
    end
    if @contract
      #todo send email ...
      logger.info('bingo!')
    end
  end

  #todo fix it to concentrate database request in models only / change minutes to 3 months
  #scope :find_to_ask_reconfirmation, -> {where("status", 1).and("renewed_at IS NULL AND created_at <= ?", 1.minutes.ago)}


end
