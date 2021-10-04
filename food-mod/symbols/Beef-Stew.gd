extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "beef-stew"
    self.value = 8
    self.values = []
    self.rarity = "very_rare"
    self.groups = ["conlikes"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Beef-Stew.png")
    self.name = "Beef Stew"
    self.description = ""