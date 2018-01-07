class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :address_number
      t.string :street
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
