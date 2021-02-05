local function tick()
    while true do 
        os.sleep(0.1)
        return "tick"
    end
end

function resetScreen()
term.clear()
term.setBackgroundColor(colors.white)
term.setTextColor(colors.yellow)
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

local monitor = peripheral.wrap(findDevice("monitor"))
rednet.open(findDevice("modem"))
term.redirect(monitor)

resetScreen()

print("Messages Channel open")

while true do
    sender, message, _ = rednet.receive()
    print(sender.. "> ".. message)
end