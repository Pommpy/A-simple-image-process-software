// ANCHOR 要求3中间栏
        Rectangle {
            id: requirement3MidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false

            Rectangle {
                id: requirement3Item_1
                height: 30
                width: 120
                color: "black"
                x: 70
                y: 10

                Text {
                    text: "原图"
                    font.family: "苹方 粗体"
                    font.pixelSize: 20
                    color: "white"
                    x: 10
                    y: 3
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: function () {
                        tick_req2.y = 15

                        photoedit.CurrentA = 0

                        picture.source = ""

                        picture.source = photoedit.edit(src.source)
                    }
                }
            }
            Rectangle {
                id: requirement3Item_2
                height: 30
                width: 120
                color: requirement3Item_1.color
                anchors.left: requirement3Item_1.left
                anchors.top: requirement3Item_1.bottom
                anchors.topMargin: 10
                Text {
                    text: "频率域低通滤波"
                    font.family: "苹方 粗体"
                    font.pixelSize: 20
                    color: "white"
                    x: 10
                    y: 3
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: function () {
                        tick_req2.y = 15 + 40

                        photoedit.CurrentA = 1

                        picture.source = ""

                        picture.source = photoedit.edit(src.source)
                    }
                }
            }
            Rectangle {
                id: requirement3Item_3
                height: 30
                width: 120
                color: requirement3Item_2.color
                anchors.left: requirement3Item_2.left
                anchors.top: requirement3Item_2.bottom
                anchors.topMargin: requirement3Item_2.anchors.topMargin
                Text {
                    text: "频率域高通滤波"
                    font.family: "苹方 粗体"
                    font.pixelSize: 20
                    color: "white"
                    x: 10
                    y: 3
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: function () {
                        tick_req2.y = 15 + 80

                        photoedit.CurrentA = 2

                        picture.source = ""

                        picture.source = photoedit.edit(src.source)
                    }
                }
            } //end
            
            Image {
                id: tick_req2
                source: "qrc:/tick.png"
                width: 20
                x: 45
                y: 15
                height: tick_req2.width
            }
        }