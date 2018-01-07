class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.string :action_name
      t.integer :point_value

      t.timestamps
    end
  end
end
