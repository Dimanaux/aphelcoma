source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.0.0"

# main
gem "activerecord-session_store"
gem "devise"
gem "omniauth-google-oauth2"
gem "kaminari"
gem "pundit"

# views
gem "redcarpet"
gem "simple_form"
gem "slim"

gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  gem "rubocop-rspec"
  gem "slim_lint"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "capybara-selenium"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "rspec-rails", "~> 3.9.0"
  gem "shoulda-matchers"
  gem "simplecov"
end
