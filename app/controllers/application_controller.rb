# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

    # Managing the Locale across Requests
    def set_locale
      I18n.locale = cookies[:locale]
    end

  def dark
    cookies[:dark] = {
        value: "dark mode on"
    }
    redirect_back(fallback_location: root_path)
  end

  def light
    cookies.delete(:dark)
    redirect_back(fallback_location: root_path)
  end
end
