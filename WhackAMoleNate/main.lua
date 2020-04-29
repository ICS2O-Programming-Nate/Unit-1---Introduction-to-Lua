----------------------------------------------------------------------------------------
-- Title: WhackAMoleNate
-- Name: Nate
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.
----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------

-- Create the background 
    local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)
    bkg:setFillColor(0/255, 0/255, 0/255)

    -- Set the position of the background
    bkg.anchorX = 0
    bkg.anchorY = 0
    bkg.x = 0
    bkg.y = 0

-- Creating Peter 
local Peter = display.newImage("Images/Icon.png", 0, 0)

    -- Set the position of the Waldo
    Peter.x = display.contentCenterX
    Peter.y = display.contentCenterY

    Peter:scale(4/5, 4/5)

    Peter.isVisible = false

-- Variable to keep track of score
local score = 0

-- Local text object to display score
local scoreText = display.newText("Score = " .. score .. "", 900, 725, nil, 60)
scoreText:setFillColor(255/255, 255/255, 255/255)

----------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------

-- This function makes Waldo appear in a random (x,y) position on the screen
-- before calling the the Hide funtion
function PopUp()

    -- Choosing random position on the screen between 0 and the size of the screen
    Peter.x = math.random(0, display.contentWidth)
    Peter.y = math.random(0, display.contentHeight)

    Peter.isVisible = true

    timer.performWithDelay(800, Hide)

end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay()

    timer.performWithDelay(3000, PopUp)

end

-- This function makes the Waldo invisible and then calls the PopUpDelay function
function Hide()

    -- Change the visibility
    Peter.isVisible = false

    PopUpDelay()

end

-- This function starts the game
function GameStart()

    PopUpDelay()

end

-- This function increments the score only if the Waldo is clicked. It then displays the
-- new score.
function Whacked(event)

    -- If touch phase just started
    if (event.phase == "began") then

        score = score + 1
        scoreText.text = "Score = " .. score .. ""
    end

end

----------------------------------------------------------------------------------------
-- EVENT LISTENERS
----------------------------------------------------------------------------------------
-- I added the event listener to Waldo so that if Waldo is touched, the Whacked
-- function is called
Peter:addEventListener( "touch", Whacked)

----------------------------------------------------------------------------------------
-- START THE GAME
----------------------------------------------------------------------------------------
GameStart()


-- background music 
local runescapeSound = audio.loadSound( "Sounds/RuneScape.mp3" )
local runescapeSoundChannel

-- play background music
runescapeSoundChannel = audio.play(runescapeSound) 
