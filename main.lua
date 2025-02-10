function love.load()
    clock = os.date('*t')
    width = 1280
    height = 720
    love.window.setMode(width, height)
    love.window.setTitle("Clock:Time")
    futura = love.graphics.newFont("book_bold.otf", 300)
    futuraSmol = love.graphics.newFont("book_bold.otf", 30)

    theme = 0
end

function themise(number,bg)
    if bg then
        if number == 0 then return 0.15294117647058825 end
        if number == 1 then return 1 end
    end
    if number == 0 then return 0.5 end
    if number == 1 then return 0.5 end
end

function calculate(base, percentage)
    local result = (base * percentage) / 100
    return result
end

function pressed()
    theme = 1 - theme
end
function love.update(dt)
    clock = os.date('*t')
    if clock.hour >= 0 and clock.hour < 10 then
        clock.hour = "0" .. clock.hour
    end
    if clock.min >= 0 and clock.min < 10 then
        clock.min = "0" .. clock.min
    end
    if clock.sec >= 0 and clock.sec < 10 then
        clock.sec = "0" .. clock.sec
    end
end

function love.gamepadpressed(joystick, button)
    if button == "start" then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setBackgroundColor(themise(theme,true), themise(theme,true), themise(theme,true))
    love.graphics.setFont(futura)

    love.graphics.setColor(themise(theme,false), themise(theme,false), themise(theme,false))

    love.graphics.print(clock.hour, calculate(width,25)-futura:getWidth(clock.hour)/2, calculate(height,50)-(235/2))
    love.graphics.print(clock.min, calculate(width,75)-futura:getWidth(clock.min)/2, calculate(height,50)-(235/2))
    love.graphics.print(":", calculate(width,50)-35, calculate(height,50)-(260/2))

    love.graphics.setFont(futuraSmol)
    love.graphics.print(clock.sec, (calculate(width,50)+13)-futuraSmol:getWidth(clock.sec)/2, calculate(height,50)+25)
    love.graphics.print("Tap to Invert", 10, 10)
end

function love.mousepressed(x, y, button, istouch)
    pressed()
end
function love.touchpressed(id, x, y, dx, dy, pressure)
    pressed()
end