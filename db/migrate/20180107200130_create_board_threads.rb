class CreateBoardThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :board_threads do |t|
      t.string :title

      t.timestamps
    end
  end
end
