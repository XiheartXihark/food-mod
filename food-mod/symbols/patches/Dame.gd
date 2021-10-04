extends "res://modloader/SymbolPatcher.gd"

var value_index: int

func init(modloader: Reference, params):
    self.modloader = modloader
    self.id = "dame"

func patch_description(description):
    return join(description, "<color_E14A68>Destroys<end> adjacent <all_and_damelikes>. Gives <icon_coin> <color_FBF236><values_2><end> for each symbol <color_E14A68>destroyed<end>.")

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
        symbol.add_effect_for_symbol(i, effect().if_group("damelikes").change_value_bonus(symbol.values[1]).animate("bounce", 0, [symbol, i]))
        symbol.add_effect_for_symbol(i, effect().set_destroyed())