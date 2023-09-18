class Course < ApplicationRecord
    has_many :videos
    has_many :mcqs
    has_many :essays
    has_many :textboos
end
