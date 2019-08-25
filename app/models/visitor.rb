class Visitor < ApplicationRecord
  extend AuthenticationLib::VisitorClassAuthenticationLib
  include AuthenticationLib::VisitorInstanceAuthenticationLib

  attr_accessor :remember_token, :reset_token

  enum provider: [:facebook, :google, :instagram]
  
  has_secure_password

  belongs_to :refer, polymorphic: true
end
