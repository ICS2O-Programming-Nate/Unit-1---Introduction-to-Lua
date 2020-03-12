-----------------------------------------------------------------------------------------
-- Nate Macavoy
-- main.lua
-- Course: ICS2O
-- This program asks the user an addition question. The user enters their answer in 
-- a numeric text field. If they answer the question correctly, the word "Correct!" 
-- is displayed. Otherwise, "incorrect" is displayed.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 95/255, 230/255, 226/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create your local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local checkmark
local redX

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(1, 8)
	randomNumber2 = math.random(1, 8)

	correctAnswer = randomNumber1 + randomNumber2

	-- create the question in the text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	checkmark.isVisible = false
	redX.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user begins editing the numericField
	if ( event.phase == "began") then

		-- clear the text field
		event.target.text = ""

	elseif ( event.phase == "submitted" ) then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			checkmark.isVisible = true
			redX.isVisible = false
			timer.performWithDelay(3000, HideCorrect)
		else 
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			checkmark.isVisible = false
			redX.isVisible = true
			timer.performWithDelay(3000, HideCorrect)
		end
		-- clear the text field
		event.target.text = ""
	end
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 75)
questionObject:setTextColor(11/255, 16/255, 189/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth*1/4, display.contentHeight*1/4, nil, 50 )
correctObject:setTextColor(199/255, 41/255, 205/255)
correctObject.isVisible = false

-- create the numeric field
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight*2/3, 200, 100)
numericField.inputType = "number"

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect. Try another one.", display.contentWidth*1/3, display.contentHeight*1/3, nil, 50 )
incorrectObject:setTextColor(2/255, 60/255, 219/255)
incorrectObject.isVisible = false

-- create the checkmark
checkmark = display.newImageRect("Images/checkmark.png", 198, 96)
checkmark.x = display.contentWidth*4/5
checkmark.y = display.contentHeight*1/4
checkmark.isVisible = false

-- create the redX
redX = display.newImageRect("Images/redX.png", 198, 96)
redX.x = display.contentWidth*4/5
redX.y = display.contentHeight*1/4
redX.isVisible = false

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()