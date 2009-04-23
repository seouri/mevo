# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mevo_session',
  :secret      => '92f8670425776803d902c0e3911d2f37c515e1f3c45b398eb3d7ea9e3535300e715a55ab800bec5146c9eef73386dabdad7fa53a38e4d62d202aa148edd03d21'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
