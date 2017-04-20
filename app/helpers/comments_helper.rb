module CommentsHelper
  def user_is_authorized_for_comment?(comment)
   current_user && (current_user == comment.user || current_user.admin?)
  end

  def no_user_comments?
    @user.comments.count == 0
  end
end
