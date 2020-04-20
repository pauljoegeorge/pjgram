module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      show_template(404)
    end
    rescue_from ActionController::ParameterMissing do |exception|
      show_template(400)
    end
    rescue_from ActiveRecord::RecordInvalid do  |exception|
      show_template(422)
    end
  end

  def show_template(code)
    render :file => "public/#{code}.html", :status => code, :layout => false
  end
end