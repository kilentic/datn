FactoryBot.define do 
  factory :visitor, class: Visitor.name do 
    name { "Quach Huy Tung" }
    email { "huytung.9729@gmail.com" }
    provider { 1 }
    uid { 123 } 
    password { "123456" } 
    password_confirmation { "123456" }
    refer { User.create }
  end
end
