local Platform = {}

function Platform:load()
    self.width = 150
    self.height = 20
    self.x = love.graphics:getWidth() / 2 - self.width / 2
    self.y = love.graphics:getHeight() - 100
    self.speed = 500

    self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.body:setFixedRotation(true)
    self.shape = love.physics.newRectangleShape(self.width/2, self.height/2, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
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