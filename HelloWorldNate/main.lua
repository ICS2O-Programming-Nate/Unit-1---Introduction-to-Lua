-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--print a gretting to the console
print ("**** Hello Nate")

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--set the colour of the backround 
display.setDefault("background", 172/255, 42/255, 176/255)

-- create a local variable 
local textObject 

-- display texts on screen at position x = 500 and y = 500 with 
-- a display font style and font size of 50 
textObject = display.newText( "Hello, Nate", 500, 500, nil, 50 )

-- sets the colour of the text 
textObject:setTextColor(0/225, 0/225, 0/225)

