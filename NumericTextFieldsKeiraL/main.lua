-- Title: NumericTextFields
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric
-- textField terminal.
-----------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 1, 1, 0.6)

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
local userAnswer
local correctAnswer
local incorrectAnswer
local answerCounter = 0
local numberOfCorrect
local correctAnswers
local answerObject

----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS -- 
----------------------------------------------------------------------------------

local function AskQuestion()
	-- generates 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 ..  " + " .. randomNumber2 .. " = "

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
			timer.performWithDelay(2000, HideCorrect)
			answerCounter = answerCounter + 1
			numberOfCorrect.text = answerCounter
		else 
			incorrectObject.isvisible = true
			timer.performWithDelay(2000, HideIncorrect)
		end
		-- clear text field
		event.target.text = ""
	end
end

------------------------------------------------------------------------------------
-- OBJECT CREATION --
------------------------------------------------------------------------------------
-- add the count of corrects answers
numberOfCorrect = display.newText("", display.contentWidth/2,
 display.contentHeight/1.10, nil, 50)
numberOfCorrect:setTextColor(0.4, 0, 0.4)

-- displays the number of correct answers 
correctAnswers = display.newText( "Correct Answers!",
 display.contentWidth/2, display.contentHeight/1.25, nil, 50)
correctAnswers:setTextColor(0.4, 0, 0.4)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0.4, 0, 0.4)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0.4, 0, 0.4)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(0.4, 0, 0.4)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event l;istener to the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )


-----------------------------------------------------------------------------------
-- FUNCTION CALLS --
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()