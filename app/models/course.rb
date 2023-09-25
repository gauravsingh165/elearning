class Course < ApplicationRecord
    has_many :videos
    has_many :mcqs
    has_many :essays
    has_many :textboos
    scope :by_type, ->(course_type) { where(type: course_type) if course_type.present? }

end
