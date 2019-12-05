# README

## Aphelcoma

A place where you can find programming problems, solve and discuss them.

Deployed (from branch heroku) with Heroku: [aphelcoma.herokuapp.com](https://aphelcoma.herokuapp.com/)

* Ruby version: ~> 2.6.5

* System dependencies: PostgreSQL

* Configuration file: `.env`

* Database creation: rake db:create, rake db:migrate

* Database initialization:

* How to run the test suite:
- run `bundle exec rake db:test:prepare`
- run `bin/spec` script.

* Deployment instructions:
- create file .env if you want mailing, see `.env.example` for example for local development.
- for production export all environment variables from `.env.example` and give them meaningful values. 
