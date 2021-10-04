extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "carrot"
    self.value = 1
    self.values = []
    self.rarity = "common"
    self.groups = ["plant", "ingredient", "food", "farmerlikes"]
    
    self.texture = load_texture("res://food-mod/symbols/Carrot.png")
    self.name = "Carrot"
    self.description = ""