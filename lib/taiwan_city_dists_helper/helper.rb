module TaiwanCityDistsHelper
  module Helper
    def render_city_select(f, cities, blank=false)
      f.collection_select :city_id, cities, :id, :name, include_blank: blank
    end

    def render_grouped_dist_select(f, cities, blank=false)
      f.grouped_collection_select :dist_id, cities, :dists, :name, :id, :name, include_blank: blank
    end

    def render_dist_select(f, dists, blank=false)
      f.collection_select :dist_id, dists, :id, :name, include_blank: blank
    end

  end
end