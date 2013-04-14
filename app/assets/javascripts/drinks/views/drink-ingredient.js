
PMO.DrinkIngredientView = Backbone.Marionette.View.extend({

  tagName: 'li',
  template: 'drinks/ingredient',
  events: {
    'click .close': 'remove',
    'keypress input[type=text]': 'enterText'
  },

  // initialize: function() {

  // }
  //   _.bindAll(this, 'render')
  //   this.model.bind('change', this.render)

  // render: () ->
  //   this.$el.html( this.ingTemplate( this.model.toJSON() ) )
  //   this.input = this.$('input')
  //   this.remover = this.$('.close')
  //   return this

  enterText: function(e) {
    if (e.keyCode != 13) {
      return;
    }

    this.model.set('raw_text', $(e.currentTarget).val());

    // render a new drink ingredient row
    var newDrinkIngredient = new PMO.DrinkIngredient();
    var newView = new PMO.DrinkIngredientView({ model: newDrinkIngredient })
    newView.render()
    $('.ingredient-list').append(newView.el);
    
    // focus on the newly created input
    $(newView.el).find('input').focus();
    return false;
  },

  remove: function() {
    this.$el.remove();
    return false;
  }
})