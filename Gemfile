source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jbuilder"
gem 'devise', '~> 4.8', '>= 4.8.1'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'pry'
gem 'bootstrap', '~> 5.2'
gem 'money-rails', '~>1.12'
gem 'activerecord-import', '~> 1.4'
gem 'faker', '~> 2.23'
gem 'turbo-rails'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'factory_bot_rails', '~> 6.2'
end

group :development do
  gem "web-console"
end

