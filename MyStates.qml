import QtQuick 2.0

Item {
    id: states
    state: "main"
    states: [
        State {
            name: "main"
            PropertyChanges{
                target: timeline
                visible: true
            }
            PropertyChanges {
                target: personen
                visible: true
            }
        },
        State{
            name: "year_2011"
            PropertyChanges {
                target: toolbar
                visible: true
            }
            PropertyChanges{
                target: textEdit
                visible: true
                text: year_2011_text
            }
            PropertyChanges {
                target: timeline
                anchors.top: parent.top
            }
            PropertyChanges {
                target: personen

            }
        }

    ]
}

