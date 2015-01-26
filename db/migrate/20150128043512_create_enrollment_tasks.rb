class CreateEnrollmentTasks < ActiveRecord::Migration
  def change
    create_table :enrollment_tasks do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :subject_id
      t.integer :task_id
      t.boolean :finish

      t.timestamps null: false
    end
  end
end
