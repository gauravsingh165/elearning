class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, [MCQ, Essay, Video, Textbook, User]
    elsif user.tutor?
      can :manage, [MCQ, Essay]
    elsif user.student?
      can :read, [Course, ProductLine, ProductVersion]
      can :manage, Enrollment, user_id: user.id
    end
  end
end