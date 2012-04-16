Ext.define("mbi.view.Main", {
    extend: 'Ext.TabPanel',
    requires: ['Ext.TitleBar'],
    
    config: {
		fullscreen: true,
        tabBarPosition: 'bottom',
        

         items: [
        		Ext.create('mbi.view.Detail')
        		,Ext.create('mbi.view.Map')
        		]
    }
});