import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Dialogs 1.2
import Qt.PhotoEdit 1.0

//BasicAdjust的slider在300行左右，ColorAdjust的在600多，
ApplicationWindow {
    id: window
    visible: true
    width: 1361
    height: 720
    maximumHeight: 720
    minimumHeight: 720
    maximumWidth: 1361
    minimumWidth: 1361
    Material.theme: Material.Dark
    Material.accent: Material.Grey
    color: "black"
    background: Image {//        source: "qrc:/tailorBg.jpg"
        //        source: "qrc:/saveDesign.jpg"
        //        source: "qrc:/startMenu.png"
        //        source: "qrc:/rotateDesige.png"
        //        source: "qrc:/textDesign.png"
    }
    //    flags: Qt.Window | Qt.FramelessWindowHint //隐藏任务栏
    PhotoEdit {
        id: photoedit
    }
    Image {
        id: src
        visible: false
        source: ""
    }

    Rectangle {
        id: header
        height: 60
        width: window.width
        color: "black"

        Text {
            id: headerText
            text: qsTr("Open File")
            color: "white"
            font.pixelSize: 28
            x: 31
            y: 16
            font.family: "Eras Bold ITC"
        }
        Rectangle {
            id: openFileWrap
            width: 120
            height: header.height
            color: "black"
            anchors.right: saveWrap.left
            anchors.rightMargin: 20

            Image {
                id: openFileIcon
                source: "qrc:/open_line.png"
                fillMode: Image.Stretch
                height: 33
                width: this.height
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                x: -5
                anchors.topMargin: 22
            }

            Text {
                id: openFileText
                text: qsTr("打开图片")
                color: "white"
                font.pixelSize: 18
                anchors.left: openFileIcon.right
                anchors.top: parent.top
                anchors.leftMargin: 7
                anchors.topMargin: 28
                font.family: brightnessText.font.family
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    fileDialog.open()
                    littleBox1.visible = true
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = false

                    basicAdjustMidWrap.visible = true
                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Basic Adjust"

                    container.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    textEditOnPic_text.visible = false
                }
            }
        }
        Rectangle {
            id: saveWrap
            width: openFileWrap.width
            height: header.height
            color: "black"
            anchors.right: parent.right
            anchors.rightMargin: 50

            Image {
                id: saveIcon
                source: "qrc:/save_on_top.png"
                fillMode: Image.Stretch
                height: 30
                width: this.height
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 8
                anchors.topMargin: 23
            }

            Text {
                id: saveText
                text: qsTr("保存")
                color: "white"
                font.pixelSize: 18
                anchors.left: saveIcon.right
                anchors.top: parent.top
                anchors.leftMargin: 7
                anchors.topMargin: 30
                font.family: openFileText.font.family
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    midAdjustArea.visible = false
                    rightPicArea.visible = false
                    headerText.text = "Save File"
                    saveFullScreen.visible = true
                }
            }
        }
    }

    Rectangle {
        id: leftSwitchBar
        height: window.height - header.height
        width: 70
        color: "black"
        anchors.top: header.bottom
        //        opacity: 0.5

        // 下面是五个小图标
        Rectangle {
            //第1个
            id: leftSwitchItem1
            x: 24
            y: 6
            width: 42
            height: 42
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = true
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    basicAdjustMidWrap.visible = true
                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Basic Adjust"

                    container.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    textEditOnPic_text.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false
                }
            }
            color: "#00000000"

            Image {
                width: 42
                height: 42
                id: leftSwitchItem1_pic
                source: "qrc:/left_icon_1.png"
                fillMode: Image.Stretch
            }
        }
        Rectangle {
            //第2个
            id: leftSwitchItem2
            x: 24
            y: 75
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height

            Image {
                width: 29
                height: 29
                id: leftSwitchItem2_pic
                x: 5
                y: 5
                source: "qrc:/left_icon_2.png"
                fillMode: Image.Stretch
            }

            color: "#00000000"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = true
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    basicAdjustMidWrap.visible = false
                    colorAdjustMidWrap.visible = true
                    tailorMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Color Adjust"

                    container.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    textEditOnPic_text.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false
                }
            }
        }
        Rectangle {
            //第3个
            id: leftSwitchItem3
            x: 25
            y: 141
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height
            color: "#00000000"
            Image {
                width: 41
                height: 41
                id: leftSwitchItem3_pic
                x: -1
                y: 0
                source: "qrc:/left_icon_3.png"
                fillMode: Image.Stretch
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = false
                    littleBox3.visible = true
                    littleBox4.visible = false
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    basicAdjustMidWrap.visible = false
                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = true
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Tailor"

                    container.visible = false
                    rotateWrap.visible = true
                    saveAndResetOfCut.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    textEditOnPic_text.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false
                }
            }
        }
        Rectangle {
            //第4个
            id: leftSwitchItem4
            x: 26
            y: 209
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height
            color: "#00000000"
            Image {
                width: 29
                height: 29
                id: leftSwitchItem4_pic
                x: 4
                y: 4
                source: "qrc:/left_icon_4.png"
                fillMode: Image.Stretch
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = true
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    basicAdjustMidWrap.visible = false
                    filterMidWrap.visible = true
                    textEditMidWrap.visible = false

                    headerText.text = "Filter"

                    textEditOnPic_text.visible = false
                    container.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false
                }
            }
        }
        Rectangle {
            //第5个
            id: leftSwitchItem5
            x: 23
            y: 271
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height
            Image {
                width: 36
                height: 36
                id: leftSwitchItem5_pic
                x: 3
                y: 4
                source: "qrc:/left_icon_5.png"
                fillMode: Image.Stretch
            }
            color: "#00000000"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = true
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    basicAdjustMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = true

                    headerText.text = "Text Edit"
                    //大冒险
                    if (invisiblePicture.width / invisiblePicture.height
                            > picture.width / picture.height) {
                        textEditOnPic_container.height = textEditOnPic_container.width
                                / (invisiblePicture.width / invisiblePicture.height)
                        //                    container.height = container.width/(invisiblePicture.width/invisiblePicture.height)
                    } else {
                        textEditOnPic_container.width = textEditOnPic_container.height
                                * (invisiblePicture.width / invisiblePicture.height)
                        textEditOnPic_container.x = (pictureWrap.width
                                                     - textEditOnPic_container.width) / 2
                        textEditOnPic_container.height = 620
                    }

                    textEditOnPic_text.visible = true
                    container.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false
                }
            }
        }
        // ANCHOR 要求1的小图标
        Rectangle {
            //第5个
            id: leftSwitchItem6
            x: 23
            y: 271+62
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height
            Image {
                width: 36
                height: 36
                id: leftSwitchItem6_pic
                x: 3
                y: 4
                source: "qrc:/req1.png"
                fillMode: Image.Stretch
            }
            color: "#00000000"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    basicAdjustMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Requirement 1"
                    //大冒险
                    if (invisiblePicture.width / invisiblePicture.height
                            > picture.width / picture.height) {
                        textEditOnPic_container.height = textEditOnPic_container.width
                                / (invisiblePicture.width / invisiblePicture.height)
                        //                    container.height = container.width/(invisiblePicture.width/invisiblePicture.height)
                    } else {
                        textEditOnPic_container.width = textEditOnPic_container.height
                                * (invisiblePicture.width / invisiblePicture.height)
                        textEditOnPic_container.x = (pictureWrap.width
                                                     - textEditOnPic_container.width) / 2
                        textEditOnPic_container.height = 620
                    }

                    textEditOnPic_text.visible = false
                    container.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false


                    requirement1MidWrap.visible = true
                    littleBox6.visible = true

                }
            }
        }
        // ANCHOR 要求2的小图标
        Rectangle {
            //第5个
            id: leftSwitchItem7
            x: 23
            y: 271+62*2
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height
            Image {
                width: 36
                height: 36
                id: leftSwitchItem7_pic
                x: 3
                y: 4
                source: "qrc:/req2.png"
                fillMode: Image.Stretch
            }
            color: "#00000000"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    basicAdjustMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Requirement 2"
                    //大冒险
                    if (invisiblePicture.width / invisiblePicture.height
                            > picture.width / picture.height) {
                        textEditOnPic_container.height = textEditOnPic_container.width
                                / (invisiblePicture.width / invisiblePicture.height)
                        //                    container.height = container.width/(invisiblePicture.width/invisiblePicture.height)
                    } else {
                        textEditOnPic_container.width = textEditOnPic_container.height
                                * (invisiblePicture.width / invisiblePicture.height)
                        textEditOnPic_container.x = (pictureWrap.width
                                                     - textEditOnPic_container.width) / 2
                        textEditOnPic_container.height = 620
                    }

                    textEditOnPic_text.visible = false
                    container.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false

                    requirement2MidWrap.visible = true
                    littleBox7.visible = true

                }
            }
        }
        // ANCHOR 要求3的小图标
        Rectangle {
            id: leftSwitchItem8
            x: 23
            y: 271+62*3
            width: leftSwitchItem1.width
            height: leftSwitchItem1.height
            Image {
                width: 36
                height: 36
                id: leftSwitchItem8_pic
                x: 3
                y: 4
                source: "qrc:req3.png"
                fillMode: Image.Stretch
            }
            color: "#00000000"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function () {
                    //这里是控制小滑块
                    littleBox1.visible = false
                    littleBox2.visible = false
                    littleBox3.visible = false
                    littleBox4.visible = false
                    littleBox5.visible = false
                    littleBox6.visible = false
                    littleBox7.visible = false
                    littleBox8.visible = false

                    startFullScreen.visible = false
                    saveFullScreen.visible = false

                    midAdjustArea.visible = true
                    rightPicArea.visible = true

                    rotateWrap.y = 92
                    rotateWrap.visible = true
                    cutWrap.visible = true
                    saveAndResetOfCut.visible = false
                    rotateDirection.visible = false

                    colorAdjustMidWrap.visible = false
                    tailorMidWrap.visible = false
                    basicAdjustMidWrap.visible = false
                    filterMidWrap.visible = false
                    textEditMidWrap.visible = false

                    headerText.text = "Requirement 3"
                    //大冒险
                    if (invisiblePicture.width / invisiblePicture.height
                            > picture.width / picture.height) {
                        textEditOnPic_container.height = textEditOnPic_container.width
                                / (invisiblePicture.width / invisiblePicture.height)
                        //                    container.height = container.width/(invisiblePicture.width/invisiblePicture.height)
                    } else {
                        textEditOnPic_container.width = textEditOnPic_container.height
                                * (invisiblePicture.width / invisiblePicture.height)
                        textEditOnPic_container.x = (pictureWrap.width
                                                     - textEditOnPic_container.width) / 2
                        textEditOnPic_container.height = 620
                    }

                    textEditOnPic_text.visible = false
                    container.visible = false

                    requirement1MidWrap.visible = false
                    requirement2MidWrap.visible = false
                    requirement3MidWrap.visible = false

                    requirement3MidWrap.visible = true
                    littleBox8.visible = true

                }
            }
        }

        // ANCHOR 左边的小滑块 其实也可以做动画
        Rectangle {
            id: littleBox1
            x: 15
            y: 14
            width: 3
            height: 26
            color: "white"
        }
        Rectangle {
            id: littleBox2
            x: 15
            y: 81
            width: 3
            height: 26
            color: "white"
            visible: false
        }
        Rectangle {
            id: littleBox3
            x: 16
            y: 149
            width: 3
            height: 26
            color: "white"
            visible: false
        }
        Rectangle {
            id: littleBox4
            x: 16
            y: 215
            width: 3
            height: 26
            color: "white"
            visible: false
        }
        Rectangle {
            id: littleBox5
            x: 15
            y: 281
            width: 3
            height: 26
            color: "white"
            visible: false
        }
        Rectangle {
            id: littleBox6
            x: 15
            y: 281 + 62*1
            width: 3
            height: 26
            color: "white"
            visible: false
        }
        Rectangle {
            id: littleBox7
            x: 15
            y: 281 + 62*2
            width: 3
            height: 26
            color: "white"
            visible: false
        }
        Rectangle {
            id: littleBox8
            x: 15
            y: 281 + 62*3
            width: 3
            height: 26
            color: "white"
            visible: false
        }
    }
    Rectangle {
        visible: false
        id: midAdjustArea
        height: window.height - header.height
        width: 330
        color: "black"
        anchors.top: header.bottom
        anchors.left: leftSwitchBar.right

        Rectangle {
            //用来放置中间的栏 这里是basic adjust的中间栏
            id: basicAdjustMidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: true

            //中间的调整的栏 亮度
            Rectangle {
                id: adjustItem1
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: parent.top
                anchors.topMargin: 8

                Text {
                    id: brightnessText
                    text: qsTr("亮度")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 25
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: brightnessSlider
                    y: -5
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    anchors.left: brightnessText.right
                    anchors.leftMargin: 27
                    onMoved: function () {

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        //                        console.log(picture.source.toString());
                        photoedit.CurrentBrightness = (brightnessSlider.value - 50) * 2

                        picture.source = ""

                        picture.source = photoedit.edit(src.source)

                        brightnessValueText.text = brightnessSlider.value
                    }
                }

                Text {
                    id: brightnessValueText
                    y: 9
                    width: 37
                    height: 18
                    text: brightnessSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: brightnessSlider.right
                    anchors.leftMargin: 9
                }
            }
            //中间的调整的栏 对比度
            Rectangle {
                id: adjustItem2
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem1.bottom //顶部对齐
                anchors.topMargin: 8

                Text {
                    id: contrastText //左边文字id
                    text: qsTr("对比度") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 15
                    anchors.topMargin: 9
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: contrastSlider
                    y: -4
                    anchors.leftMargin: 18 //如果是三个字 那就是17
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    anchors.left: contrastText.right //slider左对齐
                    onMoved: function () {

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        //                        console.log(picture.source.toString());
                        photoedit.CurrentContrast = (contrastSlider.value - 50) * 2
                        picture.source = ""
                        picture.source = photoedit.edit(src.source)
                        contrastValueText.text = contrastSlider.value
                    }
                }

                Text {
                    id: contrastValueText //右边数值id
                    y: 12
                    text: contrastSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: contrastSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 9
                }
            }

            //中间的调整的栏 曝光
            Rectangle {
                id: adjustItem3
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem5.bottom //顶部对齐
                anchors.topMargin: 8

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        exposureBtn.visible = true
                    }
                    onExited: {
                        exposureBtn.visible = false
                    }
                }

                Text {
                    id: exposureText //左边文字id
                    text: qsTr("曝光") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22 //两个字是22  三个字是15
                    anchors.topMargin: 8
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: exposureSlider
                    x: 88
                    y: -4
                    //                anchors.leftMargin: 17 //如果是三个字 那就是17
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 0
                    //                anchors.left: exposureText.right   //slider左对齐
                    onMoved: function () {
                        //按钮的出现
                        exposureBtn.visible = true
                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );

                        exposureValueText.text = exposureSlider.value
                    }
                }

                Text {
                    //                    visible: false
                    id: exposureValueText //右边数值id
                    y: 11
                    text: exposureSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: exposureSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 10
                }
                Rectangle {
                    //曝光的确认按钮
                    //                    visible: false
                    id: exposureBtn
                    anchors.left: exposureSlider.right
                    width: 40
                    height: 23
                    y: 10
                    anchors.leftMargin: 2
                    color: "#4B4747"
                    radius: 3

                    Text {
                        x: 5
                        y: 1
                        text: qsTr("确定")
                        color: "white"
                        font.family: "苹方 粗体"
                        //                        font.pixelSize: 10
                    }
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            picture.source = ""

                            picture.source = photoedit.setExposure(
                                        src.source, exposureSlider.value)
                            exposureSlider.value = 0 //归零
                            //按确认
                        }
                    }
                }
            } //end

            //中间的调整的栏 阴影
            Rectangle {
                id: adjustItem4
                x: 0
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem2.bottom //顶部对齐
                anchors.topMargin: 5

                Text {
                    id: shadeText //左边文字id
                    text: qsTr("阴影(未实现)") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 0 //两个字是22  三个字是15
                    anchors.topMargin: 8
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: shadeSlider
                    x: 88
                    y: -4
                    //                anchors.leftMargin: 17 //如果是三个字 那就是17
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    //                anchors.left: exposureText.right   //slider左对齐
                    onMoved: function () {

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        exposureValueText.text = exposureSlider.value
                    }
                }

                Text {
                    id: shadeValueText //右边数值id
                    y: 11
                    text: shadeSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: shadeSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 10
                }
            } //end

            //中间的调整的栏 高光
            Rectangle {
                id: adjustItem5
                x: 0
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem4.bottom //顶部对齐
                anchors.topMargin: 5

                Text {
                    id: highlightText //左边文字id
                    text: qsTr("高光(未实现)") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 0 //两个字是22  三个字是15
                    anchors.topMargin: 8
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: highlightSlider
                    x: 88
                    y: -4
                    //                anchors.leftMargin: 17 //如果是三个字 那就是17
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    //                anchors.left: highlightText.right   //slider左对齐
                    onMoved: function () {

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        exposureValueText.text = exposureSlider.value
                    }
                }

                Text {
                    id: highlightValueText //右边数值id
                    y: 11
                    text: highlightSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: highlightSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 10
                }
            } //end
            Rectangle {
                visible: true
                id: saveAndResetOfBasicAdjust
                x: 213
                y: 498
                width: 116
                height: 100
                color: "black"

                Rectangle {
                    //不需要保存按钮了
                    visible: false
                    id: saveOfBasicAdjust
                    width: parent.width
                    height: parent.height / 2
                    color: "black"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {}
                    }
                    Image {
                        id: saveOfBasicAdjust_icon
                        x: 17
                        y: 10
                        source: "qrc:/save.png"
                        width: 30
                        height: saveOfBasicAdjust_icon.width
                    }
                    Text {
                        id: saveOfBasicAdjust_text
                        x: 58
                        y: 13
                        text: qsTr("确定")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
                Rectangle {
                    y: parent.height / 2
                    id: resetOfBasicAdjust
                    width: parent.width
                    height: parent.height / 2
                    color: "black"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            brightnessSlider.value = 50
                            contrastSlider.value = 50
                            exposureSlider.value = 0
                            shadeSlider.value = 50
                            highlightSlider.value = 50
                            //原图覆盖现在的图
                        }
                    }
                    Image {
                        id: resetOfBasicAdjust_icon
                        x: 18
                        y: 13
                        source: "qrc:/reset.png"
                        width: 25
                        height: 24
                    }
                    Text {
                        id: resetOfBasicAdjust_text
                        x: 58
                        y: 13
                        text: qsTr("重置")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
            } //end
        }
        Rectangle {
            //用来放置中间的栏 这里是color adjust的中间栏
            id: colorAdjustMidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false

            //中间的调整的栏 饱和度
            Rectangle {
                id: adjustItem_colorAdjust_1
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: parent.top
                anchors.topMargin: 8

                Text {
                    id: saturationText
                    text: qsTr("饱和度")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 15
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: saturationSlider
                    y: -5
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    anchors.left: saturationText.right
                    anchors.leftMargin: 20
                    onMoved: function () {

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        //                        console.log(picture.source.toString());
                        photoedit.CurrentSaturation = saturationSlider.value * 5

                        picture.source = ""
                        picture.source = photoedit.edit(src.source)

                        saturationValueText.text = saturationSlider.value
                    }
                }

                Text {
                    id: saturationValueText
                    y: 10
                    width: 37
                    height: 18
                    text: saturationSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: saturationSlider.right
                    anchors.leftMargin: 9
                }
            }
            //中间的调整的栏 自然饱和
            Rectangle {
                id: adjustItem_colorAdjust_2
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem_colorAdjust_1.bottom //顶部对齐
                anchors.topMargin: 8

                Text {
                    id: naturalSaturationText //左边文字id
                    text: qsTr("自然饱和(未实现)") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: -2
                    anchors.topMargin: 9
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: naturalSaturationSlider
                    y: -4
                    anchors.leftMargin: 12 //如果是三个字 那就是18
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    anchors.left: naturalSaturationText.right //slider左对齐
                    onMoved: function () {

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        //                        console.log(picture.source.toString());
                        naturalSaturationValueText.text = naturalSaturationSlider.value
                    }
                }

                Text {
                    id: naturalSaturationValueText //右边数值id
                    y: 11
                    width: 18
                    height: 20
                    text: naturalSaturationSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: naturalSaturationSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 9
                }
            }

            //中间的调整的栏 白平衡
            Rectangle {
                id: adjustItem_colorAdjust_3
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem_colorAdjust_2.bottom //顶部对齐
                anchors.topMargin: 8
                MouseArea {
                    //用来在进入时候把数字变成按钮
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: function () {
                        temperatureBtn.visible = true
                    }
                    onExited: function () {
                        temperatureBtn.visible = false
                    }
                    //                    算了算了大可不必这么搞
                }
                Text {
                    id: temperatureText //左边文字id
                    text: qsTr("白平衡(未实现)") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 0 //两个字是22  三个字是15
                    anchors.topMargin: 8
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: temperatureSlider
                    x: 88
                    y: -4
                    //                anchors.leftMargin: 17 //如果是三个字 那就是17
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 0
                    //                anchors.left: exposureText.right   //slider左对齐
                    onMoved: function () {
                        //按钮出现
                        temperatureBtn.visible = true

                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        temperatureValueText.text = temperatureSlider.value
                    }
                }
                //不需要数值了
                Text {
                    //                    visible: false
                    id: temperatureValueText //右边数值id
                    y: 11
                    text: temperatureSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: temperatureSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 10
                }
                //穿风刺
                Rectangle {
                    //白平衡的确认按钮
                    visible: false
                    id: temperatureBtn
                    anchors.left: temperatureSlider.right
                    width: 40
                    height: 23
                    y: 10
                    anchors.leftMargin: 2
                    color: "#4B4747"
                    radius: 3

                    Text {
                        x: 5
                        y: 1
                        text: qsTr("确定")
                        color: "white"
                        font.family: "苹方 粗体"
                        //                        font.pixelSize: 10
                    }
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            temperatureSlider.value = 0 //归零
                            //按确认
                        }
                    }
                }
            } //end

            //中间的调整的栏 色相
            Rectangle {
                id: adjustItem_colorAdjust_4
                x: 0
                height: 40
                width: parent.width
                color: "black"
                anchors.top: adjustItem_colorAdjust_3.bottom //顶部对齐
                anchors.topMargin: 5

                Text {
                    id: hueText //左边文字id
                    text: qsTr("色相") //左边文字内容
                    font.pixelSize: brightnessText.font.pixelSize
                    color: brightnessText.color
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22 //两个字是22  三个字是15
                    anchors.topMargin: 8
                    font.family: brightnessText.font.family
                }

                Slider {
                    id: hueSlider
                    x: 88
                    y: -4
                    //                anchors.leftMargin: 17 //如果是三个字 那就是17
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                    //                anchors.left: exposureText.right   //slider左对齐
                    onMoved: function () {
                        //                    console.log(typeof brightnessSlider.value.toString());
                        //                    var a = true;
                        //                    console.log(typeof a );
                        photoedit.CurrentHue = hueSlider.value * 5

                        picture.source = ""
                        picture.source = photoedit.edit(src.source)

                        hueValueText.text = hueSlider.value
                    }
                }

                Text {
                    id: hueValueText //右边数值id
                    y: 11
                    text: hueSlider.value //右边数值 文本
                    font.pixelSize: brightnessValueText.font.pixelSize
                    color: brightnessValueText.color
                    anchors.left: hueSlider.right //对齐
                    font.family: brightnessValueText.font.family
                    anchors.leftMargin: 10
                }
            } //end

            Rectangle {
                visible: true
                id: saveAndResetOfColorAdjust
                x: 213
                y: 498
                width: 116
                height: 100
                color: "black"

                Rectangle {
                    visible: false
                    id: saveOfColorAdjust
                    width: parent.width
                    height: parent.height / 2
                    color: "black"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {}
                    }
                    Image {
                        id: saveOfColorAdjust_icon
                        x: 17
                        y: 10
                        source: "qrc:/save.png"
                        width: 30
                        height: saveOfBasicAdjust_icon.width
                    }
                    Text {
                        id: saveOfColorAdjust_text
                        x: 58
                        y: 13
                        text: qsTr("确定")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
                Rectangle {
                    y: parent.height / 2
                    id: resetOfColorAdjust
                    width: parent.width
                    height: parent.height / 2
                    color: "black"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            saturationSlider.value = 50
                            naturalSaturationSlider.value = 50
                            temperatureSlider.value = 0
                            hueSlider.value = 50
                            //原图覆盖现在的图
                        }
                    }
                    Image {
                        id: resetOfColorAdjust_icon
                        x: 18
                        y: 13
                        source: "qrc:/reset.png"
                        width: 25
                        height: 24
                    }
                    Text {
                        id: resetOfColorAdjust_text
                        x: 58
                        y: 13
                        text: qsTr("重置")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
            } //end
        }
        Rectangle {
            //用来放置中间的栏 这里是Tailor的中间栏
            id: tailorMidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false
            Rectangle {
                id: cutWrap
                x: 36
                y: 18
                width: 155
                height: 58
                color: "black"
                MouseArea {
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked: function () {
                        container.visible = true
                        rotateWrap.visible = false
                        saveAndResetOfCut.visible = true
                        if (invisiblePicture.width / invisiblePicture.height
                                > picture.width / picture.height) {
                            container.height = container.width
                                    / (invisiblePicture.width / invisiblePicture.height)
                        } else {
                            container.width = container.height
                                    * (invisiblePicture.width / invisiblePicture.height)
                            container.x = (pictureWrap.width - container.width) / 2
                        }
                        dragBox_left_top.x = -dragBox_left_top.width
                        dragBox_left_top.y = -dragBox_left_top.height
                        dragBox_right_bottom.x = container.width
                        dragBox_right_bottom.y = container.height
                        dragBox_left_bottom.x = dragBox_left_top.x
                        dragBox_left_bottom.y = dragBox_right_bottom.y
                        dragBox_right_top.x = dragBox_right_bottom.x
                        dragBox_right_top.y = dragBox_left_top.y

                        innerBox.width = container.width
                        innerBox.height = container.height
                    }
                }

                Image {
                    width: 46
                    height: cutIcon.width
                    id: cutIcon
                    x: 23
                    y: 7
                    source: "qrc:/cut.png"
                    fillMode: Image.Stretch
                }
                Text {
                    id: cutText
                    x: 90
                    y: 16
                    width: 52
                    height: 27
                    text: qsTr("裁剪")
                    font.pixelSize: 20
                    color: "white"
                    font.family: "苹方 粗体"
                }
            }
            Rectangle {
                id: rotateWrap
                x: 36
                y: 92
                width: 155
                height: 58
                color: "black"
                MouseArea {
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked: function () {
                        cutWrap.visible = false
                        rotateWrap.y = 18
                        rotateDirection.visible = true
                    }
                }
                Image {
                    width: 57
                    height: rotateIcon.width
                    id: rotateIcon
                    x: 19
                    y: 1
                    source: "qrc:/rotate.png"
                    fillMode: Image.Stretch
                }
                Text {
                    id: rotateText
                    x: 89
                    y: 14
                    width: 52
                    height: 27
                    text: qsTr("旋转")
                    font.pixelSize: 20
                    color: "white"
                    font.family: "苹方 粗体"
                }
            }
            Rectangle {
                visible: false
                id: saveAndResetOfCut
                x: 72
                y: 82
                width: 116
                height: 90
                color: "purple"

                Rectangle {
                    id: saveOfCut
                    width: parent.width
                    height: parent.height / 2
                    color: "black"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            container.visible = false
                            saveAndResetOfCut.visible = false
                            rotateWrap.visible = true

                            src.source = ""

                            src.source = photoedit.cut(
                                        picture.source,
                                        dragBox_left_top.x + dragBox_left_top.width,
                                        dragBox_left_top.y + dragBox_left_top.height,
                                        dragBox_right_bottom.x,
                                        dragBox_right_bottom.y)
                            picture.source = ""
                            picture.source = src.source
                            src.source = photoedit.getSource()
                            //左上的坐标是左上dragBox_left_top.x+dragBox_left_top.width
                            //dragBox_left_top.y+dragBox_left_top.height
                            //右下的dragBox_right_bottom.x,dragBox_right_bottom.y
                        }
                    }
                    Image {
                        id: saveOfCut_icon
                        x: 17
                        y: 10
                        source: "qrc:/save.png"
                        width: 30
                        height: saveOfCut_icon.width
                    }
                    Text {
                        id: saveOfCut_text
                        x: 58
                        y: 13
                        text: qsTr("确定")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
                Rectangle {
                    y: parent.height / 2
                    id: resetOfCut
                    width: parent.width
                    height: parent.height / 2
                    color: "black"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            container.visible = true
                            if (invisiblePicture.width / invisiblePicture.height
                                    > picture.width / picture.height) {
                                container.height = container.width
                                        / (invisiblePicture.width / invisiblePicture.height)
                            } else {
                                container.width = container.height
                                        * (invisiblePicture.width / invisiblePicture.height)
                                container.x = (pictureWrap.width - container.width) / 2
                            }
                            dragBox_left_top.x = -dragBox_left_top.width
                            dragBox_left_top.y = -dragBox_left_top.height
                            dragBox_right_bottom.x = container.width
                            dragBox_right_bottom.y = container.height
                            dragBox_left_bottom.x = dragBox_left_top.x
                            dragBox_left_bottom.y = dragBox_right_bottom.y
                            dragBox_right_top.x = dragBox_right_bottom.x
                            dragBox_right_top.y = dragBox_left_top.y

                            innerBox.width = container.width
                            innerBox.height = container.height
                        }
                    }
                    Image {
                        id: resetOfCut_icon
                        x: 18
                        y: 13
                        source: "qrc:/reset.png"
                        width: 25
                        height: 24
                    }
                    Text {
                        id: resetOfCut_text
                        x: 58
                        y: 13
                        text: qsTr("重置")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
            }
            Rectangle {
                visible: false
                id: rotateDirection
                x: 120
                y: 72
                width: 70
                height: 80
                color: "#00000000"

                Rectangle {
                    //顺时针
                    id: clockwise
                    width: parent.width
                    height: parent.height / 2
                    color: "#00000000"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            src.source = ""

                            src.source = photoedit.rotate(picture.source, 0)
                            picture.source = ""

                            picture.source = src.source
                            src.source = photoedit.getSource()
                        }
                    }
                    Text {
                        id: clockwise_text

                        x: 9
                        y: 7
                        text: qsTr("顺时针")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
                Rectangle {
                    //逆时针
                    y: parent.height / 2
                    id: counterclockwise
                    width: parent.width
                    height: parent.height / 2
                    color: "#00000000"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: function () {
                            src.source = ""

                            src.source = photoedit.rotate(picture.source, 1)
                            picture.source = ""

                            picture.source = src.source
                            src.source = photoedit.getSource()
                        }
                    }
                    Text {
                        id: counterclockwise_text
                        x: clockwise_text.x
                        y: clockwise_text.y
                        text: qsTr("逆时针")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
            }
        }
        Rectangle {
            //用来放置中间的栏 这里是filter的中间栏
            id: filterMidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false

            Rectangle {
                id: filterItem_1
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
                        tick.y = 15
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 0)
                    }
                }
            }
            Rectangle {
                id: filterItem_2
                height: 30
                width: 120
                color: filterItem_1.color
                anchors.left: filterItem_1.left
                anchors.top: filterItem_1.bottom
                anchors.topMargin: 10
                Text {
                    text: "浮雕"
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
                        tick.y = 15 + 40
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 1)
                    }
                }
            }
            Rectangle {
                id: filterItem_3
                height: 30
                width: 120
                color: filterItem_2.color
                anchors.left: filterItem_2.left
                anchors.top: filterItem_2.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "雕刻"
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
                        tick.y = 15 + 80
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 2)
                    }
                }
            } //end
            Rectangle {
                id: filterItem_4
                height: 30
                width: 120
                color: filterItem_3.color
                anchors.left: filterItem_3.left
                anchors.top: filterItem_3.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "怀旧色"
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
                        tick.y = 15 + 120
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 3)
                    }
                }
            } //end
            Rectangle {
                id: filterItem_5
                height: 30
                width: 120
                color: filterItem_4.color
                anchors.left: filterItem_4.left
                anchors.top: filterItem_4.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "黑白照片"
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
                        tick.y = 15 + 160
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 4)
                    }
                }
            } //end
            Rectangle {
                id: filterItem_6
                height: 30
                width: 120
                color: filterItem_5.color
                anchors.left: filterItem_5.left
                anchors.top: filterItem_5.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "褪色"
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
                        tick.y = 15 + 200
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 5)
                    }
                }
            } //end
            Rectangle {
                id: filterItem_7
                height: 30
                width: 120
                color: filterItem_6.color
                anchors.left: filterItem_6.left
                anchors.top: filterItem_6.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "羽化"
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
                        tick.y = 15 + 240
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 6)
                    }
                }
            } //end
            Rectangle {
                id: filterItem_8
                height: 30
                width: 120
                color: filterItem_7.color
                anchors.left: filterItem_7.left
                anchors.top: filterItem_7.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "素描"
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
                        tick.y = 15 + 280
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 7)
                    }
                }
            } //end
            Rectangle {
                id: filterItem_9
                height: 30
                width: 120
                color: filterItem_8.color
                anchors.left: filterItem_8.left
                anchors.top: filterItem_8.bottom
                anchors.topMargin: filterItem_2.anchors.topMargin
                Text {
                    text: "冰冻效果"
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
                        tick.y = 15 + 320
                        picture.source = ""
                        picture.source = photoedit.filter(src.source, 8)
                    }
                }
            } //end
            Image {
                id: tick
                source: "qrc:/tick.png"
                width: 20
                x: 45
                y: 15
                height: tick.width
            }
        }
        // ANCHOR 作业要求1中间栏
        //用来放置中间的栏 这里是filter的中间栏
        // id 是 requirement1MidWrap
        Rectangle {
            id: requirement1MidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false

            Rectangle {
                id: requirement1Item_1
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
                        tick_req1.y = 15
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 0)
                    }
                }
            }
            Rectangle {
                id: requirement1Item_2
                height: 30
                width: 120
                color: requirement1Item_1.color
                anchors.left: requirement1Item_1.left
                anchors.top: requirement1Item_1.bottom
                anchors.topMargin: 10
                Text {
                    text: "灰度变换"
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
                        tick_req1.y = 15 + 40
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 1)
                    }
                }
            }
            Rectangle {
                id: requirement1Item_3
                height: 30
                width: 120
                color: requirement1Item_2.color
                anchors.left: requirement1Item_2.left
                anchors.top: requirement1Item_2.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "边缘提取"
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
                        tick_req1.y = 15 + 80
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 2)
                    }
                }
            } //end
            Rectangle {
                id: requirement1Item_4
                height: 30
                width: 120
                color: requirement1Item_3.color
                anchors.left: requirement1Item_3.left
                anchors.top: requirement1Item_3.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "伽马矫正"
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
                        tick_req1.y = 15 + 120
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 3)
                    }
                }
            } //end
            Rectangle {
                id: requirement1Item_5
                height: 30
                width: 120
                color: requirement1Item_4.color
                anchors.left: requirement1Item_4.left
                anchors.top: requirement1Item_4.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "均值滤波"
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
                        tick_req1.y = 15 + 160
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 4)
                    }
                }
            } //end
            Rectangle {
                id: requirement1Item_6
                height: 30
                width: 120
                color: requirement1Item_5.color
                anchors.left: requirement1Item_5.left
                anchors.top: requirement1Item_5.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "中值滤波"
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
                        tick_req1.y = 15 + 200
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 5)
                    }
                }
            } //end
            Rectangle {
                id: requirement1Item_7
                height: 30
                width: 120
                color: requirement1Item_6.color
                anchors.left: requirement1Item_6.left
                anchors.top: requirement1Item_6.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "直方图均衡化"
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
                        tick_req1.y = 15 + 240
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 6)
                    }
                }
            } //end
            Rectangle {
                id: requirement1Item_8
                height: 30
                width: 120
                color: requirement1Item_7.color
                anchors.left: requirement1Item_7.left
                anchors.top: requirement1Item_7.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "彩色负片"
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
                        tick_req1.y = 15 + 280
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 7)
                    }
                }
            } //end
            Rectangle {
                id: requirement1Item_9
                height: 30
                width: 120
                color: requirement1Item_8.color
                anchors.left: requirement1Item_8.left
                anchors.top: requirement1Item_8.bottom
                anchors.topMargin: requirement1Item_2.anchors.topMargin
                Text {
                    text: "拉普拉斯锐化"
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
                        tick_req1.y = 15 + 320
                        picture.source = ""
                        picture.source = photoedit.req(src.source, 8)
                    }
                }
            } //end
            Image {
                id: tick_req1
                source: "qrc:/tick.png"
                width: 20
                x: 45
                y: 15
                height: tick_req1.width
            }
        }
        // ANCHOR 要求2中间栏
        Rectangle {
            id: requirement2MidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false

            Rectangle {
                id: requirement2Item_1
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
                        picture.source = ""
                        picture.source = photoedit.gauss(src.source, 0);
                    }
                }
            }
            Rectangle {
                id: requirement2Item_2
                height: 30
                width: 120
                color: requirement2Item_1.color
                anchors.left: requirement2Item_1.left
                anchors.top: requirement2Item_1.bottom
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
                        picture.source = ""
                        picture.source = photoedit.gauss(src.source, 1);
                        console.log(picture.source)
                    }
                }
            }
            Rectangle {
                id: requirement2Item_3
                height: 30
                width: 120
                color: requirement2Item_2.color
                anchors.left: requirement2Item_2.left
                anchors.top: requirement2Item_2.bottom
                anchors.topMargin: requirement2Item_2.anchors.topMargin
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
                        picture.source = ""
                        picture.source = photoedit.gauss(src.source, 2);
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
                        tick_req3.y = 15
                        picture.source = ""
                        picture.source = photoedit.recover(src.source, 0)
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
                    text: "逆滤波图像复原"
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
                        tick_req3.y = 15 + 40
                        picture.source = ""
                        picture.source = photoedit.recover(src.source, 1)
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
                    text: "维纳滤波图像复原"
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
                        tick_req3.y = 15 + 80
                        picture.source = ""
                        picture.source = photoedit.recover(src.source, 2)
                    }
                }
            } //end
            
            // 频谱按钮
            Rectangle {
                id: confirm
                height: 30
                width: 120
                color: requirement3Item_3.color
                anchors.left: requirement3Item_3.left
                anchors.top: requirement3Item_3.bottom
                anchors.topMargin: requirement3Item_3.anchors.topMargin
                Text {
                    text: "显示频谱"
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
                        // 显示频谱
                        tick_req3.y = 15 + 120
                        picture.source = ""
                        picture.source = photoedit.showMagnitude(src.source)
                    }
                }
            } //end

            Image {
                id: tick_req3
                source: "qrc:/tick.png"
                width: 20
                x: 45
                y: 15
                height: tick_req2.width
            }
        }
        Rectangle {
            //用来放置中间的栏 这里是text edit的中间栏
            id: textEditMidWrap
            height: parent.height
            width: parent.width
            color: midAdjustArea.color
            visible: false

            //中间的调整的栏 文字输入框
            Rectangle {
                id: adjustItem_textedit_1
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: parent.top
                anchors.topMargin: 8
                // 荒野乱斗
                Text {
                    id: contentText
                    text: qsTr("文字")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }
                Rectangle {
                    //输入框
                    x: 82
                    y: 0
                    width: 220
                    height: 35
                    //                    color: "red"
                    color: "#00000000"
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.IBeamCursor
                    }

                    TextInput {
                        id: contentInput
                        y: 2
                        x: 0
                        text: "示例文本"
                        width: parent.width
                        height: parent.height
                        color: "#FFFFFF"
                        font.pixelSize: 21
                        font.family: "苹方 粗体"
                        activeFocusOnPress: true //鼠标单击激活
                        selectByMouse: true
                    }
                    Rectangle {
                        anchors.top: parent.bottom
                        width: parent.width
                        height: 1
                        color: "#7F7F7F"
                    }
                }
            } //end
            //中间的调整的栏 文字大小
            Rectangle {
                id: adjustItem_textedit_2
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: adjustItem_textedit_1.bottom
                anchors.topMargin: 25 //一般是8

                Text {
                    id: fontSizeText
                    text: qsTr("大小")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: fontSizeSlider
                    y: -5
                    from: 20
                    to: 100
                    stepSize: 1
                    value: 50
                    anchors.left: fontSizeText.right
                    anchors.leftMargin: 20
                    onMoved: function () {
                        //解决越界问题
                        if (textEditOnPic_text.x > textEditOnPic_container.width
                                - textEditOnPic_text.width
                                && textEditOnPic_container.width - textEditOnPic_text.width > 0) {
                            textEditOnPic_text.x = textEditOnPic_container.width
                                    - textEditOnPic_text.width
                        }
                        if (textEditOnPic_text.y > textEditOnPic_container.height
                                - textEditOnPic_text.height) {
                            textEditOnPic_text.y = textEditOnPic_container.height
                                    - textEditOnPic_text.height
                        }
                    }
                }
                Text {
                    id: fontSizeValueText
                    y: 10
                    width: 37
                    height: 18
                    text: fontSizeSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: fontSizeSlider.right
                    anchors.leftMargin: 9
                }
            } //end
            //中间的调整的栏 红色
            Rectangle {
                id: adjustItem_textedit_3
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: adjustItem_textedit_2.bottom
                anchors.topMargin: 13 //一般是8

                Text {
                    id: redEditText
                    text: qsTr("红色")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: redEditSlider
                    y: -5
                    from: 0
                    to: 255
                    stepSize: 1
                    value: 255
                    anchors.left: redEditText.right
                    anchors.leftMargin: 20
                    onMoved: function () {}
                }
                Text {
                    id: redEditValueText
                    y: 10
                    width: 37
                    height: 18
                    text: redEditSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: redEditSlider.right
                    anchors.leftMargin: 9
                }
            } //end
            //中间的调整的栏 绿色
            Rectangle {
                id: adjustItem_textedit_4
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: adjustItem_textedit_3.bottom
                anchors.topMargin: 13 //一般是8

                Text {
                    id: greenEditText
                    text: qsTr("绿色")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: greenEditSlider
                    y: -5
                    from: 0
                    to: 255
                    stepSize: 1
                    value: 255
                    anchors.left: greenEditText.right
                    anchors.leftMargin: 20
                    onMoved: function () {}
                }
                Text {
                    id: greenEditValueText
                    y: 10
                    width: 37
                    height: 18
                    text: greenEditSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: greenEditSlider.right
                    anchors.leftMargin: 9
                }
            } //end
            //中间的调整的栏 蓝色
            Rectangle {
                id: adjustItem_textedit_5
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: adjustItem_textedit_4.bottom
                anchors.topMargin: 13 //一般是8

                Text {
                    id: blueEditText
                    text: qsTr("蓝色")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 22
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: blueEditSlider
                    y: -5
                    from: 0
                    to: 255
                    stepSize: 1
                    value: 255
                    anchors.left: blueEditText.right
                    anchors.leftMargin: 20
                    onMoved: function () {//                        textEditOnPic_text.color = Qt.rgba(redEditSlider.value,greenEditSlider.value,blueEditSlider.value,1)
                    }
                }
                Text {
                    id: blueEditValueText
                    y: 10
                    width: 37
                    height: 18
                    text: blueEditSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: blueEditSlider.right
                    anchors.leftMargin: 9
                }
            } //end
            //中间的调整的栏 透明度
            Rectangle {
                id: adjustItem_textedit_6
                height: 40
                width: parent.width
                color: "black"
                //            opacity: 0.5
                anchors.top: adjustItem_textedit_5.bottom
                anchors.topMargin: 13 //一般是8

                Text {
                    id: transparentEditText
                    text: qsTr("透明度")
                    font.pixelSize: 18
                    color: "white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 15
                    anchors.topMargin: 6
                    font.family: "苹方 粗体"
                }

                Slider {
                    id: transparentEditSlider
                    y: -5
                    from: 0
                    to: 255
                    stepSize: 1
                    value: 255
                    anchors.left: transparentEditText.right
                    anchors.leftMargin: 9
                    onMoved: function () {}
                }
                Text {
                    id: transparentEditValueText
                    y: 10
                    width: 37
                    height: 18
                    text: transparentEditSlider.value
                    font.family: "HelveticaNeueLT Pro 87 HvCnO"
                    font.pixelSize: 16
                    color: "white"
                    anchors.left: transparentEditSlider.right
                    anchors.leftMargin: 9
                }
            } //end
            Rectangle {
                //文字保存按钮
                visible: true
                id: saveOfTextEditWrap
                x: 212
                y: 552
                width: 116
                height: 90 / 2
                color: "purple"

                Rectangle {
                    id: saveOfTextEdit
                    width: parent.width
                    height: parent.height
                    color: "black"
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: function () {
                            src.source = ""

                            src.source = photoedit.putText(
                                        picture.source,
                                        textEditOnPic_text.text,
                                        textEditOnPic_text.x,
                                        textEditOnPic_text.y,
                                        fontSizeSlider.value,
                                        blueEditSlider.value,
                                        greenEditSlider.value,
                                        redEditSlider.value)

                            picture.source = ""

                            picture.source = src.source

                            src.source = photoedit.getSource()

                            redEditSlider.value = greenEditSlider.value = blueEditSlider.value
                                    = transparentEditSlider.value = 255

                            contentInput.text = ""

                            fontSizeSlider.value = 50

                            //按确定的那一刻
                        }
                    }
                    Image {
                        id: saveOfTextEdit_icon
                        x: 17
                        y: 10
                        source: "qrc:/save.png"
                        width: 30
                        height: saveOfCut_icon.width
                    }
                    Text {
                        id: saveOfTextEdit_text
                        x: 58
                        y: 13
                        text: qsTr("确定")
                        color: "white"
                        font.family: "苹方 粗体"
                        font.pixelSize: 18
                    }
                }
            }
        }
    }
    Rectangle {
        visible: false
        id: rightPicArea
        height: window.height - header.height
        width: window.width - leftSwitchBar.width - midAdjustArea.width
        color: "black"
        anchors.top: header.bottom
        anchors.left: midAdjustArea.right

        //                opacity: 0.5
        Rectangle {
            id: pictureWrap
            width: parent.width - pictureWrap.x - 60
            height: parent.height - pictureWrap.y - 30
            x: 30
            y: 10
            color: "black"

            Image {
                id: picture
                cache: false
                width: parent.width
                height: parent.height
                source: "qrc:/demo_pic.png"
                fillMode: Image.PreserveAspectFit
                verticalAlignment: Image.AlignTop
            }

            Image {
                id: invisiblePicture
                visible: false
                source: picture.source
            }

            Rectangle {
                id: container
                visible: false
                width: picture.width
                height: picture.height
                color: "#00000000"
                MouseArea {
                    hoverEnabled: true
                    anchors.fill: parent
                    onEntered: function () {}
                }
                Rectangle {
                    id: shadowRec_left
                    color: "#66000000"
                    width: dragBox_left_top.x + dragBox_left_top.width
                    height: container.height
                }
                Rectangle {
                    id: shadowRec_right
                    color: shadowRec_left.color
                    anchors.right: parent.right
                    width: container.width - dragBox_right_bottom.x
                    height: container.height
                }
                Rectangle {
                    id: shadowRec_top
                    color: shadowRec_left.color
                    anchors.top: parent.top
                    width: innerBox.width
                    height: dragBox_left_top.y + dragBox_left_top.height
                    x: dragBox_left_top.x + dragBox_left_top.width
                }
                Rectangle {
                    id: shadowRec_bottom
                    color: shadowRec_left.color
                    anchors.bottom: parent.bottom
                    width: innerBox.width
                    height: container.height - dragBox_right_bottom.y
                    x: dragBox_left_top.x + dragBox_left_top.width
                }
                Rectangle {
                    //左上
                    id: dragBox_left_top
                    width: 10
                    height: dragBox_left_top.width
                    color: "white"
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        drag.target: dragBox_left_top
                        drag.axis: Drag.axis
                        drag.minimumX: 0
                        drag.maximumX: container.width - dragBox_left_top.width
                        onPositionChanged: function () {
                            //这里巧妙地不允许越界
                            if (dragBox_left_top.x + dragBox_left_top.width
                                    >= dragBox_right_bottom.x) {
                                dragBox_left_top.x = dragBox_right_bottom.x - dragBox_left_top.width
                            }
                            if (dragBox_left_top.y + dragBox_left_top.height
                                    >= dragBox_right_bottom.y) {
                                dragBox_left_top.y = dragBox_right_bottom.y
                                        - dragBox_left_top.height
                            }
                            if (dragBox_left_top.x + dragBox_left_top.width < 0) {
                                dragBox_left_top.x = -dragBox_left_top.width
                            }
                            if (dragBox_left_top.y + dragBox_left_top.height < 0) {
                                dragBox_left_top.y = -dragBox_left_top.height
                            }
                            //解决内部拖动的bug
                            innerBox.width = dragBox_right_bottom.x
                                    - dragBox_left_top.x - dragBox_left_top.width
                            innerBox.height = dragBox_right_bottom.y
                                    - dragBox_left_top.y - dragBox_left_top.height
                            //解决左下和右上拖动的bug
                            dragBox_left_bottom.x = dragBox_left_top.x
                            dragBox_right_top.y = dragBox_left_top.y
                        }
                    }
                }
                Rectangle {
                    //右下
                    id: dragBox_right_bottom
                    width: dragBox_left_top.width
                    height: dragBox_left_top.height
                    color: dragBox_left_top.color
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        drag.target: dragBox_right_bottom
                        drag.axis: Drag.axis
                        drag.minimumX: 0
                        drag.maximumX: container.width - dragBox_right_bottom.width
                        onPositionChanged: function () {
                            //这里巧妙地不允许越界
                            if (dragBox_left_top.x + dragBox_left_top.width
                                    >= dragBox_right_bottom.x) {
                                dragBox_right_bottom.x = dragBox_left_top.width + dragBox_left_top.x
                            }
                            if (dragBox_left_top.y + dragBox_left_top.height
                                    >= dragBox_right_bottom.y) {
                                dragBox_right_bottom.y = dragBox_left_top.y
                                        + dragBox_left_top.height
                            }
                            if (dragBox_right_bottom.x > container.width) {
                                dragBox_right_bottom.x = container.width
                            }
                            if (dragBox_right_bottom.y > container.height) {
                                dragBox_right_bottom.y = container.height
                            }
                            //解决内部拖动的bug
                            innerBox.width = dragBox_right_bottom.x
                                    - dragBox_left_top.x - dragBox_left_top.width
                            innerBox.height = dragBox_right_bottom.y
                                    - dragBox_left_top.y - dragBox_left_top.height
                            //解决左下和右上拖动的bug
                            dragBox_right_top.x = dragBox_right_bottom.x
                            dragBox_left_bottom.y = dragBox_right_bottom.y
                        }
                    }
                }
                Rectangle {
                    //左下
                    id: dragBox_left_bottom
                    width: dragBox_left_top.width
                    height: dragBox_left_top.height
                    x: dragBox_left_top.x
                    y: dragBox_right_bottom.y
                    color: dragBox_left_top.color
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        drag.target: dragBox_left_bottom
                        drag.axis: Drag.axis
                        drag.minimumX: 0
                        drag.maximumX: container.width - dragBox_right_bottom.width
                        onPositionChanged: function () {
                            //实际上的操控
                            dragBox_left_top.x = dragBox_left_bottom.x
                            dragBox_right_bottom.y = dragBox_left_bottom.y
                            //这里巧妙地不允许越界
                            if (dragBox_left_top.x + dragBox_left_top.width
                                    >= dragBox_right_bottom.x) {
                                dragBox_left_top.x = dragBox_right_bottom.x - dragBox_left_top.width
                            }
                            if (dragBox_left_top.y + dragBox_left_top.height
                                    >= dragBox_right_bottom.y) {
                                dragBox_right_bottom.y = dragBox_left_top.y
                                        + dragBox_left_top.height
                            }
                            if (dragBox_left_top.x + dragBox_left_top.width < 0) {
                                dragBox_left_top.x = -dragBox_left_top.width
                            }
                            if (dragBox_right_bottom.y > container.height) {
                                dragBox_right_bottom.y = container.height
                            }
                            //解决内部拖动的bug
                            innerBox.width = dragBox_right_bottom.x
                                    - dragBox_left_top.x - dragBox_left_top.width
                            innerBox.height = dragBox_right_bottom.y
                                    - dragBox_left_top.y - dragBox_left_top.height
                        }
                    }
                }
                Rectangle {
                    //右上
                    id: dragBox_right_top
                    width: dragBox_left_top.width
                    height: dragBox_left_top.height
                    x: dragBox_right_bottom.x
                    y: dragBox_left_top.y
                    color: dragBox_left_top.color
                    MouseArea {
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        drag.target: dragBox_right_top
                        drag.axis: Drag.axis
                        drag.minimumX: 0
                        drag.maximumX: container.width - dragBox_right_bottom.width
                        onPositionChanged: function () {
                            //实际上的操控
                            dragBox_right_bottom.x = dragBox_right_top.x
                            dragBox_left_top.y = dragBox_right_top.y
                            //这里巧妙地不允许越界
                            if (dragBox_left_top.x + dragBox_left_top.width
                                    >= dragBox_right_bottom.x) {
                                dragBox_right_bottom.x = dragBox_left_top.width + dragBox_left_top.x
                            }
                            if (dragBox_left_top.y + dragBox_left_top.height
                                    >= dragBox_right_bottom.y) {
                                dragBox_left_top.y = dragBox_right_bottom.y
                                        - dragBox_left_top.height
                            }
                            if (dragBox_left_top.y + dragBox_left_top.height < 0) {
                                dragBox_left_top.y = -dragBox_left_top.height
                            }
                            if (dragBox_right_bottom.x > container.width) {
                                dragBox_right_bottom.x = container.width
                            }
                            //解决内部拖动的bug
                            innerBox.width = dragBox_right_bottom.x
                                    - dragBox_left_top.x - dragBox_left_top.width
                            innerBox.height = dragBox_right_bottom.y
                                    - dragBox_left_top.y - dragBox_left_top.height
                        }
                    }
                }
                Rectangle {
                    //里面的矩形
                    id: innerBox
                    width: dragBox_right_bottom.x - dragBox_left_top.x - dragBox_left_top.width
                    height: dragBox_right_bottom.y - dragBox_left_top.y - dragBox_left_top.height
                    x: dragBox_left_top.x + dragBox_left_top.width
                    y: dragBox_left_top.y + dragBox_left_top.height
                    color: "#00000000"
                    border.color: "white"
                    border.width: 1
                    MouseArea {
                        cursorShape: Qt.SizeAllCursor
                        anchors.fill: parent
                        drag.target: innerBox
                        drag.axis: Drag.axis
                        drag.minimumX: 0
                        drag.maximumX: container.width - innerBox.width
                        drag.maximumY: container.height - innerBox.height
                        hoverEnabled: true
                        onPositionChanged: function () {
                            innerBox.width = innerBox.width
                            innerBox.height = innerBox.height
                            dragBox_left_top.x = innerBox.x - dragBox_left_top.width
                            dragBox_right_bottom.x = innerBox.x + innerBox.width
                            dragBox_left_top.y = innerBox.y - dragBox_left_top.height
                            dragBox_right_bottom.y = innerBox.y + innerBox.height
                            //解决左下和右上拖动的bug
                            dragBox_left_bottom.x = dragBox_left_top.x
                            dragBox_right_top.y = dragBox_left_top.y
                            //解决左下和右上拖动的bug
                            dragBox_right_top.x = dragBox_right_bottom.x
                            dragBox_left_bottom.y = dragBox_right_bottom.y
                            if (dragBox_left_top.y < -dragBox_left_top.height) {
                                dragBox_left_top.y = -dragBox_left_top.height
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: textEditOnPic_container
                width: picture.width
                height: picture.height
                color: "#00000000"
                Text {
                    visible: false
                    id: textEditOnPic_text
                    text: contentInput.text
                    font.pixelSize: fontSizeSlider.value
                    font.family: "苹方 粗体"
                    color: Qt.rgba(redEditSlider.value / 255,
                                   greenEditSlider.value / 255,
                                   blueEditSlider.value / 255,
                                   transparentEditSlider.value / 255)
                    //火力全开
                    MouseArea {
                        anchors.fill: parent
                        drag.target: textEditOnPic_text
                        drag.axis: Drag.axis
                        drag.minimumX: 0
                        drag.maximumX: textEditOnPic_container.width - textEditOnPic_text.width
                        onPositionChanged: function () {
                            if (textEditOnPic_text.y < 0) {
                                textEditOnPic_text.y = 0
                            }
                            if (textEditOnPic_text.y > textEditOnPic_container.height
                                    - textEditOnPic_text.height) {
                                textEditOnPic_text.y = textEditOnPic_container.height
                                        - textEditOnPic_text.height
                            }
                        }
                    }
                }
            }
        }
    }
    Rectangle {
        //开始菜单
        visible: true
        id: startFullScreen
        anchors.fill: parent
        color: "#00000000"
        Rectangle {
            id: startMenuWrapTop
            x: 546
            y: 268
            width: 270
            height: 83
            color: "black"
            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                Image {
                    id: startMenuIcon_1
                    x: 18
                    y: 12
                    width: 57
                    height: startMenuIcon_1.width
                    source: "qrc:/open_line.png"
                }
                Text {
                    x: 98
                    y: 26
                    width: 132
                    height: 31
                    text: "打开照片"
                    font.family: "苹方 粗体"
                    color: "white"
                    font.pixelSize: 24
                }
                onClicked: function () {
                    fileDialog.open()
                }
            }
        }
        Rectangle {
            id: startMenuWrapBottom
            x: 546
            y: 363
            width: 270
            height: 83
            color: "black"
            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                Image {
                    id: startMenuIcon_2
                    x: 20
                    y: 15
                    width: 50
                    height: startMenuIcon_2.width
                    source: "qrc:/photo.png"
                }
                Text {
                    x: 98
                    y: 20
                    width: 132
                    height: 31
                    text: "打开样本照片"
                    font.family: "苹方 粗体"
                    color: "white"
                    font.pixelSize: 24
                }
                onClicked: function () {
                    picture.source = ""
                    picture.source = photoedit.init(src.source)
                    src.source = picture.source
                    startFullScreen.visible = false
                    headerText.text = "Basic Adjust"
                    midAdjustArea.visible = true
                    rightPicArea.visible = true
                }
            }
        }
        FileDialog {
            id: fileDialog
            title: qsTr("Please choose an image file")
            nameFilters: ["Image Files (*.jpg *.png *.jpeg)"]
            onAccepted: {
                src.source = fileUrl
                picture.source = photoedit.init(src.source)
                src.source = picture.source
                //console.log(picture.source);
                startFullScreen.visible = false
                headerText.text = "Basic Adjust"
                midAdjustArea.visible = true
                rightPicArea.visible = true
                //                console.log(container.height)
            }
            onRejected: {

            }
        }
    }
    Rectangle {
        //保存菜单
        visible: false
        id: saveFullScreen
        anchors.fill: parent
        color: "#00000000"
        Rectangle {
            //选择目录
            x: 758
            y: 593
            width: 116
            height: 45
            radius: 8
            color: "#181717"
            border.width: 1
            border.color: "#9F9F9F"
            Text {
                id: selectFolder
                x: 15
                y: 8
                text: "选择目录"
                color: "white"
                font.pixelSize: 21
                font.family: "苹方 粗体"
            }
            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                onClicked: function () {
                    fileDialog_save.open()
                }
            }
        }
        Rectangle {
            //保存按钮
            id: saveBtn
            x: 919
            y: 593
            width: 116
            height: 45
            radius: 8
            color: "#00181717"
            border.width: 1
            border.color: "#9F9F9F"
            Image {
                id: saveBtn_icon
                x: 20
                y: 9
                width: 29
                height: 27
                source: "qrc:/save_on_top.png"
                opacity: 0.9
            }

            Text {
                id: saveBtn_text
                x: 55
                y: 8
                text: "保存"
                color: "#f3f3f3"
                font.pixelSize: 21
                font.family: "苹方 粗体"
            }
            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                hoverEnabled: true
                onClicked: function () {
                    //这里不要删
                    if (saveInputName.text != ""
                            && fileDialog_save.fileUrl != "") {
                        saveBtn_text.text = "保存成功"
                        saveBtn_text.x = 17
                        saveBtn_icon.visible = false
                        saveBtn.color = "#3B3838"
                    }
                    photoedit.save(picture.source,
                                   fileDialog_save.fileUrl + saveInputName.text)
                    //按下保存键那一刻
                }
                onEntered: function () {
                    if (saveInputName.text == ""
                            || selectFolder.text != "已选择") {
                        cursorShape = Qt.ForbiddenCursor
                    } else {
                        cursorShape = Qt.PointingHandCursor
                        photoedit.save(picture.source, fileDialog_save.fileUrl,
                                       saveInputName.text)
                        //这里不是用来保存的,别加代码
                        //保存文件
                    }
                }
            }
        }
        Image {
            id: savePicWrap
            cache: false
            x: 192
            y: 80
            width: 1017
            height: 444
            source: picture.source
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: saveMenuIcon_1
            x: 369
            y: 599
            width: 36
            height: 34
            source: "qrc:/photo.png"
        }
        Rectangle {

            //输入框
            x: 432
            y: 591
            width: 312
            height: 48
            radius: 8
            color: "#2B2929"
            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onEntered: function () {
                    pointJpg.visible = true
                    inputYourPicName.visible = false
                }
                onExited: function () {
                    pointJpg.visible = false
                    inputYourPicName.visible = true
                    if (saveInputName.text != '') {
                        inputYourPicName.text = ''
                        pointJpg.visible = true
                    }
                }
                cursorShape: Qt.IBeamCursor
            }

            TextInput {
                id: saveInputName
                y: 10
                x: 15
                width: 280
                height: parent.height
                color: "#FFFFFF"
                font.pixelSize: 21
                font.family: "苹方 粗体"
                activeFocusOnPress: true //鼠标单击激活
                selectByMouse: true
            }
            Text {
                id: inputYourPicName
                x: 15
                y: 8
                text: "请输入图片名"
                color: "#7f7f7f"
                font.pixelSize: 21
                font.family: "苹方 粗体"
            }
            Text {
                visible: false
                id: pointJpg
                x: 257
                y: 8
                text: ".jpg"
                color: "#7f7f7f"
                font.pixelSize: 21
                font.family: "苹方 粗体"
            }
        }
        FileDialog {
            id: fileDialog_save
            title: qsTr("Please choose an folder")
            selectFolder: true

            //            nameFilters: ["Image Files (*.jpg *.png *.gif *.bmp *.ico)",]
            //        selectFolder: true
            onAccepted: {
                selectFolder.text = "已选择"
                selectFolder.x += 13
            }
            onRejected: {

            }
        }
    }
}
