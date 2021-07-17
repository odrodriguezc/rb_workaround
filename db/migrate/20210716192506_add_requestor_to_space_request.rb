class AddRequestorToSpaceRequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :space_requests, :requestor, foreign_key: true
  end
end
