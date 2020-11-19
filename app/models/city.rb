# frozen_string_literal: true

# city model
class City < ActiveRecord::Base
  has_many :dists
end
