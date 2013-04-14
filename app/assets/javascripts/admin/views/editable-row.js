
PMO.EditableRow = Backbone.View.extend({
  tagName: 'tr',
  render: function() {
    var that = this;
    _.each(this.schema, function(schemaItem) {
      var newCell, editableCell;
      switch (schemaItem.type) {
        case 'text':
          editableCell = PMO.EditableTextCell;
          break;
        case 'autocomplete':
          editableCell = PMO.AutocompleteCell;
          break;
        default:
          editableCell = PMO.EditableTextCell;
          break;
      }
      newCell = new editableCell({ model: that.model, schema: schemaItem });
      that.$el.append(newCell.render().el);
    });
    return this;
  }
});