local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Main obj Menu",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}
 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if DoesEntityExist(a) then 	  
  local position = 'objID '..a
  local offset = {x = 0.290, y = 0.850}
  local rgb = {r = 25, g = 25, b = 140}
  local alpha = 255
  local scale = 0.2
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)

 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if DoesEntityExist(a) then 	  
  local position = "obj rotation "..entityRot
  local offset = {x = 0.290, y = 0.860}
  local rgb = {r = 25, g = 25, b = 150}
  local alpha = 255
  local scale = 0.2
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)
 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if DoesEntityExist(a) then 	  
  local position = "obj coords "..entityCoords
  local offset = {x = 0.290, y = 0.870}
  local rgb = {r = 25, g = 25, b = 120}
  local alpha = 255
  local scale = 0.2
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)

 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if DoesEntityExist(a) then
	   if DoesEntityHavePhysics(a) then
	     c = "yes"
	   else
	     c = "no"
	   end
  local position = "does obj have physics "..c
  local offset = {x = 0.290, y = 0.880}
  local rgb = {r = 25, g = 25, b = 130}
  local alpha = 255
  local scale = 0.2
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)
 Citizen.CreateThread(function()
	while true do
	isEntityAttached = IsEntityAttached(a)
	  Citizen.Wait(0) 
	  if DoesEntityExist(a) then
	   if IsEntityAttached(a) then
	     d = "yes"
	   else
	     d = "no"
	   end
  local position = "is Entity Attached "..d
  local offset = {x = 0.290, y = 0.890}
  local rgb = {r = 25, g = 25, b = 160}
  local alpha = 255
  local scale = 0.2
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)
isEntityAttached = IsEntityAttached(attach)

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
------------------------------------------------------------------
--------------------------main menu-------------------------------
------------------------------------------------------------------
function Main()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "my menyoo"
    options.menu_subtitle = "~o~main menu"
    ClearMenu()
    Menu.addButton("~y~GunRunning ~b~menu", "GRCrateMenu", nil)
	Menu.addButton("~y~GunRunning MOC ~b~menu", "MOCmoules", nil)
end
------------------------------------------------------------------
--------------------------gunrunning obj menu---------------------
------------------------------------------------------------------
function GRCrateMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning"
    options.menu_subtitle = "select object to spawn"
    ClearMenu()
	Menu.addButton("adv_case", "objMenuGRAdvCase", nil)
	Menu.addButton("carcreeper", "objMenuGRCarCreeper", nil)
	Menu.addButton("gun crate 01a", "objMenuGRCrateGun01a", nil)
	Menu.addButton("mag crate 01a", "objMenuGRCrateMag01a", nil)		
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end	
------------------------------------------------------------------
--------------------------gunrunning MOC obj menu-----------------
------------------------------------------------------------------
function MOCmoules()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning MOC"
    options.menu_subtitle = "select object to spawn"
    ClearMenu()
    Menu.addButton("MOC carmod", "MOCCarMod01", nil)
	Menu.addButton("MOC command", "MOCCommand01", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end	
------------------------------------------------------------------
-----------------------advanced case spawn menu-------------------
------------------------------------------------------------------
function objMenuGRAdvCase()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning"
    options.menu_subtitle = "advanced case"
    ClearMenu()
	Menu.addButton("spawn advanced case", "things1", -739654066)
	Menu.addButton("freeze advanced case", "freezeStuff", a)
	Menu.addButton("unfreeze advanced case", "unfreezeStuff", a)
    Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~back", "GRCrateMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
------------------------------------------------------------------
--------------------------car creeper spawn menu------------------
------------------------------------------------------------------
function objMenuGRCarCreeper()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning"
    options.menu_subtitle = "car creeper"
    ClearMenu()
	Menu.addButton("spawn car creeper", "things1", 1177042352)
    Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~back", "GRCrateMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
------------------------------------------------------------------
---------------------gun crate 01a spawn menu---------------------
------------------------------------------------------------------
function objMenuGRCrateGun01a()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning"
    options.menu_subtitle = "gun crate"
    ClearMenu()
	Menu.addButton("spawn gun crate 01a", "things1", -471632408)
    Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~back", "GRCrateMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
------------------------------------------------------------------
------------------mag crate 01a spawn menu------------------------
------------------------------------------------------------------
function objMenuGRCrateMag01a()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning"
    options.menu_subtitle = "mag crate"
    ClearMenu()
	Menu.addButton("spawn mag crate 01", "things1", 1281731670)
    Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~back", "GRCrateMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
------------------------------------------------------------------
------------------MOC carmod spawn menu------------------------
------------------------------------------------------------------
function MOCCarMod01()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning MOC"
    options.menu_subtitle = "MOC carmod"
    ClearMenu()
	Menu.addButton("spawn MOC carmod 01", "things1", -2083549178)
	Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~BACK", "MOCmoules", nil)	
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
------------------------------------------------------------------
------------------MOC command spawn menu------------------------
------------------------------------------------------------------
function MOCCommand01()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~GunRunning MOC"
    options.menu_subtitle = "MOC command"
    ClearMenu()
	Menu.addButton("spawn MOC command 01", "things1", -2104782239)
	Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~BACK", "MOCmoules", nil)	
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
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

------------------------------------------------------------------
--------------------------obj spawner-----------------------------
------------------------------------------------------------------
function things1(stuff)
 things(stuff)
spawnStuff(stuff)
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



