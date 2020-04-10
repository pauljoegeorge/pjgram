class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = current_user
    @vocabularies = current_user.vocabularies.page params[:page]
    @articles = current_user.articles.page params[:page]
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    user = current_user
    user.update(permitted_params(params))
    redirect_to user_profile_path
  end

  private

  def permitted_params(params)
    params.require(:user).permit(:name, :profile_picture)
  end
end
