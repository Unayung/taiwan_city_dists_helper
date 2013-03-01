# -*- encoding : utf-8 -*-
class Dist < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :city
end
