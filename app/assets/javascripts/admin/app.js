
PMO.AdminApp = new Backbone.Marionette.Application();

PMO.AdminApp.addInitializer(function() {

  var ingredientCollection = new PMO.IngredientCollection();
  ingredientCollection.fetch();

  var drinkCollection = new PMO.DrinkCollection();
  var drinkEditor = new PMO.DrinkEditor();
  var drinkTable = new PMO.DrinkTable({
    collection: drinkCollection
  });
});

