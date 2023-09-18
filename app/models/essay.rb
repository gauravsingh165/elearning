class Essay < ApplicationRecord
  belongs_to :course
  validates :question, presence: true
 
end
