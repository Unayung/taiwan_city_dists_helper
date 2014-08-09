# -*- encoding : utf-8 -*-
class City < ActiveRecord::Base
  has_many :dists
end
