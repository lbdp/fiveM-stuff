local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Model Menu",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}



function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end



function Main()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "my menyoo"
    options.menu_subtitle = "~o~main menu"
    ClearMenu()
    Menu.addButton("~y~objects menu", "objMenu", nil)
	Menu.addButton("~y~animations menu", "animationMenu", nil)
end

function animationMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~animation menu"
    options.menu_subtitle = "VirtMill animation list"
    ClearMenu()
    Menu.addButton("unload_rl_01_amy_skater_01", "thingsVM3", nil)
    Menu.addButton("unload_rl_02_amy_skater_01","thingsVM4",nil)
    Menu.addButton("operate_01_amy_skater_01", "thingsVM5", nil)
    Menu.addButton("operate_02_amy_skater_01", "thingsVM6", nil)
    Menu.addButton("operate_03_amy_skater_01", "thingsVM7", nil)
    Menu.addButton("reachout_amy_skater_01", "thingsVM8", nil)	
    Menu.addButton("~o~NEXT PAGE", "nextPageAnim", nil)	
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)	
end
function objMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~obj spawner menu"
    options.menu_subtitle = "obj list"
    ClearMenu()
	Menu.addButton("gr_adv_case", "things1", "gr_prop_gr_adv_case")
    Menu.addButton("gr_crate_gun_01a", "things1", "gr_prop_gr_crate_gun_01a")
    Menu.addButton("~r~delete stuff", "deleteStuff", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
function nextPageAnim()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~animation menu"
    options.menu_subtitle = "speed drill animation list"
    ClearMenu()	
	Menu.addButton("unload_rl_01_amy_skater_01", "thingsSD1", nil)
	Menu.addButton("unload_rl_02_amy_skater_01", "thingsSD2", nil)
	Menu.addButton("operate_01_amy_skater_01", "thingsSD3", nil)	
    Menu.addButton("~o~PREV PAGE", "animationMenu", nil)	
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)		

end
--[[
function Main()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "things"
    options.menu_subtitle = "and stuff"
    ClearMenu()
	Menu.addButton("unload_rl_01_amy_skater_01", "things1", nil)
    Menu.addButton("unload_rl_02_amy_skater_01", "things2", nil)
    Menu.addButton("operate_01_amy_skater_01", "things3", nil)
    Menu.addButton("operate_02_amy_skater_01","things4",nil)
    Menu.addButton("operate_03_amy_skater_01", "things5", nil)
    Menu.addButton("reachout_amy_skater_01", "things6", nil)
end
--]]
function things1(stuff)
 things(stuff)
spawnStuff(stuff)
end
function thingsSD3()
RequestAnimDict("anim@amb@machinery@speed_drill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@speed_drill@", "operate_01_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsSD2()
RequestAnimDict("anim@amb@machinery@speed_drill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@speed_drill@", "unload_rl_02_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsSD1()
RequestAnimDict("anim@amb@machinery@speed_drill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@speed_drill@", "unload_rl_01_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end

function thingsVM3()
RequestAnimDict("anim@amb@machinery@vertical_mill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@vertical_mill@", "unload_rl_01_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsVM4()
RequestAnimDict("anim@amb@machinery@vertical_mill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@vertical_mill@", "unload_rl_02_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsVM5()
RequestAnimDict("anim@amb@machinery@vertical_mill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@vertical_mill@", "operate_01_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsVM6()
RequestAnimDict("anim@amb@machinery@vertical_mill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@vertical_mill@", "operate_02_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsVM7()
RequestAnimDict("anim@amb@machinery@vertical_mill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@vertical_mill@", "operate_03_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
function thingsVM8()
RequestAnimDict("anim@amb@machinery@vertical_mill@")
TaskPlayAnim(GetPlayerPed(PlayerId()), "anim@amb@machinery@vertical_mill@", "reachout_amy_skater_01", 8.0, -8.0, -1, 48, 0.0, 0, 0, 0)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press F5 to open/close menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)                  
                    if IsControlJustReleased(1, 166) then -- INPUT_CELLPHONE_DOWN
                        Main() -- Menu to draw
                        Menu.hidden = not Menu.hidden -- Hide/Show the menu
                    end

                    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
                end       
end)
