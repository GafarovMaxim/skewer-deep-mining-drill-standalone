-- Базовые подключения, всегда присутствуют
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local meld = require("meld")

-- Переменные под ресурсы Space Age (nil, если мод не активен)
local space_age_sounds = nil
local space_age_item_sounds = nil
local item_effects = nil
local simulations = nil

if mods and mods["space-age"] then
    space_age_sounds = require("__space-age__.prototypes.entity.sounds")
    space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
    item_effects = require("__space-age__.prototypes.item-effects")
    simulations = require("__space-age__.prototypes.factoriopedia-simulations")
end

data:extend({
    {
        type = "item",
        name = "advanced_mining_drill",
        icon = "__skewer-deep-mining-drill-standalone__/graphics/icons/advanced_mining_drill.png",
        icon_size = 64, -- обязателен для новых версий Factorio
        subgroup = "extraction-machine",
        color_hint = { text = "1" },
        order = "a[items]-d[big-mining-drill]",
        inventory_move_sound = item_sounds.drill_inventory_move,
        pick_sound = item_sounds.drill_inventory_pickup,
        drop_sound = item_sounds.drill_inventory_move,
        place_result = "advanced_mining_drill",
        stack_size = 20,
        default_import_location = mods["space-age"] and "vulcanus" or nil,
        weight = 100*kg, -- в Space Age вес указывается в граммах
        random_tint_color = item_tints.iron_rust,
        -- При желании можно добавить эффекты, если Space Age есть
        -- effects = item_effects and item_effects.some_effect or nil
    }
})
