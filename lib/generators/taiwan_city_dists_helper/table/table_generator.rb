require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module TaiwanCityDistsHelper
  module Generators
    class TableGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      self.source_paths << File.join(File.dirname(__FILE__), 'templates')

      def create_migration_file
        migration_template "migration.rb", "db/migrate/create_cities_and_dists.rb"
      end

      def self.next_migration_number(path)
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end
end