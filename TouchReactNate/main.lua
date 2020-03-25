-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--hide status bar 
display.setStatusBar(display.HiddenStatusBar)

-- set background color 
display.setDefault("background", 192/255, 49/255, 96/255 ) 

-- 
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

--
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false 

--
local textObject = display.newText ("Clicked", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

--
--
--
--
--
local function blueButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = false
		redButton.isVisible = true 
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then 
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false 
	end
end


--
blueButton:addEventListener("touch", blueButtonListener)

local function redButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false 
	end

	if (touch.phase == "ended") then 
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false 
	end
end
redButton:addEventListener("touch", redButtonListener)
