
PMO.DrinkTable = Backbone.View.extend({
  el: $('#drinks-table-body'),
  initialize: function() {
    this.collection.on('sync', this.render, this);
    this.collection.on('add', function() { console.log('add'); });
    this.collection.fetch();
  },
  render: function() {
    this.$el.empty();
    this.collection.each(function(model) {
      var row = new PMO.DrinkRow({model: model});
      this.$el.append(row.render().el);
    }, this);
  }  
});