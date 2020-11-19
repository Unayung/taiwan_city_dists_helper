# frozen_string_literal: true

module TaiwanCityDistsHelper
  # view helpers
  module Helper
    def render_city_select(form, cities, options = {}, html_options = {})
      form.collection_select :city_id, cities, :id, :name, options, html_options
    end

    def render_grouped_dist_select(form, cities, options = {}, html_options = {})
      form.grouped_collection_select :dist_id, cities, :dists, :name, :id, :name, options, html_options
    end

    def render_dist_select(form, dists, options = {}, html_options = {})
      form.collection_select :dist_id, dists, :id, :name, options, html_options
    end
  end
end
