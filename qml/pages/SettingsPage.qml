import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "../JS/preferences.js" as Preferences

Page {
    id: settingsPage

    property var options: ['€','£','$']

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Restore Default"
                //onClicked:
            }
        }

        contentHeight: column.height

        Column {
            id: column

            width: settingsPage.width
            spacing: Theme.paddingSmall
            PageHeader {
                title: "Settings"
            }

            ComboBox {
                width: parent.width * 0.75
                anchors {horizontalCenter: parent.horizontalCenter}
                label: "Currency: "
                currentIndex: Preferences.get("Currency",0)

                menu: ContextMenu {
                    MenuItem { text: options[0] }
                    MenuItem { text: options[1] }
                    MenuItem { text: options[2] }
                }

                onCurrentIndexChanged: Preferences.set("Currency",currentIndex)
            }
        }
    }
}
