# frozen_string_literal: true

class LocalesController < ApplicationController
  include LocalesHelper

  def update
    remember(params[:locale])
    redirect_to root_path
  end

  private
    # Remembers the user locale.
    def remember(locale)
      cookies[:locale] = locale
      I18n.locale = locale
    end
end
