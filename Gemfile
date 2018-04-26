source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end

gem 'amazon-ecs'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'rails', '5.2.0.rc2'
gem 'rack-cors'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'retryable'
gem 'rollbar'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'sprockets', '~> 4.x'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'mechanize'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'minitest', '~> 5.10.0'
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'minitest-sub_test_case'
  gem 'vcr'
  gem 'webmock'
end
gem 'nokogiri', '>= 1.8.1'
gem 'loofah', '>= 2.2.1'
gem 'rails-html-sanitizer', '>= 1.0.4'
