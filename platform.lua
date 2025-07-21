local Platform = {}

function Platform:load()
    self.width = 200
    self.height = 20
    self.x = love.graphics:getWidth() / 2 - self.width / 2
    self.y = love.graphics:getHeight() - 100
    self.speed = 200
end

function Platform:update(dt)

end

function Platform:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Platform