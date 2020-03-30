module AlertHelper
  def check_for_alert
    if flash[:error].present?
      render 'common/flash_message/alert'
    elsif flash[:success].present?
      render 'common/flash_message/success'
    end
  end
end