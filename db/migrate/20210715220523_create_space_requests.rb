class CreateSpaceRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :space_requests do |t|
      t.string :status
      t.datetime :renewed_at

      t.timestamps
    end
  end
end
