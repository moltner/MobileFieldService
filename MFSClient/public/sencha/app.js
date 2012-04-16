//<debug>
Ext.Loader.setPath({
    'Ext': '/public/sencha/sdk/src'
});
//</debug>

Ext.application({
    name: 'mbi',

    requires: [
        'Ext.MessageBox'
    ],

    views: ['Main','Detail','DataView','ListView'],  //'Map',
	models: ['ListViewModel','DetailDataModel'],
	stores: ['ListViewStore','DataViewStore'],
    icon: {
        57: '/public/sencha/resources/icons/Icon.png',
        72: '/public/sencha/resources/icons/Icon~ipad.png',
        114: '/public/sencha/resources/icons/Icon@2x.png',
        144: '/public/sencha/resources/icons/Icon~ipad@2x.png'
    },
    
    phoneStartupScreen: '/public/sencha/resources/loading/Homescreen.jpg',
    tabletStartupScreen: '/public/sencha/resources/loading/Homescreen~ipad.jpg',

    launch: function() {
        // Destroy the #appLoadingIndicator element
        Ext.fly('appLoadingIndicator').destroy();

        // Initialize the main view
        Ext.Viewport.add(Ext.create('mbi.view.Main'));
    },

    onUpdated: function() {
        Ext.Msg.confirm(
            "Application Update",
            "This application has just successfully been updated to the latest version. Reload now?",
            function() {
                window.location.reload();
            }
        );
    }
});
