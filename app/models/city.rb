# -*- encoding : utf-8 -*-
class City < ActiveRecord::Base
  attr_accessor :name
  has_many :dists
end
