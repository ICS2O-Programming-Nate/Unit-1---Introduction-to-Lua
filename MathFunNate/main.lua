----------------------------------------------------------------------------------------------------
-- Title: MathFunNate
-- Name: Nate 
-- Course: ICS2O
-- This program is a math game that asks the user random addition, subtraction, 
-- multiplication, and division questions. All division answers are rounded to one 
-- decimal place. If the user gets the answer correct or incorrect, it tells them so.
----------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar) 

-- sets the background colour
display.setDefault("background", 0/255, 0/255, 0/255)

------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------------

-- create local variables
local randomOperator

local questionObject
local correctObject
local incorrectObject

local numericField

local randomNumber1
local randomNumber2

local userAnswer
local correctAnswer
local correctAnswerText
local incorrectAnswer

local points = 0
local wrongs = 0

------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------

local function AskQuestion()
    -- generate a random number between 1 and 4
    randomOperator = math.random(1, 4)

	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 4)
    randomNumber2 = math.random(0, 4)
    
    -- if the random operator is 1, then do addition
    if (randomOperator == 1) then

        -- calculate the correct answer
        correctAnswer = randomNumber1 + randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    
    -- otherwise, if the random operator is 2, do subtraction
    elseif (randomOperator == 2) then
        
        if (randomNumber2 > randomNumber1) then
        
        -- calculate answer with numbers flipped
        correctAnswer = randomNumber2 - randomNumber1

        -- create question in text object
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
        else 
	    -- calculate the correct answer
	    correctAnswer = randomNumber1 - randomNumber2

	    -- create question in text object
        questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
        end

    -- otherwise, if the random operator is 3, do multiplication
    elseif (randomOperator == 3) then

        -- calculate the correct answer
        correctAnswer = randomNumber1*randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

     -- otherwise, if the random operator is 4, do division
    elseif (randomOperator == 4) then

        -- calculate the correct answer
        correctAnswer = randomNumber1/randomNumber2
        correctAnswer = math.round(correctAnswer)

         -- create question in text object
        questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

    end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideCorrectAnswerText()
	correctAnswerText.isVisible = false
end

local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the user's answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
		
			-- give a point if the user gets the correct answer and display "Correct!"
			points = points + 1
			correctObject.isVisible = true

			-- update it in the display object
			pointsText.text = "Points = " .. points

			-- perform HideCorrect with a delay and clear the text field
			timer.performWithDelay(1500, HideCorrect)
			event.target.text = ""

		else
			-- display "Incorrect!" and show the right answer
			incorrectObject.isVisible = true
			correctAnswerText = display.newText( "The correct answer is " .. correctAnswer, display.contentWidth/2, display.contentHeight*(4/5), nil, 50)
			timer.performWithDelay(2000, HideIncorrect)
			timer.performWithDelay(2000, HideCorrectAnswerText)
			event.target.text = ""
		end	
	end
end

------------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth*(3/4), display.contentHeight*(1/4), nil, 50)
pointsText:setTextColor(255/255, 255/255, 255/255)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/2 - 50, display.contentHeight/2, nil, 100 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0/255, 0/255, 204/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(204/255, 0/255, 102/255)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth*(3/4), display.contentHeight/2, 150, 100 )
numericField.inputType = "number"

-- add the event listeners for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()