class CreateCrossfitters < ActiveRecord::Migration[7.1]
  def change
    create_table :crossfitters do |t|
      t.references :gym, null: false, foreign_key: true 
      t.string :name
      t.boolean :oly_lift
      t.integer :age

      t.timestamps
    end
  end
end
