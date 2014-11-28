class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :propertytype
      t.string :address
      t.string :location
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :otherroom
      t.integer :rent
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :properties, [:user_id, :created_at]
  end
end
