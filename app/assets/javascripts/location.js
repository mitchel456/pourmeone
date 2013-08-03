(function() {
  navigator.geolocation.getCurrentPosition(function(pos) {
    var drinkForm = $('form#drink_search');
    if (drinkForm) {
      drinkForm.append('<input type="hidden" name="lat" value="' + pos.coords.latitude + '" />');
      drinkForm.append('<input type="hidden" name="lon" value="' + pos.coords.longitude + '" />');
    }
  });
})();
