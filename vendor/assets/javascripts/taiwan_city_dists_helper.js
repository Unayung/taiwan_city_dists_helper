$(function() {
  var dists;
  dists = $('select[id*="_dist_id"]').html();
  $('select[id*="_city_id"]').change(function() {
    var city, escaped_city, options;
    city = $('select[id*="_city_id"] :selected').text();
    escaped_city = city.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    if (dists.indexOf("optgroup") != -1){
      options = $(dists).filter("optgroup[label=" + escaped_city + "]").html();
      if (options) {
        $('select[id*="_dist_id"]').html(options);
      } else {
        $('select[id*="_dist_id"]').empty();
      }
    }
  });
});