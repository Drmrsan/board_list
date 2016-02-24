class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
