import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import Qt.labs.folderlistmodel 2.1

Item {
    
    property alias cfg_speed: speed.value;
    property alias cfg_type: type.currentText;

    GridLayout {
        Layout.fillWidth: true;
        columns: 2;
        rows: 4;
        Image{
            Layout.column:2
            Layout.row: 1
            id:body;
            source: "../../images/turn/penguin_13.png";
            rotation:0;
        }
      
      Text {
            Layout.row: 1
            Layout.column:1
            text: i18n('<p><b>
                          <a href=\http://konstantinz.byethost32.com/penguin_desktop.htm\>Desktop Penguin 1.0</a>
                        </b></p>
                       <p>Real live penguin on you desktop.</p>
                       ');
            Layout.alignment: Qt.AlignLeft;
            onLinkActivated: Qt.openUrlExternally(link)
            }
        

       Label {
            Layout.row: 2
            Layout.column:1
            text: i18n('<b>Penguin speed:</b>');
            //Layout.alignment: Qt.AlignLeft;
        }
       Slider {
           Layout.row: 3
           Layout.column:1
           id: speed;
           maximumValue: 50.0;
           stepSize: 1.0;
           
        }
        
       Label {
            Layout.row: 4
            Layout.column:1
            text: i18n('<b>Penguin Type:</b>');
            Layout.alignment: Qt.AlignLeft;
           
        }        
        
       ComboBox {
            Layout.row: 4
            Layout.column:2
            id: type;
            Layout.alignment: Qt.AlignLeft;
            
            //model: ["ls ../images/"]
            FolderListModel{
                folder: "../../images/"
                showDirs : true
                showFiles : false
                id:folderModel
                
            }

            model:folderModel
            textRole: 'fileName'
             
            //model: [ "penguin", "tophat", "Coconut" ]
        }        
                
        
    }
    
}
