var PMO = PMO || {};

PMO.DrinkIngredientsView = Backbone.Marionette.CompositeView.extend({
    template: JST['drink_ingredients'],
    itemViewContainer: '#ingredients-container',
    itemView: PMO.DrinkIngredientView,

    onRender: function() {
        this.$('#new-ingredient').autocomplete({
            source: _.pluck(this.options.ingredientSource, 'label'),
            select: _.bind(function(event, ui) {
                this.$('#ingredient-id').val(_.findWhere(this.options.ingredientSource, { label: ui.item.label }).value);
            }, this)
        });
    },

    events: {
        'click #add-new-ingredient': 'addIngredient'
    },

    addIngredient: function() {
        this.collection.add(new PMO.Ingredient({
            ingredient_id: this.$('#ingredient-id').val(),
            ingredient_name: this.$('#new-ingredient').val()
        }));
        this.$('#ingredient-id').val('');
        this.$('#new-ingredient').val('');
    }
});