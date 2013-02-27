require "rails"
require "taiwan_city_dists_helper/version"
require "action_view"

module TaiwanCityDistsHelper
  # Your code goes here...
  module Rails
    if ::Rails.version < "3.1"
      require "taiwan_city_dists_helper/railtie"
    else
      require "taiwan_city_dists_helper/engine"
    end
  end
end
