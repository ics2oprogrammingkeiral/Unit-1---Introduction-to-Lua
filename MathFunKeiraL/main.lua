-- Title: MathFun
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program displays a math question with a random operator and asks 
-- the user to answer in a numeric textField terminal.
-----------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 0.7, 1, 0.89)

----------------------------------------------------------------------------------
-- LOCAL VARIABLES --
----------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField 
local randomNumber1
local randomNumber2
local randomNumberOne
local randomNumberTwo
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator

----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS -- 
----------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 4

	randomOperator = math.random(1,4)

	-- generate 2 random numbers
	randomNumber1 = math.random(1,8)
	randomNumber2 = math.random(1,8)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- if the first random number is smaller then the second run 
		-- the functon again until it's correct
		if (randomNumber1 < randomNumber2) then
			runFunction = AskQuestion()
		end
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2

	-- if the random operator is 3, do multiplication
	elseif (randomOperator == 3) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2

	-- if the random operator is 4, do division
	elseif (randomOperator == 4) then
		-- if the first random number is smaller then the second run 
		-- the functon again until it's correct
		if (randomNumber1 < randomNumber2) then
			runFunction = AskQuestion()
		end
		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2

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

local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then


	elseif ( event.phase == "submitted" ) then

		-- when the answer is submitted (enter key is pressed) set user input 
		-- to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			
			correctSoundChannel  = audio.play(correctSound)

			timer.performWithDelay(2000, HideCorrect)
		else 
			incorrectObject.isvisible = true

			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2000, HideIncorrect)
		end

		-- clear text field
		event.target.text = ""
	end
end

------------------------------------------------------------------------------------
-- OBJECT CREATION --
------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0, 0.4, 0.4)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0, 0.4, 0.4)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(0, 0.4, 0.4)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event l;istener to the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

---------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------

-- correct sound
local correctSound = audio.loadSound( "Sounds/CashRegister.mp3" )
local correctSoundChannel

-- incorrect sound
local incorrectSound = audio.loadSound( "Sounds/whack.mp3" )
local incorrectSoundChannel
-----------------------------------------------------------------------------------
-- FUNCTION CALLS --
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
