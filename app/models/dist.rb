# frozen_string_literal: true

# dist model
class Dist < ActiveRecord::Base
  self.table_name = 'tcdh_dists'
  belongs_to :city
end
