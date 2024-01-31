-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

-- Knife Library
Timer = require 'lib/knife.timer'

-- Push library
push = require 'lib/push'

-- Constants
require 'src/constants'


-- Building Blocks
require 'src/NumberSelector'
require 'src/Button'
require 'src/VoteSystem'
require 'src/InputTextBox'

-- States
require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/FeedState'
require 'src/states/StartState'
require 'src/states/GameSettingsState'
require 'src/states/PlayState'
require 'src/states/PostRoundState'
require 'src/states/PostGameState'
require 'src/states/HelpState'
require 'src/states/NamesState'

-- Utility Functions
require 'src/util'


-- Characters
require 'src/characters/Player'
require 'src/characters/Sara'
require 'src/characters/Innocent'
require 'src/characters/Ethan'
require 'src/characters/Alfred'
require 'src/characters/Sophia'
require 'src/characters/Default'

-- Fonts
gFonts = {
    ['small'] = love.graphics.newFont('fonts/BLKCHCRY.TTF', 16),
    ['med'] = love.graphics.newFont('fonts/BLKCHCRY.TTF', 24),
    ['med+'] = love.graphics.newFont('fonts/BLKCHCRY.TTF', 32),
    ['large'] = love.graphics.newFont('fonts/BLKCHCRY.TTF', 48)
}

-- Sounds
gSounds = {
    ['button'] = love.audio.newSource("sounds/button.wav", "static"),
    ['bg-sound'] = love.audio.newSource("sounds/bg-sound.mp3", "static")
}


-- Textures
gTextures = {
    ['up-arrow'] = love.graphics.newImage("textures/up-arrow.png"),
    ['down-arrow'] = love.graphics.newImage("textures/down-arrow.png"),
    ['button'] = love.graphics.newImage("textures/button.png"),
    ['background'] = love.graphics.newImage("textures/background.jpeg")
}