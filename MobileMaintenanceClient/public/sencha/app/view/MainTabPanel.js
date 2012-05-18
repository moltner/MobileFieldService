/*
 * File: app/view/MainTabPanel.js
 *
 * This file was generated by Sencha Architect version 2.0.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Sencha Touch 2.0.x library, under independent license.
 * License of Sencha Architect does not include license for Sencha Touch 2.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('MyApp.view.MainTabPanel', {
    extend: 'Ext.tab.Panel',
    requires: [
        'MyApp.view.DetailContainer',
        'MyApp.view.MapContainer',
        'MyApp.view.SettingsContainer'
    ],
	id:'mainTabPanel',
    config: {
        layout: {
            animation: 'slide',
            type: 'card'
        },
        items: [
            {
                xtype: 'mycontainer',
                title: 'Order Services',
                iconCls: 'info'
            },
            {
                xtype: 'mycontainer1',
                title: 'Map View',
                iconCls: 'info'
            },
            {
                xtype: 'settingscontainer',
                title: 'Form',
                iconCls: 'info'
            }
        ],
        tabBar: {
            docked: 'bottom'
        }
    }

});