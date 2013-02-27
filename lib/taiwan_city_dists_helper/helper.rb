module TaiwanCityDistsHelper
  module Helper
    def render_city_select
      select_tag "cities", options_from_collection_for_select(@cities, "id", "name")
    end

    def render_dist_select
      select_tag "dists", options_from_collection_for_select(@dists, "id", "name")
    end
  end
end