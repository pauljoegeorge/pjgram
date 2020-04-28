class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = get_user(params)
    @current_user = current_user
    @vocabularies = @user.vocabularies.page params[:page]
    @articles = @user.articles.page params[:page]
    @follow = Follow.new
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

  def get_user(params)
    params[:id].present? ? User.find(params[:id]) : current_user
  end
end
