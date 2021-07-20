class RemoveColumnRenewEveryAsDays < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :renewed_every_as_days
  end
end
