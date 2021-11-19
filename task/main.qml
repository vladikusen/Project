import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

import Contacts 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true

    Item {
        id: status
        property bool colored: false
    }
    Item {
        id: orgrid
        property bool orgrid: false
    }

    ContactList {
        id:list
        anchors.fill: parent
        spacing: 3
        topMargin: 3
        leftMargin: 10
        rightMargin: 10
    }

    ContactGrid{
        id:grid
        anchors.fill: parent
        leftMargin: 10
        rightMargin: 10
    }

    Rectangle{// a rectange which are a base for changing layout image
        width: 30
        height: 30
        Image {
            id: layout
            source: "layout.png"
            width: 30
            height: 30
        }
        anchors.bottom: parent.bottom
        MouseArea//by clicking the mouse(in our case) changes layout to list/grid
        {
            anchors.fill:parent
            onClicked:
            {
                if(orgrid.orgrid == false)
                {
                    grid.visible=true;
                    list.visible=false;
                    orgrid.orgrid=true;
                }
                else
                {
                    orgrid.orgrid=false;
                    grid.visible=false
                    list.visible=true
                }

            }
        }
    }
  }
