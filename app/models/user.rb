class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :set_sub
  validate :validate_single_admin, on: :create
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:confirmable
  
  enum role: { admin: 'admin', student: 'student', tutor: 'tutor' ,manager: 'manager'}
  
  
  # def set_sub
  #     self.role=["student"]
  # end
  private

  def validate_single_admin
    if role == 'admin'
      admin_count = User.where(role: 'admin').count
      if admin_count >= 1
        errors.add(:role, 'Only one admin is allowed in the entire database.')
      end
    end
  end
end