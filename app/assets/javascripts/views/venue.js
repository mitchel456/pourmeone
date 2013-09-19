var PMO = PMO || {};

PMO.VenueView = Backbone.Marionette.ItemView.extend({
   tagName: 'li',
    className: 'venue-row',
   template: JST['venue']
});