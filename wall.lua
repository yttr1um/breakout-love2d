local Wall = {}
Wall.__index = Wall
local walls = {}

function Wall.new(x, y, width, height)
    local instance = setmetatable({}, Wall)

    instance.x = x
    instance.y = y
    instance.width = width
    instance.height = height
    table.insert(walls, instance)
end

function Wall:update(dt)
    
end

function Wall:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Wall.drawAll()
    for i, v in ipairs(walls) do 
        v:draw()
    end
end

return Wall