local Ball = {}

local platform = require("platform")

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = platform.y - 100
    self.radius = 10
end

function Ball:update(dt)

end

function Ball:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1)
end

return Ball