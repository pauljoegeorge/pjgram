class AccountController < Devise::RegistrationsController

  def signup
  end

  def signin
  end

  def signout
  end

  private

  def sign_up_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password)
  end
end
