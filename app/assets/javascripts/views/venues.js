var PMO = PMO || {};

PMO.VenueCollectionView = Backbone.Marionette.CollectionView.extend({
   itemView: PMO.VenueView,
   el: 'venue-list'
});