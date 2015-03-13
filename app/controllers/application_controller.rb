class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  private

  def set_locale
    if session[:locale].blank? && I18n.available_locales.include?( extract_locale_from_accept_language_header.to_sym )
      session[:locale] = extract_locale_from_accept_language_header
    end

    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
    
    I18n.locale = session[:locale] || I18n.default_locale  
  end

  def extract_locale_from_accept_language_header
    if env['HTTP_ACCEPT_LANGUAGE'].nil?
      'zh-TW'
    else
      request.env['HTTP_ACCEPT_LANGUAGE'].split(',').first.downcase.gsub(/-\w{2}/, &:upcase)
    end
  end
end
