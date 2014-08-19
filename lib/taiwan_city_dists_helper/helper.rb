module TaiwanCityDistsHelper
  module Helper
    def render_city_select(f, cities, blank=false, html_options = {})
      f.collection_select :city_id, cities, :id, :name, include_blank: blank, html_options: html_options
    end

    def render_grouped_dist_select(f, cities, blank=false, html_options = {})
      f.grouped_collection_select :dist_id, cities, :dists, :name, :id, :name, include_blank: blank, html_options: html_options
    end

    def render_dist_select(f, dists, blank=false, html_options = {})
      f.collection_select :dist_id, dists, :id, :name, include_blank: blank, html_options: html_options
    end

  end
end