Sara = Class{__includes = Player}


function Sara:init(params)
    self.super = Player(params)
    self.spy = true
    self.sentinel = false
    self.type = 'Sara'
    self.buttons = self.super.buttons
    self.info = {"Sara has an immunity from elemination for 1 time"}
    self.powerup = 1
end
