class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     cnan :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)

    if user && user.admin      # need to figure out how to check if admin
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    else

      # manager abilities
      if user && user.manager
        can :manage, Project
        can :read, :all
        cannot :read, User
      end
    end

    print "NAME:" + user.name
    print "**********user.admin: " + user.admin.to_s + "\n"
    print "**********user.manager: " + user.manager.to_s + "\n"
    

    # # common abilities
    can :read, User, :id => user.id
    can :manage, User, :id => user.id
    # cnan :access, :rails_admin
  end
end


