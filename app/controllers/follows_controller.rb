class FollowsController < ApplicationController

  def create
    follow = Follow.new(follow_params(params))
    follow.save
    render json: {data: 'success'}, status: 200
  end

  def delete
    follow = Follow.where(following_user_id: params[:follow][:following_user_id], follower_user_id: params[:follow][:follower_user_id]).first
    follow.delete
  end

  private

  def follow_params(params)
    params.require(:follow).permit(:follower_user_id, :following_user_id)
  end
end
