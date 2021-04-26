if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_acebook-insert-team-name-here', domain: 'acebook-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_acebook-insert-team-name-here'
end
