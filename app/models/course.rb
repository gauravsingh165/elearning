class Course < ApplicationRecord
    has_many :videos
    has_many :mcqs
    has_many :asssys
    has_many :textboos
end
