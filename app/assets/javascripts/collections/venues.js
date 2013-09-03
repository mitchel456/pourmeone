var PMO = PMO || {};
PMO.VenueCollection = Backbone.Collection.extend({
    model: PMO.Venue,
    url: '/venues'
});
