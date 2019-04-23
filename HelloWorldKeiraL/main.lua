-- Title: HelloWorld
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program displays Hello, World on the iPad simulator and "Hellooooooo!" to the command terminal. 
-----------------------------------------------------------------------------------------
--
-- main lua
--
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hellooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 204/255, 204/255)

--create a local variable
local textObject

-- displays text "Hello there!" on screen 
textObject = display.newText( "Hello there! I am Corona.", 500, 325, nil, 75)

-- change colour of text
textObject:setTextColor(102/255, 178/255, 255/255)

local textObjectSignature

-- display text "Created by Keira Lawson"
textObjectSignature = display.newText("Created by Keira Lawson", 500, 420, nil, 45)

-- change colour of text
textObjectSignature:setTextColor(51/255, 153/255, 255/255)

-- display "ICS2O Programming is a great course!" on console
print ("ICS2O Programming is a great course!")

-- display text "This is Awesome!" on console
print ("This is awesome!")