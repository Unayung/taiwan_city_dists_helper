# TaiwanCityDistsHelper

Generate Taiwan City and Districts models with dynamic select boxes

輕鬆產生台灣鄉鎮市的 model relation 以及動態 select box

## Installation

Add this line to your application's Gemfile:

    gem 'taiwan_city_dists_helper'

And then execute:

    $ bundle install

## Preparation

    1. bundle exec rails g tcdh:table
    2. bundle exec rails db:migrate
    3. bundle exec rails tcdh:fetch
    4. add //= require taiwan_city_dists_helper to your application.js ( webpacker not supported )

Make sure your object ( let's say Customer ) has relations with city and dist, so you have to
add city\_id and dist\_id to your customers table, and define belongs_to in your customer.rb

    class Customer < ActiveRecord::Base
      belongs_to :city
      belongs_to :dist
    end

## Helper

### render\_city\_select(FormObject, CollectionOfCities, IncludeBlank?=false)
will render

    <select id="customer_city_id" name="customer[city_id]">
    <option value="1">臺北市</option>
    <option value="2">新北市</option>
    <option value="3">臺中市</option>
    .....
    </select>

### render\_dist\_select(FormObject, CollectionOfDists, IncludeBlank?=false)
will render

    <select id="customer_dist_id" name="customer[dist_id]">
    <option value="1">松山區</option>
    <option value="2">大安區</option>
    <option value="3">大同區</option>
    <option value="4">中山區</option>
    <option value="5">內湖區</option>
    .....
    </select>

### render\_grouped\_dist\_select(FormObject, CollectionOfCities, IncludeBlank?=false)
will render

    <select id="customer_dist_id" name="customer[dist_id]">
    <optgroup label="臺北市">
      <option value="1">松山區</option>
      <option value="2">大安區</option>
      <option value="3">大同區</option>
      <option value="4">中山區</option>
      <option value="5">內湖區</option>
      <option value="6">南港區</option>
      <option value="7">士林區</option>
      <option value="8">北投區</option>
      <option value="9">信義區</option>
      <option value="10">中正區</option>
      <option value="11">萬華區</option>
      <option value="12">文山區</option>
    </optgroup>
    <optgroup label="新北市">
      <option value="13">板橋區</option>
      <option value="14">三重區</option>
      <option value="15">永和區</option>
      <option value="16">中和區</option>
      .....
    </select>

## Example

With simple\_form you can do this

    <%= simple_form_for(@customer, :url => customers_path ) do |f| %>
      <%= f.label "交易地點" %>
      <%= render_city_select(f, @cities, false) %>
      <%= render_grouped_dist_select(f, @cities, false) %>
    <% end %>

Or with form\_for you still can do this

    <%= form_for @customer do |f| %>
      <%= f.label "交易地點" %>
      <%= render_city_select(f, @cities, false) %>
      <%= render_grouped_dist_select(f, @cities, false) %>
    <% end %>

When you using render\_city\_select and render\_grouped\_dist\_select together

dist select box will dynamic filter matching options

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
