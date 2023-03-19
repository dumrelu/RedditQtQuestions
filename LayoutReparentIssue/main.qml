import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12



Window {
    id: window
    width: 640
    height: 480
    visible: true
    minimumHeight: 400
    minimumWidth: 350
    title: qsTr("Hello World")




    Page{

        title: "Main Page"

        anchors.fill: parent

        header: NavBar{
            id: navBar



            Label{
                text: "Label a"
            }

            Label{
                text: "Label b"
            }

            Label{
                text: "Label c"
            }

            Label{
                text: "Label d"
            }

            Label{
                text: "Label e"
            }

            Label{
                text: "Label f"
            }

        }
        Rectangle{
            id: body
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            border.color: "black"
            border.width: 5
            color: "white"


            Button{
                id: darkModeButton
                anchors.centerIn: parent
                text: "Dank mode"
                width: 100
                height: 50


                contentItem: Text {
                    text: darkModeButton.text
//                    color: ThemeColors.buttonTextTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
//                onClicked: ThemeColors.darkModeOn = !ThemeColors.darkModeOn

                background: Rectangle{
//                    color: darkModeButton.down? ThemeColors.activeColor: ThemeColors.primaryColor
                }
            }

        }


    }

}
