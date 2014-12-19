source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.0.rc1'
gem 'pg'
gem 'puma'
gem 'pry-rails'

gem 'sass-rails', '~> 5.0.0.beta1'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '~> 4.0.0.beta2'
gem 'opal-rails', '~> 0.7.0.beta1'
gem 'opal-rspec', github: 'opal/opal-rspec'
gem 'opal-slim', github: 'jgaskins/opal-slim'

# gem "representable"
#gem "reform", "1.2.4" #, git: "https://github.com/apotonick/reform.git"
gem "trailblazer", git: "https://github.com/apotonick/trailblazer.git"
gem "cells", git: "https://github.com/apotonick/cells"

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0.0.beta4'
  gem 'faker'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
