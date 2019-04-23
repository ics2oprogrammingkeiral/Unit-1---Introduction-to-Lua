-- Title: WhackAMole
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in time
-- the score increases by 1

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-- set the background colour
display.setDefault("background", 0.4, 0.4, 0.6)

-- creating the horse
local horse = display.newImage( "Images/horse.png", 0, 0)
	
	-- set the poisition
	horse.x = display.contentCenterX
	horse.y = display.contentCenterY

	-- scale down the sixe
	horse:scale(0.4, 0.4)

	-- make the horse invisible
	horse.isVisible = false

-- create the local variables for the score
local score = 0
local scoreObject
local scoreText

---------------------------------FUNCTIONS---------------------------------

-- this function that makes the horse appear in a random (x,y) poisition on the screen
-- before calling the hide function

function PopUp()
	-- choose a random poisition on the screen between 0 and the sixe of the screen
	horse.x = math.random(0, display.contentWidth)
	horse.y = math.random(0, display.contentHeight)

	-- make the horse visible
	horse.isVisible = true

	-- call the hide function after 500 milliseconds
	timer.performWithDelay(500, Hide)
end

-- this function calls the pop up function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 500, PopUp )
end

-- this function make the horse invisible and then calls the pop up delay function
function Hide()
	-- change the visibility
	horse.isvisible = false

	-- call the pop up delay function
	PopUpDelay()
end

-- this function increments the score only if the horse is clicked. it then displays
-- the new score
function Whacked( event )

	-- if the touch phase just started
	if (event.phase == "began") then
		score = score + 1

		scoreObject.text = score
	end
end

---------------------------------EVENT LISTENERS---------------------------------
-- add the event listener to the horse so that if the horse is touched, the whacked
-- function is called
horse:addEventListener("touch", Whacked)

---------------------------------OBJECT CREATION---------------------------------
-- create the score text object
scoreText = display.newText( "Score:", display.contentWidth*0.2, 
			display.contentHeight*0.15, nil, 45)
scoreObject = display.newText("", display.contentWidth*0.2, 
			display.contentHeight*0.2, nil, 45)

---------------------------------BACKGROUND MUSIC---------------------------------
local miiMusic = audio.loadSound("Sounds/mii-plaza.mp3")
audio.play(miiMusic)

---------------------------------START THE GAME---------------------------------
-- call the function to start the game
PopUp()