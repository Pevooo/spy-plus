
HelpState = Class{__includes = BaseState}

function HelpState:enter(params)

    self.back_button = Button({
        x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT - 120, w = 160, h = 60, texture = gTextures['button'], text = "Back",
        onClick = function()
            gStateMachine:change('start', {})
        end
    })

    self.text = {
        "Spy+ is game which you can play",
        "with two or more of your friends.",
        "Each game there will be two groups:",
        "Innocents and Spies.",
        "Innocents are given a place",
        "but spies are not.",
        "As an Innocent, you should know",
        "who are the spies by asking questions",
        "to random people.",
        "Each spy type has a differrent ablility.",
        "Spies use their abilities to hide their identity.",
        "If you're an Innocent you can vote someone off",
        "if you think he/she is the spy.",
        "If there are less than 3 players remaining or",
        "the game ended with 1 or more spy,",
        "the spies won the game.",
        "If there are no spies left,",
        "the Innocents will win.",

    }

end

function HelpState:update(dt)
    self.back_button:update(dt)
end


function HelpState:render()
    self.back_button:render()

    for i, t in ipairs(self.text) do
        print_centered(t, 120 + (i - 1) * 20)
    end
    print_centered("Made by Pevo", WINDOW_HEIGHT - 20)
end


