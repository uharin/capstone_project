class CreateUserActions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_actions do |t|
      t.integer :user_id
      t.integer :action_id

      t.timestamps
    end
  end
end
