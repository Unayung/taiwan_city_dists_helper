module TaiwanCityDistsHelper
  module Helper
    def render_city_select(f, cities, options={}, html_options={})
      f.collection_select :city_id, cities, :id, :name, options, html_options
    end

    def render_grouped_dist_select(f, cities, options={}, html_options={})
      f.grouped_collection_select :dist_id, cities, :dists, :name, :id, :name, options, html_options
    end

    def render_dist_select(f, dists, options={}, html_options={})
      f.collection_select :dist_id, dists, :id, :name, options, html_options
    end

  end
end