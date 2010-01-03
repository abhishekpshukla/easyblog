# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_easyblog_session',
  :secret      => '8342bfd56ebe27055d226976855ec1e78e2805d0ce096ae0d8b9c6e22195a066c5b6295ed78eb17da723b91325365ec5b65c01a1eb03cbba8486cf679383d61b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
