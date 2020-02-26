-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- create my local variables
local areaText
local textSize = 40
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local radiusOfCircle = 90 
local PI = 3.14 
-- set the background colour of my screen. Remember that colors are between 0 and 1.
display.setDefault("background", 172/255, 42/255, 176/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the colour of the rectangle 
myRectangle:setFillColor(0.7, 0.1, 0.3)

-- set the color of the border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- wrtie the area on the screen. Take into consideration the size of the font when positionins it on the screen
areaText = display.newText("The area of this rectangle with a width of /n" ..
	widthOfRectangle .. "and a height of " .. heightOfRectangle .. "is" ..
	areaOfRectangle .. "pixels squared.", 0, 0, Oswald, 24)

--anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

-- display a circle on your tablet
myCircle = display.newCircle( 100, 100, 90 )

-- anchor the circle in the top right corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 800
myCircle.y = 20

-- set the width of the border
myCircle.strokeWidth = 10

-- set the color of the circle
myCircle:setFillColor(0.7, 0.1, 0.3)

-- set the color of the border
myCircle:setStrokeColor(0, 1, 0)

-- calculate the area of the circle
areaOfCircle = PI * 90*90

-- write the area of the circle on the screen. Take into consideration the size of the font when positioning it on the screen
areaTextCircle = display.newText("The area of this circle with a radius of \n" .. 
	radiusOfCircle .. "squared, multplied by " .. PI .. " is " ..
	areaOfCircle .. " pixels.", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 20
areaTextCircle.y = 600

-- set the colour of the newText
areaTextCircle:setTextColor(1, 1, 1)
 