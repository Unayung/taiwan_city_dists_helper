# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'
require "fileutils"

namespace :taiwan_city_dists do

  desc "Copy city.rb and dist.rb"
  task :copy do
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    FileUtils.cp_r("#{source_root}/app/models/.", "#{Rails.root}/app/models", { :preserve => true })
  end

  desc "Grab Cities"
  task :get_cities do
    url = "http://zh.wikipedia.org/wiki/%E4%B8%AD%E8%8F%AF%E6%B0%91%E5%9C%8B%E5%8F%B0%E7%81%A3%E5%9C%B0%E5%8D%80%E9%84%89%E9%8E%AE%E5%B8%82%E5%8D%80%E5%88%97%E8%A1%A8"
    list = Nokogiri::HTML(open(url))
    cities = []
    scans = list.css("table.wikitable b a")
    # puts scans.text
    scans.each do |scan|
      City.new
    end
  end

  desc "Grab Dists"
  task :get_dists do
  end

end
