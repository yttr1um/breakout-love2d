local Player = require("platform")
local Ball = require("ball")
local Brick = require("bricks")

function love.load()

    SCREEN_WIDTH = love.graphics.getWidth()

    Player:load()
    Ball:load()
    Brick:load()
    
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    Brick.updateAll()
end

function love.draw()
    Player:draw()
    Ball:draw()
    Brick.drawAll()
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x< b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end

function love.keypressed(key)
    if key == "r" then
        love.event.quit("restart")
    elseif key == "escape" then
        love.event.quit()
    end
end