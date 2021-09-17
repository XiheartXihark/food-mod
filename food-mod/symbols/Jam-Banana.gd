extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "jam-banana"
    self.value = 2
    self.values = []
    self.rarity = "common"
    self.groups = ["conlikes", "jam"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Jam-Banana.png")
    self.name = "Banana Jam"
    self.description = "<color_4A4A4A>Delicious jam, made by the cook!<end>"