class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "admin", password: "featurequest" unless Rails.env.development? || Rails.env.test?
  before_action :set_locale

  private
    def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
