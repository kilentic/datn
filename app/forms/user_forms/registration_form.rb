class RegistrationForm
  include ActiveModel::Model
  attr_accessor :name, :email, :password, :password_confirmation, :provider, :uid

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :provider, uniqueness: { scope: :uid }  

  def save
    return false unless valid? 
    email.downcase!
    ApplicationRecord.transaction do
      refer_user = User.create 
      visitor = Visitor.create name: name, email: email, password: password, 
        password_confirmation: password_confirmation, provider: provider, refer: refer_user
    end
  end
end
