Default = Class{__includes = Player}


function Default:init(params)
    self.super = Player(params)
    self.spy = true
    self.sentinel = false
    self.type = 'Default Spy'
    self.buttons = self.super.buttons
    self.info = {"You're default. You don't do anything :("}
    self.powerup = 1
end

