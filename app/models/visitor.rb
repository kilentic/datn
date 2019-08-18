class Visitor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :provider, uniqueness: { scope: :uid }  

  has_secure_password

  enum provider: [:facebook, :google, :instagram]

  belongs_to :refer, polymorphic: true

  before_save { email.downcase! }
end
