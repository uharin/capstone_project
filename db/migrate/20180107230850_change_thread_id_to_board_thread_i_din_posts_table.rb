class ChangeThreadIdToBoardThreadIDinPostsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :thread_id, :board_thread_id
  end
end
