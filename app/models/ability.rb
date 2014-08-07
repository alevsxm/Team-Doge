class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, Resovision do |resovision|
      user == resovision.user
    end
  end
end
