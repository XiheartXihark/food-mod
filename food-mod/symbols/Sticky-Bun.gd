extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "sticky-bun"
    self.value = 5
    self.values = []
    self.rarity = "rare"
    self.groups = ["conlikes"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Sticky-Bun.png")
    self.name = "Sticky Bun"
    self.description = ""