class AddTokenToSpaceRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :space_requests, :token, :string
  end
end
