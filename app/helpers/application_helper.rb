module ApplicationHelper


  def default_avatar(user_image)
    if Current.user.image_url == nil
      'avatars/default_avatar.jpeg'
    else
      Current.user.image_url
    end
  end
end
