# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
# CollectionApi::Application.config.secret_token = 'e61dca2530e088764e73afcdf38d977b54ca06bd72a476080635447797bd656c2b509023bb7b9e511f9c2225f9893024b763c7ceea961a10f2e4590c6bdc0aeb'
CollectionApi::Application.config.secret_token = ENV['SECRET_TOKEN']