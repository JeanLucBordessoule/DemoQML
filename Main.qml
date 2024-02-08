import QtCore // Settings
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

    // Message dialog to confirm the exit of the application
    onClosing: function(close) {
        close.accepted = false // can't close by pressing the X button from the system bar
        mainMsgDlgId.open()
    }
    MessageDialog {
        id: mainMsgDlgId
        title: qsTr("Exit ?")
        text: qsTr("Do you want to exit?")
        buttons:  MessageDialog.Yes | MessageDialog.No // MessageDialog.Ok | MessageDialog.Close //
        onButtonClicked: function (button, role) {
            switch (button) {
            case MessageDialog.Yes: { Qt.exit(0); break }
            case MessageDialog.No: { console.log("No"); break }
            //case MessageDialog.Ok: { Qt.exit(0); break }
            //case MessageDialog.Close: { console.log("Close"); break }
            }
        }
        //onAccepted: { Qt.exit(0) } // Ok
        //onRejected: { console.log("Exit cancelled") } // Close
    }

    // windows with demos
    Chap02_01 { id: chap02_01_Id; visible: false }
    Chap09_01 { id: chap09_01_Id; visible: false }

    // menubar , toolbar, main window and footer of the applicaation window
    menuBar : MenuBar {
        Menu {
            title: qsTr("File")
            MenuSeparator {}
            Action {
                id: exitId
                text: qsTr("Exit")
                shortcut: "Ctrl+Q"
                onTriggered : {
                    mainMsgDlgId.open()
                }
            }
        }
        Menu {
            title: qsTr("View")
            Action {
                id: viewRectanglesId
                text: qsTr("02.01 Rectangles")
                onTriggered : {
                    chap02_01_Id.show()
                }
            }
            MenuSeparator {}
            Action {
                id: viewDialogsId
                text: qsTr("09.01 Dialogs")
                onTriggered : {
                    chap09_01_Id.show()
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
            id: tab1Id
            text: qsTr("1")
            onClicked: {
                console.log("1")
                stackViewId.pop()
                stackViewId.push("MainPage1.qml")
            }
        }
        TabButton {
            id: tab2Id
            text: qsTr("2")
            onClicked: {
                console.log("2")
                stackViewId.pop()
                stackViewId.push("MainPage2.qml")
            }
        }
        TabButton {
            id: tab3Id
            text: qsTr("3")
            onClicked: {
                console.log("3")
                stackViewId.pop()
                stackViewId.push("MainPage3.qml")
            }
        }
    }

    // page 534: chapter 13: Settings:
    Settings {
        id: colorsSettingsId
        category: "colors"
        // property alias tab1Color: mainRect1.color
    }

}
