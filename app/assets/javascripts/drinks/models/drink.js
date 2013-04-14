
PMO.Drink = Backbone.RelationalModel.extend({
  relations: [{
    type: Backbone.HasMany,
    key: 'drink_ingredients',
    relatedModel: PMO.DrinkIngredient,
    collectionType: PMO.DrinkIngredientCollection
  }]
});