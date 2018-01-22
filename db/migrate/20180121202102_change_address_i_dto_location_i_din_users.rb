class ChangeAddressIDtoLocationIDinUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :address_id, :location_id
  end
end
