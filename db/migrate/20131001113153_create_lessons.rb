class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.time :time
      t.string :room
      t.string :teacher
      t.string :subject
      t.string :day
      t.references :group
      t.boolean :lowerweek

      t.timestamps
    end
    add_index :lessons, :group_id
  end
end
