local Brick = {}
Brick.__index = Brick

local ActiveBricks = {}

Brick.width = 75
Brick.height = 30

function Brick.new(x, y)
    local instance = setmetatable({}, Brick)
    instance.x = x
    instance.y = y
    instance.toBeRemoved = false

    table.insert(ActiveBricks, instance)
end

function Brick:remove()
    for i, v in ipairs(ActiveBricks) do
        if v == self then
            table.remove(ActiveBricks, i)
        end
    end
end

function Brick:update(dt)
    self:checkRemove()
end

function Brick:checkRemove()
    if self.toBeRemoved then
        self:remove()
    end
end

function Brick:draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

function Brick.updateAll()
    for i, v in ipairs(ActiveBricks) do
        v:update(dt)
    end
end

function Brick.drawAll()
    for i, v  in ipairs(ActiveBricks) do
        v:draw()
    end
end

return Brick