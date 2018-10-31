import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
Window {
    id: window
    visible: true
    property int settingselements: 7
    property string state_before: "Qt"
    property string active_text: "Hauptmenü"
    property string before_text
    property int cellheight: 100
    property bool reset: false
    property var farben: ["aliceblue", "antiquewhite","aqua","aquamarine","azure","beige","bisque","black","blanchedalmond","blue","blueviolet","brown","burlywood","cadetblue","chartreuse","chocolate","coral","cornflowerblue","cornsilk","crimson","cyan","darkblue","darkcyan","darkgoldenrod","darkgrey","darkgreen","darkkkhaiki","darkmagenta","darkolivegreen","darkorange","darkorchid","darkred","darksalmon","darkseagreen","darkslateblue","darkturquoise","darkviolet","deeppink","deepskyblue","dimgrey","dodgerblue","firebrick","floralwhite","forestgreen","fuchsia","gainsboro","ghostwhite","gold","goldenrod","grey","green","greenyellow","honeydew","hotpink","indianred","indigo","ivory","khaki","lavender","lavenderblush","lawngreen","lemonchiffon","lightblue","lightcoral","lightcyan","lightgoldenrodyellow","lightgreen","lightgrey","lightpink","lightsalmon","lightseagreen","lightskyblue","lightslategrey","lightsteelblue","lightyellow","lime","limegreen","linen","magenta","maroon","mediumaquamarine","mediumblue","mediumorchid","mediumpurple","mediumseagreen","mediumslateblue","mediumspringgreen","mediumturquoise","mediumvioletred","midnightblue","mintcream","mistyrose","moccasin","navajowhite","navy","oldlace","olive","olivedrab","orange","orangered","orchid","palegoldenrod","palegreen","paleturquoise","palevioletred","papayawhip","peachpuff","peru","pink","plum","powderblue","purple","red","rosybrown","royalblue","saddlebrown","salmon","sandybrown","seagreen","seashell","sienna","silver","skyblue","slateblue","slategrey","snow","springgreen","steelblue","tan","teal","thistle","tomato","turquoise","violet","wheat","white","whitesmoke","yellow","yellowgreen"]
    //farben "white","lightblue","blue","darkblue", "yellow","lightgreen","green","darkgreen","lightred","red","darkred","darkslategrey","dimgrey","black","lime",""
    Text{
        z: 50
        id: debug
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        color: "lightgreen"
    }
    LinearGradient {    //Background
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, parent.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: s.background_color1 }
            GradientStop { position: 1.0; color: s.background_color2 }
        }
    }
    function save_settings() {
        s.text_pixelsize = ti1.text;
        s.personen_pixelsize = ti2.text;
        s.years_pixelsize = ti3.text;
        s.text_color = text_color_button.currentText;
        s.toolbarsize = ti4.text;
        s.personen_textcolor = personen_color_button.currentText
        s.combobox_background1 = background_color1_button.currentIndex;
        s.combobox_background2 = background_color2_button.currentIndex;
        s.combobox_personencolor = personen_color_button.currentIndex;
        s.combobox_textcolor = text_color_button.currentIndex;
        //if(combobox_background1)
        s.background_color1 = background_color1_button.currentText;
        s.background_color2 = background_color2_button.currentText;
    }
    function save_personenfarben()
    {
        s.personen_color[0] = pakku_farbenfenster.currentText;
    }
    Settings{           //Savedata
        id: s
        property string background_color1: "darkslategrey"
        property string background_color2: "dimgrey"
        property int text_pixelsize: 25
        property string text_color : "black"
        property int personen_pixelsize: 20
        property int years_pixelsize: 50
        property int toolbarsize: 75
        //Pakku-0, Jonathan-1, Peter-2, Evie-3, maalia-4, shary-5, lloyd-6, aqqu-7, anga-8, spider-9, ver_einP-10, ver_einN-11, ver_grö-12
        property var personen_color: ["green", "darkgreen", "purple", "pink", "red", "cyan", "yellow", "brown", "grey", "orange", "lightblue", "blue", "khaki"]
        property string personen_textcolor: "black"
        property int personen_anzahl: 12
        //property var personen_text: ["","","","","","","","","","","","",""]
        property string pakku
        property string jona
        property string pete
        property string evie
        property string maal
        property string shar
        property string lloy
        property string aqqu
        property string anga
        property string spid
        property string vUP
        property string vUN
        property string vG
        // 2011-0, 2020-1, 2025-2
        //property string years_text: ["", "", ""]
        property string year_2011
        property string year_2020
        property string year_2025

        property int combobox_background1
        property int combobox_background2
        property int combobox_textcolor
        property int combobox_personencolor
    }
    Rectangle{          //Home-screen
        id: home
        color: "transparent"
        anchors.fill: parent
        Rectangle{
            id: timeline
            anchors.top: personen.bottom
            width: parent.width
            height: parent.height/3-s.toolbarsize
            color: "transparent"
            Image{
                id: timeline_image
                source: "qrc:/../flat-right-arrow-theme-action-icon.jpg.png"
                anchors.fill: parent
                Rectangle{
                    id: timeline_2011
                    width: parent.width/3
                    height: parent.height
                    anchors.left: parent.left
                    color: "#505555FF"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "2011";
                            textEdit.text = s.year_2011;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to year 2011   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.years_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "2011"
                    }
                }
                Rectangle{
                    id: timeline_2020
                    width: parent.width/3
                    height: parent.height
                    anchors.left: timeline_2011.right
                    color: "#5055FF55"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "2020";
                            textEdit.text = s.year_2020;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to year 2020   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.years_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "2020"
                    }
                }
                Rectangle{
                    id: timeline_2025
                    width: parent.width/3
                    height: parent.height
                    anchors.left: timeline_2020.right
                    color: "#50FF5555"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "2025";
                            textEdit.text = s.year_2025;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to year 2025   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.years_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "2025"
                    }
                }
            }
        }
        Rectangle{
            id: personen
            anchors.top: parent.top
            //anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: parent.height/3*2
            color: "transparent"
            Grid{
                anchors.fill: parent
                columns: s.personen_anzahl/2
                spacing: 0
                Rectangle{
                    id: pakkutakWildhausen
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[0]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "pakku";
                            if(s.toolbarsize < 50)
                                s.toolbarsize = 50
                            textEdit.text = s.pakku;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to pakku   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Pakkutak Wildhausen"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: jonathanQuerido
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[1]
                    z:0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "jona";
                            textEdit.text = s.jona;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to jona   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Jonathan Querido"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: peterWildhausen
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[2]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "pete";
                            textEdit.text = s.pete;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to pete   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Peter Wildhausen"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: evieKristansen
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[3]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "evie";
                            textEdit.text = s.evie;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to evie   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Evie Kristansen"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: maalia
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[4]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "maal";
                            textEdit.text = s.maal;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to maal   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Maalia"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: sharyEnoksen
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[5]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "shar";
                            textEdit.text = s.shar;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to shar   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Shary Enoksen"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: lloyd
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[6]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "lloy";
                            textEdit.text = s.lloy;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to lloy   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Lloyd"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: aqqualak
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[7]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "aqqu";
                            textEdit.text = s.aqqu;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to aqqu   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Aqqualak"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: angaja
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[8]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "anga";
                            textEdit.text = s.anga;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to anga   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Angaja"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: spider
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[9]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "spid";
                            textEdit.text = s.spid;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to spid   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Spider"
                        color: s.personen_textcolor
                    }
                }
                Rectangle{
                    id: veränderung_Ureinwohner
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: "transparent"
                    z: 0
                    Rectangle{
                        anchors.top: parent.top
                        width: parent.width
                        height: parent.height/2
                        z: 0
                        color: s.personen_color[10]
                        Text{
                            anchors.fill: parent
                            text: "Positive Veränderung der Ureinwohner"
                            wrapMode: Text.WordWrap
                            color: s.personen_textcolor
                            font.pixelSize: s.personen_pixelsize
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: { active_text = "vUP";
                                textEdit.text = s.vUP;
                                state_before = state.state;
                                state.state = "textview";
                                console.log("Going to vUP   |state: " + state.state + "   |state before: " + state_before);}
                        }
                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: parent.height/2
                        z: 0
                        color: s.personen_color[11]
                        Text{
                            anchors.fill: parent
                            text: "Negative Veränderung der Ureinwohner"
                            wrapMode: Text.WordWrap
                            color: s.personen_textcolor
                            font.pixelSize: s.personen_pixelsize
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: { active_text = "vUN";
                                textEdit.text = s.vUN;
                                state_before = state.state;
                                state.state = "textview";
                                console.log("Going to vUN   |state: " + state.state + "   |state before: " + state_before);}
                        }
                    }
                }
                Rectangle{
                    id: veränderung_Grönland
                    height: parent.height/2
                    width: parent.width/(s.personen_anzahl/2)
                    color: s.personen_color[12]
                    z: 0
                    MouseArea{
                        anchors.fill: parent
                        onClicked: { active_text = "vG";
                            textEdit.text = s.vG;
                            state_before = state.state;
                            state.state = "textview";
                            console.log("Going to vG   |state: " + state.state + "   |state before: " + state_before);}
                    }
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: s.personen_pixelsize
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        text: "Veränderung durch den Klimawandel von Grönland"
                        color: s.personen_textcolor
                    }
                }
            }
        }
    }
    Rectangle {         //Toolbar
        id: toolbar
        anchors.bottom: parent.bottom
        width: parent.width
        height: s.toolbarsize
        color: "steelblue"
        z: 20

        Text{
            id: toolbar_text
            z:21
            anchors.fill: parent
            height: s.toolbarsize
            width: parent.width/3
            font.pixelSize: s.personen_pixelsize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: active_text
        }
        Image{
            z: 22
            id: backandsave
            anchors.right: parent.right
            width: s.toolbarsize-10
            height: s.toolbarsize-10
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/../12161812051009901768jean_victor_balin_icon_arrow_left_green.svg.hi.png"
            MouseArea{
                z:20
                anchors.fill: parent
                onClicked: {
                    console.log("Back pressed")
                    switch(state_before){

                    case "Qt":              //verlassen
                        Qt.quit()
                        console.log("exit")
                        break;
                    case "main":            //im Editor
                        switch(active_text){        //speichern des Textes und verlassen
                        case "pakku":
                            s.pakku = textEdit.text
                            console.log("gespeichert für: pakku")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "jona":
                            s.jona = textEdit.text
                            console.log("gespeichert für: jona")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "pete":
                            s.pete = textEdit.text
                            console.log("gespeichert für: pete")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "evie":
                            s.evie = textEdit.text
                            console.log("gespeichert für: evie")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "maal":
                            s.maal = textEdit.text
                            console.log("gespeichert für: maal")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "shar":
                            s.shar = textEdit.text
                            console.log("gespeichert für: shar")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "lloy":
                            s.lloy = textEdit.text
                            console.log("gespeichert für: lloy")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "aqqu":
                            s.aqqu = textEdit.text
                            console.log("gespeichert für: aqqu")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "anga":
                            s.anga = textEdit.text
                            console.log("gespeichert für: anga")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "spid":
                            s.spid = textEdit.text
                            console.log("gespeichert für: spid")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "vUP":
                            s.vUP = textEdit.text
                            console.log("gespeichert für: VUP")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "vUN":
                            s.vUN = textEdit.text
                            console.log("gespeichert für: VUN")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "vG":
                            s.vG = textEdit.text
                            console.log("gespeichert für: VG")
                            state.state = state_before
                            active_text = "Hauptmenü"
                            state_before = "Qt"
                            break;
                        case "2011":
                            s.year_2011 = textEdit.text
                            console.log("gespeichert für: 2011: " + s.year_2011)
                            state.state = state_before
                            state_before = "Qt"
                            active_text = "Hauptmenü"
                            break;
                        case "2020":
                            s.year_2020 = textEdit.text
                            console.log("gespeichert für: 2020")
                            state.state = state_before
                            state_before = "Qt"
                            active_text = "Hauptmenü"
                            break;
                        case "2025":
                            s.year_2025 = textEdit.text
                            console.log("gespeichert für: 2025")
                            state.state = state_before
                            state_before = "Qt"
                            active_text = "Hauptmenü"
                            break;
                        case "settings":                            //In den Einstellungen
                            console.log("settings saved")
                            save_settings();
                            if(before_text == "Hauptmenü")
                            {
                                state.state = state_before
                                active_text = "Hauptmenü"
                                state_before = "Qt"
                            }
                            else{
                                state.state = "textview"
                                active_text = before_text
                                state_before = "main"
                            }

                            console.log("state.state: " + state.state + "  |  state_before: " + state_before)

                            break;
                        case "settings_grid_personenfarben":                            //In den Einstellungen
                            console.log("settings saved")
                            save_settings();
                            if(before_text == "Hauptmenü")
                            {
                                state.state = state_before
                                active_text = "Hauptmenü"
                                state_before = "Qt"
                            }
                            else{
                                state.state = "textview"
                                active_text = before_text
                                state_before = "main"
                            }

                            console.log("state.state: " + state.state + "  |  state_before: " + state_before)

                            break;
                        default: {
                            console.log("Saving Error: active_text is wrong. Please call an admin");
                            console.log("state: " + state.state + "  |  active_text: " + active_text + "  |  state_before: " + state_before);
                            debug.text = "Saving Error: active_text is wrong. Please call an admin";
                            break;
                        }
                        }
                        break;
                    case "textview":
                        console.log("Get back to Text: " + before_text);
                        if(state.state == "settings")
                        {
                            save_settings();
                        }

                        state.state = "textview";
                        active_text = before_text;
                        state_before = "main";
                        break;
                    case "settings":
                        console.log("Go back to settings von settings_gird_personenfarbe")
                        state.state = "settings"
                        active_text = before_text;
                        state_before = "main"

                        break;
                    default:
                        console.log("Back-Error: State_before is wrong. Please call an admin");
                        console.log("state: " + state.state  + "  |  state_before: " + state_before + "  |  active_text: " + active_text + "  |  before_text: " + before_text);
                        debug.text = "Back-Error: State_before is wrong. Please call an admin";
                        break;
                    }
                }
            }
        }
        Image{
            z: 22
            id: settings_button
            anchors.left: parent.left
            width: s.toolbarsize-10
            height: s.toolbarsize-10
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/../gears.png"
            MouseArea{
                z: 10
                anchors.fill: parent
                onClicked: {
                    background_color1_button.currentIndex = s.combobox_background1
                    background_color2_button.currentIndex = s.combobox_background2
                    text_color_button.currentIndex = s.combobox_textcolor
                    personen_color_button.currentIndex = s.combobox_personencolor
                    before_text = active_text;
                    active_text = "settings";
                    state_before = state.state;
                    state.state = "settings";
                    console.log("Entering Settings  |  state:" + state.state + "  |  state_before: " + state_before + "  |  active_text: "+ active_text + "  |  before_text: " + before_text)
                }
            }
        }
        Image{
            id: paste_button
            width: s.toolbarsize-10
            height: s.toolbarsize-10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: backandsave.left
            anchors.rightMargin: parent.width/2/3
            enabled: false
            visible: false
            source: "qrc:/../paste-icon.png"
            MouseArea{
                anchors.fill: parent
                onClicked: textEdit.paste()
            }
        }
        Image{
            id: copy_button
            width: s.toolbarsize-10
            height: s.toolbarsize-10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: settings_button.right
            anchors.leftMargin: parent.width/2/3
            enabled: false
            visible: false
            source: "qrc:/../copy-icon.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {textEdit.copy()}
            }
        }

    }
    TextArea{           //Text-screen
        id: textEdit
        text: ""
        width: parent.width
        height: parent.height-s.toolbarsize
        visible: false
        backgroundVisible: false
        font.pixelSize: s.text_pixelsize
        textColor: s.text_color
        //style: TextAreaStyle{textColor: s.text_color}
    }
    Rectangle{          //Settings-screen
        id: settings
        height: parent.height-s.toolbarsize
        width: parent.width
        visible: false
        color: "transparent"
        GridView{
            id: settings_grid_main
            anchors.fill: parent
            cellWidth: parent.width/2
            cellHeight: 100
            model: VisualItemModel{
                id: settingsMain
                Text{
                    id: tx1
                    width: parent.width/2
                    height: cellheight
                    text: "Textgröße: "
                    font.pixelSize: s.personen_pixelsize
                    color: s.text_color
                }
                TextInput{
                    id: ti1
                    width: parent.width/2
                    height: cellheight
                    text: s.text_pixelsize
                    color: s.personen_textcolor
                    font.pixelSize: tx1.font.pixelSize
                }
                Text{
                    id: tx2
                    width: parent.width/2
                    height: cellheight
                    text: "Personenschriftgröße: "
                    font.pixelSize: tx1.font.pixelSize
                    color: s.text_color
                }
                TextInput{
                    id: ti2
                    width: parent.width/2
                    height: cellheight
                    text: s.personen_pixelsize
                    font.pixelSize: tx1.font.pixelSize
                    color: s.personen_textcolor
                }
                Text{
                    id: tx3
                    width: parent.width/2
                    height: cellheight
                    text: "Jahreszahlengröße: "
                    font.pixelSize: tx1.font.pixelSize
                    color: s.text_color
                }
                TextInput{
                    id: ti3
                    width: parent.width/2
                    height: cellheight
                    text: s.years_pixelsize
                    color: s.personen_textcolor
                    font.pixelSize: tx1.font.pixelSize
                }
                Text{
                    id: tx4
                    width: parent.width/2
                    height: cellheight
                    text: "Toolbargröße: "
                    font.pixelSize: tx1.font.pixelSize
                    color: s.text_color
                }
                TextInput{
                    id: ti4
                    width: parent.width/2
                    height: cellheight
                    text: s.toolbarsize
                    font.pixelSize: tx1.font.pixelSize
                    color: s.personen_textcolor
                }
                Button{
                    id: farbenfenster_personen
                    width: parent.width/2
                    height: cellheight
                    text: "Personen Farben wählen"
                    onClicked: {
                        console.log("Go to farbenfenster_personen")
                        settings_grid_main.enabled = false
                        settings_grid_main.visible = false
                        settings_grid_personenfarben.enabled = true
                        settings_grid_personenfarben.visible = true
                        before_text = active_text
                        active_text = "settings_grid_personenfarben"
                        state_before = state.state
                        state.state = "settings_grid_personenfarben"
                    }
                }
                Button{
                    id:farbenfenster_timeline
                    width: parent.width/2
                    height: cellheight
                    text: "Timeline Farben wählen"
                }
                Button{
                    id: importieren_button
                    width: parent.width/2
                    height: cellheight
                    text: "Importieren"
                }
                Button{
                    id: exportieren_button
                    width: parent.width/2
                    height: cellheight
                    text: "Exportieren"
                }
                ComboBox{
                    id: background_color1_button
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Hintergrundfarbe-1"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: s.personen_pixelsize
                            color: s.background_color1
                        }
                    }
                }
                ComboBox{
                    id: background_color2_button
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Hintergrundfarbe-2"
                            font.pixelSize: s.personen_pixelsize
                            color: s.background_color2
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
                ComboBox{
                    id: text_color_button
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Textfarbe"
                            font.pixelSize: s.text_pixelsize
                            color: s.text_color
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
                ComboBox{
                    id: personen_color_button
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Personentextfarbe"
                            font.pixelSize: s.personen_pixelsize
                            color: s.personen_textcolor
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
                Label{
                    id: tx5
                    text: "-> Bei Fehler oder Bugs bitte an energie.hallo@web.de wenden \n-> By GeneralMine (Marvin Raiser) - 2016"
                    font.pixelSize: s.text_pixelsize
                    color: s.text_color
                }
                /*Label{
                    id: tx6
                    text: "By GeneralMine (Marvin Raiser) - 2016"
                    font.pixelSize: s.text_pixelsize
                }*/
            }
        }
        GridView{
            id: settings_grid_personenfarben
            anchors.fill: parent
            cellWidth: parent.width/2
            cellHeight: 100
            visible: false
            enabled: false
            model: VisualItemModel{
                id: farbenfenster_personen_model
                ComboBox{
                    id: pakku_farbenfenster
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Pakkutak´s Farbe"
                            font.pixelSize: s.personen_pixelsize
                            color: s.personen_color[0]
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
                ComboBox{
                    id: jona_farbenfenster
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Pakkutak´s Farbe"
                            font.pixelSize: s.personen_pixelsize
                            color: s.personen_color[0]
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
                ComboBox{
                    id: pete_farbenfenster
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Pakkutak´s Farbe"
                            font.pixelSize: s.personen_pixelsize
                            color: s.personen_color[0]
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
        }
        GridView{
            id: settings_grid_yearsfarben
            anchors.fill: parent
            cellWidth: parent.width/2
            cellHeight: 100
            visible: false
            enabled: false
            model: VisualItemModel{
                id: farbenfenster_years_model
                ComboBox{
                    id: year_2011_farbenfenster
                    width: parent.width/2
                    height: cellheight
                    model: farben
                    style: ComboBoxStyle{
                        textColor: "lightgreen"
                        background: Rectangle{anchors.fill: parent; color: "transparent"}
                        label: Text{
                            text: "Pakkutak´s Farbe"
                            font.pixelSize: s.personen_pixelsize
                            color: s.personen_color[0]
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
        }
    }
    Item {              //States
        id: state
        state: "main"
        states: [
            State{
                name: "main"
                PropertyChanges{
                    target: settings_button
                    visible: true
                    enabled: true
                }
                PropertyChanges{
                    target: home
                    enabled: true
                    visible: true
                }
                PropertyChanges {
                    target: textEdit
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: settings
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: paste_button
                    enabled: false
                    visible: false
                }
                PropertyChanges {
                    target: copy_button
                    enabled: false
                    visible: false
                }
            },
            State{
                name: "textview"
                PropertyChanges{
                    target: textEdit
                    enabled: true
                    visible: true
                }
                PropertyChanges {
                    target: home
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: settings
                    enabled: false
                    visible: false
                }
                PropertyChanges {
                    target: paste_button
                    enabled: true
                    visible: true
                }
                PropertyChanges {
                    target: copy_button
                    enabled: true
                    visible: true
                }
            },
            State{
                name: "settings"
                PropertyChanges {
                    target: textEdit
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: home
                    visible: false
                    enabled: false
                }
                PropertyChanges{
                    target: settings_button
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: settings
                    enabled: true
                    visible: true
                }
                PropertyChanges{
                    target: settings_grid_main
                    enabled: true
                    visible: true
                }
                PropertyChanges{
                    target: settings_grid_personenfarben
                    enabled: false
                    visible: false
                }
                PropertyChanges {
                    target: settings_grid_yearsfarben
                    visible: false
                    enabled: false
                }
            },
            State{
                name: "settings_grid_personenfarben"
                PropertyChanges {
                    target: textEdit
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: home
                    visible: false
                    enabled: false
                }
                PropertyChanges{
                    target: settings_button
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: settings
                    visible: true
                    enabled: true
                }
                PropertyChanges{
                    target: settings_grid_main
                    visible: false
                    enabled: false
                }
                PropertyChanges {
                    target: settings_grid_personenfarben
                    visible: true
                    enabled: true
                }
                PropertyChanges {
                    target: settings_grid_yearsfarben
                    enabled: false
                    visible: false
                }
            }

        ]
        transitions: [
        ]
    }
}

