
-- Title: AreaOfRectangleAndCircle
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program displays a coloured rectangle with
-- a border of a different colour. It also calculates
-- the rectangles area and displays it on the screen.
-- Then I added the code to draw a circle of a given 
-- radius that is coloured and has a border of a different 
-- colour. I used the radius to calculate the area and 
-- displayed this on the iPad.


--create my variables
 local areaText
 local textSize = 40
 local myRectangle
 local widthOfRectangle = 350
 local lengthOfRectangle = 200
 local AreaOfRectangle

--set the background colour
display.setDefault("background", 0.8, 0.8, 1) 

-- remove status bar
display.setStatusBar(display.HiddenStatusBar)

--create the rectangle
myRectangle = display.newRect(0, 0, widthOfRectangle, lengthOfRectangle)

-- anchor the rectangle to the top corner of the screen and set it's
-- x and y poisition
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

--set border width
myRectangle.strokeWidth = 5

-- set colour of stroke width
myRectangle:setStrokeColor(0.62, 0.62, 0.62)

--set rectangle colour
myRectangle:setFillColor(0.8, 1, 0.6)

--calculate the area
AreaOfRectangle = widthOfRectangle * lengthOfRectangle

-- write the area on the screen 
areaText = display.newText("The area of this rectangle with a width \n"
	.. widthOfRectangle .." and a length of " .. lengthOfRectangle .. " is "
	.. AreaOfRectangle .. " pixels².", 0, 0, nil, textSize)

--anchor text and set its x and y poisition
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = 250

--set the text colour
areaText:setTextColor(0.62, 0.62, 0.62)
----------------------------------------------------------------------------------------------------

--create circles variables
PI = 3.14
local myCircle
local radiusOfCircle = 150
local AreaOfCircle
local textTwo

-- create the circle
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- calculate the area
AreaOfCircle = PI * radiusOfCircle * radiusOfCircle

-- anchor the circle in the bottom right corner
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 675
myCircle.y = 360

-- ste border width
myCircle.strokeWidth = 5

-- set stroke width colour
myCircle:setStrokeColor(0.62, 0.62, 0.62)

-- set circle colour
myCircle:setFillColor(0.8, 1, 0.6)

-- create my text
textTwo = display.newText("The area of this circle with a radius of \n"
 .. radiusOfCircle .. " is " .. AreaOfCircle .. " pixels².",
  0, 0, nil, textSize)

-- anochor the text and set it's x and y poisition
textTwo.anchorX = 0
textTwo.anchorY = 0
textTwo.x = 20
textTwo.y = 650

-- set the text colour
textTwo:setTextColor(0.62, 0.62, 0.62)