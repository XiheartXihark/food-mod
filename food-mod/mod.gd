extends Reference

func load(modloader: Reference, mod_info, tree: SceneTree):
    #Added Symbols
    modloader.add_mod_symbol("res://food-mod/symbols/Baker.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Bread.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Connoisseur.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Chef.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Apple.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Banana.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Cherry.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Coconut.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Orange.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Peach.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Strawberry.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Jam-Watermelon.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Meat.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Sandwich.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Sugar.gd")
    modloader.add_mod_symbol("res://food-mod/symbols/Wheat.gd")

    #Modified Symbols
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Apple.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Banana.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Cheese.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Cherry.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Coconut_Half.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Martini.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Omelette.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Orange.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Peach.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Strawberry.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Sun.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Watermelon.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Wine.gd")

    #Removed symbols
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Chef.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Crow.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Goose.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Highlander.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Magpie.gd")
    modloader.add_symbol_patch("res://food-mod/symbols/patches/Void_Fruit.gd")

func modify_starting_symbols(current):
    current.erase("pearl")
    current.erase("coin")
    current.push_back("cook")
    return current
    #return ["sun", "wheat"]