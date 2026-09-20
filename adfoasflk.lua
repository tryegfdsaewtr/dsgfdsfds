
if type(Drawing) ~= "table" or type(Drawing.new) ~= "function" then
    warn("NIGGER")
    return
end

local cam = workspace.CurrentCamera


local pat = {
    "..X..",
    "..X..",
    "..X..",
    ".XXXX",
    "XXXXX",
    "XXXXX",
    ".XXX.",
}

local px = 6
local perTick = 4
local pool = {}

local function rndCol()
    return Color3.fromRGB(math.random(40, 255), math.random(40, 255), math.random(40, 255))
end

local function drawFinger(ox, oy, c)
    for r = 1, #pat do
        local row = pat[r]
        for i = 1, #row do
            if row:sub(i, i) == "X" then
                local ok, sq = pcall(Drawing.new, "Square")
                if not ok or not sq then return end
                sq.Filled = true
                sq.Thickness = 0
                sq.Color = c
                sq.Size = Vector2.new(px, px)
                sq.Position = Vector2.new(ox + (i - 1) * px, oy + (r - 1) * px)
                sq.Visible = true
                pool[#pool + 1] = sq
            end
        end
    end
end

task.spawn(function()
    while true do
        local vs = cam.ViewportSize
        local maxX = math.max(1, vs.X - 5 * px)
        local maxY = math.max(1, vs.Y - 7 * px)
        for _ = 1, perTick do
            drawFinger(math.random(0, maxX), math.random(0, maxY), rndCol())
        end
        task.wait(0.00)
    end
end)
