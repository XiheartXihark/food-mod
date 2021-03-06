extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "brownie"
    self.value = 3
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["conlikes", "damelikes"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Brownie.png")
    self.name = "Brownie"
    self.description = "<color_666666><icon_dame> Likes this!<end>"