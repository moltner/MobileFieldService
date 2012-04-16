Ext.define("mbi.view.Detail", {
    extend: 'Ext.Container',
    requires: ['Ext.TitleBar','mbi.view.ListView','mbi.view.DataView'],
  
    config: {
	    title: 'Details',
		fullscreen: true,
		layout: 'hbox',
         items: [
          {
        	 xtype:'listviewlist',
        	 flex:1
         },
         {
        	 xtype:'dataview',
        	 flex:2
         }
         
         ]
                 
    
    }
});