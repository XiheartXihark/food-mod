extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "baker"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["human", "organism"]
    
    self.texture = load_texture("res://food-mod/symbols/Baker.png")
    self.name = "Baker"
    self.description = "Transforms adjacent <icon_wheat> into <icon_bread>."

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
        symbol.add_effect_for_symbol(i, effect().if_type("wheat").change_type("bread").animate("shake", 0, [symbol, i]))