source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem "bcrypt-ruby", :require => "bcrypt"

gem 'jquery-rails'

gem 'jquery_datepicker'

gem 'will_paginate', '~> 3.0'

gem 'paperclip'
gem 'rmagick'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

# sqlite in development
group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

# mysql in production
group :production do
  gem 'mysql2'
end