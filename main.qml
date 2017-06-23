import QtQuick 2.6
import QtQuick.Window 2.2
import "qml"
import QtQuick.Controls 1.4
import imageChange 1.0
import myTimer 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: root
    QTimer{
        id: timer
        interval: 1000
        onTimeout: {
            updateImage()
        }
    }
    ImageChange{
        id: changeMyImg
    }

    function updateImage(){
        timer.start()
        changeMyImg.changedImage()
    }
    Image{
        id: imgMove
        source: changeMyImg.sourceImage
    }


    Button{
        anchors.top: imgMove.bottom
        id: btnChange
        text: "Đi"
        onClicked: {
            updateImage()
        }
    }



    Rectangle{
        id: box
        width: 50
        height: 50
        color: "green"
        opacity: 1

        NumberAnimation on x {
            to: root.width-50
            duration: 10000
        }
        NumberAnimation on y {
            to: root.height-50
            duration: 10000
        }
//        RotationAnimation on rotation {
//            from: 0
//            to: 360
//            duration: 1000
//            loops: Animation.Infinite
//        }

        ColorAnimation on color{
            from: "green"
            to: "red"
            duration: 10000
        }

    }

}
