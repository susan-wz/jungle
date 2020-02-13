# Jungle

Jungle is a mini e-commerce application built with Rails 4.2. I worked on this project during week 9 of the Lighthouse Labs bootcamp. 

We were given base code for this project with the intention of learning how to work with new and unfamiliar code when joining a project that's already been built. I had to familiarize myself with the code and then add a number of features to it: 
 - user authentication
 - the product sold out badge
 - functionality for admins to manage products
 - functionality for admins to manage product categories
 - functionality for admins to manage storewide sales
 - enhancing the order details page
 - security for the admin section
 - email confirmations once an order has been placed
 - changing the purchase flow in the index, product and cart pages
 - client and server side validation for admins creating new products, categories, and sales

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
Used for testing: 
* Capybara
* Poltergeist
* Database Cleaner
