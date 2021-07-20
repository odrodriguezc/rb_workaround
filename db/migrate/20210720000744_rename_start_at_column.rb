class RenameStartAtColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :space_requests, :renewed_at, :countdown_start_at
  end
end
