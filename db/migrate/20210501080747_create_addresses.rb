class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code_id, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address_line, null: false
      t.string :building 
      t.string :phonenumber, null: false
      t.references :purchaser, foreign_key: true
      t.timestamps
    end
  end
end
