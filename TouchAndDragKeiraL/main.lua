-- Title: TouchAndDrag
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program has two images on the screen, when I click and drag on each image it moves with my mouse.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- make local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

local yellowGirl = display.newImageRect("Images/yellowGirl.png", 150, 150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local pinkGirl = display.newImageRect("Images/pinkGirl.png", 150, 150)
local pinkGirlWidth = pinkGirl.width
local pinkGirlHeight = pinkGirl.height

-- boolean variables
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false
local alreadyTouchedPinkGirl = false

-- set the initial poisitions
yellowGirl.x = 450
yellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

pinkGirl.x = 800
pinkGirl.y = 300

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if ( (alreadyTouchedYellowGirl == false) and (alreadyTouchedPinkGirl == false) ) then
			alreadyTouchedBlueGirl = true
		end
	end

	if ( ( touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedYellowGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

-- Function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when yellow girl is touched, move her
local function YellowGirlListener(touch)
	if (touch.phase == "began") then
		if ( (alreadyTouchedBlueGirl == false) and (alreadyTouchedPinkGirl == false) ) then
			alreadyTouchedYellowGirl = true
		end
	end

	if( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		yellowGirl.x = touch.x
		yellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedBlueGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective event listener 
yellowGirl:addEventListener("touch", YellowGirlListener)

-- Function: PinkGirlListener
-- Input: touch listener
-- Output: none
-- Description: when pink girl is touched, move her
local function PinkGirlListener(touch)
	if (touch.phase == "began") then
		if ( (alreadyTouchedBlueGirl == false) and (alreadyTouchedYellowGirl == false) ) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPinkGirl == true) ) then
		pinkGirl.x = touch.x
		pinkGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedPinkGirl = false
		alreadyTouchedBlueGirl = false
		alreadyTouchedYellowGirl = false
	end
end

-- add the respective listener
pinkGirl:addEventListener("touch", PinkGirlListener)