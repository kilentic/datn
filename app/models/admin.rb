class Admin < ApplicationRecord
  has_one :visitor, as: :referer
end
