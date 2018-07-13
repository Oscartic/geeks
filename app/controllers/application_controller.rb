class ApplicationController < ActionController::Base
  before_action :set_variant
=begin
  def set_variant
    return unless params[:variant].in?(%w(phone tablet desktop))
    request.variant = params[:variant].to_sym
  end
=end
  # o tambien se puede por medio del user_agent:
  def set_variant
    # request.variant = :phone if request.user_agent.include?('iPhone')
    # o con la gema browser
    request.variant = :phone if browser.device.mobile?
  end
end
