module AuthenticationLib 
  module VisitorInstanceAuthenticationLib
    def authenticated? attribute, token 
      digest = send "#{attribute}_digest"
      return false if digest.nil? 
      BCrypt::Password.new(digest).is_password?(token)
    end

    def remember 
      remember_token = self.class.new_token 
      update_attribute :remember_digest, self.class.digest(remember_token) 
    end
    
    def forget 
      update_attribute :remember_digest, nil 
    end 
  end
end
