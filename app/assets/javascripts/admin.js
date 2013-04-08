
$(function() {

  var DrinkIngredient = Backbone.RelationalModel.extend({});

  var DrinkIngredientCollection = Backbone.Collection.extend({
    model: DrinkIngredient,
    url: 'drink_ingredients'
  });

  var Drink = Backbone.RelationalModel.extend({
    relations: [{
      type: Backbone.HasMany,
      key: 'drink_ingredients',
      relatedModel: DrinkIngredient,
      collectionType: DrinkIngredientCollection
      // reverseRelation: {
        // key: 'usedIn',
        // includeInJSON: 'id',
        // relatedModel: 'Drink'
        //relationType: Backbone.HasMany
      // }
    }]
  });

  var Ingredient = Backbone.RelationalModel.extend({});

  var IngredientCollection = Backbone.Collection.extend({
    model: Ingredient,
    url: 'ingredients'
  });

  var ingredientCollection = new IngredientCollection();
  ingredientCollection.fetch();

 

  var DrinkCollection = Backbone.Collection.extend({
    model: Drink,
    url: 'admin'
  });
  var drinkCollection = new DrinkCollection();

  var DrinkTable = Backbone.View.extend({
    el: $('#drinks-table-body'),
    initialize: function() {
      this.collection.on('sync', this.render, this);
      this.collection.on('add', function() { console.log('add'); });
      this.collection.fetch();
    },
    render: function() {
      this.$el.empty();
      this.collection.each(function(model) {
        var row = new DrinkRow({model: model});
        this.$el.append(row.render().el);
      }, this);
    }  
  });

  var DrinkEditor = Backbone.View.extend({
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
        var ingredientRow = new IngredientRow({ model: ingredient });
        this.$('#ingredients-table').append(ingredientRow.render().el);
      });
      return this;
    },
    editDrink: function(drink) {
      this.model = drink;
      this.render();
    }
  });

  var drinkEditor = new DrinkEditor();

  var EditableTextCell = Backbone.View.extend({
    tagName: 'td',
    className: 'editable-text-cell',
    template: Handlebars.compile($('#editable-text-cell').html()),
    events: {
      'dblclick span': 'editField',
      'blur input': 'submitEdits',
      'keyup input': 'updateOnEnter'
    },
    initialize: function() {
      this.field = this.options.schema.field;
    },
    render: function() {
      this.$el.html(this.template({ field: this.model.get(this.field) }));
      this.$label = this.$('span');
      this.$input = this.$('input');
      return this;
    },
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

  var ActionCell = Backbone.View.extend({
    tagName: 'td',
    className: 'action-cell',
    template: Handlebars.compile($('#action-cell').html()),
    events: {
      'click input': 'performAction'
    },
    initialize: function() {
      this.label = this.options.schema.label;
      this.action = this.options.schema.action;
    },
    render: function() {
      this.$el.html(this.template({ label: this.label }));
      return this;
    },
    performAction: function() {
      this.action();
    }
  });

  var IngredientAutocompleteCell = Backbone.View.extend({
    tagName: 'td',
    className: 'autocomplete-cell',
    template: Handlebars.compile($('#autocomplete-cell').html()),
    render: function() {
      var view = this;
      var value = this.model.get('ingredient_id'), acCell = this;
      this.$el.html(this.template());
      // this.$('.ac-value').val(value);
      // this.$('.parent-ingredient').hide();
      var current = ingredientCollection.get(value);
      var display = current ? current.get('name') : '';
      this.$('.ac-display').val(display);
      this.$('.ac-display').autocomplete({
        source: function(request, response) {
          $.get('ingredients/autocomplete', request, function(data) {
            view.cache = data;
            response(_.pluck(data, 'label'));
          });
        },
        select: function(e, ui) {
          view.model.set('ingredient_id', _.findWhere(view.cache, { label: ui.item.label }).value);
          view.model.save();
        },
        change: function(e) {
          ingredientCollection.create({
            name: e.srcElement.value
          }, {
            success: function(model) {
              view.model.save({ ingredient_id: model.get('id') });
            }
          })
        }
      });
      return this;
    },
    events: {

    }
  });

  var EditableRow = Backbone.View.extend({
    tagName: 'tr',
    render: function() {
      var that = this;
      _.each(this.schema, function(schemaItem) {
        var newCell, editableCell;
        switch (schemaItem.type) {
          case 'text':
            editableCell = EditableTextCell;
            break;
          case 'action':
            editableCell = ActionCell;
            break;
          case 'autocomplete':
            editableCell = AutocompleteCell;
            break;
          default:
            editableCell = EditableTextCell;
            break;
        }
        newCell = new editableCell({ model: that.model, schema: schemaItem });
        that.$el.append(newCell.render().el);
      });
      return this;
    }
  });

  var IngredientRow = Backbone.View.extend({
    tagName: 'tr',
    render: function() {
      this.$el.append(new EditableTextCell({ model: this.model, schema: { field: 'raw_text'} }).render().el);
      this.$el.append(new IngredientAutocompleteCell({ model: this.model }).render().el);
      return this;
    }
  })

  // var IngredientRow = EditableRow.extend({
  //   className: 'ingredient',
  //   schema: [
  //     { type: 'text', field: 'raw_text' },
  //     { 
  //       type: 'autocomplete', 
  //       field: 'ingredient_id', 
  //       source: 'ingredients/autocomplete',
  //       collection: ingredientCollection
  //     }
  //   ]
  // });

  var DrinkRow = EditableRow.extend({
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

  var drinkTable = new DrinkTable({
    collection: drinkCollection
  });

});

/*
Ext.onReady(function() {

	Ext.define('Drink', {
    extend: 'Ext.data.Model',
    fields: [
      { name: 'id', type: 'integer' },
      { name: 'name', type: 'string' },
      { name: 'description', type: 'string' },
      { name: 'instructions', type: 'string' },
      { name: 'price', type: 'float' }
    ],

    hasMany: {
      model: 'DrinkIngredient',
      name: 'drink_ingredients'
    }
	});

  Ext.define('Ingredient', {
    extend: 'Ext.data.Model',
    fields: [
      { name: 'id', type: 'integer' },
      { name: 'name', type: 'string' } 
    ]
  });

  Ext.define('DrinkIngredient', {
    extend: 'Ext.data.Model',
    fields: [
      { name: 'id', type: 'integer' },
      { name: 'raw_text', type: 'string' },
      { name: 'ingredient_id', type: 'integer' }
    ],
    hasOne: { model: 'Ingredient', name: 'ingredient' }
  });

	var drinkStore = new Ext.data.JsonStore({
		model: 'Drink',
    autoLoad: true,
    proxy: {
      type: 'rest',
      format: 'json',
      url: '/drinks',
      api: {
        read: 'admin/drinks'
      }
    }
	});

  var ingredientsStore = new Ext.data.JsonStore({
    model: 'Ingredient',
    autoLoad: true,
    proxy: {
      type: 'rest',
      format: 'json',
      url: '/ingredients'
    }
  });
  console.log(ingredientsStore);

	var panel = Ext.create('Ext.grid.Panel', {
		title: 'Drinks',
		store: drinkStore,
    viewConfig: {
      listeners: {
        expandbody: function(rowNode, record, expandNode) {

          var drinkIngredientsStore = new Ext.data.JsonStore({
            model: 'DrinkIngredient',
            proxy: new Ext.data.proxy.Rest({
              type: 'rest',
              format: 'json',
              url: '/drink_ingredients'
            }),
            data: record.drink_ingredients().data.items
          });

          var ingredientsGrid = Ext.create('Ext.grid.Panel', {
            title: "Ingredients for " + record.get('name'),
            listeners: {
              edit: function(editor, e) {
                console.log(e.record);
                if (!Ext.isNumber(e.record.get('ingredient_id'))) {

                } else {
                  drinkIngredientsStore.sync();
                }

              }
            },
            store: drinkIngredientsStore,
            columns: [
              { text: 'Text', dataIndex: 'raw_text', editor: 'textfield' },
              { 
                text: 'Ingredient', 
                dataIndex: 'ingredient_id', 
                editor: new Ext.form.field.ComboBox({
                  store: ingredientsStore,
                  forceSelection: false,
                  displayField: 'name',
                  emptyText: 'Select an Ingredient',
                  valueField: 'id',
                  listeners: {
                    'selectNode': function() {
                      console.log('selected');
                    }
                  }
                }), 
                renderer: function(value) {
                  return 'stuff';
                  var ingredient = ingredientsStore.getById(value);
                  if (ingredient) {
                    return ingredient.get('name');
                  } else {
                    return '<none>';
                  }
                }
              }
            ],
            renderTo: Ext.dom.Query.selectNode('.ingredients-grid', expandNode),
            plugins: [
              Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
              })
            ]
          })
        },
        collapsebody: function(rowNode, record, expandNode) {
          console.log(Ext.ComponentQuery.query('grid', rowNode));
        }
      }
    },
    listeners: {
      edit: function(editor, e) {
        console.log(e.record.store.proxy.type);
        e.record.store.sync();
      }
    },
		columns: [
      { text: 'ID', dataIndex: 'id' },
      { text: 'Name', dataIndex: 'name', editor: 'textfield' },
      { text: 'Description', dataIndex: 'description', editor: 'textfield' },
      { text: 'Instructions', dataIndex: 'instructions', editor: 'textfield' },
      { text: 'Price', dataIndex: 'price', editor: 'textfield' }
		],
		renderTo: 'drink-table',
    plugins: [
      { 
        ptype: 'rowexpander',
        rowBodyTpl : ['<div class="ingredients-grid"></div>'],
        selectRowOnExpand: true
      },
      Ext.create('Ext.grid.plugin.CellEditing', {
        clicksToEdit: 1
      })
    ]
	});

});
*/
