import QtQuick 2.6
import QtQuick.Window 2.2
import "qml"
import QtQuick.Controls 1.4
import imageChange 1.0
import myTimer 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Moving")
    id: root
    function updateImage(){
        timer.start()
        changeMyImg.changedImage()
    }
    //This is Rectangle containt Image and three Rectangle have position To move Image to
    Rectangle{

        width: root.width
        height: root.height
        id: page
        // Using QTimer to delay Image
        QTimer{
            id: timer
            interval: 500
            onTimeout: {
                updateImage()
            }
        }
        //Using it in qml to Call the function defind in cpp file
        ImageChange{
            id: changeMyImg
        }

        //Image with animation
        Image{
            anchors.left: topRect.right
            id: imgMove
            width: 50
            height: 100
            x: topRect.x+20;
            y: topRect.y -20;
            source: changeMyImg.sourceImage


        }
        //Button defind that how to move the image
        /*
        Button{
            id: btnChange
            text: "Đi"
            onClicked: {
                updateImage()
            }
        } 
        */
        //---------------Now I create 3 rectangle to containt 3 position
        //---------------If click to Rectangle the image will move to
        Rectangle{
            id: topRect
            width: 50;height: 50
            anchors{left: parent.left;top: parent.top ; leftMargin: 20; topMargin: 20}
            color: "red"; border.color: "Gray";radius: 6
            MouseArea{anchors.fill: parent; onClicked: {updateImage();page.state=""}}
        }
        Rectangle{
            id: midRightRect
            width: 50; height: 50
            anchors {right: parent.right;verticalCenter: parent.verticalCenter; rightMargin: 10; }
            color: "red" ; border.color: "gray"; radius: 6
            MouseArea{anchors.fill: parent;onClicked: {updateImage();page.state="moveMidRight"}}
        }
        Rectangle{
            id: botLeftRect
            width: 50
            height: 50
            anchors{left: parent.left; bottom: parent.bottom; leftMargin: 20; bottomMargin: 20}
            color: "red" ; border.color: "Gray"; radius: 6
            MouseArea{anchors.fill: parent; onClicked: {updateImage();page.state="moveBot"}}
        }
        states:[
            State {
                name: "moveMidRight"
                PropertyChanges {
                    target: imgMove
                    x: midRightRect.x
                    y: midRightRect.y
                }
            },
            State {
                name: "moveBot"
                PropertyChanges {
                    target: imgMove
                    x: botLeftRect.x
                    y: botLeftRect.y-30
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "moveMidRight"
                NumberAnimation{properties: "x,y"; easing.type: Easing.InOutQuad; duration: 9000}
            },
            Transition {
                from: "*"
                to: "moveBot"
                NumberAnimation{properties: "x,y"; easing.type: Easing.InOutQuad; duration: 9000}
            },
            Transition {
                NumberAnimation{properties: "x,y"; easing.type: Easing.InOutQuad; duration: 9000}
            }
        ]
    }
}
