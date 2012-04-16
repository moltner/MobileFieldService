Ext.define("mbi.view.DataView", {
    extend: 'Ext.DataView',
    xtype: 'dataview',
    requires: ['mbi.store.DataViewStore'],
    
    config: {
        itemTpl: '{name} is {age} old',
        store: Ext.create('mbi.store.DataViewStore')
      
    }
});