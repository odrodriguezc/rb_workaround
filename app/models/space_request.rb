class SpaceRequest < ApplicationRecord
  # Create 'magics' methods to set the status value an to filter by status
  enum status: [:unconfirmed, :confirmed, :accepted, :expired]

  # n:1 Relation with requestor
  belongs_to :requestor

  # Callback to create contract on space_request accepted
  # after_update :create_contract, if: saved_change_to_attribute?(:status)

  # Method to modify status (call enum magi method) with another name (accept instead of accepted)
  def accept!
    accepted!
  end

  def create_contract
    @contract = self.requestor.contracts.create(start_at: DateTime.now, renewed_every_as_days: 30)
    if @contract
      #todo send email ...
    end
  end
end
