source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'http'
# Use friendly_id to make elegant url
gem 'friendly_id'
# elasticsearch
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
# allow CORS
gem 'rack-cors', :require => 'rack/cors'

gem 'angular-rails-templates'
# track page view
gem 'impressionist'

# paginator
gem 'kaminari'

gem 'devise', '~> 3.4.0'
gem 'angular_rails_csrf'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'bullet'
end

group :test do
	gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails'
end

group :production do
	gem 'rails_12factor', '0.0.2'
end

