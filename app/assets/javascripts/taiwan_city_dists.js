$(function() {
  var dists;
  dists = $('select[id*="_dist_id"]').html();
  return $('select[id*="_city_id"]').change(function() {
    var city, escaped_city, options;
    city = $('select[id*="_city_id"] :selected').text();
    escaped_city = city.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(dists).filter("optgroup[label=" + escaped_city + "]").html();
    if (options) {
      return $('select[id*="_dist_id"]').html(options);
    } else {
      return $('select[id*="_dist_id"]').empty();
    }
  });
});