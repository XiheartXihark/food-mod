extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "butcher"
    self.value = 2
    self.values = [1, 20, 2, 30]
    self.rarity = "uncommon"
    self.groups = ["human", "organism", "doglikes"]
    self.sfx = ["guillotine"]
    
    self.texture = load_texture("res://food-mod/symbols/Butcher.png")
    self.name = "Butcher"
    self.description = "<color_E14A68>Destroys<end> adjacent <icon_chicken> adding <icon_coin><color_FBF236><values_2><end> and <icon_drumstick><values_1>. <color_E14A68>Destroys<end> <icon_cow> adding <icon_coin><color_FBF236><values_2><end> and <icon_beef><values_3>."

func add_conditional_effects(symbol, adjacent):
    var symbol_adds = []
    for i in adjacent:
        if i.type == "chicken":
            symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("shake", 0, [symbol, i]))
            symbol.add_effect(effect().change_value_bonus(symbol.values[1]))
            for j in symbol.values[0]:
                symbol_adds.push_back({"type": "drumstick"})
        if i.type == "cow":
            symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("shake", 0, [symbol, i]))
            symbol.add_effect(effect().change_value_bonus(symbol.values[3]))
            for j in symbol.values[2]:
                symbol_adds.push_back({"type": "beef"})

    if symbol_adds.size() > 0:
        symbol.add_effect({"comparisons": [], "tiles_to_add": symbol_adds})