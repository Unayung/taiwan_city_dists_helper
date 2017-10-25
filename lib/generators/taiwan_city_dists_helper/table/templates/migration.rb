class CreateCitiesAndDists < ActiveRecord::Migration
  def self.up
    create_table :cities, :force => true do |table|
      table.string :name
      table.timestamps
    end

    create_table :dists, :force => true do |table|
      table.string :name
      table.integer :city_id
      table.timestamps
    end
  end

  def self.down
    drop_table :cities
    drop_table :dists
  end
end
