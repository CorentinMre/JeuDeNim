from os import system

class Game:
    """
    Class Game
    for the game "NIM"
    """
    
    def __init__(self, namePlayer1:str, namePlayer2 = None, nb_allumettes:int = 12):
        """Innitialisation du jeu

        Args:
            namePlayer1 (_type_): Name of player 1
            namePlayer2 (_type_, optional): Name of second player (if there is one). Defaults to None.
            nb_allumettes (int, optional): total number of matches(allumettes). Defaults to 12.
        """
        self.computerName = "L'ordinateur"
        self.player1_name = namePlayer1
        if namePlayer2 == None: self.player2_name = self.computerName
        else: self.player2_name = namePlayer2
        self.whoPlay = self.player1_name
        self.allumettes = '|'
        self.nb_allumettes = nb_allumettes
        self.max_allumettes_retiree = 3
        self.lessAllumettes = 0
        self.nb_allumettes_for_game_over = self._algorithmForTheComputer()
        self.nb_allumettes_global = self.nb_allumettes
        self.isWin = False
        

    def _algorithmForTheComputer(self):
        """
        Algorithm for the computer

        Returns:
            list: Return a list of all the number to make the opponent lose. Ex. [5, 9, 13] (for max_allumettes_retiree = 3)
        """
        possible = []
        for i in range(self.nb_allumettes//self.max_allumettes_retiree):
            possible.append((self.max_allumettes_retiree*2-1)+(self.max_allumettes_retiree+1)*(i-1))
        return possible
        

    def computerPlay(self):
        """
        The computer play
        """

        if self.nb_allumettes in self.nb_allumettes_for_game_over: self.lessAllumettes = 1
        else:
            self.lessAllumettes = self.max_allumettes_retiree
            while not self.nb_allumettes-self.lessAllumettes in self.nb_allumettes_for_game_over: self.lessAllumettes -= 1

        self.nb_allumettes -= self.lessAllumettes


    def removeAllumettes(self, nb):
        """Remove allumettes

        Args:
            nb (int): nb of allumettes to remove

        Returns:
            bool: Return True if it's possible to remove allumettes, else False
        """
        if nb >0 and nb <= self.nb_allumettes and nb <= self.max_allumettes_retiree:
            self.nb_allumettes -= nb
            return True
        else: return False
    

    def checkWin(self):
        """
        Check if the game is win

        Returns:
            bool: Return True if the game is win, else False
        """
        if self.nb_allumettes == 0:
            self.isWin = True
            return True
        else: return False
    
    def displayAllumettes(self):
        """Display allumettes

        Returns:
            str: return the number of allumettes. Ex. "||||||"
        """
        return self.allumettes*self.nb_allumettes
    



if __name__ == "__main__":
    
    playVsComputer = input("Voulez vous jouer contre l'ordinateur ? (y/n) : ").upper()
    if playVsComputer == "Y":
        name = input("Entrez votre nom : ")
        nbAllummettes = int(input("Entrez le nombre d'allumettes : "))
        game = Game(name, nb_allumettes=nbAllummettes)
    elif playVsComputer == "N":
        name1 = input("Entrez le nom du joueur 1 : ")
        name2 = input("Entrez le nom du joueur 1 : ")
        nbAllummettes = int(input("Entrez le nombre d'allumettes : "))
        game = Game(name1, name2, nb_allumettes=nbAllummettes)
    else: print("Vous n'avez pas entré un choix valide"); exit()
    
    
    
    while not game.isWin:
        
        #Affichage des allumettes restantes
        print(game.displayAllumettes())

        print(f"\n[!] Au tour de {game.whoPlay}!")
        
        if game.whoPlay != game.computerName:
            while True:
                nb = int(input("[?] Combien d'allumettes voulez vous retirer: "))
                game.lessAllumettes = nb
                if game.removeAllumettes(nb): break
                else: print(f"\n[!] Vous pouvez seulement retirer entre 1 et {game.max_allumettes_retiree} allumettes. Et vous ne pouvez pas retirer plus {game.nb_allumettes} allumette(s).")
        else: game.computerPlay()
        #Vérification de la victoire
        game.checkWin()
             
        #Efface le terminal
        _ = system("cls")
        _ = system("clear")

        if game.nb_allumettes_global != game.nb_allumettes:
            print(f"\n{game.whoPlay} prend {game.lessAllumettes} allumette(s)")
            print(f"Il reste {game.nb_allumettes} allumette(s)\n")

        #Changement de joueur pour que le suivant joue
        game.whoPlay = game.player1_name if game.whoPlay == game.player2_name else game.player2_name
        

    #Efface le terminal
    _ = system("cls")
    _ = system("clear")

    #GAGNANT
    print(f"\n[!] Nous avons un gagnant! {game.whoPlay} a gagné.")
