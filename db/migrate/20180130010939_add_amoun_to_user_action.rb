class AddAmounToUserAction < ActiveRecord::Migration[5.1]
  def change
    add_column :user_actions, :amount, :float
  end
end
