import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Rectangle {
    id: root
    default property alias content: navItemContainer.children

    property bool showDrawer: window.width <= 600
    property color backgroundColor: "white"
    property int numberOfChieldEelements: 0
    height: 75
    implicitWidth: 1200
    implicitHeight: 100
    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
        bottom: parent.top
        bottomMargin: -75
        topMargin: 0
        rightMargin: 0
        leftMargin: 0
    }
    color: backgroundColor

    Item {
        height: 100
        anchors {
            verticalCenter: parent.verticalCenter
            left: rowLayout.right
            right: textField.left
            rightMargin: 10
            leftMargin: 10
        }

        GridLayout {
            id: navItemContainer
            anchors.fill: parent
            rows: 1
            columns: -1
        }

        states: [
            State {
                name: "displayItemInDrawer"
                when: root.showDrawer
                ParentChange {
                    target: navItemContainer
                    parent: drawer.contentItem
                }

                PropertyChanges {
                    target: navItemContainer
                    rows: -1
                    columns: 1
                }
            }

        ]
    }




    TextField {
        id: textField
        x: 612
        width: 150
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 10
        }
        placeholderText: qsTr("Text Field")
//        color: ThemeColors.inputFieldTextColor
//        placeholderTextColor: ThemeColors.inputFieldPlaceholderTextColor
        background: Rectangle {
//            color: ThemeColors.inputFieldBackgroundColor
//            border.color: ThemeColors.inputFieldBorderColor
        }
    }

    RowLayout {
        id: rowLayout
        y: 0
        width: 140
        height: 75
        anchors {
            left: parent.left
            leftMargin: 10
        }

        Text {
            id: menuIcon
            width: 50
            height: 50
            text: "X"
            visible: showDrawer
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: drawer.open()
            }
        }

        Label {
            id: logo

            text: qsTr("Logo")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            font.pointSize: 25
        }
    }

    onWidthChanged: {
        if(window.width > 600)
        {
            drawer.close();
        }
    }

    Drawer {
        id: drawer
        interactive: showDrawer
        width: 0.44 * window.width
        height: window.height

        ColumnLayout {
            id: drawerItemContainer
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                rightMargin: 0
                leftMargin: 0
                bottomMargin: 0
            }
        }

        onClosed: {}

    }

    Component.onCompleted: {
//        if (root.children.length <= 4) {
//            return
//        }

//        while (root.children.length > 4) {
//            root.children[4].parent = navItemContainer
//        }
//        numberOfChieldEelements = navItemContainer.children.length
    }
}
