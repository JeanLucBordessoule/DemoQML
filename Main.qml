import QtQuick  // required for base types (Row Rectanglr, ...)
import QtQuick.Controls
import QtQuick.Dialogs  // MessageDialog
import QtQml  // Qt.exit


ApplicationWindow {

    width: 640
    height: 480
    minimumWidth: 40
    minimumHeight: 300
    visible: true
    title: qsTr("Hello QML")

    MessageDialog {
        id: mainMsgDgId
        title: qsTr("Exit ?")
        text: qsTr("Do you want to exit?")
        buttons: MessageDialog.Ok | MessageDialog.Close // MessageDialog.Yes | MessageDialog.No
        onAccepted: { Qt.exit(0) }
        onRejected: { console.log("Exit cancelled") }
    }

    menuBar : MenuBar {
        Menu {
            title: qsTr("File")
            MenuSeparator {}
            Action {
                id: exitId
                text: qsTr("Exit")
                shortcut: "Ctrl+Q"
                onTriggered : {
                    console.log("exit")
                    mainMsgDgId.open()
                }
            }
        }
        Menu {
            title: qsTr("Help")
            icon.source: "qrc:/images/qt-logo.jpg"
            icon.width: 16
            icon.height: 16
            Action {
                id: helpId
                text: qsTr("Qt")
                icon.source: "qrc:/images/qt-logo.png"
                icon.width: 16
                icon.height: 16
            }
        }
    }

    header: ToolBar {
        Row {
            anchors.fill: parent
            ToolButton {
                action: exitId
            }
            ToolButton {
                action: helpId
            }
        }
    }

    StackView {
        id: stackViewId
        anchors.fill: parent
        initialItem: MainPage1 {}
    }

    footer: TabBar {
        width: parent.width
        TabButton {
            text: qsTr("1")
            onClicked: {
                console.log("1")
                stackViewId.pop()
                stackViewId.push("MainPage1.qml")
            }
        }
        TabButton {
            text: qsTr("2")
            onClicked: {
                console.log("2")
                stackViewId.pop()
                stackViewId.push("MainPage2.qml")
            }
        }
        TabButton {
            text: qsTr("3")
            onClicked: {
                console.log("3")
                stackViewId.pop()
                stackViewId.push("MainPage3.qml")
            }
        }
    }
}
