extends Reference

const mod_name : String = "food-mod"

func load(modloader: Reference, mod_info, tree: SceneTree):
    #Added Symbols
    var added = [
        "Baker", "Beef", "Beef-Stew", "Bread", "Brownie", "Butcher", "Carrot", "Chocolate", "Connoisseur", "Chef", "Drumstick",
        "Jam-Apple", "Jam-Banana", "Jam-Cherry", "Jam-Coconut", "Jam-Orange", "Jam-Peach", "Jam-Strawberry", "Jam-Watermelon",
        "Lettuce", "Potato", "Salad", "Sandwich", "Scrambled-Eggs", "Sugar", "Tomato", "Wheat"
    ]
    for i in added:
        modloader.add_mod_symbol("res://" + mod_name + "/symbols/" + i + ".gd")

    #Modified Symbols
    var updated = [
        "Apple", "Banana", "Cheese", "Cherry", "Coconut_Half", "Dame", "Egg",
        "Martini", "Omelette", "Orange", "Peach", "Strawberry",
        "Sun", "Watermelon", "Wine"
    ]
    for i in updated:
        modloader.add_symbol_patch("res://" + mod_name + "/symbols/patches/" + i + ".gd")

    #Removed symbols
    var removed = [
        "chef", "crow", "goose", "highlander", "light_bulb", "magpie", "matryoshka_doll_1", "sloth", "owl", "void_fruit", "present"
    ]
    for i in removed:
        modloader.add_symbol_patch("res://" + mod_name + "/symbols/patches/Removed.gd", {"id": i})

func modify_starting_symbols(current):
    var old = ["pearl", "coin", "cat", "flower", "cherry"]
    var new = ["fchef", "sugar", "wheat", "cheese"]
    for symbol in old:
        current.erase(symbol)
    for symbol in new:
        current.push_back(symbol)

    #current = ["butcher", "chicken", "chicken", "chicken", "cow", "cow", "cow"]
    return current