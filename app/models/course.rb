class Course < ActiveRecord::Base
	has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  accepts_nested_attributes_for :user_courses, allow_destroy: true
  validates :name, presence: true
end
