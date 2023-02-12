class Fruit:
    def __init__(self, poids=1):
        """
        Constructeur.
        """
        self.__poids = poids

    def __repr__(self):
        """
        Representation en str.
        """
        return "Un fruit de %s kilos."%self.poids()

    def poids(self):
        """
        Retourne le poids.
        """
        return self.__poids

    def est_un_fruit(self):
        """
        Retourne True si c'est un fruit.
        """
        return True

class Banane(Fruit):
    def __repr__(self):
        """
        Representation en str.
        """
        return "Une banane de %s kilos."%self._poids

class Fraise(Fruit):
    def __repr__(self):
        """
        Representation en str.
        """
        return "Une fraise de %s kilos."%self._poids

    def __add__(self, autre):
        """
        Fusion de la fraise avec une autre fraise.
        """
        return Fraise(self.poids()**2 + autre.poids()**2)

class Ananas(Fruit):
    def __repr__(self):
        """
        Representation en str.
        """
        return "Un ananas de %s kilos."%self._poids

