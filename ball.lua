local Ball = {}

local platform = require("platform")

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = platform.y - 100

    self.width, self.height = 10, 10

    self.speed = 400
    self.xVel = 0
    self.yVel = self.speed
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:collide()
    if checkCollision(self, platform) then
        self.yVel = -self.speed

        local middleBall = self.x + self.width / 2
        local middlePlayer = platform.x + platform.width / 2
        local collisionPosition = middleBall - middlePlayer
        self.xVel =  collisionPosition * 5
    end

    if self.y < 0 then 
        self.y = 0
        self.yVel = -self.yVel

    elseif self.x < 0 then
        self.x = 0
        self.xVel = self.speed

    elseif self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.width
        self.xVel = -self.speed
    end
end

function Ball:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

return Ball