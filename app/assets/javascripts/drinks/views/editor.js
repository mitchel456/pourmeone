
PMO.DrinkEditor = Backbone.View.extend({
  el: $('#drinks-box'),
  //template: Handlebars.compile($('#edit-drink-box').html()),
  initialize: function() {
    this.listenTo(Backbone, 'drinks:edit', this.editDrink);
  },
  render: function () {
    //this.$el.html(this.template(this.model.attributes));
    this.$('#drink_name').val(this.model.get('name'));
    this.$('#ingredients-table').empty();
    this.model.get('drink_ingredients').each(function(ingredient) {
      var ingredientRow = new PMO.IngredientRow({ model: ingredient });
      this.$('#ingredients-table').append(ingredientRow.render().el);
    });
    return this;
  },
  editDrink: function(drink) {
    this.model = drink;
    this.render();
  }
});