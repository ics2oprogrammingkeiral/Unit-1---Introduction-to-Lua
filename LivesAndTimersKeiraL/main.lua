-- Title: LivesAndTimers
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program sets a timer countdown at the top of the screen along with a health
-- bar that decreases when you get questions wrong
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

-- timer variables
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

----------------------------------------------------------------------------------
-- IMAGES --
----------------------------------------------------------------------------------

-- create the gameover background 

gameOver = display.newImageRect("Images/gameOver.png", 1336, 824)
gameOver.x = display.contentWidth * 1.5/3
gameOver.y = display.contentHeight * 1.5/3
gameOver.isVisible = false

-- create the lives to display
heart1 = display.newImageRect("Images/heart.png", 80, 80)
heart1.x = display.contentWidth *  6 / 9
heart1.y = display.contentHeight * 1 / 8

heart2 = display.newImageRect("Images/heart.png", 80, 80)
heart2.x = display.contentWidth * 7 / 9
heart2.y = display.contentHeight * 1 / 8

heart3 = display.newImageRect("Images/heart.png",  80, 80)
heart3.x = display.contentWidth * 8 / 9
heart3.y = display.contentHeight * 1 / 8
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
		-- if the first random number is smaller then the second run the functon
		-- again until it's correct
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
		-- if the first random number is smaller then the second run the functon
		-- again until it's correct
		if (randomNumber1 < randomNumber2) then
			runFunction = AskQuestion()
		end
		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2
		correctAnswer = math.floor (correctAnswer + 0.5)

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
			secondsLeft = totalSeconds
			correctSoundChannel  = audio.play(correctSound)

			timer.performWithDelay(2000, HideCorrect)
		else 
			incorrectObject.isvisible = true
			lives = lives - 1
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2000, HideIncorrect)
		end
		-- clear text field
		event.target.text = ""
	end
end

local function UpdateTime()

	-- decrease the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the numbers of seconds left in the clock object
	clockText.text  = secondsLeft .. ""

	if ( phase == "submitted" ) then
		secondsLeft = totalSeconds
	end 

	if (secondsLeft == 0) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
	end

	if (lives == 2) then
		heart1.isVisible = false
	elseif (lives == 1) then
		heart2.isVisible = false
	elseif (lives == 0) then
		heart3.isVisible = false
	end

	if (lives == 0) then
		gameOver.isVisible = true
		questionObject.isVisible = false
		numericField.isVisible = false
		clockText.isVisible = false
		correctObject.isVisible = false
		incorrectObject.isvisible = false
		timer.cancel(countDownTimer)
	end 
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

------------------------------------------------------------------------------------
-- OBJECT CREATION --
------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3,
 display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0, 0.4, 0.4)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2,
 display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0, 0.4, 0.4)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2,
 display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(0, 0.4, 0.4)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2,
 display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- create clock text
clockText = display.newText( "", display.contentWidth/0.5,
 display.contentHeight/0.5, nil, 50)
clockText:setTextColor(0, 0.4, 0.4)
clockText.isVisible = true

-- add the event listener to the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------
-- FUNCTION CALLS --
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
-- call the function to run the timer
StartTimer()

