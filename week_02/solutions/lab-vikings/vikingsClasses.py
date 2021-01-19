class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
    def attack(self):
        return self.strength
    def receiveDamage(self, damage):
        self.health = self.health - damage
        # self.health -= damage
    def __lt__(self,other):
        # SELF < OTHER
        return self.receiveDamage(other.attack())

class Viking(Soldier):
    def __init__(self, name, health, strength):
        self.name = name
        super().__init__(health, strength)
    def receiveDamage(self, damage):
        super().receiveDamage(damage)
        if self.health > 0:
            return f"{self.name} has received {damage} points of damage"
        else:
            return f"{self.name} has died in act of combat"
    def battleCry(self):
        return "Odin Owns You All!"

class Saxon(Soldier):
    # The constructor __init__ is also inherited. If there are no changes to it,
    # there's no need to define it again.
    def receiveDamage(self, damage):
        super().receiveDamage(damage)
        if self.health > 0:    
            return f"A Saxon has received {damage} points of damage"
        else:
            return f"A Saxon has died in combat"

import random
class War():
    def __init__(self):
        self.vikingArmy = []
        self.saxonArmy = []

    def addViking(self, viking):
        # Good example of defensive programming
        # It only allows objects of the correct class to join the army
        if isinstance(viking, Viking):
            self.vikingArmy.append(viking)

    def addSaxon(self, saxon):
        if isinstance(saxon, Saxon):
            self.saxonArmy.append(saxon)

    # We can try to use a single attack function and use parameters to define
    # the attacking and defending teams
    def armyAttack(self,attacking_army,defending_army):
        attacker = random.choice(attacking_army)
        defender = random.choice(defending_army)
        damage = defender < attacker
        if defender.health <= 0:
            defending_army.remove(defender)
            return damage
        else:
            return damage

    # We define this method and use it to call the generic attack method
    # with the parameters
    def vikingAttack(self): 
        return self.armyAttack(self.vikingArmy,self.saxonArmy)

    def saxonAttack(self):
        return self.armyAttack(self.saxonArmy,self.vikingArmy)
        
    def showStatus(self):
        if len(self.saxonArmy) == 0:
            return "Vikings have won the war of the century!"
        elif len(self.vikingArmy) == 0:
            return "Saxons have fought for their lives and survive another day..."
        else:
            return "Vikings and Saxons are still in the thick of battle."

### Future Ideas
# Instead of lists, armies could be their own class
"""
class Army(list):
    def randomSoldier(self):
        return random.choice(self.__iter__())
"""