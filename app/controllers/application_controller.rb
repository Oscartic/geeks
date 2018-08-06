class ApplicationController < ActionController::Base
  # set_variant detecta el dispositivo por el cual se accede y asigna el template correspondiente:
  before_action :set_variant
  # set_locale detecta el lugar de acceso para mostrar la traduccion conrrespondiente
  before_action :set_locale
  #gestion de errores => 404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

    # def set_variant
    #   return unless params[:variant].in?(%w(phone tablet desktop))
    #   request.variant = params[:variant].to_sym
    # end
    # o tambien se puede por medio del user_agent:
    def set_variant
      # request.variant = :phone if request.user_agent.include?('iPhone')
      # o con la gema browser
      request.variant = :phone if browser.device.mobile?
    end

    def set_locale
      I18n.locale = params[:locale] if params[:locale]
      @country = Country.find_by!(Code: I18n.locale)
    end
    # definimos el 404 que se esta pasando en el rescue_from
    def render_404
      render 'web/404', status: 404
    end
end
