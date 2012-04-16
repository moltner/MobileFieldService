Ext.define('mbi.store.DataViewStore', {
    extend: 'Ext.data.Store',
   // requires: ['Ext.data.proxy.JsonP'],
    config: {
        model: 'mbi.model.DetailDataModel',
        sorters: 'name',
        autoLoad: true,
        grouper : function(record) {
            return record.get('name')[0];
        },
        proxy: {
            type: 'ajax',
            url: '/app/Dataview/alljson',

            reader: {
                type: 'json',
                rootProperty: 'results'
            }
        }
    }
});