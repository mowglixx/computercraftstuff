local t_args = { ... }

function debugMode(debug_output)
    if t_args = "v" then 
        print(debug_output ) 
    end
end


function autoFindDevice( TargetDevice )
    -- a list of devices
    devices =   {   "monitor",
                    "modem",
                    "printer",
                    "speaker"
                }

    -- a list of sides
    sides =     {   
                    "top",
                    "left",
                    "right",
                    "bottom",
                    "back",
                    "front"
                }
    if
        for _,side in pairs( sides ) do
            if pocket then
                side = "back"
            end
            
            debugPrint( "Checking " .. side )
            if peripheral.isPresent( side ) then
                debugPrint("Found peripheral on " .. side )
                
                if peripheral.getType( side ) == TargetDevice then
                    print( "Found " .. TargetDevice .. " on " .. side )
                    return( side )
                end
            else
                print("nope.")
                print("------------------------")
                return(false)
            end
        end
    end

end
autoFindDevice()