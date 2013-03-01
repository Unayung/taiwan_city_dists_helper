module TaiwanCityDistsHelper
  module Helper
    def render_city_select(f, cities)
      #select_tag "cities", options_from_collection_for_select(cities, "id", "name")
      f.collection_select :city_id, cities, :id, :name, include_blank: true
    end

    def render_dist_select(f, cities, dists)
      #select_tag "dists", grouped_options_for_select(dists, "id", "name")
      f.grouped_collection_select :dist_id, cities, :dists, :name, :id, :name, include_blank: true
    end
  end
end