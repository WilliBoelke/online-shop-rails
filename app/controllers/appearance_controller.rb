# frozen_string_literal: true

class AppearanceController < ApplicationController
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
