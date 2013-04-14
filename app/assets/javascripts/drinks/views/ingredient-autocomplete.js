PMO.IngredientAutocompleteCell = Backbone.Marionette.View.extend({
  tagName: 'td',
  className: 'autocomplete-cell',
  template: 'cells/auto',
  // render: function() {
  //   var view = this;
  //   var value = this.model.get('ingredient_id'), acCell = this;
  //   this.$el.html(this.template());
  //   // this.$('.ac-value').val(value);
  //   // this.$('.parent-ingredient').hide();
  //   var current = ingredientCollection.get(value);
  //   var display = current ? current.get('name') : '';
  //   this.$('.ac-display').val(display);
  //   this.$('.ac-display').autocomplete({
  //     source: function(request, response) {
  //       $.get('ingredients/autocomplete', request, function(data) {
  //         view.cache = data;
  //         response(_.pluck(data, 'label'));
  //       });
  //     },
  //     select: function(e, ui) {
  //       view.model.set('ingredient_id', _.findWhere(view.cache, { label: ui.item.label }).value);
  //       view.model.save();
  //     },
  //     change: function(e) {
  //       ingredientCollection.create({
  //         name: e.srcElement.value
  //       }, {
  //         success: function(model) {
  //           view.model.save({ ingredient_id: model.get('id') });
  //         }
  //       })
  //     }
  //   });
  //   return this;
  // }
});