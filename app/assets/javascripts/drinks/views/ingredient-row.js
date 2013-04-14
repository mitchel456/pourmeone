
PMO.IngredientRow = Backbone.View.extend({
  tagName: 'tr',
  render: function() {
    this.$el.append(new PMO.EditableTextCell({ model: this.model, schema: { field: 'raw_text'} }).render().el);
    this.$el.append(new PMO.IngredientAutocompleteCell({ model: this.model }).render().el);
    return this;
  }
});