extends "res://modloader/SymbolPatcher.gd"

var value_index: int

func init(modloader: Reference, params):
    self.modloader = modloader
    self.id = "cheese"

func patch_groups(groups):
    groups.push_back("ingredient")
    return groups


func patch_description(description):
    return join(description, "<icon_cook> can combine this with <icon_bread> and <icon_meat> to make <icon_sandwich>.")