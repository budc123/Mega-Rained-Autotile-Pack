-- based on the thinner pipes autotile

-- setup autotile data
local autotile = rained.tiles.createAutotile("Rivet Pipes", "Budc - Pipes")
autotile.type = "path"
autotile.allowIntersections = true
autotile:addToggleOption("junctions", "Allow Junctions", true)
autotile:addToggleOption("cap", "Use End Tiles", false)

-- change "allowIntersections" property when junctions is turned on/off
function autotile:onOptionChanged(id)
    if id == "junctions" then
        autotile.allowIntersections = autotile:getOption(id)
    end
end

-- Rained will not allow the user to use this autotile
-- if any of the tiles in this table are not installed
autotile.requiredTiles = {
	"Rivet Pipe Plain Vertical",
    "Rivet Pipe Separator Vertical",
    "Rivet Pipe Plain Horizontal",
    "Rivet Pipe Separator Horizontal",
    "Rivet Pipe Corner NW",
    "Rivet Pipe Corner NE",
    "Rivet Pipe Corner SE",
    "Rivet Pipe Corner SW",
    "Rivet Pipe T Junction N",
    "Rivet Pipe T Junction E",
    "Rivet Pipe T Junction S",
    "Rivet Pipe T Junction W",
    "Rivet Pipe Valve Box",
    "Rivet Pipe Separator End N",
    "Rivet Pipe Separator End E",
    "Rivet Pipe Separator End S",
    "Rivet Pipe Separator End W"
}

-- table of tiles to use for the standard autotiler function
local tileTable = {
    ld = "Rivet Pipe Corner SW",
    lu = "Rivet Pipe Corner NW",
    rd = "Rivet Pipe Corner SE",
    ru = "Rivet Pipe Corner NE",
    vertical = "Rivet Pipe Plain Vertical",
    horizontal = "Rivet Pipe Plain Horizontal",
    tr = "Rivet Pipe T Junction W",
    tu = "Rivet Pipe T Junction S",
    tl = "Rivet Pipe T Junction E",
    td = "Rivet Pipe T Junction N",
    x = "Rivet Pipe Valve Box",
    capRight = "Rivet Pipe Separator End E",
    capUp = "Rivet Pipe Separator End N",
    capLeft = "Rivet Pipe Separator End W",
    capDown = "Rivet Pipe Separator End S",

    placeJunctions = true,
    placeCaps = false
}

-- this is the callback function that Rained invokes when the user
-- wants to autotile a given path
---@param layer integer The layer to run the autotiler on
---@param segments PathSegment[] The list of path segments
---@param forceModifier ForceModifier Force-placement mode, as a string. Can be nil, "force", or "geometry".
function autotile:tilePath(layer, segments, forceModifier)

    tileTable.placeJunctions = self:getOption("junctions")
    tileTable.placeCaps = self:getOption("cap")

    -- run the standard autotiler
    rained.tiles.autotilePath(tileTable, layer, segments, forceModifier)

end