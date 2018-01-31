class AddUserIdToBoardThreads < ActiveRecord::Migration[5.1]
  def change
    add_column :board_threads, :user_id, :integer
  end
end
