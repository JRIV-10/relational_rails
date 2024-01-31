class CreateCrossfitters < ActiveRecord::Migration[7.1]
  def change
    create_table :crossfitters do |t|
      t.references :gyms, null: false, foreign_key: true 
      t.integer :mem_id
      t.string :name
      t.boolean :oly_lift
      t.integer :age

      t.timestamps
    end
  end
end
