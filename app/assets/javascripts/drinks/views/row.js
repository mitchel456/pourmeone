
PMO.DrinkRow = PMO.EditableRow.extend({
  className: 'drink',
  events: {
    'click': 'editDrink'
  },
  schema: [
    { type: 'text', field: 'name' }
  ],
  editDrink: function() {
    Backbone.trigger('drinks:edit', this.model);
  }
});