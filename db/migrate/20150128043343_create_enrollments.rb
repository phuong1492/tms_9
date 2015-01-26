class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
