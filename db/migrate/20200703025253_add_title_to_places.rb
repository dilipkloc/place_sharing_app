class AddTitleToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :title, :string
  end
end
