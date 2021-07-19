class RenewContractJob < ApplicationJob
  queue_as :default

  #todo rename start_at to renewed_at
  def perform(*args)
    Contract.where(start_at: ..1.months.ago).each do |contract|
      contract.update(start_at: DateTime.now)
    end
  end
end
