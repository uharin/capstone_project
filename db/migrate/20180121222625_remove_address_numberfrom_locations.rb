class RemoveAddressNumberfromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :address_number, :string
    rename_column :locations, :street, :street_address
  end
end
