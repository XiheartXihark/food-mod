extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "scrambled_eggs"
    self.value = 3
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["conlikes"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Scrambled-Eggs.png")
    self.name = "Scrambled Eggs"
    self.description = ""