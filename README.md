# README

# Aphelcoma

Aphelcoma is a web application where you can find programming problems, solve and discuss them.

## Application Gems

* [activerecord-session_store](https://github.com/rails/activerecord-session_store) for long session values
* [decent_exposure](https://github.com/voxdolo/decent_exposure) to DRY controllers
* [devise](http://github.com/plataformatec/devise) for authentication
* [draper](https://github.com/drapergem/draper) for views
* [kaminari](https://github.com/amatsuda/kaminari) for pagination
* [interactor](https://github.com/collectiveidea/interactor) encapsulates application's business logic
* [omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2) to authenticate with Google via OAuth
* [puma](https://github.com/puma/puma) as Rails web server
* [pundit](https://github.com/elabs/pundit) to encapsulates authorization logic
* [redcarpet](https://github.com/vmg/redcarpet) for rendering markdown to HTML
* [responders](https://github.com/plataformatec/responders) to DRY controllers
* [rollbar](https://github.com/rollbar/rollbar-gem) for exception notification
* [sass-rails](https://github.com/rails/sass-rails) for [SASS and SCSS](https://sass-lang.com)
* [simple_form](https://github.com/plataformatec/simple_form) for forms
* [slim](https://github.com/slim-template/slim) for views
* [webpacker](https://github.com/rails/webpacker) to manage JavaScript

## Development Gems

* [fasterer](https://github.com/DamirSvrtan/fasterer) to see speed improvement suggestions
* [listen](https://github.com/guard/listen) to update app without restart
* [rubocop](https://github.com/bbatsov/rubocop) to follow Ruby style guide
* [rubocop-rspec](https://github.com/nevir/rubocop-rspec) to follow Ruby style guide in specs
* [slim_lint](https://github.com/sds/slim-lint) to follow Ruby style guide in slim templates
* [spring](https://github.com/rails/spring) for fast Rails actions via pre-loading
* [spring-watcher-listen](https://github.com/jonleighton/spring-watcher-listen) to update app without restart
* [web-console](https://github.com/rails/web-console) for better debugging with Rails consoles in browser
* [byebug](https://github.com/deivid-rodriguez/byebug) for debugging in console
* [dotenv-rails](https://github.com/bkeepers/dotenv) to load environment variables from file

## Test Gems

* [capybara](https://github.com/teamcapybara/capybara) for user actions simulations during tests
* [capybara-selenium](https://github.com/dsaenztagarro/capybara-selenium) for integration selenium and capybara
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) for factories in tests
* [ffaker](https://github.com/ffaker/ffaker) to generate fake data
* [rspec-rails](https://github.com/rspec/rspec-rails) as a test framework
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) for human like asserts
* [simplecov](https://github.com/colszowka/simplecov) for generating code coverage reports

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, fasterer and slim-lint
* `bin/spec` - runs all tests and quality checks

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC, ruby-dev installed on your development machine.

* `Ruby 2.6.5`
* `PostgreSQL`
* `node`

### Deployment

Deployed (from branch `heroku`) with Heroku: [aphelcoma.herokuapp.com](https://aphelcoma.herokuapp.com/)

## Other

* Ruby version: ~> 2.6.5

* System dependencies: PostgreSQL

* Configuration file: `.env`, example: `.env.example`

* Database creation: rake db:create, rake db:migrate

* How to run the test suite:
- run `bundle exec rake db:test:prepare`
- run `bin/spec` script.

* Deployment instructions:
- create file .env if you want mailing and oauth, see `.env.example` for example for local development.
- for production export all environment variables from `.env.example` and give them meaningful values. 
