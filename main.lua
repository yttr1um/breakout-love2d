local Player = require("platform")
local Wall = require("wall")
local Ball = require("ball")

local SCREEN_WIDTH = love.graphics:getWidth()
local SCREEN_HEIGHT = love.graphics:getHeight()

function love.load()
    world = love.physics.newWorld(0, 0)

    Player:load()
    Ball:load()

    --walls
    Wall.new(0, 0, SCREEN_WIDTH, 10)
    Wall.new(0, 0, 10, SCREEN_HEIGHT)
    Wall.new(SCREEN_WIDTH-10, 0, 10, SCREEN_HEIGHT)
end

function love.update(dt)
    world:update(dt)
    Player:update(dt)
    Ball:update(dt)
    Wall:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
    Wall.drawAll()
end