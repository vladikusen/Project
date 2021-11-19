import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

import Contacts 1.0




ListView {
    implicitHeight: 300
    implicitWidth: parent.width

    model: ContactsModel{}

    delegate: Rectangle{//main green rectangle which plays role as a background of our contact
        id:contact
        width:(orgrid.orgrid==false) ? parent.width : 40
        height:(orgrid.orgrid==false) ? 40 : 40

        radius: 3
        color: "#008080"
        Text {
            visible: (orgrid.orgrid==false) ? true : false
            text: model.name;
            color: "black"
            font.pixelSize: 15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            padding: 10
        }

        Rectangle{//rectangle which are a base for contact face image
            id:face
            width: 40
            Image{
                visible: true
                width: 40
                height: 40
                source: model.face
            }
        }
        Rectangle{//rectange which are a base for process call icon image
            id:call
            visible: false
            width: 40
            anchors.right: parent.right
            Image {
                width: 40
                height: 40
                source: "button.png"
            }

        }

        MouseArea {//collects a mouse(in our case) actions on the main rectangle which are actually a list element
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (mouse.button == Qt.LeftButton)//left mouse button to call a person
                {


                    if(status.colored == false)
                    {
                        if(orgrid.orgrid == true)
                        {
                            face.visible = false;
                        }
                        parent.color ='#12c1c1' ;
                        call.visible=true;
                        status.colored = true;
                    }
                }
                else//right mouse button to end the call
                {
                    face.visible = true;
                    parent.color ='#008080';
                    status.colored = false;
                    call.visible=false;

                }

                }
        }
     }
}



