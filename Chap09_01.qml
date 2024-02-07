import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Window {
    id: windowId
    visible: true
    title: qsTr("#9.1   Dialogs Demo")

    width: 640
    height: 480

    minimumWidth: 200
    minimumHeight: 100

    ColorDialog {
        id: colorDlgId
        onAccepted: {
            rectId.color = selectedColor
        }
    }
    FileDialog {
        id: fileDlgId
        onAccepted: {
            labelId.text = selectedFile
        }
    }
    FolderDialog {
        id: folderDlgId
        onAccepted: {
            labelId.text = selectedFolder
        }
    }
    FontDialog {
        id: fontDlgId
        modality: Qt.NonModal
        onAccepted: {
            labelId.font = selectedFont
        }
    }
    MessageDialog {
        id: messageDlgId
        buttons:  MessageDialog.Yes | MessageDialog.No
        title: qsTr("Title")
        text: qsTr("Click a button")
        onButtonClicked: function (button, role) {
            switch (button) {
            case MessageDialog.Yes: { labelId.text = "Yes"; break }
            case MessageDialog.No: { labelId.text = "No"; break }
            }
        }
    }
    // CustomDialog

    Rectangle {
        id: rectId
        width: parent.width
        anchors.top: parent.top
        anchors.bottom: rowId.top
        color: "yellow"
        border { color: "black"; width: 5 }
        Label {
            id: labelId
            text: qsTr("Text to be changed")
            color: "black"
            anchors.centerIn: parent
        }
    }

    Row {
        id: rowId
        anchors.bottom: parent.bottom
        Button {
            text: qsTr("Color")
            onClicked: {
                colorDlgId.open()
            }
        }
        Button {
            text: qsTr("File")
            onClicked: {
                fileDlgId.open()
            }
        }
        Button {
            text: qsTr("Folder")
            onClicked: {
                folderDlgId.open()
            }
        }
        Button {
            text: qsTr("Font")
            onClicked: {
                fontDlgId.modality = Qt.WindowModal
                fontDlgId.open()
            }
        }
        Button {
            text: qsTr("Font (not modal)")
            onClicked: {
                fontDlgId.modality = Qt.NonModal
                fontDlgId.open()
            }
        }
        Button {
            text: qsTr("Message")
            onClicked: {
                messageDlgId.open()
            }
        }
    }

}
