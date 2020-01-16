class ApplicationController < ActionController::Base

  def dark
    cookies[:dark] = {
        value: 'dark mode on'
    }
    redirect_back(fallback_location: root_path)
  end

  def light
    cookies.delete(:dark)
    redirect_back(fallback_location: root_path)
  end

end
