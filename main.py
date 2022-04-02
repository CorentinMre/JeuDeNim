import sys
import os

#For the Game
from src import Game

# IMPORT MODULES
from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot, Signal

# Main Window Class
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.game = None

    # Signals To Send Data
    status = Signal(str)
    retire_allumettes = Signal(int)
    win = Signal()

    # Function PlayVsComputer
    @Slot(str, str)
    def start(self, namePlayer1:str, namePlayer2:str):
        """
        Start a new game with a other player

        Args:
            namePlayer1 (str): Name of player 1
            namePlayer2 (str): Name of the second player 
        """
        if namePlayer2 == "None": self.game = Game(namePlayer1)
        else: self.game = Game(namePlayer1, namePlayer2)
        self.status.emit(f"Il y a {self.game.nb_allumettes} allumettes\n A {self.game.whoPlay} de jouer")
        

    @Slot(int)
    def nextRound(self, nb_allumettes_en_moins:int):
        """
        Go to the next round
        
        Args:
            nb_allumettes_en_moins (int): Number of matches removed
        """
        status = ""

        if self.game.removeAllumettes(nb_allumettes_en_moins):
            self.game.lessAllumettes = nb_allumettes_en_moins
        else: self.status.emit(f"Vous pouvez seulement retirer entre 1 et {self.game.max_allumettes_retiree} allumettes. Et vous ne pouvez pas retirer plus {self.game.nb_allumettes} allumette(s).")

        if self.game.nb_allumettes_global != self.game.nb_allumettes:
            status += f"{self.game.whoPlay} prend {self.game.lessAllumettes} allumette(s). Il reste {self.game.nb_allumettes} allumette(s). "
        
        #Changement de joueur pour que le suivant joue
        self.game.whoPlay = self.game.player1_name if self.game.whoPlay == self.game.player2_name else self.game.player2_name
        
        
        if not self.game.checkWin():
            if self.game.whoPlay == self.game.computerName: self.game.computerPlay(); self.retire_allumettes.emit(self.game.lessAllumettes); status = f"{self.game.whoPlay} prend {self.game.lessAllumettes} allumette(s). Il reste {self.game.nb_allumettes} allumette(s). "; self.game.whoPlay = self.game.player1_name if self.game.whoPlay == self.game.player2_name else self.game.player2_name
            if self.game.nb_allumettes <= 0: self.status.emit(f"Nous avons un gagnant! {self.game.whoPlay} a gagné."); self.win.emit()
            else: status+=f"Au tour de {self.game.whoPlay}!"; self.status.emit(status)
        
        else: self.status.emit(f"Nous avons un gagnant! {self.game.whoPlay} a gagné."); self.win.emit()
    
    
        
        

            
# INSTACE CLASS
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    app.setWindowIcon(QIcon("images/logo_allumettes.png"))
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    # Check Exit App
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())