require 'httparty'
require 'json-schema'
require 'time'
require 'digest/md5'
require_relative File.expand_path('../../classes/authentication.rb', __FILE__)
require_relative File.expand_path('../../classes/request.rb', __FILE__)
require_relative File.expand_path('../../schemas/schema_characters.rb', __FILE__)