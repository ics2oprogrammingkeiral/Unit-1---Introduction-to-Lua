-- Title: PhysicsAndCollisions
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program makes three balls continuously roll and bounce around on the
-- screen with borders that help them stay in a selected area.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
---------------------------------------------------------------------------
-- OBJECTS --
---------------------------------------------------------------------------
-- ground
local ground = display.newImage("Images/ground.png", 0, 0)

	-- set the x and y poisitioning
	ground.x = display.contentWidth * 3.5/7
	ground.y = display.contentHeight * 7/7

	-- change the width to be the same as the screen
	ground.width = display.contentWidth

	-- add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------------
-- wall
local wall = display.newImage("Images/ground.png", 0, 0)
	
	-- set the x and y poisitioning
	wall.x = display.contentWidth * 7/7
	wall.y = display.contentHeight * 3.5/7

	-- change the width to be the same as the screen
	wall.width = display.contentWidth


	-- rotate to 90 degrees
	wall:rotate(90)

	-- add to physics
	physics.addBody(wall, "static", {friction=0.5, bounce=0.3})
---------------------------------------------------------------------------
-- beam
local beam = display.newImage("Images/beam.png", 0, 0)

	-- set the x and y poisitioning
	beam.x = display.contentCenterX/5
	beam.y =display.contentCenterY*1.65

	-- set the beam width to be half the ipad width and 1/10 of the ipad height 
	beam.width = display.contentWidth/2
	beam.height = display.contentHeight*1/10

	-- rotate the beam -10 degrees so it's on an angle
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------------
-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)
	-- set the x and y poisitioning
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the width and height to be the full ipad
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight
	-- send to back
	bkg:toBack()

---------------------------------------------------------------------------
-- FUNCTIONS --
---------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics to the ball
	physics.addBody(ball1, {density=20, friction=0.5, bounce=1.4, radius=25})

	-- scale the ball
	ball1:scale(5, 5)
end

local function secondBall()
	--creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics to ball
	physics.addBody(ball2, {density=4.0, friction=0.5, bounce=0.5, radius=12.5})

	-- scale the ball
	ball2:scale(2.5, 2.5)
end

local function thirdBall ()
	-- creating the third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics to the ball
	physics.addBody(ball3, {density=6.0, friction=1.4, bounce=2.0, radius=50})
end
---------------------------------------------------------------------------
-- TIMER DELAYS	 -- call each function after the given nillisecond
---------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 1000, thirdBall)
