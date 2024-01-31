class CreateGyms < ActiveRecord::Migration[7.1]
  def change
    create_table :gyms do |t|
      t.boolean :always_open
      t.integer :num_of_platforms
      t.string :name

      t.timestamps
    end
  end
end
