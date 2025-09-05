local ingredients

if mods["Krastorio2-spaced-out"] then
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    {"kr-matter-tech-card", 1},
    {"kr-singularity-tech-card", 1}
  }
elseif mods["Krastorio2"] then
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1},
	{"kr-advanced-tech-card", 1},
    {"kr-matter-tech-card", 1}
  }
elseif mods["space-age"] then
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"electromagnetic-science-pack", 1}
  }
else
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1}
  }
end

-- Без самоссылок
local prerequisites
if mods["skewer-deep-mining-drill-standalone"] and mods["space-age"] then
  prerequisites = {"holmium-processing", "big-mining-drill", "turbo-transport-belt"}
elseif mods["skewer-deep-mining-drill-standalone"] then
  prerequisites = {"electric-engine", "automation-3"}
elseif mods["space-age"] then
  prerequisites = {"holmium-processing", "big-mining-drill", "turbo-transport-belt"}
else
  prerequisites = {"electric-engine", "automation-3"}
end

data:extend({
  {
    type = "technology",
    name = "deep_mining",
    icon = "__skewer-deep-mining-drill-standalone__/graphics/icons/deepcore_mining.png",
    icon_size = 128,
    effects = {
      { type = "unlock-recipe", recipe = "advanced_mining_drill" }
    },
    prerequisites = prerequisites,
    unit = {
      count = 2000,
      ingredients = ingredients,
      time = 20
    },
    order = "c-g-b-z"
  }
})
