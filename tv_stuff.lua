-- Configure the opening hours
local openingHour = 0
local closingHour = 22

-- Configure the coordinates for all the cinemas
local cinemaLocations = {
  { ['name'] = "Downtown", ['x'] = 300.788, ['y'] = 200.752, ['z'] = 104.385},
  { ['name'] = "Morningwood", ['x'] = -1423.954, ['y'] = -213.62, ['z'] = 46.5},
  { ['name'] = "Vinewood",  ['x'] = 302.907, ['y'] = 135.939, ['z'] = 160.946}
}

local blipsLoaded = false
--local randomMovie = GetRandomIntInRange(0, 4)
local MovieState = false
function LoadBlips()
  for k,v in ipairs(cinemaLocations) do
    local blip = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite(blip, 135)
    SetBlipScale(blip, 1.2)
    SetBlipColour(blip, 25)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Movie Theater")
    EndTextCommandSetBlipName(blip)

    RequestIpl("v_cinema")
    blipsLoaded = true
  end
end



function randomVideo()
 n = GetRandomIntInRange(0, 4)
   if n == 0 then
    return "PL_CINEMA_CARTOON"
   elseif n == 1 then
    return "PL_CINEMA_ARTHOUSE"
   elseif n == 2 then
    return "PL_CINEMA_MULTIPLAYER"
   elseif n == 3 then
    return "PL_CINEMA_MULTIPLAYER_NO_MELTDOWN" 
   elseif n == 4 then
    return "PL_CINEMA_ACTION"   
   end
end
		 

function SetupMovie()

  cinema = GetInteriorAtCoords(320.217, 263.81, 82.974)
  LoadInterior(cinema)
--this gets the hash key of the cinema screen
  cin_screen = GetHashKey("v_ilev_cin_screen")
--this gets the entity ID of screen
  
   if not DoesEntityExist(tv1) then
     tv = CreateObjectNoOffset(cin_screen, 320.1257, 248.6608, 86.56934, 1, true, false)
	 SetEntityHeading(tv, 179.99998474121)
    else 
	 tv = GetClosestObjectOfType(319.884, 262.103, 82.917, 20.475, cin_screen, 0, 0, 0)
   end
  --AttachTvAudioToEntity(tv)
  if not IsNamedRendertargetRegistered("cinscreen") then
    RegisterNamedRendertarget("cinscreen", 0)
  end
    if not IsNamedRendertargetLinked(cin_screen) then
        LinkNamedRendertarget(cin_screen)
    end
  rendertargetid = GetNamedRendertargetRenderId("cinscreen")
  if IsNamedRendertargetLinked(cin_screen) and IsNamedRendertargetRegistered("cinscreen") then
    Citizen.InvokeNative(0x9DD5A62390C3B735, 2, randomVideo(), 0)								
	SetTextRenderId(rendertargetid)
	SetTvVolume(100)	
    SetTvChannel(2)
    EnableMovieSubtitles(1)      
    Citizen.InvokeNative(0x67A346B3CDB15CA5, 100.0)
    Citizen.InvokeNative(0x61BB1D9B3A95D802, 4)
    Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
  else 
   SetTextRenderId(GetDefaultScriptRendertargetRenderId())
  end
  if MovieState == false then
    MovieState = true
    CreateMovieThread()
  end
end

function helpDisplay(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function DeconstructMovie()
 local obj = GetClosestObjectOfType(319.884, 262.103, 82.917, 20.475, cin_screen, 0, 0, 0)
  cin_screen = GetHashKey("v_ilev_cin_screen")
  SetTvChannel(-1)  
  ReleaseNamedRendertarget(GetHashKey("cinscreen"))
  SetTextRenderId(GetDefaultScriptRendertargetRenderId())
  SetEntityAsMissionEntity(obj,true,false)
  DeleteObject(obj)
end

function StartMovie()
    DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
end
function CreateMovieThread()
  Citizen.CreateThread(function()
    SetTextRenderId(GetNamedRendertargetRenderId("cinscreen"))
	Citizen.InvokeNative(0x9DD5A62390C3B735, 2, randomVideo(), 0)		
	SetTvChannel(2)
	Citizen.InvokeNative(0x67A346B3CDB15CA5, 100.0)
    Citizen.InvokeNative(0x61BB1D9B3A95D802, 4)
    Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)		
    while(true) do
      Citizen.Wait(0)
      StartMovie()
    end
  end)
end
-- GetEntityCoords(GetPlayerPed(-1), true)
function IsPlayerInArea()
  playerPed = GetPlayerPed(-1)
  playerCoords = GetEntityCoords(playerPed, true)
  hour = GetClockHours()
  -- if GetRoomKeyFromEntity(PlayerPedId()) == -1337806789 then
  --   return
  -- end
--FreezeEntityPosition(GetPlayerPed(-1), 0)
  for k,v in ipairs(cinemaLocations) do
        -- Check if the player is near the cinema
        if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z) < 4.8 then
          -- Check if the cinema is open or closed.
          if hour < openingHour or hour > closingHour then
            helpDisplay("The cinema is ~r~closed ~w~come back between 1am and 22pm.", 0)
          else
            helpDisplay("Press ~INPUT_CONTEXT~ to watch a movie", 0)
            -- Check if the player is near the cinema and pressed "INPUT_CONTEXT"
			if IsControlPressed(0, 38) then
			  SetupMovie()
              -- Teleport the Player inside the cinema
              SetEntityCoords(playerPed, 320.217, 263.81, 81.974, true, true, true, true)
              SetEntityHeading(playerPed, 180.475)
			  TaskLookAtCoord(GetPlayerPed(-1), 319.259, 251.827, 85.648, -1, 2048, 3)
			  FreezeEntityPosition(GetPlayerPed(-1), 1)			  
            end
          end
        end
      end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    IsPlayerInArea()
  end
end)
Citizen.CreateThread(function()
 if GetRoomKeyFromEntity(PlayerPedId()) ~= -1337806789 and DoesEntityExist(GetClosestObjectOfType(319.884, 262.103, 82.917, 20.475, cin_screen, 0, 0, 0)) then
    DeconstructMovie() 
 end
  -- Create the blips for the cinema's
  LoadBlips()      
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPed = GetPlayerPed(-1)    
      -- Check if the player is at the exit door
      if IsControlPressed(0, 322) and GetRoomKeyFromEntity(PlayerPedId()) == -1337806789 then   
        SetEntityCoords(playerPed, 297.891, 193.296, 104.344, 161.925)
		FreezeEntityPosition(GetPlayerPed(-1), 0)
		SetFollowPedCamViewMode(fistPerson)
		DeconstructMovie()
        MovieState = false
      end
    if GetRoomKeyFromEntity(PlayerPedId()) == -1337806789 then
     SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), 1)
	 SetFollowPedCamViewMode(4)
	end 
    end
end)
