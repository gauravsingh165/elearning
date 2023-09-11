class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.has_role?('admin')||user.has_role?('manager')
      can :manage, [Mcq,Essay,Video,Textbook]
      can :mark, Essay
      can :upload,[Video,Textbook]
    elsif user.has_role?(:tutor)
      can :mark ,Essay
    elsif user.has_role?(:student)
      can :enroll, Cource 
      can :read, [Textbook, Video]
      can :attempt, [Mcq, Essay]
      can :ask, Query
    end
    if user.has_role?('admin')
      can :access, :user_list
      can :filter, :user
      can activate, :user
      can deactivate, :user
    end
  end
end
