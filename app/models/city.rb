# -*- encoding : utf-8 -*-
class City < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :dists
end
