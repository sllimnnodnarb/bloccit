module TopicsHelper
  def user_is_authorized_for_topics?
    current_user && current_user.admin?
  end

  def user_is_authorized_to_moderate_topics?
    current_user && current_user.moderator?
  end

  def is_admin?
    current_user && current_user.admin?
  end

  def is_moderator?
    current_user && (current_user.admin? || current_user.moderator?)
  end
end
