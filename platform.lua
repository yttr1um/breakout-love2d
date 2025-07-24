local Platform = {}

function Platform:load()
    self.width = 150
    self.height = 20
    self.x = love.graphics:getWidth() / 2 - self.width / 2
    self.y = love.graphics:getHeight() - 100
    self.speed = 500
end

function Platform:update(dt)
    self:move()
end

function Platform:move()

    local dx = 0

    if love.keyboard.isDown("d", "right") then
        dx = self.speed
    elseif love.keyboard.isDown("a", "left") then
        dx = -self.speed
    end
end

function Platform:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Platform