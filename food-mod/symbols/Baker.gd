extends "res://modloader/ModSymbol.gd"

var recipes = {
    "sticky-bun": ["bread", "honey"],
    "brownie": ["bread", "chocolate", "sugar"]
}

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "baker"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["human", "organism", "doglikes"]
    
    self.texture = load_texture("res://food-mod/symbols/Baker.png")
    self.name = "Baker"
    self.description = "Transforms adjacent <icon_wheat> into <icon_bread>. Also bakes things."

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
        symbol.add_effect_for_symbol(i, effect().if_type("wheat").change_type("bread").animate("shake", 0, [symbol, i]))

    var symbol_adds = []
    var used = []

    check_recipes(symbol, adjacent, symbol_adds, used)
    while not used.empty():
        symbol.add_effect_for_symbol(used.pop_back(), {"comparisons": [], "value_to_change": "destroyed", "diff": true})
        symbol.add_effect(effect().animate("bounce", 0, symbol))
    
    if symbol_adds.size() > 0:
        symbol.add_effect({"comparisons": [], "tiles_to_add": symbol_adds})

func check_recipes(symbol, adjacent, symbol_adds, used):
    var ingredients = {}
    var current_recipe = {}
    var have_ingredients = true
    var target = 0
    var found = 0

    #populate our list of ingredients
    for i in adjacent:
        if i.groups.has("ingredient") and not i.destroyed and not i.tbd:
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
        for ingredient in recipes.get(recipe):
            #key: ingredient name | value: ingredient quantity ---- {watermelon: count}
            if ingredients.has(ingredient):
                current_recipe[ingredient] = ingredients.get(ingredient)
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
                        if y.type == x and not y.destroyed and not y.tbd:
                            #remove used ingredients from total ingredients counter
                            ingredients[x] -= 1
                            #mark symbols we've used
                            used.push_back(y)
                            #add to found
                            found += 1
                        if found == target:
                            break