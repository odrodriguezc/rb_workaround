class SpaceRequest < ApplicationRecord
  # Create 'magics' methods to set the status value an to filter by status
  enum status: [:unconfirmed, :confirmed, :accepted, :expired]

  # n:1 Relation with requestor
  belongs_to :requestor

  # Method to modify status (call enum magi method) with another name (accept instead of accepted)
  def accept!
    accepted!
  end
end
