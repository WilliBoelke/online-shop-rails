# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

    # Managing the Locale across Requests
    def set_locale
      I18n.locale = cookies[:locale]
    end
end
