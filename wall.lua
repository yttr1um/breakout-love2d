local Wall = {}
Wall.__index = Wall
local walls = {}

function Wall.new(x, y, width, height)
    local instance = setmetatable({}, Wall)

    instance.x = x
    instance.y = y
    instance.width = width
    instance.height = height

    instance.body = love.physics.newBody(world, instance.x, instance.y, "static")
    instance.shape = love.physics.newRectangleShape(instance.width/2, instance.height/2, instance.width, instance.height)
    instance.fixture = love.physics.newFixture(instance.body, instance.shape)

    table.insert(walls, instance)
end

function Wall:update(dt)
    
end

function Wall:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Wall.drawAll()
    for i, v in ipairs(walls) do 
        v:draw()
    end
end

return Wall