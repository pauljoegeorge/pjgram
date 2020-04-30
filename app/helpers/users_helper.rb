module UsersHelper
  def follow_user(me, other_user)
    if me != other_user
      if following?(me, other_user)
        render 'show_following_icon'
      else
        render 'show_follow_icon'
      end
    end
  end
end
