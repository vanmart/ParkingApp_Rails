class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all              # allow everyone to read everything

    if user
      can :access, :rails_admin  # only allow admin users to access Rails Admin
      can :dashboard             # allow access to dashboard

      if user.role? :admin
        can :manage, :all
      elsif user.role? :employee
        cannot [:destroy, :update, :create], User
        can :update, User, :id => user.id
      end
    end
  end
end