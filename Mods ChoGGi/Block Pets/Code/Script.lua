-- See LICENSE for terms

if not g_AvailableDlc.shepard then
	return
end

local mod_EnableMod

-- fired when settings are changed/init
local function ModOptions()
	mod_EnableMod = CurrentModOptions:GetProperty("EnableMod")
end

-- load default/saved settings
OnMsg.ModsReloaded = ModOptions

-- fired when option is changed
function OnMsg.ApplyModOptions(id)
	if id ~= CurrentModId then
		return
	end

	ModOptions()
end

local orig_SpawnPets = SpawnPets
function SpawnPets(...)
	if mod_EnableMod then
		return const.DayDuration
	end

	return orig_SpawnPets(...)
end

local orig_Residence_SpawnAnimal = Residence.SpawnAnimal
function Residence.SpawnAnimal(...)
	if mod_EnableMod then
		return
	end
	return orig_Residence_SpawnAnimal(...)
end

local orig_Service_SpawnAnimal = Service.SpawnAnimal
function Service.SpawnAnimal(...)
	if mod_EnableMod then
		return
	end
	return orig_Service_SpawnAnimal(...)
end
