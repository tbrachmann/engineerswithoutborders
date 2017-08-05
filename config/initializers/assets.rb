# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( users.js.coffee )
Rails.application.config.assets.precompile += %w( multi-select.css )
Rails.application.config.assets.precompile += %w( multi-select.js )
Rails.application.config.assets.precompile += %w( edit-volunteers.js )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile << /\.(?:png|jpg|jpeg|gif)\z/
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
