Ext.define("mbi.view.Map", {
    extend: 'Ext.Map',
    config: {
		title: 'Maps',
		iconCls: 'user',
		fullscreen: true,
        mapOptions : {
                center : new google.maps.LatLng(37.381592, -122.135672),  //nearby San Fran
                zoom : 12,
                mapTypeId : google.maps.MapTypeId.ROADMAP,
                navigationControl: true,
                navigationControlOptions: {
                    style: google.maps.NavigationControlStyle.DEFAULT
                }
    }
    }
});