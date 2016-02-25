class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.date :duedate
      t.integer :to_do_id

      t.timestamps null: false
    end
  end
end
