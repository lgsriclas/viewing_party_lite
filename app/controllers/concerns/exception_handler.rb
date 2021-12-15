module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      flash[:alert] = "Please enter valid credentials; #{e.message}"
    end
  end
end