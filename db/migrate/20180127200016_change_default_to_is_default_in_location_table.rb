class ChangeDefaultToIsDefaultInLocationTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :locations, :default, :is_default
  end
end
