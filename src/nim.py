class Game:
    """
    Class Game
    for the game "NIM"
    """
    
    def __init__(self, namePlayer1:str, namePlayer2 = None, nb_allumettes:int = 12, max_allumettes_retiree:int = 3):
        """Innitialisation du jeu

        Args:
            namePlayer1 (_type_): Name of player 1
            namePlayer2 (_type_, optional): Name of second player (if there is one). Defaults to None.
            nb_allumettes (int, optional): total number of matches(allumettes). Defaults to 12.
            max_allumettes_retiree (int, optional): max matches removed. Defaults to 3.
        """
        self.computerName = "L'ordinateur"
        self.player1_name = namePlayer1
        if namePlayer2 == None: self.player2_name = self.computerName
        else: self.player2_name = namePlayer2
        self.whoPlay = self.player1_name
        self.allumettes = '|'
        self.nb_allumettes = nb_allumettes
        self.max_allumettes_retiree = max_allumettes_retiree
        self.machine_retire_allumettes = 0
        self.infoMachine = ""
        self.infoPlayer = ""
        self.iswin = False
        self.islose = False
        self.nb_allumettes_for_game_over = self._algorithmForTheComputer()
        
    def _algorithmForTheComputer(self):
        possible = []
        for i in range(self.nb_allumettes//self.max_allumettes_retiree):
            possible.append((self.max_allumettes_retiree*2-1)+(self.max_allumettes_retiree+1)*(i-1))
        return possible
        
    def playerPlay(self, allumettes_a_retirer:int):
        """
        A player play
        """
        
        if allumettes_a_retirer <=  self.max_allumettes_retiree and allumettes_a_retirer >= 1 and allumettes_a_retirer < self.nb_allumettes:
            self.nb_allumettes -= allumettes_a_retirer
            self.infoPlayer = f"{self.whoPlay} prend {allumettes_a_retirer} allumette(s)"
        elif allumettes_a_retirer == self.nb_allumettes: self.islose = True
        

    def computerPlay(self):
        """
        The computer play
        """

        if self.nb_allumettes in self.nb_allumettes_for_game_over: self.machine_retire_allumettes = 1
        else:
            self.machine_retire_allumettes = self.max_allumettes_retiree
            while not self.nb_allumettes-self.machine_retire_allumettes in self.nb_allumettes_for_game_over: self.machine_retire_allumettes -= 1

        self.nb_allumettes -= self.machine_retire_allumettes
        self.infoMachine = f"{self.player2_name} prend {self.machine_retire_allumettes} allumette(s)"
        
    def status(self):
        """
        Display the status of the game
        """
        if self.islose:
            if self.whoPlay == self.player1_name: return f"{self.player2_name} à perdu. Il est le dernier à avoir pris des allumettes."
            else: return f"{self.player1_name} à perdu. Il est le dernier à avoir pris des allumettes." 
        
        if self.iswin:
            if self.whoPlay != self.player1_name: return f"{self.player1_name} a gagné, {self.player2_name} est le dernier à prendre une allumette."
            else: return f"{self.player2_name} a gagné, {self.player1_name} est le dernier à prendre une allumette."

        if self.whoPlay != self.computerName and self.player2_name == self.computerName: return f"{self.infoMachine}\nIl reste {self.nb_allumettes} allumette(s)\nA {self.whoPlay} de jouer."
        else: return f"{self.infoPlayer}\nIl reste {self.nb_allumettes} allumette(s)\nA {self.whoPlay} de jouer."

    
    def play(self,nb_allumettes_a_retirer:int):
        """
        launch the game
        """
        
        if self.nb_allumettes != 1:
            if self.whoPlay == self.player1_name:
                self.playerPlay(nb_allumettes_a_retirer)
                self.whoPlay = self.player2_name
            
            elif self.whoPlay != self.computerName and self.whoPlay == self.player2_name:
                self.playerPlay(nb_allumettes_a_retirer)
                self.whoPlay = self.player1_name
        if self.nb_allumettes != 1:
            if self.whoPlay == self.player2_name and self.player2_name == self.computerName:
                self.computerPlay()
                self.whoPlay = self.player1_name
                
        else: self.iswin = True
