extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "bread"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["ingredient"]
    self.findable = false
    
    self.texture = load_texture("res://food-mod/symbols/Bread.png")
    self.name = "Bread"
    self.description = "<icon_cook> can combine this with <icon_cheese> and <icon_meat> to make <icon_sandwich>."