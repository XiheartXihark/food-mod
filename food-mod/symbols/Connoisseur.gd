extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "connoisseur"
    self.value = 2
    self.values = []
    self.rarity = "rare"
    self.groups = ["human", "organism", "doglikes"]
    
    self.texture = load_texture("res://food-mod/symbols/Connoisseur.png")
    self.name = "Connoisseur"
    self.description = "<color_E14A68>Destroys<end> adjacent <all_and_conlikes>. Permanently gives <icon_coin> equal to the value of symbols destroyed this way."

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
        symbol.add_effect_for_symbol(i, effect().if_group("conlikes").set_destroyed().animate("bounce", 0, i))
        symbol.add_effect_for_symbol(i, effect().if_destroyed().if_group("conlikes").set_target(symbol).add_permanent_bonus(i.value).animate("bounce", 0, symbol))