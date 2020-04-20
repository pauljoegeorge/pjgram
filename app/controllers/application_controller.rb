class ApplicationController < ActionController::Base
  include ErrorHandler
  add_flash_types :info, :error, :warning
end
