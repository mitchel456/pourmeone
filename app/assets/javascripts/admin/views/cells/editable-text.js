
PMO.EditableTextCell = Backbone.Marionette.View.extend({
  tagName: 'td',
  className: 'editable-text-cell',
  template: 'cells/editable-text',
  events: {
    'dblclick span': 'editField',
    'blur input': 'submitEdits',
    'keyup input': 'updateOnEnter'
  },
  initialize: function() {
    this.field = this.options.schema.field;
  },
  // render: function() {
  //   this.$el.html(this.template({ field: this.model.get(this.field) }));
  //   this.$label = this.$('span');
  //   this.$input = this.$('input');
  //   return this;
  // },
  editField: function() {
    this.$el.addClass('editing');
  },
  submitEdits: function() {
    var newValue = this.$input.val();
    this.model.set(this.field, newValue);
    this.model.save();
    this.$label.text(newValue);
    this.$el.removeClass('editing');
  },
  updateOnEnter: function(e) {
    if (e.keyCode == 13) this.submitEdits();
  }
});