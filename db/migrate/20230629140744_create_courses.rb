class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.float :number
      t.integer :no_of_subject
      t.float :percentage
      t.integer :student_id
      t.timestamps
    end
  end
end
