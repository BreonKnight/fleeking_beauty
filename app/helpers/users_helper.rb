module UsersHelper

  def is_user?(user)
    user == current_user
  end

  def upvote_count(user)
    user.upvotes.count
  end

  def downvote_count(user)
    user.downvotes.count
  end

end
