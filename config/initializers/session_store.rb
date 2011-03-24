# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_depotnew_session',
  :secret      => 'c1dafc7f0f7d678bc3e0a0ca3c5c80cebc7fda3dcd46b5b0778c016ba39f27b219f736810e345ef93c53497b0f1cf97f29f29cf29545f6ed9dbbc879fec4c024'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
