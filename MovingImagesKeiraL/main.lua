-- Title: MovingImages
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program moves a beetleship across
-- the screen and then makes it fade out.
-- I added another object that moves in a 
-- different direction as well as a background image.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variable
scrollSpeed = 3
scrollSpeedTwo = -3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y poisition of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: Thius function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the 
-- x-value of the ship.

local function MoveShip(event)
	--add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	--change the transparency of the ship  every time it moves
	--so that it fades in
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- second character image with width and height
local octoship = display.newImageRect("Images/octoship.png", 200, 200)

-- set the image to be fully visible
octoship.alpha = 1

--set the initial x and y poisitioning of the octoship
octoship.x = 1024
octoship.y = 580

-- Function: MoveShip
-- Input: Thius function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value
-- of the ship.

local function MoveShipTwo(event)
	--add the scroll speed to the x-value of the ship
	octoship.x = octoship.x + scrollSpeedTwo
	--Change the transparency of the ship every time it moves 
	--it fades out
	octoship.alpha = octoship.alpha - 0.001

	movingSoundChannel = audio.play(movingSound)
end
-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShipTwo)


---------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------

local movingSound = audio.loadSound( "Sounds/collectcoin.wav" )
local movingSoundChannel