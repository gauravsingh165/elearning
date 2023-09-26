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
      can :access, :product_version_panel
      can :access, :product_line_panel
      can :access, :essay_new
      can :read, :admin
      can :create, :all
      can :edit, :all
      can :update, :all
    elsif user.tutor?
      can :manage, [Mcq, Essay]
      can :access, :admin_panel
      can :read, :admin
      can :create, :all
      can :edit, :all
      can :update, :all
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
