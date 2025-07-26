local Brick = {}
Brick.__index = Brick

local ActiveBricks = {}

Brick.width = 75
Brick.height = 30

local Ball = require("ball")

function Brick.new(x, y)
    local instance = setmetatable({}, Brick)
    instance.x = x
    instance.y = y
    instance.toBeRemoved = false

    table.insert(ActiveBricks, instance)
end

function Brick:load()
    local y = 100
    for i = 1, 4 do
        local x = 20
        while x < SCREEN_WIDTH - 20 do
            Brick.new(x, y)
            x = x + Brick.width + 1
        end
        y = y + Brick.height + 5
    end
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
    self:collide()
end

function Brick:collide()
    if checkCollision(Ball, self) then
        Ball.yVel = Ball.speed
        local middleBall = Ball.x + Ball.width / 2
        local middleBrick = self.x + self.width / 2
        local collisionPosition = middleBall - middleBrick
        Ball.xVel =  collisionPosition * 5
        self:remove()
    end
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