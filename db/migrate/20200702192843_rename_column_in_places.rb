class RenameColumnInPlaces < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :status_id, :share_id
  end
end
