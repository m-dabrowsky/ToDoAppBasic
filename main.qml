import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ToDo App")
    color: "#333333"


    // prevent window resize below these values
    minimumWidth: 200
    minimumHeight: 200

    // model to manage our data
    ListModel {id: todoModel}


    // show children in a column (one below another)
    // this will show input field and button above
    // and scrolling list below
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.margins: 15

        // show children in a row (one next to each other)
        RowLayout {
            id: rowLayout
            Layout.fillWidth: true
            spacing: 15

            // show this above our todoList view
            z: 1

            TextField {
                id: todoInputField
                placeholderText: qsTr("New")
                Layout.fillWidth: true
            }

            RoundButton {
                id: roundButton
                text: "\u2795"
                onClicked: {
                    // add data to our model
                    todoModel.append({ content: todoInputField.text })
                    todoInputField.text = ''
                }
            }
        }

        ListView {
            id: todoList
            // use the model we defined above to render list
            model: todoModel

            Layout.fillHeight: true
            Layout.fillWidth: true

            delegate: ColumnLayout {
                width: todoList.width
                height: 55

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15

                    TextField {
                        color: "#fff"
                        background: Item {}
                        // render data from model
                        text: model.content
                        Layout.fillWidth: true
                    }

                    RoundButton {
                        text: "\u2796"
                        palette: {
                            palette.buttonText = "yellow"
                        }
                        // remove this element from model
                        onClicked: todoModel.remove(model.index)
                        height: parent.height
                    }
                }
                Rectangle { color: "#666"; height: 1; Layout.fillWidth: true }

            }
        }

    }





}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}D{i:4}D{i:2}
}
##^##*/
