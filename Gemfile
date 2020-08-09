source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

gem 'mail_form'
gem 'mailgun-ruby'
gem 'dotenv-rails', groups: [:development, :test]
gem 'sendgrid-ruby'
gem 'gravatar_image_tag'
# ransack for search
gem 'ransack'
# gem devise
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# pg search
gem 'pg_search'

gem 'carrierwave', '~> 2.0'
gem 'aws-sdk', '< 3.0'

# tooltip
gem 'accessible_tooltip'

gem 'select2-rails'
gem 'underscore-rails'
# pagination fucking time!
gem 'will_paginate', '~> 3.1.0'
# modal 
gem 'responders'

# gem votable
gem 'rollbar'

gem 'acts_as_votable'

# haml time

gem "haml-rails", "~> 2.0"


# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

end
#simply comment dev out and then use PG when doing production
# other way around when doing 
 #gem 'sqlite3', group: :development
 gem 'pg'

 # group :production do
 #   gem 'pg'
 # end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
