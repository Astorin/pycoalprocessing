local Prototype = require("stdlib.data.prototype")

local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/automated-factory/top-conection.png",
            priority = "extra-high",
            width = 244,
            height = 280,
            shift = shift_north
        }
    else
        north = Prototype.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_south
        }
    else
        south = Prototype.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_west
        }
    else
        west = Prototype.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_east
        }
    else
        east = Prototype.empty_sprite
    end
    return {north=north, south=south, west=west, east=east}
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "automated-factory",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"iron-plate", 20},
        {"engine-unit", 2},
        {"steel-plate", 35}, --updated-bob invar-alloy
        {"electronic-circuit", 10}, --updated-bob basic-electronic-circuit-board
    },
    result= "automated-factory",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "automated-factory",
    icon = "__pycoalprocessing__/graphics/icons/automated-factory.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-d[coal-processing]",
    place_result = "automated-factory",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "automated-factory",
    icon = "__pycoalprocessing__/graphics/icons/automated-factory.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "automated-factory"},
    fast_replaceable_group = "automated-factory",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 6
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"crafting","crafting-with-fluid","advanced-crafting"},
    crafting_speed = 3.5,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03 / 2.6,
    },
    energy_usage = "100kW",
    ingredient_count = 8,

    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/automated-factory/left.png",
                width = 128,
                height = 280,
                line_length = 16,
                frame_count = 101,
                shift = {-1.5, -0.68},
                animation_speed = 0.1,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/automated-factory/right.png",
                width = 116,
                height = 280,
                line_length = 16,
                frame_count = 101,
                shift = {2.31, -0.68},
                animation_speed = 0.1,
            },
        }
    },
    fluid_boxes =
    {
        --1
        {
            production_type = "input",
            pipe_picture = pipe_pictures({0.3, 3.06}, {-0.00, -0.83}, {0.55, 0.15}, {-0.5, 0.15}),
            pipe_covers = Prototype.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, 4.0} }}
        },
        {
            production_type = "input",
            pipe_picture = pipe_pictures({0.3, 3.06}, {-0.00, -0.83}, {0.55, 0.15}, {-0.5, 0.15}),
            pipe_covers = Prototype.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, -4.0} }}
        },
        {
            production_type = "output",
            pipe_picture = pipe_pictures({0.3, 3.06}, {-0.00, -0.83}, {0.55, 0.15}, {-0.5, 0.15}),
            pipe_covers = Prototype.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="input", position = {2.0, 4.0} }}
        },
		off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/automated-factory.ogg", volume = 1.0 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/automated-factory.ogg", volume = 0.6 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end