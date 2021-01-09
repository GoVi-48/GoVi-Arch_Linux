import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.components 2.0    as PlasmaComponents
import org.kde.plasma.core 2.0          as PlasmaCore
 
Item
{
    id: root

    Layout.preferredWidth:  date_label.width  + 4   // 2 px of separation 
    Layout.maximumWidth:    date_label.width  + 4
    Layout.preferredHeight: date_label.height + 4
    Layout.maximumHeight:   date_label.height + 4

    PlasmaCore.DataSource
    {
        id:                 time_src
        engine:             "time"
        connectedSources:   ["Local"]
        interval:           1000            // 1 sec (period to refresh)
    }
    
    PlasmaComponents.Label
    {
        id:                 time_label
        text:               Qt.formatDateTime( time_src.data.Local.DateTime, "h:mm:ss AP\n" )
        anchors.centerIn:   parent
    }
    PlasmaComponents.Label
    {
        id:                 date_label
        text:               Qt.formatDateTime( time_src.data.Local.DateTime, "\nddd dd MMM yyyy" )
        anchors.centerIn:   parent
    }

}
