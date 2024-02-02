import QtQuick

Window {
    id: windowId
    visible: true
    title: qsTr("#2.1   QML Syntax Demo")

    width: 640
    height: 480

    minimumWidth: 200
    minimumHeight: 100

    modality: Qt.NonModal // by default

    onClosing: (close) => {
                   console.log("onClosing " + close.accepted )
                   // close.accepted = false
               }

    property string textToShow: "Hello"

    Row {
        anchors.centerIn: parent
        spacing: (parent.width - 400) / 5
        //padding: 50
        Rectangle { color: "red"  ; width: 100; height: 100; radius: 20
            MouseArea {
                anchors.fill:parent
                onClicked: { windowId.textToShow = "red"; console.log("Clicked on red")}
            }
        }
        Rectangle { color: "green"; width: 100; height: 100; radius: 20
            MouseArea {
                anchors.fill:parent
                onClicked: { windowId.textToShow = "green"; console.log("Clicked on green")}
            }
        }
        Rectangle { color: "blue" ; width: 100; height: 100; radius: 20
            MouseArea {
                anchors.fill:parent
                onClicked: { windowId.textToShow = "blue"; console.log("Clicked on blue")}
            }
        }
        Rectangle { color: "dodgerblue" ; width: 100; height: 100; radius: width
            Text {
                id: textId
                text: windowId.textToShow // binging
                color: "yellow"
                font.pixelSize: 25
                font.bold: true
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    windowId.textToShow = "dodgerblue";
                    console.log("Clicked on dodgerblue")
                    // textId.text = "broken" // breaking the binding by assigning statis resource
                }
            }
        }
    }
}
