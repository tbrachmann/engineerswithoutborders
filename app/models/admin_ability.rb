class AdminAbility
  include CanCan::Ability
  def initialize(user)

    user ||= User.new
    
    puts "NAME:" + user.name
    
    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all
      can :dashboard
    end
  end
end
