module UsersHelper

  def user_ud(user)
    user == current_user
  end

  def upvoteCount(user)
    user.upvotes.count
  end

  def downvoteCount(user)
    user.downvotes.count
  end

end
