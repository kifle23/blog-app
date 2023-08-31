class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :destroy, Post
    else
      can :destroy, Post, user_id: user.id
    end
  end
end