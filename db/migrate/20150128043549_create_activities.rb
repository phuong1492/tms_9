class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :content
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
