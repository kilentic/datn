module AuthenticationLib 
  module VisitorClassAuthenticationLib 
    def digest token 
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create token, cost: cost   
    end
    
    def new_token 
      SecureRandom.urlsafe_base64
    end
  end
end
