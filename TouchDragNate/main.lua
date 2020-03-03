-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
 -- hide stsatus bar
 display.setStatusBar(display.HiddenStatusBar)

 -- local variables. I am still trying to get the x-value to be set properly 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local planet = display.newImageRect("Images/planet.png", 150, 150)
local planetWidth = planet.width 
local planetHeight = planet.height 
 
 local girl5 = display.newImageRect("Images/girl5.png", 150, 150)
 local girl5Width = girl5.width 
 local girl5Height = girl5.height

 -- my boolen variables to keep trackof which object I touched first 
 local alreadyTouchedPlanet = false 
 local alreadyTouchedGirl5 = false 

 -- set the initial x and y position for myImage 
 planet.x = 400
 planet.y = 500 

 girl5.x = 300 
 girl5.y = 200 

 -- function: planetListener 
 -- input: touch listener 
 -- output: none 
 -- description: when planet is touched, move it 
 local function planetListener(touch)

 	if (touch.phase == "began") then 
 		if (alreadyTouchedPlanet == false) then
 			alreadyTouchedGirl5 = true 
 		end
 	end
 	
 	if ( (touch.phase == "moved") and (alreadyTouchedGirl5 == true) ) then 
 		girl5.x = touch.x
 		girl5.y = touch.y 
 	end 
 	
 	if (touch.phase == "ended") then
 		alreadyTouchedGirl5 = false 
 		alreadyTouchedPlanet = false 
 	end 
 end 

 -- add the respective listeners to each object 
 girl5: addEventListener("touch", girl5Listener)				
