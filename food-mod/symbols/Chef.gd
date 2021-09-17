extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "cook"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["human", "organism"]
    
    self.texture = load_texture("res://food-mod/symbols/Chef.png")
    self.name = "Chef"
    self.description = "Uses a combination of ingredients to create more valuable symbols."

func add_conditional_effects(symbol, adjacent):
    var symbol_adds = []
    var used = []

    check_recipes(symbol, adjacent, symbol_adds, used)
    while not used.empty():
        symbol.add_effect_for_symbol(used.pop_back(), {"comparisons": [], "anim": "jump", "value_to_change": "destroyed", "diff": true})
    
    if symbol_adds.size() > 0:
        symbol.add_effect({"comparisons": [], "tiles_to_add": symbol_adds})

func check_recipes(symbol, adjacent, symbol_adds, used):
    var recipes = {
        "jam-watermelon": ["watermelon", "sugar"],
        "jam-strawberry": ["strawberry", "sugar"],
        "jam-apple": ["apple", "sugar"],
        "jam-peach": ["peach", "sugar"],
        "jam-orange": ["orange", "sugar"],
        "jam-coconut": ["coconut_half", "sugar"],
        "jam-cherry": ["cherry", "sugar"],
        "jam-banana": ["banana", "sugar"],
        "sandwich": ["bread", "cheese", "meat"]
    }
    var ingredients = {}
    var current_recipe = {}
    var have_ingredients = true
    var target = 0
    var found = 0

    #populate our list of ingredients
    for i in adjacent:
        if i.groups.has("ingredient"):
            if ingredients.has(i.type):
                ingredients[i.type] += 1
            else:
                ingredients[i.type] = 1

    #for each recipe name ---- recipe = jam-watermelon
    for recipe in recipes.keys():
        #empty the current recipe
        current_recipe.clear()
        #reset flag for all ingredients
        have_ingredients = true
        #for each recipe name, ingredient list (as array) ---- j = ["watermelon", "sugar"]
        for j in recipes.get(recipe):
            #key: ingredient name | value: ingredient quantity ---- {watermelon: count}
            if ingredients.has(j):
                current_recipe[j] = ingredients.get(j)
            else:
                have_ingredients = false
                break
        if have_ingredients:
            target = current_recipe.values().min()
            #finds which ingredient has the lowest count and loops that many times
            for n in target:
                #add new symbol
                symbol_adds.push_back({"type": recipe})
                #for each ingredient in our current recipe ---- x = "watermelon"
                for x in current_recipe.keys():
                    #reset qty found
                    found = 0
                    #for each adjacent symbol
                    for y in adjacent:
                        #if this symbol has been used
                        if used.has(y):
                            continue
                        #if the symbol matches a needed ingredient (x = "watermelon") and we still need that ingredient
                        if y.type == x:
                            #remove used ingredients from total ingredients counter
                            ingredients[x] -= 1
                            #mark symbols we've used
                            used.push_back(y)
                            #add to found
                            found += 1
                        if found == target:
                            break

func print_dictionary(dic):
    var debugstr = ""
    for i in dic.keys():
        debugstr = debugstr + str(i) + ": " + str(dic.get(i)) + ", "
    debugstr = debugstr.left(debugstr.length()-2)
    return debugstr

func print_types(arr):
    var debugstr = "["
    if not arr.empty():
        for i in arr:
            debugstr = debugstr + i.type + ", "
        debugstr = debugstr.left(debugstr.length()-2)
    debugstr = debugstr + "]"
    return debugstr