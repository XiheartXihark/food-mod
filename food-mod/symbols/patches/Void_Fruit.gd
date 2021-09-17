extends "res://modloader/SymbolPatcher.gd"

var value_index: int

func init(modloader: Reference, params):
    self.modloader = modloader
    self.id = "void_fruit"

func patch_groups(groups):
    groups.erase("fruit")
    return groups

func can_find_symbol(symbol_grid):
    return false