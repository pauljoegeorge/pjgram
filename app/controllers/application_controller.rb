class ApplicationController < ActionController::Base
  include ErrorHandler
  include ApplicationHelper
  add_flash_types :info, :error, :warning
end
