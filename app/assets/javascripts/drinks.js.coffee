# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

_.templateSettings = {
	interpolate: /\[\%\=(.+?)\%\]/g,
	evaluate: /\[\%(.+?)\%\]/g
}

$(document).ready () ->

	DrinkIngredient = Backbone.Model.extend({
		defaults: {
			raw_text: ''
		}
	})
	

	DrinkIngredientView = Backbone.View.extend({

		tagName: 'li',
		ingTemplate: _.template( $('script.di-template').html() ),
		events: {
			'click .close': 'remove',
			'keypress input[type=text]': 'enterText'
		},

		initialize: () ->
			_.bindAll(this, 'render')
			this.model.bind('change', this.render)

		render: () ->
			this.$el.html( this.ingTemplate( this.model.toJSON() ) )
			this.input = this.$('input')
			this.remover = this.$('.close')
			return this

		enterText: (e) ->
			if e.keyCode != 13
				return
			this.model.set('raw_text', $(e.currentTarget).val())

			# render a new drink ingredient row
			newDrinkIngredient = new DrinkIngredient();
			newView = new DrinkIngredientView({ model: newDrinkIngredient })
			newView.render()
			$('.ingredient-list').append(newView.el)
			
			# focus on the newly created input
			$(newView.el).find('input').focus()
			return false

		remove: () -> 
			this.$el.remove()
			return false
	})

	di = new DrinkIngredient()
	drinkIngredientView = new DrinkIngredientView({ model: di, el: '#ingredient' })
	drinkIngredientView.render()