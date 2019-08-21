source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "bcrypt"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "dotenv-rails"
gem "dry-validation", "0.12.3"
gem "font_awesome5_rails"
gem "js-routes"
gem "i18n"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", git: "https://github.com/eric-norcross/puma.git"
gem "rails", "~> 5.2.3"
gem "reform", "2.3.0rc1"
gem "reform-rails"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do 
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
end
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
