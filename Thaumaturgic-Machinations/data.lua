if not TM then TM = {} end
if not inherited then inherited = {} end
TM.blacklist = {
	["grow-silverwood"] = true,
	["grow-wood"] = true,
	["TM-seedling"] = true,
	["coal-liquefaction"] = true,
	["uranium-processing"] = true,
	["player-port"] = true,
	["thaumic-tree-farm"] = true,
	["tm-electronic-circuit-1"] = true,
	["tm-battery-1"] = true,
	["cursed-generator"] = true,
}


tm_debug_setting = settings.startup["tm-debug-enabled"].value
creatio_enabled = settings.startup["creatio-enabled"].value
creatio_aspect_cost = settings.startup["creatio-aspect-cost"].value
creatio_primal_cost = settings.startup["creatio-primal-cost"].value
creatio_recipe_time = settings.startup["creatio-recipe-time"].value
creatio_multiplier = settings.startup["creatio-multiplier"].value
combine_seperate_modifier = settings.startup["combine-seperate-modifier"].value
inheritance_enabled = settings.startup["inheritance-enable"].value
inherit_multiplier = 1.1 -- the amount of increase in aspects further down the inheritance tree
asp_pow_max = 6 -- 10^asp_pow_max is the maximum of one type of aspect that can be on an item.

require("prototypes.item.item")
require("prototypes.item.generated-item")
require("prototypes.technology.technology")
require("prototypes.aspect.TM-Aspect-Master")
require("TM-functions")

-- adds a couple aspects to the flamethrower turret ammo
local flamethrower_turret_ammo = data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids
flamethrower_turret_ammo[#flamethrower_turret_ammo + 1] = {type = "Ignis", damage_modifier = 1.2}
flamethrower_turret_ammo[#flamethrower_turret_ammo + 1] = {type = "Infernus", damage_modifier = 4}

if combine_seperate_modifier ~= 0 then
	require("prototypes.aspect.TM-Aspect-Tree-Master")
else
	log("WARNING: Seperation and Combination recipes have been disabled. This disallows the inherit function.")
end
require("prototypes.aspect.TM-Aspect-Distillation-raw")
require("prototypes.recipe.recipes")
require("prototypes.entity.entities")
require("prototypes.category.categories")
require("prototypes.aspect.TM-item-aspects")
require("prototypes.item.TM-Modules")
require("prototypes.equipment.equipment")
require("prototypes.item.equipment")
require("prototypes.equipment.power-crystal")
require("prototypes.item.ammo")
require("prototypes.entity.projectiles")
require("prototypes.item.gun")

require("prototypes.tile.tiles")

require("prototypes.entity.enemies")

if creatio_enabled then
	require("prototypes.aspect.TM-Creatio")
end

require("compatibility")