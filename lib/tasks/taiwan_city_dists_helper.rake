# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'fileutils'

namespace :tcdh do
  desc 'Fetch cities and dists from OpenData API'
  task fetch: :environment do
    county_url = 'https://api.nlsc.gov.tw/other/ListCounty'
    town_url = 'https://api.nlsc.gov.tw/other/ListTown1/'
    counties = Nokogiri::XML(URI.parse(county_url).open)
    counties.css('countyItem').each do |county|
      city_name = county.css('countyname').text
      city_code = county.css('countycode').text
      city = City.create(name: city_name)
      towns = Nokogiri::XML(URI.parse(town_url + city_code).open)
      towns.css('townItem').each do |dist|
        dist_name = dist.css('townname').text
        Dist.create(name: dist_name, city: city)
      end
    end
  end
end
