class User < ApplicationRecord
  has_one :visitor, as: :referer
end
