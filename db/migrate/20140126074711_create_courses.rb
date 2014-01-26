class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :courseName
      t.integer :user_id
      t.string :grade

      t.timestamps
    end
  end
end
