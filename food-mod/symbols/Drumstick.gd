extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "drumstick"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["ingredient"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Drumstick.png")
    self.name = "Drumstick"
    self.description = ""