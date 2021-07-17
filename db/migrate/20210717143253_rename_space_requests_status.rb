class RenameSpaceRequestsStatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :space_requests, :status, :string
    add_column :space_requests, :status, :integer, default: 0
  end
end
