Innocent = Class{__includes = Player}


function Innocent:init(params)
    self.super = Player(params)
    self.spy = false
    self.sentinel = false
    self.type = 'Innocent'
    self.buttons = self.super.buttons
    self.info = {params.place, "Good Luck!"}
    self.info_many = {"You are Innocent.", "Good luck next time.", "The place is " ..params.place ..".", "Innocents try to know who the spy is.", "Good Luck finding the spy :)"}
end

