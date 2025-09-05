local seperation_energy_requirements = 2
local oxidization_energy_requirements = 5
local decay_energy_requirements = 10
local tiny_energy = 0.1
local tiny_input_amount = 1
local tiny_output_amount = 10

-- Функция формирования ингредиентов под разные моды
local function get_ingredients()
  if mods["Krastorio2"] or mods["Krastorio2-spaced-out"] then
    local ing = {
      {type = "item", name = "kr-electric-mining-drill-mk3", amount = 6},
      {type = "item", name = "kr-imersium-gear-wheel", amount = 100},
      {type = "item", name = "kr-charged-matter-stabilizer", amount = 10},
	  {type = "item", name = "processing-unit", amount = 100},
      {type = "item", name = "kr-ai-core", amount = 2},
      {type = "fluid", name = "lubricant", amount = 300}
    }
    if mods["space-age"] then
	  table.insert(ing, 1, {type = "item", name = "big-mining-drill", amount = 3})
	  table.insert(ing, 2, {type = "item", name = "holmium-plate", amount = 100})
    end

    return ing
  end
  if mods["space-age"] then
    return {
      {type = "item", name = "big-mining-drill", amount = 3},
      {type = "item", name = "steel-plate", amount = 200},
      {type = "item", name = "processing-unit", amount = 50},
	  {type = "item", name = "electric-engine-unit", amount = 25},
      {type = "item", name = "tungsten-plate", amount = 100},
      {type = "item", name = "holmium-plate", amount = 100},
      {type = "fluid", name = "lubricant", amount = 300}
    }
  end
  return {
    {type = "item", name = "electric-mining-drill", amount = 5},
    {type = "item", name = "steel-plate", amount = 300},
    {type = "item", name = "processing-unit", amount = 125},
    {type = "item", name = "electric-engine-unit", amount = 100},
    {type = "fluid", name = "lubricant", amount = 300}
  }
end

-- Surface conditions — только для Space Age
local surface_conditions = nil
if mods["space-age"] then
  surface_conditions = {
    { property = "magnetic-field", min = 99 }
  }
end

data:extend({
  {
    type = "recipe",
    name = "advanced_mining_drill",
    energy_required = 5,
    enabled = false,
    category = "crafting-with-fluid",
    surface_conditions = surface_conditions,
    ingredients = get_ingredients(),
    icon = "__skewer-deep-mining-drill-standalone__/graphics/icons/advanced_mining_drill.png",
    icon_size = 64,
    subgroup = "production-machine",
    results = {
      {type = "item", name = "advanced_mining_drill", amount = 1}
    }
  }
})
