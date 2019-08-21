class Visitor < ApplicationRecord
  enum provider: [:facebook, :google, :instagram]
  
  has_secure_password

  belongs_to :refer, polymorphic: true
end
