
PMO.DrinkApp = new Backbone.Marionette.Application();

PMO.DrinkApp.addInitializer(function() {
  navigator.geolocation.getCurrentPosition(function(position) {
    var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
      new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
    );
    var autocomplete = new google.maps.places.Autocomplete(document.getElementById('drink_venue'), {
      bounds: defaultBounds,
      types: ['establishment']
    });
  });
});

PMO.DrinkApp.addInitializer(function() {
  var ingredient = new PMO.DrinkIngredient();
  drinkIngredientView = new PMO.DrinkIngredientView({ model: ingredient, el: '#ingredient' });
  drinkIngredientView.render();
});