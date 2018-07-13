class ApplicationController < ActionController::Base
  before_action :set_variant
  def set_variant
    return unless params[:variant].in?(%w(phone tablet desktop))
    request.variant = params[:variant].to_sym
  end
end
