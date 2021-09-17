extends "res://modloader/SymbolPatcher.gd"

var value_index: int
var red = "<color_E14A68>"
var gold = "<color_FBF236>"

func init(modloader: Reference, params):
    self.modloader = modloader
    self.id = "sun"

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
        symbol.add_effect_for_symbol(i, effect().if_type("wheat").change_value_multiplier(symbol.values[0]).animate("shake", 0, [symbol, i]))

func patch_description(description):
    return join("Adjacent <icon_flower> and <icon_wheat> give " + red + "5x<end> more <icon_coin>. Adjacent <icon_seed> are " + red + "<values_2>%<end> more likely to grow.")