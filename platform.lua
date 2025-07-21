local Platform = {}

function Platform:load()
    self.width = 200
    self.height = 20
    self.x = love.graphics:getWidth() / 2 - self.width / 2
    self.y = love.graphics:getHeight() - 100
    self.speed = 500
end

function Platform:update(dt)
    self:move(dt)
end

function Platform:move(dt)
    if love.keyboard.isDown("d", "right") then
        self.x = self.x + self.speed * dt
    elseif love.keyboard.isDown("a", "left") then
        self.x = self.x - self.speed * dt
    end
end

function Platform:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Platform