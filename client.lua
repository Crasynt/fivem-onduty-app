local identifier = "FiveM-Onduty-App"

CreateThread(function (functions.js)
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    local function AddApp()
        local added, errorMessage = exports["lb-phone"]:AddCustomApp({
            identifier = identifier,
            name = "FiveM-Onduty-Appt",
            description = "Police Onduty App",
            developer = "Crasy",
            defaultApp = true, -- Not needed to be downloaded,
            size = 59812, -- OPTIONAL in kb
            images = {"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4U8s2RN2Ia9mLKtzTzbAZJQgLSjxgA9LOyw&usqp=CAU"}, -- Icon Image
            ui = GetCurrentResourceName() .. "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4U8s2RN2Ia9mLKtzTzbAZJQgLSjxgA9LOyw&usqp=CAU", -- Icon Image
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/assets/icon.png"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            AddApp()
        end
    end)

    local directions = {"N", "NE", "E", "SE", "S", "SW", "W", "NW"}
    local oldYaw, oldDirection

    RegisterNUICallback("getDirection", function(data, cb)
        cb(oldDirection)
    end)

    while true do
        Wait(25)

        local yaw = math.floor(360.0 - ((GetFinalRenderedCamRot(0).z + 360.0) % 360.0) + 0.5)
        if yaw == 360 then
            yaw = 0
        end

        -- get closest direction
        if oldYaw ~= yaw then
            oldYaw = yaw
            oldDirection = yaw .. "° " .. directions[math.floor((yaw + 22.5) / 45.0) % 8 + 1]
            exports["lb-phone"]:SendCustomAppMessage(identifier, {
                type = "updateDirection",
                direction = oldDirection
            })
        end
    end
end)

RegisterNUICallback("drawNotification", function(data, cb)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(data.message)
    EndTextCommandThefeedPostTicker(false, false)

    cb("ok")
end)