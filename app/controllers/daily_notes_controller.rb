class DailyNotesController < ApplicationController
  before_action :authenticate_user!

  def show
    @note = Daily.new
    @dailies = current_user.dailies.order(id: "DESC")
    @user = current_user
  end

  def create
    @note = Daily.new(permitted_params(params))
    @note.save
    redirect_to daily_notes_path
  end

  def update
    daily = Daily.find(params[:daily][:user_id])
    daily.update(note: params[:daily][:note])
    render json: {data: 'success'}, status: 200
  end

  def destroy
    daily = Daily.find(params[:id])
    daily.delete
    redirect_to daily_notes_path
  end

  private

  def permitted_params(params)
    params.require(:daily).permit(:note, :user_id)
  end
end
