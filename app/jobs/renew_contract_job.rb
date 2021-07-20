class RenewContractJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Contract.older_than.each do |contract|
      contract.update(countdown_start_at: DateTime.now)
    end
  end
end
