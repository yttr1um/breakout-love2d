local Ball = {}

local platform = require("platform")

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = platform.y - 20
    self.radius = 10

    self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.shape = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Ball:update(dt)

end

function Ball:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1)
end

return Ball