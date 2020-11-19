# frozen_string_literal: true

# create cities and dists table
class CreateCitiesAndDists < ActiveRecord::Migration[4.2]
  def self.up
    create_table :tcdh_cities, force: true do |table|
      table.string :name
      table.timestamps
    end

    create_table :tcdh_dists, force: true do |table|
      table.string :name
      table.integer :city_id
      table.timestamps
    end
  end

  def self.down
    drop_table :tcdh_cities
    drop_table :tcdh_dists
  end
end
