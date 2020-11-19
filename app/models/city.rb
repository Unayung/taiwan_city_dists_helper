# frozen_string_literal: true

# city model
class City < ActiveRecord::Base
  self.table_name = 'tcdh_cities'
  has_many :dists
end
