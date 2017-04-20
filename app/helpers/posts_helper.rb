module PostsHelper
  def user_is_authorized_for_post?(post)
     current_user || (current_user == post.user || current_user.admin?)
  end

  def user_is_authorized_to_moderate_posts?(post)
    current_user && (current_user == post.user || current_user.moderator?)
  end

  def no_user_posts?
    @user.posts.count == 0
  end

end
