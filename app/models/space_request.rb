class SpaceRequest < ApplicationRecord
  enum status: [:unconfirmed, :confirmed, :accepted, :expired]
  belongs_to :requestor

  def accept!
    accepted!
  end
end
