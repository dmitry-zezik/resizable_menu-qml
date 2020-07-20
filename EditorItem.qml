import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0

Item {
    id: root_editor_item

    property bool settingsDragActive: false
    property var settingRecHeightStartPoint

    Rectangle {
        id: settings_rec
        width: parent.width
        height: parent.height * 0.5
        radius: dp(18)
        color: app_dark
        x: 0
        anchors.bottom: parent.bottom

        Drag.active: dragArea.drag.active
        Drag.dragType: Drag.None
        Drag.hotSpot.x: 10
        Drag.hotSpot.y: 10

        Rectangle {
            // Drag rectangle item.

            id: drag_rec
            y: dp(2)
            width: dp(86)
            height: dp(4)
            radius: height
            color: "white"
            opacity: 0.7
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id: dragArea
                anchors.centerIn: parent
                width: parent.width
                height: parent.height * 4
                drag.target: settings_rec
                drag.axis: Drag.YAxis
                onPressed: {
                    drag_rec.opacity = 1
                    drag_rec.scale = 1.1
                    settingRecHeightStartPoint = settings_rec.height

                }
                onMouseYChanged: {
                    if (drag.active) {
                        settings_rec.height = settings_rec.height - mouseY
                    }
                }
                onReleased: {
                    drag_rec.opacity = 0.7
                    drag_rec.scale = 1.0
                    if (settings_rec.height < root_editor_item.height * 0.3) {
                        console.log("showSettingsAnimMin")
                        showSettingsAnimMin.restart()
                    } else if (settings_rec.height > root_editor_item.height * 0.85) {
                        console.log("showSettingsAnimMax")
                        showSettingsAnimMax.restart()
                    }
                }
            }
        }

        Item {
            // Top buttons item.

            id: top_buttons            
            x: parent.width * 0.05
            y: dp(24)
            width: parent.width * 0.9
            height: dp(36)

            Row {
                anchors.fill: parent
                spacing: parent.width * 0.08

                Rectangle {
                    id: add_button
                    width: parent.width * 0.28
                    height: parent.height
                    color: app_blue
                    border.color: app_blue
                    border.width: dp(1)
                    radius: height
                    AppText {
                        id: content_number
                        fontSize: 16
                        text: qsTr("App")
                        color: 'white'
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editor_sview.currentIndex = 0
                        }
                    }
                }

                Rectangle {
                    id: settings_button
                    width: parent.width * 0.28
                    height: parent.height
                    color: 'transparent'
                    border.color: "white"
                    border.width: dp(1)
                    radius: height
                    AppText {
                        fontSize: 16
                        text: qsTr("Items")
                        color: 'white'
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editor_sview.currentIndex = 1
                        }
                    }
                }

                Rectangle {
                    id: layers_button
                    width: parent.width * 0.28
                    height: parent.height
                    color: 'transparent'
                    border.color: "white"
                    border.width: dp(1)
                    radius: height
                    AppText {
                        fontSize: 16
                        text: qsTr("Settings")
                        color: 'white'
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editor_sview.currentIndex = 2
                        }
                    }
                }
            }
        }

        Item {
            // Swipe View item.

            id: bottom_sview
            anchors.top: top_buttons.bottom
            anchors.topMargin: dp(8)
            anchors.bottom: parent.bottom
            width: parent.width

            SwipeView {
                id: editor_sview
                anchors.fill: parent

                currentIndex: 0
                onCurrentIndexChanged: {
                    switch (currentIndex) {
                        case 0:
                            add_button.color = app_blue
                            settings_button.color = 'transparent'
                            layers_button.color = 'transparent'
                            add_button.border.color = app_blue
                            settings_button.border.color = 'white'
                            layers_button.border.color = 'white'
                            break
                        case 1:
                            add_button.color = 'transparent'
                            settings_button.color = app_blue
                            layers_button.color = 'transparent'
                            add_button.border.color = 'white'
                            settings_button.border.color = app_blue
                            layers_button.border.color = 'white'
                            break
                        case 2:
                            add_button.color = 'transparent'
                            settings_button.color = 'transparent'
                            layers_button.color = app_blue
                            add_button.border.color = 'white'
                            settings_button.border.color = 'white'
                            layers_button.border.color = app_blue
                            break
                    }
                }

                Item {
                    width: bottom_sview.width
                    height: bottom_sview.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width - dp(96)
                        height: parent.height - dp(96)
                        color: 'gray'
                        opacity: 0.3
                        radius: dp(16)
                    }
                    AppText {
                        fontSize: 16
                        text: qsTr("App")
                        color: 'white'
                        anchors.centerIn: parent
                    }
                }
                Item {
                    width: bottom_sview.width
                    height: bottom_sview.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width - dp(96)
                        height: parent.height - dp(96)
                        color: 'gray'
                        opacity: 0.3
                        radius: dp(16)
                    }
                    AppText {
                        fontSize: 16
                        text: qsTr("Items")
                        color: 'white'
                        anchors.centerIn: parent
                    }
                }
                Item {
                    width: bottom_sview.width
                    height: bottom_sview.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width - dp(96)
                        height: parent.height - dp(96)
                        color: 'gray'
                        opacity: 0.3
                        radius: dp(16)
                    }
                    AppText {
                        fontSize: 16
                        text: qsTr("Settings")
                        color: 'white'
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }

    NumberAnimation {
        id: showSettingsAnimMin
        target: settings_rec; property: "height"; to: root_editor_item.height * 0.3;
        duration: 500; easing.type: Easing.InOutBack; easing.overshoot: 1
    }

    NumberAnimation {
        id: showSettingsAnimMax
        target: settings_rec; property: "height"; to: root_editor_item.height * 0.85;
        duration: 500; easing.type: Easing.InOutBack; easing.overshoot: 1
    }

    Component.onCompleted: {
        // After the inner element (settings_rec) has been created, let's do a little testing.
        // First, let's test the appearance of the element.

        let editorSettingsItemUI = testingModule.checkEditorSettingsItemUI(settings_rec)
        let editorSettingsButtons = testingModule.checkEditorSettingsButtons(settings_rec, top_buttons, add_button,
                                                                             settings_button, layers_button)
        let editorSettingsSview = testingModule.checkEditorSettingsSview(settings_rec, top_buttons, bottom_sview, editor_sview)
    }

}
