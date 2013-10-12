class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :load_ong
  
  protected
  def permission_denied
    if flash.key? :timedout
      flash[:error] = t('devise.failure.timeout')
    else
      flash[:error] = t('errors.messages.unauthorized')
    end
    redirect_to root_url
  end
  
  private
  def load_ong
    @ong ||= params.has_key?(:ong_id) ? Ong.find(params[:ong_id]) : nil
  end
  
end
