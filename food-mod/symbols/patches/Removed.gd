extends "res://modloader/SymbolPatcher.gd"

var value_index: int

func init(modloader: Reference, params):
    self.modloader = modloader
    self.id = params.id

func can_find_symbol(symbol_grid):
    return false

func patch_groups(groups):
    groups.clear()
    return groups