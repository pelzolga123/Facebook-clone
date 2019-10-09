# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.factory_bot.definition_file_paths = ["spec/factories"]
