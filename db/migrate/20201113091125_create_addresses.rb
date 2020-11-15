class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zipcode, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :house, null: false
      t.bigint :telephone, null: false
      t.references :record, foreign_key: true
      t.timestamps
    end
  end
end
