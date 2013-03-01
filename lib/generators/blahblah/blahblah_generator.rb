require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

class BlahblahGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  puts "Just blahblah"
end
