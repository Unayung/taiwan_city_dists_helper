# frozen_string_literal: true

require 'taiwan_city_dists_helper/version'

module TaiwanCityDistsHelper
  # injected in rails
  module Rails
    require 'taiwan_city_dists_helper/engine'
  end
end
