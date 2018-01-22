class RenameAddressesToLocations < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :addresses, :locations
  end

  def self.down
    rename_table :locations, :addresses
  end
end