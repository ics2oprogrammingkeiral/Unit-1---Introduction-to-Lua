-- Title: TouchAndReact
-- Name: Keira L
-- Course: ICS2O/3C
-- This program does something when I click on the button.

-- set background colour
display.setDefault ("background", 0.8, 0.8, 1)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its poisition and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create red button, set its poisition and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false 

-- create text object, set its poisition and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 60)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 0.4, 0.4)
textObject.isVisible = false

-- create the checkmark
local checkmark = display.newImageRect("Images/checkmark.png", 96, 96)
checkmark.x = display.contentWidth/6
checkmark.y = display.contentHeight/6
checkmark.isVisible = true 

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the 
-- red button, and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton,isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton,isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end


-- Function:RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the 
-- red button, and make the blue button disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = true
		textObject.isVisible = true 
		blueButton.isVisible = false
		checkmark.isVisible = true
	end

	if (touch.phase == "ended") then
		redButton.isVisible = false
		textObject.isVisible = false 
		blueButton,isVisible = true
		checkmark.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

redButton:addEventListener("touch", RedButtonListener)

---------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------

-- add spring sound effect
local springSound = audio.loadSound( "Sounds/SpringSoundEffect.mp3")
local springSoundChannel

local function SoundEffect( event )
	-- when user clicks the button sound effect will play
	if (touch.phase == "began" ) then
		springSoundChannel = audio.play(springSound)
	end
end