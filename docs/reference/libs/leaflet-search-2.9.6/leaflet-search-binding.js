LeafletWidget.methods.addSearchControl = function(group, options) {
  (function() {
    if(this.search) {
      this.search.removeFrom(this);
    }
    options = options || {};
    options.layer = this.layerManager.getLayerGroup(group, true);
    this.search = new L.Control.Search(options);
    this.search.addTo(this);
    this.search.on('search:locationfound', function(e) {
      if(options.openPopup && e.layer._popup) {
        e.layer.openPopup();
      }
    });
  }).call(this);
};
