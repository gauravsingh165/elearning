class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validate :validate_single_admin
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  enum role: { admin: 'admin', student: 'student', tutor: 'tutor' ,manager: 'manager'}
  

  private
  
  def validate_single_admin
    if User.where(role: 'admin').count > 1
      errors.add(:role, 'Only one admin is allowed in the entire database.')
    end
  end
end
