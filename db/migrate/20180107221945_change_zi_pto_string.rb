class ChangeZiPtoString < ActiveRecord::Migration[5.1]
  def change
    change_column :addresses, :zip, :string
  end
end
