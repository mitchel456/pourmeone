var PMO = PMO || {};

PMO.DrinkIngredientView = Backbone.Marionette.ItemView.extend({
   tagName: 'li',
   className: 'drink-ingredient-row',
   template: JST['drink_ingredient'],

    events: {
        'click .delete': 'removeIngredient'
    },

    removeIngredient: function() {
        this.model.destroy();
    }
});