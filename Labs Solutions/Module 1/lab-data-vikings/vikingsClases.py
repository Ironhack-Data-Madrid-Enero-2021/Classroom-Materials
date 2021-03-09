
import random   # para elegir guerreros al azar


# Soldier
class Soldier():
	def __init__(self, health, strength):
		self.health=health
		self.strength=strength
	
	def attack(self):
		return self.strength
		
	def receiveDamage(self, damage):
		self.health-=damage
			
		
		


# Viking
class Viking(Soldier):
	def __init__(self, name, health, strength):
		self.name=name
		self.health=health
		self.strength=strength
		
	def receiveDamage(self, damage):
		self.health-=damage
		if self.health>0    : return "{} has received {} points of damage".format(self.name, damage)	
		elif self.health<=0 : return "{} has died in act of combat".format(self.name)
		
	def battleCry(self):
		return "Odin Owns You All!"	





# Saxon
class Saxon(Soldier):
	def __init__(self, health, strength):
		self.health=health
		self.strength=strength
	
	def receiveDamage(self, damage):
		self.health-=damage
		if self.health>0    : return "A Saxon has received {} points of damage".format(damage)	
		elif self.health<=0 : return "A Saxon has died in combat"







# War
class War():
	def __init__(self):
		self.vikingArmy=[]
		self.saxonArmy=[]
		
	def addViking(self, Viking):
		self.vikingArmy.append(Viking)
		
	def addSaxon(self, Saxon):
		self.saxonArmy.append(Saxon)
	
	def vikingAttack(self):
		Sax=random.choice(self.saxonArmy)
		Vik=random.choice(self.vikingArmy)
		sax_life=Sax.receiveDamage(Vik.strength)
		if Sax.health<=0: self.saxonArmy.remove(Sax)
		return sax_life

	def saxonAttack(self):
		Vik=random.choice(self.vikingArmy)
		Sax=random.choice(self.saxonArmy)
		vik_life=Vik.receiveDamage(Sax.strength)
		if Vik.health<=0: self.vikingArmy.remove(Vik)
		return vik_life
	
	def showStatus(self):
		if self.vikingArmy==[]: return "Saxons have fought for their lives and survive another day..."
		if self.saxonArmy==[] : return "Vikings have won the war of the century!"
		if self.vikingArmy!=[] and self.saxonArmy!=[] : return "Vikings and Saxons are still in the thick of battle."















