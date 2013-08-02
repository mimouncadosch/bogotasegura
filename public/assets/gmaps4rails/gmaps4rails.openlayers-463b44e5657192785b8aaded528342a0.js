((function(){var a={}.hasOwnProperty,b=function(b,c){function e(){this.constructor=b}for(var d in c)a.call(c,d)&&(b[d]=c[d]);return e.prototype=c.prototype,b.prototype=new e,b.__super__=c.prototype,b};this.Gmaps4RailsOpenlayers=function(a){function c(){c.__super__.constructor.apply(this,arguments),this.map_options={},this.mergeWithDefault("map_options"),this.markers_conf={},this.mergeWithDefault("markers_conf"),this.openMarkers=null,this.markersLayer=null,this.markersControl=null,this.polylinesLayer=null}return b(c,a),c.prototype.createPoint=function(a,b){},c.prototype.createLatLng=function(a,b){return(new OpenLayers.LonLat(b,a)).transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913"))},c.prototype.createAnchor=function(a){return a===null?null:new OpenLayers.Pixel(a[0],a[1])},c.prototype.createSize=function(a,b){return new OpenLayers.Size(a,b)},c.prototype.createLatLngBounds=function(){return new OpenLayers.Bounds},c.prototype.createMap=function(){var a;return a=new OpenLayers.Map(this.map_options.id),a.addLayer(new OpenLayers.Layer.OSM),a.setCenter(this.createLatLng(this.map_options.center_latitude,this.map_options.center_longitude),this.map_options.zoom),a},c.prototype.createMarker=function(a){var b,c;return c=OpenLayers.Util.extend({},OpenLayers.Feature.Vector.style["default"]),c.fillOpacity=1,this.markersLayer===null&&(this.markersLayer=new OpenLayers.Layer.Vector("Markers",null),this.serviceObject.addLayer(this.markersLayer),this.markersLayer.events.register("featureselected",this.markersLayer,this.onFeatureSelect),this.markersLayer.events.register("featureunselected",this.markersLayer,this.onFeatureUnselect),this.markersControl=new OpenLayers.Control.SelectFeature(this.markersLayer),this.serviceObject.addControl(this.markersControl),this.markersControl.activate()),a.marker_picture===""?(c.graphicHeight=30,c.externalGraphic="http://openlayers.org/dev/img/marker-blue.png"):(c.graphicWidth=a.marker_width,c.graphicHeight=a.marker_height,c.externalGraphic=a.marker_picture,a.marker_anchor!==null&&(c.graphicXOffset=a.marker_anchor[0],c.graphicYOffset=a.marker_anchor[1]),a.shadow_picture!==""&&(c.backgroundGraphic=a.shadow_picture,c.backgroundWidth=a.shadow_width,c.backgroundHeight=a.shadow_height,a.shadow_anchor!==null&&(c.backgroundXOffset=a.shadow_anchor[0],c.backgroundYOffset=a.shadow_anchor[1]))),c.graphicTitle=a.marker_title,b=new OpenLayers.Feature.Vector(new OpenLayers.Geometry.Point(a.Lng,a.Lat),null,c),b.geometry.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),this.markersLayer.addFeatures([b]),b},c.prototype.clearMarkers=function(){return this.clearMarkersLayerIfExists(),this.markersLayer=null,this.boundsObject=new OpenLayers.Bounds},c.prototype.clearMarkersLayerIfExists=function(){if(this.markersLayer!==null&&this.serviceObject.getLayer(this.markersLayer.id)!==null)return this.serviceObject.removeLayer(this.markersLayer)},c.prototype.extendBoundsWithMarkers=function(){var a,b,c,d,e;console.log("here"),d=this.markers,e=[];for(b=0,c=d.length;b<c;b++)a=d[b],e.push(this.boundsObject.extend(this.createLatLng(a.lat,a.lng)));return e},c.prototype.createClusterer=function(a){var b,c,d,e,f;return d={pointRadius:"${radius}",fillColor:"#ffcc66",fillOpacity:.8,strokeColor:"#cc6633",strokeWidth:"${width}",strokeOpacity:.8},c={context:{width:function(a){var b;return(b=a.cluster)!=null?b:{2:1}},radius:function(a){var b;return b=2,a.cluster&&(b=Math.min(a.attributes.count,7)+2),b}}},f=new OpenLayers.Style(d,c),e=new OpenLayers.Strategy.Cluster,b=new OpenLayers.Layer.Vector("Clusters",{strategies:[e],styleMap:new OpenLayers.StyleMap({"default":f,select:{fillColor:"#8aeeef",strokeColor:"#32a8a9"}})}),this.clearMarkersLayerIfExists(),this.serviceObject.addLayer(b),b.addFeatures(a),b},c.prototype.clusterize=function(){var a,b,c,d,e;if(this.markers_conf.do_clustering===!0){this.markerClusterer!==null&&this.clearClusterer(),b=new Array,e=this.markers;for(c=0,d=e.length;c<d;c++)a=e[c],b.push(a.serviceObject);return this.markerClusterer=this.createClusterer(b)}},c.prototype.clearClusterer=function(){return this.serviceObject.removeLayer(this.markerClusterer)},c.prototype.createInfoWindow=function(a){if(a.description!=null)return a.serviceObject.infoWindow=a.description},c.prototype.onPopupClose=function(a){return this.markersControl.unselect(this.feature)},c.prototype.onFeatureSelect=function(a){var b,c;return b=a.feature,c=new OpenLayers.Popup.FramedCloud("featurePopup",b.geometry.getBounds().getCenterLonLat(),new OpenLayers.Size(300,200),b.infoWindow,null,!0,this.onPopupClose),b.popup=c,c.feature=b,this.map.addPopup(c)},c.prototype.onFeatureUnselect=function(a){var b;b=a.feature;if(b.popup)return this.map.removePopup(b.popup),b.popup.destroy(),b.popup=null},c.prototype.create_polyline=function(a){var b,c,d,e,f,g,h,i,j,k,l,m;this.polylinesLayer===null&&(this.polylinesLayer=new OpenLayers.Layer.Vector("Polylines",null),this.serviceObject.addLayer(this.polylinesLayer),this.polylinesLayer.events.register("featureselected",this.polylinesLayer,this.onFeatureSelect),this.polylinesLayer.events.register("featureunselected",this.polylinesLayer,this.onFeatureUnselect),this.polylinesControl=new OpenLayers.Control.DrawFeature(this.polylinesLayer,OpenLayers.Handler.Path),this.serviceObject.addControl(this.polylinesControl)),g=[];for(l=0,m=a.length;l<m;l++)c=a[l],c===a[0]&&(h=c.strokeColor||this.polylines_conf.strokeColor,i=c.strokeOpacity||this.polylines_conf.strokeOpacity,j=c.strokeWeight||this.polylines_conf.strokeWeight,b=c.clickable||this.polylines_conf.clickable,k=c.zIndex||this.polylines_conf.zIndex),c.lat!=null&&c.lng!=null&&(d=new OpenLayers.Geometry.Point(c.lng,c.lat),g.push(d));return e=new OpenLayers.Geometry.LineString(g),f={strokeColor:h,strokeOpacity:i,strokeWidth:j},a=new OpenLayers.Feature.Vector(e,null,f),a.geometry.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),this.polylinesLayer.addFeatures([a]),a},c.prototype.updateBoundsWithPolylines=function(){},c.prototype.updateBoundsWithPolygons=function(){},c.prototype.updateBoundsWithCircles=function(){},c.prototype.fitBounds=function(){return this.serviceObject.zoomToExtent(this.boundsObject,!0)},c.prototype.centerMapOnUser=function(){return this.serviceObject.setCenter(this.userLocation)},c.prototype.extendMapBounds=function(){},c.prototype.adaptMapToBounds=function(){return this.fitBounds()},c}(Gmaps4Rails)})).call(this);