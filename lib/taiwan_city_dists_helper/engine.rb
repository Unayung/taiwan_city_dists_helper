require "taiwan_city_dists_helper/helper"

module TaiwanCityDistsHelper
  module Rails
    class Engine < ::Rails::Engine
      initializer "taiwan_city_dists_helper.view_helpers" do
        ActionView::Base.send :include, TaiwanCityDistsHelper::Helper
      end
    end
  end
end
