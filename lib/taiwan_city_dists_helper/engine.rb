# frozen_string_literal: true

require 'taiwan_city_dists_helper/helper'

module TaiwanCityDistsHelper
  module Rails
    # included in rails engine
    class Engine < ::Rails::Engine
      initializer 'taiwan_city_dists_helper.view_helpers' do
        include TaiwanCityDistsHelper::Helper
      end
    end
  end
end
