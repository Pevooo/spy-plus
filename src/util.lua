function collides(x1, y1, w1, h1, x2, y2)
    if x2 > x1 and x2 < x1 + w1 and y2 > y1 and y2 < y1 + h1 then
        return true
    else
        return false
    end
end

function shuffle(tbl)
    local rand = math.random
    local iterations = #tbl
    local shuffleIterations = 2 -- Number of shuffling iterations

    for _ = 1, shuffleIterations do
        for i = 1, iterations do
            local j = rand(iterations)
            tbl[i], tbl[j] = tbl[j], tbl[i]
        end
    end

    return tbl
end

function argmax(tbl)
    local max = 0
    local max_voted = 0
    for k, v in pairs(tbl) do
        if max < v then
            max = v
            max_voted = k
        end
    end

    local count = 0
    for k, v in pairs(tbl) do
        if v == max then
            count = count + 1
        end
    end

    if count > 1 then
        return 0, 0
    end
    return max_voted, max
end




function repeat_animation(time, tbl)
    Timer.tween(time / 2, {[tbl] = {r = 0, g = 0, b = 0}})
    :finish(function()         
        Timer.tween(time / 2, {[tbl] = {r = 1, g = 1, b = 1}})
        end)
    Timer.every(time, 
    function()
        Timer.tween(time / 2, {[tbl] = {r = 0, g = 0, b = 0}})
        :finish(function()         
            Timer.tween(time / 2, {[tbl] = {r = 1, g = 1, b = 1}})
            end)
        end)
end


function e_int_tbl(e, tbl)
    for i, k in ipairs(tbl) do
        if k == e then
            return true
        end
    end
    return false
end


function print_centered(text, y) 
    love.graphics.printf(text, 0, y, WINDOW_WIDTH, "center")
end


function copy(tbl)
    local new_tbl = {}

    for k, v in pairs(tbl) do
        new_tbl[k] = v
    end

    return new_tbl
end