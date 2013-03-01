# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'
require "fileutils"

namespace :taiwan_city_dists do

  desc "Copy city.rb and dist.rb"
  task :copy => :environment do
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    FileUtils.cp_r("#{source_root}/app/models/.", "#{Rails.root}/app/models", { :preserve => true })
  end

  desc "Grab cities and dists from wikipedia"
  task :get_cities_and_dists => :environment do
    url = "http://zh.wikipedia.org/wiki/%E4%B8%AD%E8%8F%AF%E6%B0%91%E5%9C%8B%E5%8F%B0%E7%81%A3%E5%9C%B0%E5%8D%80%E9%84%89%E9%8E%AE%E5%B8%82%E5%8D%80%E5%88%97%E8%A1%A8"
    doc = Nokogiri::HTML(open(url))
    doc.search("//table[@class='wikitable']//tr").each do |tr|
      city_name = tr.search("td[1]").text
      if city_name != ""
        #puts city_name
        @city = City.create(:name => "#{city_name}")

        dist_string = tr.search("td[3]").text
        dists = dist_string.split("、")
        dists.each do |dist_name|
          Dist.create(:name => "#{dist_name}", :city_id => @city.id)
        end
      end
    end
  end


end
