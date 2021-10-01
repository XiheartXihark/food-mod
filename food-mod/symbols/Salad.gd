extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "salad"
    self.value = 4
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["conlikes"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Salad.png")
    self.name = "Salad"
    self.description = ""