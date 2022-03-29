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
    def startPlayVsPlayer(self, namePlayer1:str, namePlayer2:str):
        """
        Start a new game with a other player

        Args:
            namePlayer1 (str): Name of player 1
            namePlayer2 (str): Name of the second player 
        """
        self.game = Game(namePlayer1, namePlayer2)
        self.status.emit(self.game.status())
        
    # Function PlayVsPlayer
    @Slot(str)
    def startPlayVsComputer(self, namePlayer:str):
        """
        Start a new game vs the computer

        Args:
            namePlayer (_type_): Name of player
        """
        self.game = Game(namePlayer)
        self.status.emit(self.game.status())
    
    @Slot(int)
    def nextRound(self, nb_allumettes_en_moins:int):
        """
        Go to the next round
        
        Args:
            nb_allumettes_en_moins (int): Number of matches removed
        """
        self.game.play(nb_allumettes_en_moins)
        status= self.game.status()
        self.status.emit(status)
        if "perdu" in status:
            self.win.emit()

        if self.game.player2_name == self.game.computerName:
            self.retire_allumettes.emit(self.game.machine_retire_allumettes)
        
        if self.game.iswin == True:
            self.win.emit()
            
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