module LandingPagesHelper

  def features_available
    if user_signed_in?
      render 'landing_pages/shared/user_browse_buttons'
    else
      render 'landing_pages/shared/guest_connect_buttons'
    end
  end
end
