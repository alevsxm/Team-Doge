class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, Resovision do |resovision|
      user == resovision.user
    end
    can :update, Position do |position|
      user == position.resovision.user
    end
    can :update, Education do |education|
      user == education.resovision.user
    end
  end
end
