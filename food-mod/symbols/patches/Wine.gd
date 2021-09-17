extends "res://modloader/SymbolPatcher.gd"

var value_index: int

func init(modloader: Reference, params):
    self.modloader = modloader
    self.id = "wine"

func patch_groups(groups):
    groups.push_back("conlikes")
    return groups