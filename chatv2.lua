local width,height = term.getSize()

versionNumber = "2"
username = "mowglixx"

function reset()
    term.setBackgroundColor(colors.cyan)
    term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
end

function findDevice(TargetDevice)

    sides = {   "top",
                "left",
                "right",
                "bottom",
                "back",
                "front"
            }

    for _, side in pairs(sides) do
        --print("Checking ".. tostring(side))
        if peripheral.isPresent(side) then
            --print("Found peripheral on " .. side)
            if peripheral.getType(side) == TargetDevice then
                print("Found ".. TargetDevice .." on "..side)
                correctside = side
                return(correctside)
            end
        end
    end
end
--loadAPI('/chat.lua')

display = {
    min_x = 2,
    min_y = 2,
    max_x = width-1,
    max_y = height-1
    }
-- clear the screen before strting chat
reset()
print("ChatMessenger"..\n..versionNumber)
sleep(2)
reset()

while true do
    term.setCursorPos( display.min_x ,display.max_y)    
    term.setBackgroundColor(colors.white)
    term.clearLine()
    term.setTextColor(colors.black)
    write("@"..username.."> ")
    msg = read()
    if msg then
    
        term.setCursorPos(display.min_x, display.max_y-1)
        term.scroll(1)
        term.clearLine()    
            print(msg)
    end
end
