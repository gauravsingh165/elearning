class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Guest user (not logged in)

    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, [Mcq, Essay, Video, Textbook, User]
    elsif user.tutor?
      can :manage, [Mcq, Essay]
    else
      can :read, Video
      can :read, Course
      can :read, Essay
      can :write, Essay
    end
  end
end

# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new 

#     if user.admin?
#       can :manage, :all
#     elsif user.manager?
#       can :manage, [MCQ, Essay, Video, Textbook, User]
#     elsif user.tutor?
#       can :manage, [MCQ, Essay]
#     elsif user.student?
#       can :read, [Course, ProductLine, ProductVersion]
#       can :manage, Enrollment, user_id: user.id
#     end
#   end
# end