extends Reference

const mod_name = food-mod

func load(modloader: Reference, mod_info, tree: SceneTree):
    #Added Symbols
    var added = [
        "Baker", "Bread", "Connoisseur", "Chef", "Jam-Apple", "Jam-Banana",
        "Jam-Cherry", "Jam-Coconut", "Jam-Orange", "Jam-Peach", "Jam-Strawberry",
        "Jam-Watermelon", "Meat", "Sandwich", "Scrambled-Eggs", "Sugar", "Wheat"
    ]
    for i in added:
        modloader.add_mod_symbol("res://" + mod_name + "/symbols/" + i + ".gd")

    #Modified Symbols
    var updated = [
        "Apple", "Banana", "Cheese", "Cherry", "Coconut_Half", "Egg",
        "Martini", "Omelette", "Orange", "Peach", "Strawberry",
        "Sun", "Watermelon", "Wine"
    ]
    for i in updated:
        modloader.add_symbol_patch("res://" + mod_name + "/symbols/patches/" + i + ".gd")

    #Removed symbols
    var removed = [
        "chef", "crow", "goose", "highlander", "magpie", "void_fruit"
    ]
    for i in removed:
        modloader.add_symbol_patch("res://" + mod_name + "/symbols/patches/Removed.gd", {"id": i})

func modify_starting_symbols(current):
    old = ["pearl", "coin", "cat", "flower", "cherry"]
    new = ["fchef", "sugar", "wheat", "cheese"]
    for symbol in old:
        current.erase(symbol)
    for symbol in new:
        current.push_back(symbol)
    return current
    #return ["sun", "wheat"]