-- Title: MovingObjects
-- Name: Nate MacAvoy
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade in. 
-- I added a second object that moves in a different direction, fades out and grow in size

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- gloabal variables 
scrollSpeed = 3 

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- character image to be transparent 
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3 

-- Function: MoveShip
-- input: this function accepts an event listener 
-- output: none 
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
-- add the scroll speed to the x-value of the ship
beetleship.x = beetleship.x + scrollSpeed
-- change the transparency of the ship everytime it moves so that it fades out
beetleship.alpha = beetleship.alpha + 0.01 
end 

-- MoveShip will be called over and over again 
Runtime:addEventListener("enterFrame", MoveShip)

-- new character image width and height 
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- new character image to be transparent 