-- #####################################
-- #####################################
-- 
--      Mincraft chat client for CC
--      Written in Lua by 
--      https://github.com/mowglixx
--      
-- #####################################
-- #####################################

-- Open the modem to rednet
rednet.open(findDevice("modem"))

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

function translateToContact(contact)
    return contact
end

function recieveMessages()
    sender, rsvd_message, _ = rednet.receive()
    message = {translateToContact(sender),rsvd_message}
end

local monitor = peripheral.wrap(findDevice("monitor"))
monitor.setText
term.redirect(monitor)

resetScreen()
print("Messages Channel open")

while true do
    sender, message, _ = rednet.receive()
    print(sender.. "> ".. message)
end