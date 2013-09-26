var PMO = PMO || {};

PMO.IngredientCollection = Backbone.Collection.extend({
    model: PMO.Ingredient,
    url: '/ingredients'
});
