local Platform = {}

function Platform:load()
    self.width = 150
    self.height = 20
    self.x = love.graphics:getWidth() / 2 - self.width / 2
    self.y = love.graphics:getHeight() - 100
    self.speed = 500

    self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.body:setFixedRotation(true)
    self.body:setGravityScale(0)
    self.shape = love.physics.newRectangleShape(self.width/2, self.height/2, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Platform:update(dt)
    self:move()
    self:syncPhysics()
end

function Platform:syncPhysics()
    self.x, self.y = self.body:getPosition()
end

function Platform:move()

    local dx = 0

    if love.keyboard.isDown("d", "right") then
        dx = self.speed
    elseif love.keyboard.isDown("a", "left") then
        dx = -self.speed
    end

    self.body:setLinearVelocity(dx, 0)
end

function Platform:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Platform