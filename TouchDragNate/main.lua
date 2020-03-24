-----------------------------------------------------------------------------------------
-- Title: TouchDragNate
-- Name: Nate 
-- Course: ICS2O
-- This program allows the user to touch on images and move them arond 
-- the screen       
-----------------------------------------------------------------------------------------

-- Your code here

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

local planet = display.newImageRect("Images/planet.png", 150, 150)
local planetWidth = planet.width
local planetHeight = planet.height

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

local girl = display.newImageRect("Images/girl5.png", 150, 150)
local girlWidth = girl.width
local girlHeight = girl.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedPlanet = false
local alreadyTouchedStar = false
local alreadyTouchedGirl = false

-- set the initial x and y position of myImage
planet.x = 400
planet.y = 500

star.x = 300
star.y = 200

girl.x = 150
girl.y = 100

-- Function: StarListener
-- Input: touch listener
-- Output: none
-- Description: when star is touched, move it
local function StarListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPlanet == false) and (alreadyTouchedGirl == false) then
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedStar = false
		alreadyTouchedPlanet = false
		alreadyTouchedGirl = false
	end
end

-- add the respective listeners to each object
star:addEventListener("touch", StarListener)

-- Function: PlanetListener
-- Input: touch listener
-- Output: none
-- Description: when planet is touched, move it
local function PlanetListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedStar == false) and (alreadyTouchedGirl == false) then
			alreadyTouchedPlanet = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPlanet == true) ) then
		planet.x = touch.x
		planet.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedPlanet = false
		alreadyTouchedStar = false
		alreadyTouchedGirl = false
	end
end

-- add the respective listeners to each object
planet:addEventListener("touch", PlanetListener)

-- Function: GirlListener
-- Input: touch listener
-- Output: none
-- Description: when girl is touched, move it
local function GirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPlanet == false) and (alreadyTouchedStar == false) then
			alreadyTouchedGirl = true
		end

	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirl == true) ) then
		girl.x = touch.x
		girl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirl = false
		alreadyTouchedPlanet = false
		alreadyTouchedStar = false
	end
end
-- add the respective listeners to each object
girl:addEventListener("touch", GirlListener) 