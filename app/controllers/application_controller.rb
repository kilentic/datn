class ApplicationController < ActionController::Base
  layout :choose_layout

  private
  def choose_layout 
    if true
      "users_layout"
    else
    end
  end
end
