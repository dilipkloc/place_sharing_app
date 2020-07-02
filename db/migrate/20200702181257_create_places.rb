class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :x_axis
      t.string :y_axis
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
