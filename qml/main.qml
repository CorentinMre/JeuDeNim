import QtQuick 2.15
import QtQuick.Window 6.0
import QtQuick.Controls 2.15
import "controls"
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects 6.0


Window{
    id: window
    width: 400
    height: 580
    x : Screen.width / 2 - width / 2
    y : Screen.height / 2 - height / 2
    visible: true
    color: "#00ffffff"
    title: qsTr("Jeu de Nim")

    property int nb_allumettes_retiree: 0




    // SET FLAGS
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint | Qt.Window | Qt.FramelessWindowHint

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    

    

    // Internal functions
    QtObject{
        id: internal


        function recPlayVsComputer(){
            
            if(nameOfPlayer.text != "" ){
                nb_allumettes_retiree =0

                btnAllumettes1.visible= true
                btnAllumettes2.visible= true
                btnAllumettes3.visible= true
                btnAllumettes4.visible= true
                btnAllumettes5.visible= true
                btnAllumettes6.visible= true
                btnAllumettes7.visible= true
                btnAllumettes8.visible= true
                btnAllumettes9.visible= true
                btnAllumettes10.visible= true
                btnAllumettes11.visible= true
                btnAllumettes12.visible= true

                btnAllumettes1.opacity= 1
                btnAllumettes2.opacity= 1
                btnAllumettes3.opacity= 1
                btnAllumettes4.opacity= 1
                btnAllumettes5.opacity= 1
                btnAllumettes6.opacity= 1
                btnAllumettes7.opacity= 1
                btnAllumettes8.opacity= 1
                btnAllumettes9.opacity= 1
                btnAllumettes10.opacity= 1
                btnAllumettes11.opacity= 1
                btnAllumettes12.opacity= 1
                btnSuivant.text = qsTr("Suivant")
                backend.start(nameOfPlayer.text, "None")
                recPlay.visible = true
                recAccueil.visible = false
            }else{
                nameOfPlayer.Material.foreground = Material.Red
                nameOfPlayer.Material.accent = Material.Red
            }

        }
        function recPlayVsOtherPlayer(){

            if(nameOfPlayer1.text != "" && nameOfPlayer2.text != ""){
                nb_allumettes_retiree = 0

                btnAllumettes1.visible= true
                btnAllumettes2.visible= true
                btnAllumettes3.visible= true
                btnAllumettes4.visible= true
                btnAllumettes5.visible= true
                btnAllumettes6.visible= true
                btnAllumettes7.visible= true
                btnAllumettes8.visible= true
                btnAllumettes9.visible= true
                btnAllumettes10.visible= true
                btnAllumettes11.visible= true
                btnAllumettes12.visible= true

                btnAllumettes1.opacity= 1
                btnAllumettes2.opacity= 1
                btnAllumettes3.opacity= 1
                btnAllumettes4.opacity= 1
                btnAllumettes5.opacity= 1
                btnAllumettes6.opacity= 1
                btnAllumettes7.opacity= 1
                btnAllumettes8.opacity= 1
                btnAllumettes9.opacity= 1
                btnAllumettes10.opacity= 1
                btnAllumettes11.opacity= 1
                btnAllumettes12.opacity= 1

                btnSuivant.text = qsTr("Suivant")
                backend.start(nameOfPlayer1.text, nameOfPlayer2.text)
                recPlay.visible = true
                recAccueil.visible = false
            }else{
                nameOfPlayer1.Material.foreground = Material.Red
                nameOfPlayer1.Material.accent = Material.Red
                nameOfPlayer2.Material.foreground = Material.Red
                nameOfPlayer2.Material.accent = Material.Red
            }

        }

        function retourPlay(){
            recAccueil.visible = true
            recPlay.visible = false
        }
        function aide(){
            recAide.visible = true
            recAccueil.visible = false
        }
        function retourAide(){
            recPlay.visible = true
            recAide.visible = false
        }

        function nextRound(nb_allumettes_retiree){

            if(btnAllumettes1.opacity == .25){btnAllumettes1.visible = false}
            if(btnAllumettes2.opacity == .25){btnAllumettes2.visible = false}
            if(btnAllumettes3.opacity == .25){btnAllumettes3.visible = false}
            if(btnAllumettes4.opacity == .25){btnAllumettes4.visible = false}
            if(btnAllumettes5.opacity == .25){btnAllumettes5.visible = false}
            if(btnAllumettes6.opacity == .25){btnAllumettes6.visible = false}
            if(btnAllumettes7.opacity == .25){btnAllumettes7.visible = false}
            if(btnAllumettes8.opacity == .25){btnAllumettes8.visible = false}
            if(btnAllumettes9.opacity == .25){btnAllumettes9.visible = false}
            if(btnAllumettes10.opacity == .25){btnAllumettes10.visible = false}
            if(btnAllumettes11.opacity == .25){btnAllumettes11.visible = false}
            if(btnAllumettes12.opacity == .25){btnAllumettes12.visible = false}

            backend.nextRound(nb_allumettes_retiree)

        }




    }

    


    
    

    Rectangle {
        id: recAccueil
        x: 0
        width: 400
        height: 545
        visible: true
        color: "#0b5541"
        anchors.top: parent.top
        anchors.topMargin: 35

        Image{
            id: imgLogo
            x: 50
            y: 14
            width: 124
            height: 124
            source: "../images/logo_allumettes.png"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 47
        }

        Text{
            id: lblExplication
            x: 166
            y: 230
            width: 123
            height: 63
            text: qsTr("Jeu de NIM")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -59
            anchors.horizontalCenterOffset: 1
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 17
        }

        Switch {
            id: switch1
            x: 150
            y: 279
            width: 101
            height: 30
            layer.enabled: false
            
            onClicked : {
                if (switch1.checked) {
                    recPlayVsOtherPlayer.visible = true
                    recPlayVsComputer.visible = false
                }
                else {
                    recPlayVsComputer.visible = true
                    recPlayVsOtherPlayer.visible = false
                }
            }
        }

        Rectangle {
            id: recPlayVsOtherPlayer
            x: 8
            y: 315
            width: 384
            height: 222
            visible: false
            color: "#00ffffff"

            Button {
                id: btnPlay
                x: 42
                y: 65
                width: 98
                height: 46
                opacity: 1
                text: qsTr("Jouer")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                z: 0
                onClicked : internal.recPlayVsOtherPlayer()
            }

            TextField {
                id: nameOfPlayer1
                y: 88
                width: 139
                height: 37
                selectByMouse: true
                anchors.left: parent.left
                anchors.leftMargin: 45
                placeholderText: qsTr("Nom du joueur 1")
            }

            TextField {
                id: nameOfPlayer2
                x: 187
                y: 88
                width: 139
                height: 37
                selectByMouse: true
                anchors.right: parent.right
                anchors.rightMargin: 45
                placeholderText: qsTr("Nom du joueur 2")
            }

            Rectangle {
                id: recNameOfRec
                x: 60
                height: 40
                color: "#1d8154"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 60
                anchors.rightMargin: 60
                anchors.topMargin: 24
                anchors.leftMargin: 60
                Text {
                    id: lblNameOfRec
                    color: "#151515"
                    text: qsTr("Jouer à deux")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Rectangle {
            id: recPlayVsComputer
            x: 8
            y: 315
            width: 384
            height: 222
            visible: true
            color: "#00ffffff"
            Button {
                id: btnPlay1
                x: 42
                y: 161
                width: 98
                height: 46
                opacity: 1
                text: qsTr("Jouer")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                z: 0
                onClicked: internal.recPlayVsComputer()
            }

            TextField {
                id: nameOfPlayer
                y: 87
                width: 139
                height: 37
                color: "#ffffff"
                selectByMouse: true
                anchors.left: parent.left
                selectedTextColor: "#ffffff"
                placeholderText: qsTr("Nom du joueur")
                anchors.leftMargin: 123
            }

            Rectangle {
                id: recNameOfRec1
                x: 60
                height: 40
                color: "#1d8154"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 60
                anchors.rightMargin: 60
                anchors.topMargin: 24
                anchors.leftMargin: 60
                Text {
                    id: lblNameOfRec1
                    color: "#151515"
                    text: qsTr("Jouer contre l'ordinateur")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }



    }





    Rectangle {
        id: recTopBar
        x: 0
        y: 0
        width: 400
        height: 35
        color: "#151515"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top


        Image {
            id: iconApp
            width: 36
            height: 22
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../images/allumettes.png"
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            fillMode: Image.PreserveAspectFit
        }

        Row {
            id: rowBtns
            x: 330
            width: 70
            height: 35
            visible: true
            anchors.right: parent.right
            anchors.top: parent.top
            smooth: false
            enabled: true
            padding: 0
            topPadding: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0

            TopBarButton{
                id: btnMinimize
                width: 35
                height: 35
                horizontalPadding: 4
                padding: 4
                btnColorDefault: "#1c1d20"
                bottomPadding: 4
                autoRepeatDelay: 300
                btnColorClicked: "#1d8154"
                onClicked: {
                    window.showMinimized()
                }
            }



            TopBarButton {
                id: btnClose
                btnColorClicked: "#ff0000"
                btnIconSource: "../../images/svg_images/close_icon.svg"
                onClicked: window.close()
            }
        }

        Label {
            id: lblNameOfGame
            x: 46
            width: 241
            color: "#c3cbdd"
            text: qsTr("Jeu de Nim")
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 113
            font.pointSize: 10
            anchors.leftMargin: 5
        }

        DragHandler {
            onActiveChanged: if(active){
                                 window.startSystemMove()
                             }
        }

    }

    Rectangle {
        id: recPlay
        visible: false
        color: "#0b5541"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 35

        Rectangle {
            id: recInfo
            color: "#1d8154"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 60
            anchors.bottomMargin: 428
            anchors.rightMargin: 50
            anchors.leftMargin: 60
            anchors.topMargin: 46
            Text {
                id: lblInfo
                width: 274
                height: 54
                color: "#151515"
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: recAllumettes
            x: 16
            y: 147
            width: 368
            height: 180
            color: "#00ffffff"

            Button {
                id: btnAllumettes1
                x: 33
                y: 44
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                autoExclusive: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes1.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes1.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes1.opacity = 1
                    }
                }

                Image {
                    id: allumettes1
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Button {
                id: btnAllumettes2
                x: 84
                y: 44
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes2.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes2.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes2.opacity = 1
                    }
                }
                Image {
                    id: allumettes2
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes3
                x: 134
                y: 44
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes3.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes3.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes3.opacity = 1
                    }
                }
                Image {
                    id: allumettes3
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes4
                x: 183
                y: 44
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes4.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes4.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes4.opacity = 1
                    }
                }
                Image {
                    id: allumettes4
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes5
                x: 233
                y: 44
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes5.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes5.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes5.opacity = 1
                    }
                }
                Image {
                    id: allumettes5
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes6
                x: 284
                y: 44
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes6.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes6.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes6.opacity = 1
                    }
                }
                Image {
                    id: allumettes6
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes7
                x: 33
                y: 103
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes7.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes7.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes7.opacity = 1
                    }
                }
                Image {
                    id: allumettes7
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes8
                x: 84
                y: 103
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes8.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes8.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes8.opacity = 1
                    }
                }
                Image {
                    id: allumettes8
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes9
                x: 134
                y: 103
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes9.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes9.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes9.opacity = 1
                    }
                }
                Image {
                    id: allumettes9
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes10
                x: 183
                y: 103
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes10.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes10.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes10.opacity = 1
                    }
                }
                Image {
                    id: allumettes10
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes11
                x: 233
                y: 103
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes11.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes11.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes11.opacity = 1
                    }
                }
                Image {
                    id: allumettes11
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }

            Button {
                id: btnAllumettes12
                x: 284
                y: 103
                width: 51
                height: 66
                text: qsTr("")
                autoRepeat: false
                hoverEnabled: true
                onClicked: {
                    if(btnAllumettes12.opacity == 1){
                        nb_allumettes_retiree++
                        btnAllumettes12.opacity = .25
                    }else{
                        nb_allumettes_retiree--
                        btnAllumettes12.opacity = 1
                    }
                }
                Image {
                    id: allumettes12
                    x: 0
                    y: 0
                    width: 51
                    height: 66
                    source: "../images/allumette.png"
                    fillMode: Image.PreserveAspectFit
                }
                autoExclusive: false
            }
        }

        Button {
            id: btnSuivant
            width: 300
            opacity: 1
            text: qsTr("Au suivant")
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 377
            z: 0
            onClicked: {

                if(btnSuivant.text == "Suivant"){
                    if(nb_allumettes_retiree <=3 && nb_allumettes_retiree >= 1){
                        internal.nextRound(nb_allumettes_retiree)
                        nb_allumettes_retiree= 0
                    }else{
                        lblInfo.text = "Il faut retirer au maximum 3 allumettes et au minimum 1."
                    }
                }else{

                    internal.retourPlay()

                    
                }

                
            }
        }

        Button {
            id: btnRetourPlay
            x: 16
            width: 79
            height: 37
            opacity: 1
            text: qsTr("Retour")
            anchors.top: parent.top
            anchors.topMargin: 500
            z: 0
            onClicked: internal.retourPlay()
        }

        Button {
            id: btnAide
            x: 313
            width: 79
            height: 37
            opacity: 1
            text: qsTr("Aide")
            anchors.top: parent.top
            anchors.topMargin: 500
            z: 0
            onClicked: internal.aide()
        }


    }

    Rectangle {
        id: recAide
        visible: false
        color: "#0b5541"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 35
        Image {
            id: imgLogo1
            x: 50
            y: 14
            width: 124
            height: 124
            anchors.top: parent.top
            source: "../images/logo_allumettes.png"
            anchors.topMargin: 47
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: recExplication1
            x: 60
            y: 194
            height: 216
            color: "#1d8154"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: imgLogo1.bottom
            anchors.margins: 60
            anchors.rightMargin: 50
            anchors.topMargin: 47
            anchors.leftMargin: 60
            Text {
                id: lblExplication1
                width: 245
                height: 180
                color: "#151515"
                text: qsTr("Le jeu se joue à deux au tour par tour. Le but du jeu est de ne pas prendre la dernière allumette. Vous pouvez prendre au maximum 3 allumettes et au minimum 1 allumette pour faire perdre l'adversaire.")
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Button {
            id: btnRetourAide
            x: 16
            width: 79
            height: 37
            opacity: 1
            text: qsTr("Retour")
            anchors.top: parent.top
            anchors.topMargin: 500
            z: 0
            onClicked: internal.retourAide()
        }
    }


    Connections {
        target: backend


        function onStatus(info){lblInfo.text=info}

        function onRetire_allumettes(nb_allumettes){

            if(nb_allumettes>=1 && btnAllumettes1.opacity == 1){
                btnAllumettes1.opacity = 0
                btnAllumettes1.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes2.opacity == 1){
                btnAllumettes2.opacity = 0
                btnAllumettes2.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes3.opacity == 1){
                btnAllumettes3.opacity = 0
                btnAllumettes3.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes4.opacity == 1){
                btnAllumettes4.opacity = 0
                btnAllumettes4.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes5.opacity == 1){
                btnAllumettes5.opacity = 0
                btnAllumettes5.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes6.opacity == 1){
                btnAllumettes6.opacity = 0
                btnAllumettes6.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes7.opacity == 1){
                btnAllumettes7.opacity = 0
                btnAllumettes7.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes8.opacity == 1){
                btnAllumettes8.opacity = 0
                btnAllumettes8.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes9.opacity == 1){
                btnAllumettes9.opacity = 0
                btnAllumettes9.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes10.opacity == 1){
                btnAllumettes10.opacity = 0
                btnAllumettes10.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes11.opacity == 1){
                btnAllumettes11.opacity = 0
                btnAllumettes11.visible = false
                nb_allumettes--
            }if(nb_allumettes>=1 && btnAllumettes12.opacity == 1){
                btnAllumettes12.opacity = 0
                btnAllumettes12.visible = false
                nb_allumettes--
            }

            


        }
        function onWin(){
            btnSuivant.text = qsTr("Revenir au menu")


        }

    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
