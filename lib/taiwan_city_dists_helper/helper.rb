module TaiwanCityDistsHelper
  module Helper
    def render_city_select(f, cities, blank=false)
      #select_tag "cities", options_from_collection_for_select(cities, "id", "name")
      f.collection_select :city_id, cities, :id, :name, include_blank: blank
    end

    def render_grouped_dist_select(f, cities, blank=false)
      #select_tag "dists", grouped_options_for_select(dists, "id", "name")
      f.grouped_collection_select :dist_id, cities, :dists, :name, :id, :name, include_blank: blank
    end

    def render_dist_select(f, dists, blank=false)
      f.collection_select :dist_id, dists, :id, :name, include_blank: blank
    end

    def render_city_dists_js
      s = <<-HEREDOC
      jQuery ->
        $('#person_state_id').parent().hide()
        states = $('#person_state_id').html()
        $('#person_country_id').change ->
          country = $('#person_country_id :selected').text()
          escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
          options = $(states).filter("optgroup[label=#{escaped_country}]").html()
          console.log(options)
          if options
            $('#person_state_id').html(options)
            $('#person_state_id').parent().show()
          else
            $('#person_state_id').empty()
            $('#person_state_id').parent().hide()
      HEREDOC
    end
  end
end