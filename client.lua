local identifier = "Onduty"

CreateThread(function()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    local function AddApp()
        local added, errorMessage = exports["lb-phone"]:AddCustomApp({
            identifier = identifier,
            name = "Onduty",
            description = "Onduty App",
            developer = "Crasy & Politeblock07",
            defaultApp = true,
            size = 59812,
            images = {
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4U8s2RN2Ia9mLKtzTzbAZJQgLSjxgA9LOyw&usqp=CAU" -- Icon Image
            },
            ui = "nui://" .. GetCurrentResourceName() .. "/ui.html", -- Corrected HTML file path
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/assets/NZP.png"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

    -- Wait for NUI to be ready before adding the app
    Citizen.Wait(1000)
    AddApp()
end) -- Closing parenthesis for CreateThread

AddEventHandler("onResourceStart", function(resource)
    if resource == "lb-phone" then
        AddApp()
    end
end) -- Closing parenthesis for AddEventHandler

RegisterNUICallback('chatCommand', function(data, cb)
    local command = data.command
    -- Implement your logic to handle chat commands here
    cb('ok')
end)
