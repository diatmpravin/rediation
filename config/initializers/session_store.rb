# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_radiation_session',
  :secret      => '37137c01a6cb496ba11a73314e88c4360313d04514f50f0a4a018cba14425ebaafd010bb36ff271944d6646d59fbcc167bfeb3f9b3592ea1ca30a608f2b18f84'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
