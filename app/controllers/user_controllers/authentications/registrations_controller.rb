class UserControllers::Authentications::RegistrationsController < ApplicationController
  def new
    @registration_form = UserForms::RegistrationForm.new visitor: Visitor.new
    respond_to do |format|
      format.js
    end
  end

  def create 
    @registration_form = UserForms::RegistrationForm.new visitor: Visitor.new 
    respond_to do |format|
      if @registration_form.validate registration_form_params 
        @registration_form.save
        format.js 
      else 
        format.js do 
          render partial: 'shared/errors/errors', 
            locals: { error_messages: @registration_form.errors.messages }
        end 
      end
    end
  end

  private
  def registration_form_params
    params.require(:visitor).permit :name, :email, 
      :password, :password_confirmation
  end
end
