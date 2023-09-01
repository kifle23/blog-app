class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Comment, author: user
    can :manage, Post, author: user
    return unless user.admin?

    can :manage, :all
  end
end
