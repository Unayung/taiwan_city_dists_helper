# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'ruby-progressbar'

namespace :tcdh do
  desc 'Fetch cities and dists from OpenData API'
  task fetch: :environment do
    progressbar = ProgressBar.create(total: 368, format: '%t: |%B| %c/%C')
    county_url = 'https://api.nlsc.gov.tw/other/ListCounty'
    town_url = 'https://api.nlsc.gov.tw/other/ListTown1/'
    progressbar.log '連線至 https://api.nlsc.gov.tw/other/ListCounty 取得縣市資料'
    counties = Nokogiri::XML(URI.parse(county_url).open)
    counties.css('countyItem').each do |county|
      city_name = county.css('countyname').text
      city_code = county.css('countycode').text
      progressbar.log "建立 #{city_name} 記錄"
      city = City.create(name: city_name)
      progressbar.log "連線至 https://api.nlsc.gov.tw/other/ListTown1/#{city_code} 取得 #{city_name} 資料"
      towns = Nokogiri::XML(URI.parse(town_url + city_code).open)
      towns.css('townItem').each do |dist|
        dist_name = dist.css('townname').text
        progressbar.log "建立 #{dist_name} 記錄"
        Dist.create(name: dist_name, city: city)
        progressbar.increment
      end
      sleep(1)
    end
  end
end
