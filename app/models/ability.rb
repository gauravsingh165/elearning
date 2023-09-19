class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Guest user (not logged in)

    if user.admin?
      can :manage, :all
      can :access, :admin_panel
    elsif user.manager?
      can :manage, [Mcq, Essay, Video, Textbook, User]
      can :access, :admin_panel
      can :access, :essay_new
    elsif user.tutor?
      can :manage, [Mcq, Essay]
      can :access, :admin_panel
    else
      cannot :access, :admin_panel
      cannot :access, :essay_new
      can :read, Video
      can :read, Course
      can :read, Essay
      can :write, Essay
      can :read , Mcq
      cannot :read, :admin
      cannot :create, :all
      cannot :edit, :all
      cannot :update, :all
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