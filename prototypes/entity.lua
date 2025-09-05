require("util")
require("__base__.prototypes.entity.pipecovers")
require("circuit-connector-sprites")
require("__base__.prototypes.entity.assemblerpipes")

local simulations = require("__base__.prototypes.factoriopedia-simulations")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local drill_scale = 0.4

-- Вычисляем параметры под текущие моды
local resource_categories
if mods["space-age"] or mods["Krastorio2-spaced-out"] then
  resource_categories = {"basic-solid", "hard-solid"}
else
  resource_categories = {"basic-solid"}
end

local allowed_effects
if mods["space-age"] or mods["Krastorio2-spaced-out"] or mods["K2QualityCompat"] then
  allowed_effects = {"consumption", "speed", "pollution", "productivity", "quality"}
else
  allowed_effects = {"consumption", "speed", "pollution", "productivity"}
end

local heating_energy = mods["space-age"] and "300kW" or nil
local drops_full_belt_stacks = mods["space-age"] and true or nil

function electric_mining_drill_smoke()
  return {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke.png",
    line_length = 6,
    width = 48,
    height = 72,
    frame_count = 30,
    repeat_count = 2,
    animation_speed = 0.5,
    shift = util.by_pixel(0, 3),
    scale = 1
  }
end

function electric_mining_drill_smoke_front()
  return {
    priority = "high",
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke-front.png",
    line_length = 6,
    width = 148,
    height = 132,
    frame_count = 30,
    repeat_count = 2,
    animation_speed = 0.5,
    shift = util.by_pixel(0, 3),
    scale = 1
  }
end

data:extend({
  {
    type = "mining-drill",
    name = "advanced_mining_drill",
    icon = "__skewer-deep-mining-drill-standalone__/graphics/icons/advanced_mining_drill.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "advanced_mining_drill"},
    max_health = 1000,
    corpse = "medium-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    energy_source = {
      type = "electric",
      emissions_per_minute = { pollution = 125 },
      usage_priority = "secondary-input"
    },
    energy_usage = "1250kW",
    heating_energy = heating_energy,
    mining_speed = 7.5,
    resource_categories = resource_categories,
    resource_searching_radius = 5,
    drops_full_belt_stacks = drops_full_belt_stacks,
    module_slots = 4,
	allowed_effects = allowed_effects,
    vector_to_place_result = {0, -1.55},
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r = 78, g = 173, b = 255},
    base_render_layer = "object",
    graphics_set = {
      animation = {
        north = {
          layers = {
            {
              filename = "__skewer-deep-mining-drill-standalone__/graphics/entity/advanced_mining_drill/electric-mining-drill-N-output.png",
              width = 60,
              height = 66,
              frame_count = 21,
              line_length = 5,
              shift = {0, -1.1},
              animation_speed = 0.75,
              scale = 0.40
            },
            {
              filename = "__skewer-deep-mining-drill-standalone__/graphics/entity/advanced_mining_drill/deepcore-moho-sheet.png",
              width = 256,
              height = 256,
              frame_count = 21,
              line_length = 7,
              shift = {0, -0.5},
              animation_speed = 0.5,
              scale = drill_scale
            },
            {
              filename = "__skewer-deep-mining-drill-standalone__/graphics/entity/advanced_mining_drill/deepcore-miner-drill-animation.png",
              width = 120,
              height = 122,
              frame_count = 21,
              line_length = 7,
              shift = {0, 0},
              animation_speed = 0.75,
              scale = drill_scale
            }
          }
        }
        -- south, east, west можно добавить по аналогии
      },
      working_visualisations = {
        {
          constant_speed = true,
          synced_fadeout = true,
          align_to_waypoint = true,
          apply_tint = "resource-color",
          animation = electric_mining_drill_smoke_front(),
          north_position = {-0.2, 0.2},
          east_position = {-0.2, 0.2},
          south_position = {-0.2, 0.2},
          west_position = {-0.2, 0.2}
        },
        {
          light = {
            type = "basic",
            intensity = 2,
            size = 15
          }
        }
      }
    },
    open_sound = sounds.drill_open,
    close_sound = sounds.drill_close,
    working_sound = {
      sound = {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.75,
        advanced_volume_control = {attenuation = "exponential"}
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    fast_replaceable_group = "pumpjack",
    circuit_connector = circuit_connector_definitions["pumpjack"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
})
