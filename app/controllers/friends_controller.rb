class FriendsController < ApplicationController
  before_action :authenticate_user!

  def articles
    # current_user.followers
  end
end
