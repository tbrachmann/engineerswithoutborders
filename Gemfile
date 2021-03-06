source 'https://rubygems.org'

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.9'
gem 'sprockets-rails', :require => 'sprockets/railtie'
# Boostrap for styling
gem 'bootstrap'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-datepicker-rails'
gem 'rails4-autocomplete'
gem 'language_list'
gem 'turbolinks'
gem 'ransack'
gem 'jbuilder'
gem 'sdoc' # , '~> 0.4.0', group: :doc
gem 'jquery-turbolinks'
gem 'bcrypt'
gem 'cancancan'
gem 'simple_form'
gem 'devise'
gem 'rails-assets-tether'
gem 'kaminari'
gem 'rails_admin'
gem 'json'
gem 'rake' # , '10.4.2'
gem 'faker'
gem 'factory_girl_rails'
gem 'multi-select-rails'
gem 'magnific-popup-rails', '~> 1.1.0'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'test-unit'
  gem 'guard-rspec'
  gem 'jasmine'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
end

# Setup Cucumber, RSpec, autotest support
group :test do
  gem 'simplecov', :require => false
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  
  # Basic imperative step defs
  
  # required for Cucumber
  gem 'database_cleaner'
  gem 'autotest-rails'
  gem 'selenium-webdriver'
  # gem 'factory_girl_rails' # if using FactoryGirl
  gem 'metric_fu' # collect code metrics
end

group :production do
  # Use PostgreSQL in production (Heroku)
  gem 'pg'
  # Heroku specific production settings
  gem 'rails_12factor'
end

gem "haml"

gem "chartkick"
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
