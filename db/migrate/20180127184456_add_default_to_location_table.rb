class AddDefaultToLocationTable < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :default, :boolean
  end
end
