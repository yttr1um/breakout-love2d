local Player = require("platform")
local Ball = require("ball")

local SCREEN_WIDTH = love.graphics:getWidth()
local SCREEN_HEIGHT = love.graphics:getHeight()

function love.load()
    Player:load()
    Ball:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
end

function love.keypressed(key)
    if key == "r" then
        love.event.quit("restart")
    elseif key == "escape" then
        love.event.quit()
    end
end