class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
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
end
