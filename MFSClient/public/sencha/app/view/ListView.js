Ext.define("mbi.view.ListView", {
    extend: 'Ext.List',
    xtype: 'listviewlist',
    requires: ['mbi.store.ListViewStore'],
    
    config: {
        title: 'Auftraege',
        grouped: true,
        itemTpl: '{firstName} {lastName}',
        store: Ext.create('mbi.store.ListViewStore'),
        onItemDisclosure: false
    }
});

