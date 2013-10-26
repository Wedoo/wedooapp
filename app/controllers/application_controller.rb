class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  @@wedoo_subdomain = '.wedoo'
  
  helper_method :ong
  
  protected
  def permission_denied
    if flash.key? :timedout
      flash[:error] = t('devise.failure.timeout')
    else
      flash[:error] = t('errors.messages.unauthorized')
    end
    redirect_to root_url
  end
  
  def ong
    return @ong if defined? @ong
    if params.has_key?(:ong_id)
      return @ong = Ong.find(params[:ong_id])
    end
    # TODO: sería choro poder generar urls con la ong como subdominio directamente, en lugar
    # de que actualmente genera un path /ongs/:id
    subdomain = request.subdomain
    subdomain = subdomain[0..-(@@wedoo_subdomain.size + 1)] if subdomain.include?(@@wedoo_subdomain)
    return @ong = Ong.find_by(subdomain: subdomain) || Ong.first
  end

end
