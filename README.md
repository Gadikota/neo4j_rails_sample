# Neo4j integration in rails, A Sample App

## In Rails 4
## In a new project

`rails new YourProject --skip-active-record`

## In an existing project
In your Gemfile, remove the database driver gem, e.g. gem 'sqlite3' or gem 'pg'.

In config/application.rb, replace require 'rails/all' with

``` 
require "action_controller/railtie"

require "action_mailer/railtie"

require "sprockets/railtie"

require "rails/test_unit/railtie"
```

In config/environments/development.rb, remove or comment out 

`config.active_record.migration_error = :page_load`


you have to remove active_record helpers from the spec_helper

In application.rb

`config.app_middleware.delete "ActiveRecord::ConnectionAdapters::ConnectionManagement"`


`gem 'neo4j', github: 'neo4jrb/neo4j'  # in Gemfile`


## neo4j.yml

``` 
default: &default

  type: server_db

  url: http://neo4j:password@localhost:7474

development:

  <<: *default

test:

  <<: *default

production:

  <<: *default
```