class UserControllers::Authentications::SessionsController < ApplicationController
  def new    
    respond_to do |format| 
      format.js
    end
  end

  def create 
    visitor = Visitor.find_by email: params[:session][:email]
    respond_to do |format| 
      if visitor && visitor.authenticate(params[:session][:password])
          log_in visitor
          params[:session][:remember_me] == '1' ? remember(visitor) : forget(visitor)
          format.js 
      else
        format.js do 
          render partial: "shared/errors/errors", 
            locals: { error_messages: { 
              invalid_email_and_password: ["Combination"] } 
            }
        end
      end
    end
  end 
end
