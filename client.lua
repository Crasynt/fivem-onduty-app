local function AddApp()
    local added, errorMessage = exports["lb-phone"]:AddCustomApp({
        identifier = identifier,
        name = "FIVEM-ONDUTY-APP",
        description = "Police Onduty App",
        developer = "Crasy",
        defaultApp = true, 
        size = 59812, 
        images = {"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4U8s2RN2Ia9mLKtzTzbAZJQgLSjxgA9LOyw&usqp=CAU"}, -- Icon Image
        ui = GetCurrentResourceName() .. "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4U8s2RN2Ia9mLKtzTzbAZJQgLSjxgA9LOyw&usqp=CAU", -- Icon Image
        icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/assets/icon.png"
    
    })

    if not added then
        print("Error adding the custom app: " .. errorMessage)
    end
end

-- Call the function to add the custom app
AddApp()
