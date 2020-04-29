-----------------------------------------------------------------------------------------
-- Title: Physics and Collisions
-- main.lua
-- Name: Nate 
-- Course: ICS20
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local physics
local ground
local beam
local beam2

local backgroundMusic = audio.loadSound("Sounds/RuneScape.mp3")
local backgroundMusicChannel

-----------------------------------------------------------------------------------------
-- ADDING SOUND
-----------------------------------------------------------------------------------------

backgroundMusicChannel = audio.play(backgroundMusic)

-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/ball.png", 0, 0)
	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

-----------------------------------------------------------------------------------------

-- create the second ball
local function secondBall()
	local ball2 = display.newImage("Images/ball.png", 0, 0)
	-- add to physics
	physics.addBody(ball2, {density=1.4, friction=0.8, bounce=0.8, radius=25})
end

-----------------------------------------------------------------------------------------

-- create the third ball
local function thirdBall()
	local ball3 = display.newImage("Images/ball.png", 0, 0)
	-- add the physics
	physics.addBody(ball3, {density=1.5, friction=0.6, bounce=1.0, radius=25})
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- load physics into the game
physics = require("physics")
-- start the physics
physics.start()

-- create the ground
ground = display.newImage("Images/ground.png", 0, 0)
ground.x = 512
ground.y = 800
-- change the width to be the width of the screen
ground.width = display.contentWidth
-- add the physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-- create the beam
beam = display.newImage("Images/beam.png", 0, 0)
-- set the x and y pos
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.64
-- change the width to be half of the iPad width
beam.width = display.contentWidth*2
-- change the beam height to be 1/10 of the iPad height
beam.height = display.contentHeight*1/12
--- rotate the beam -60 degrees so its on an angle
beam:rotate(45)
-- send it to the back layer
beam:toBack()
-- add the physics
physics.addBody(beam, "static", {friction = 0.5, bounce=0.3})


-- create the wall to stop the balls
beam2 = display.newImage("Images/beam.png", 0, 0)
-- change the position of the wall
beam2.x = display.contentWidth*16/20
beam2.y = display.contentHeight*6/7
-- change the height of the wall
beam2.height = display.contentHeight*1.01
-- add the physics
physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

-- create the background 
display.setDefault("background", 255/255, 255/255, 255/255)


-----------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
-----------------------------------------------------------------------------------------

timer.performWithDelay( 0, firstBall)

timer.performWithDelay( 500, secondBall)

timer.performWithDelay( 1000, thirdBall)