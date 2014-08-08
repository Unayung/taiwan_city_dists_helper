# -*- encoding : utf-8 -*-
class Dist < ActiveRecord::Base
  attr_accessor :name, :city_id
  belongs_to :city
end
