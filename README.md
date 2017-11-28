# GIZ

This code base has been developed for a project we delivered for GIZ.

https://www.giz.de/en/html/index.html

We are open sourcing to share the work (as this is our default practice at Futuregov whenever possible).

==========

## Caveats to the code base

At the time of writing, the code base was built in a rapid first phase delivery. We only had 5 days of development scoped for delivery. This is why we didn't bother with writing tests.

# Development

## Prerequisites

* PostgreSQL
* Ruby 2.4.2+

## Setup

The setup process does a standard Rails setup but also creates
dummy data. If you'd like to have a play:

* Clone the repo
* bundle
* You will need some basic env variable setup by copying the .env.example file -> .env
* * Add your own values to .env

```
SECRET_KEY_BASE= (use rake secret in your terminal)
DEVISE_SECRET_KEY= (use rake secret in your terminal)
DEVISE_PEPPER= (use rake secret in your terminal)
DEFAULT_PASSWORD=SomePassword
```

* cp config/database.yml.example config/database.yml
* rake db:create
* rake db:migrate
* rake db:seed # creates a test user and adds some dummy solutions

Try 'rails s'. Good luck!
