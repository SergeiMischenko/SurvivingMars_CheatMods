--stores default values and some tables

--useful lists
ChoGGi.Tables = {
  --for increasing school/sanatorium traits and adding/removing traits funcs
  NegativeTraits = {"Vegan","Alcoholic","Glutton","Lazy","Refugee","ChronicCondition","Infected","Idiot","Hypochondriac","Whiner","Renegade","Melancholic","Introvert","Coward","Tourist","Gambler"},
  PositiveTraits = {"Workaholic","Survivor","Sexy","Composed","Genius","Celebrity","Saint","Religious","Gamer","DreamerPostMystery","Empath","Nerd","Rugged","Fit","Enthusiast","Hippie","Extrovert","Martianborn"},
  ColonistAges = {"Child","Youth","Adult","Middle Aged","Senior","Retiree",Child = true,Youth = true,Adult = true,["Middle Aged"] = true,Senior = true,Retiree = true},
  ColonistGenders = {"OtherGender","Android","Clone","Male","Female",OtherGender = true,Android = true,Clone = true,Male = true,Female = true},
  ColonistSpecializations = {"scientist","engineer","security","geologist","botanist","medic",scientist = true,engineer = true,security = true,geologist = true,botanist = true,medic = true},
  ColonistBirthplaces = {},
  --display names only! (stored as numbers, not names like the rest; which is why i guessed)
  ColonistRaces = {"White","Black","Asian","Indian","Southeast Asian",White = true,Black = true,Asian = true,Indian = true,["Southeast Asian"] = true},
  --Some names need to be fixed when doing construction placement
  ConstructionNamesListFix = {
    RCRover = "RCRoverBuilding",
    RCDesireTransport = "RCDesireTransportBuilding",
    RCTransport = "RCTransportBuilding",
    ExplorerRover = "RCExplorerBuilding",
    Rocket = "SupplyRocket"
  },
  SchoolTraits = const.SchoolTraits,
  SanatoriumTraits = const.SanatoriumTraits,
  --for mystery menu items (added below after mods load)
  Mystery = {}
}
do
  --build tables
  local ChoGGi = ChoGGi
  local Nations = Nations
  for i = 1, #Nations do
    ChoGGi.Tables.ColonistBirthplaces[#ChoGGi.Tables.ColonistBirthplaces+1] = Nations[i].value
    ChoGGi.Tables.ColonistBirthplaces[Nations[i].value] = true
  end
  local const = const
  --maybe a mod removed them?
  if #const.SchoolTraits < 5 then
    ChoGGi.Tables.SchoolTraits = {"Nerd","Composed","Enthusiast","Religious","Survivor"}
  end
  if #const.SanatoriumTraits < 7 then
    ChoGGi.Tables.SanatoriumTraits = {"Alcoholic","Gambler","Glutton","Lazy","ChronicCondition","Melancholic","Coward"}
  end
end

--stores defaults and constants
ChoGGi.Defaults = {
  _VERSION = 0,
  ConsoleDim = true,
  ConsoleToggleHistory = true,
  FirstRun = true,
  InfopanelCheats = true,
  CleanupCheatsInfoPane = true,
  ShowInterfaceInScreenshots = true,
  NumberKeysBuildMenu = true,
  UseLastOrientation = true,
  ShowCheatsMenu = true,
  ShowShuttleControls = true,
  ShowCallRocket = true,
  DebugGridSize = 10,
  DebugGridOpacity = 15,
--stores custom settings for each building
  BuildingSettings = {},
  Transparency = {},
}

--and constants
ChoGGi.Consts = {
	LightmodelCustom = "PlaceObj('Lightmodel', {\n\t'name', \"ChoGGi_Custom\",\n\t'pp_bloom_strength', 100,\n\t'pp_bloom_threshold', 25,\n\t'pp_bloom_contrast', 75,\n\t'pp_bloom_colorization', 65,\n\t'pp_bloom_inner_tint', RGBA(187, 23, 146, 255),\n\t'pp_bloom_mip2_radius', 8,\n\t'pp_bloom_mip3_radius', 10,\n\t'pp_bloom_mip4_radius', 27,\n\t'exposure', -100,\n\t'gamma', RGBA(76, 76, 166, 255),\n})",

--const.* (I don't think these have default values in-game anywhere, so manually set them.) _GameConst.lua
  RCRoverMaxRadius = 20,
  CommandCenterMaxRadius = 35,
  BreakThroughTechsPerGame = 13,
  OmegaTelescopeBreakthroughsCount = 3,
  ExplorationQueueMaxSize = 10,
  fastGameSpeed = 5,
  mediumGameSpeed = 3,
  MoistureVaporatorPenaltyPercent = 40,
  MoistureVaporatorRange = 5,
  ResearchQueueSize = 4,
  ResourceScale = 1000,
  ResearchPointsScale = 1000,
  guim = 100,
--Consts.* (Consts is a prop object, so we can get the defaults with ReadSettingsInGame below.) _const.lua
  AvoidWorkplaceSols = false,
  BirthThreshold = false,
  CargoCapacity = false,
  ColdWaveSanityDamage = false,
  CommandCenterMaxDrones = false,
  Concrete_cost_modifier = false,
  Concrete_dome_cost_modifier = false,
  CrimeEventDestroyedBuildingsCount = false,
  CrimeEventSabotageBuildingsCount = false,
  CropFailThreshold = false,
  DeepScanAvailable = false,
  DefaultOutsideWorkplacesRadius = false,
  DroneBuildingRepairAmount = false,
  DroneBuildingRepairBatteryUse = false,
  DroneCarryBatteryUse = false,
  DroneConstructAmount = false,
  DroneConstructBatteryUse = false,
  DroneDeconstructBatteryUse = false,
  DroneMeteorMalfunctionChance = false,
  DroneMoveBatteryUse = false,
  DroneRechargeTime = false,
  DroneRepairSupplyLeak = false,
  DroneResourceCarryAmount = false,
  DroneTransformWasteRockObstructorToStockpileAmount = false,
  DroneTransformWasteRockObstructorToStockpileBatteryUse = false,
  DustStormSanityDamage = false,
  Electronics_cost_modifier = false,
  Electronics_dome_cost_modifier = false,
  FoodPerRocketPassenger = false,
  HighStatLevel = false,
  HighStatMoraleEffect = false,
  InstantCables = false,
  InstantPipes = false,
  IsDeepMetalsExploitable = false,
  IsDeepPreciousMetalsExploitable = false,
  IsDeepWaterExploitable = false,
  LowSanityNegativeTraitChance = false,
  LowSanitySuicideChance = false,
  LowStatLevel = false,
  MachineParts_cost_modifier = false,
  MachineParts_dome_cost_modifier = false,
  MaxColonistsPerRocket = false,
  Metals_cost_modifier = false,
  Metals_dome_cost_modifier = false,
  MeteorHealthDamage = false,
  MeteorSanityDamage = false,
  MinComfortBirth = false,
  MysteryDreamSanityDamage = false,
  NoHomeComfort = false,
  NonSpecialistPerformancePenalty = false,
  OutsourceResearch = false,
  OutsourceResearchCost = false,
  OxygenMaxOutsideTime = false,
  PipesPillarSpacing = false,
  Polymers_cost_modifier = false,
  Polymers_dome_cost_modifier = false,
  positive_playground_chance = false,
  PreciousMetals_cost_modifier = false,
  PreciousMetals_dome_cost_modifier = false,
  ProjectMorphiousPositiveTraitChance = false,
  RCRoverDroneRechargeCost = false,
  RCRoverMaxDrones = false,
  RCRoverTransferResourceWorkTime = false,
  RCTransportGatherResourceWorkTime = false,
  rebuild_cost_modifier = false,
  RenegadeCreation = false,
  SeeDeadSanity = false,
  TimeBeforeStarving = false,
  TravelTimeEarthMars = false,
  TravelTimeMarsEarth = false,
  VisitFailPenalty = false,
}

--set game values to saved values
function ChoGGi.SettingFuncs.SetConstsToSaved()
  local ChoGGi = ChoGGi
  local const = const
--Consts.
  local function SetConstsG(Name)
    ChoGGi.ComFuncs.SetConstsG(Name,ChoGGi.UserSettings[Name])
  end
  SetConstsG("AvoidWorkplaceSols")
  SetConstsG("BirthThreshold")
  SetConstsG("CargoCapacity")
  SetConstsG("ColdWaveSanityDamage")
  SetConstsG("CommandCenterMaxDrones")
  SetConstsG("Concrete_cost_modifier")
  SetConstsG("Concrete_dome_cost_modifier")
  SetConstsG("CrimeEventDestroyedBuildingsCount")
  SetConstsG("CrimeEventSabotageBuildingsCount ")
  SetConstsG("CropFailThreshold")
  SetConstsG("DeepScanAvailable")
  SetConstsG("DefaultOutsideWorkplacesRadius")
  SetConstsG("DroneBuildingRepairAmount")
  SetConstsG("DroneBuildingRepairBatteryUse")
  SetConstsG("DroneCarryBatteryUse")
  SetConstsG("DroneConstructAmount")
  SetConstsG("DroneConstructBatteryUse")
  SetConstsG("DroneDeconstructBatteryUse")
  SetConstsG("DroneMeteorMalfunctionChance")
  SetConstsG("DroneMoveBatteryUse")
  SetConstsG("DroneRechargeTime")
  SetConstsG("DroneRepairSupplyLeak")
  SetConstsG("DroneResourceCarryAmount")
  SetConstsG("DroneTransformWasteRockObstructorToStockpileAmount")
  SetConstsG("DroneTransformWasteRockObstructorToStockpileBatteryUse")
  SetConstsG("DustStormSanityDamage")
  SetConstsG("Electronics_cost_modifier")
  SetConstsG("Electronics_dome_cost_modifier")
  SetConstsG("FoodPerRocketPassenger")
  SetConstsG("HighStatLevel")
  SetConstsG("HighStatMoraleEffect")
  SetConstsG("InstantCables")
  SetConstsG("InstantPipes")
  SetConstsG("IsDeepMetalsExploitable")
  SetConstsG("IsDeepPreciousMetalsExploitable")
  SetConstsG("IsDeepWaterExploitable")
  SetConstsG("LowSanityNegativeTraitChance")
  SetConstsG("LowSanitySuicideChance")
  SetConstsG("LowStatLevel")
  SetConstsG("MachineParts_cost_modifier")
  SetConstsG("MachineParts_dome_cost_modifier")
  SetConstsG("MaxColonistsPerRocket")
  SetConstsG("Metals_cost_modifier")
  SetConstsG("Metals_dome_cost_modifier")
  SetConstsG("MeteorHealthDamage")
  SetConstsG("MeteorSanityDamage")
  SetConstsG("MinComfortBirth")
  SetConstsG("MysteryDreamSanityDamage")
  SetConstsG("NoHomeComfort")
  SetConstsG("NonSpecialistPerformancePenalty")
  SetConstsG("OutsourceResearch")
  SetConstsG("OutsourceResearchCost")
  SetConstsG("OxygenMaxOutsideTime")
  SetConstsG("PipesPillarSpacing")
  SetConstsG("Polymers_cost_modifier")
  SetConstsG("Polymers_dome_cost_modifier")
  SetConstsG("positive_playground_chance")
  SetConstsG("PreciousMetals_cost_modifier")
  SetConstsG("PreciousMetals_dome_cost_modifier")
  SetConstsG("ProjectMorphiousPositiveTraitChance")
  SetConstsG("RCRoverDroneRechargeCost")
  SetConstsG("RCRoverMaxDrones")
  SetConstsG("RCRoverTransferResourceWorkTime")
  SetConstsG("RCTransportGatherResourceWorkTime")
  SetConstsG("rebuild_cost_modifier")
  SetConstsG("RenegadeCreation")
  SetConstsG("SeeDeadSanity")
  SetConstsG("TimeBeforeStarving")
  SetConstsG("TravelTimeEarthMars")
  SetConstsG("TravelTimeMarsEarth")
  SetConstsG("VisitFailPenalty")
--const.
  local function SetConst(Name)
    if ChoGGi.UserSettings[Name] then
      const[Name] = ChoGGi.UserSettings[Name]
    end
  end
  SetConst("BreakThroughTechsPerGame")
  SetConst("ExplorationQueueMaxSize")
  SetConst("fastGameSpeed")
  SetConst("mediumGameSpeed")
  SetConst("MoistureVaporatorPenaltyPercent")
  SetConst("MoistureVaporatorRange")
  SetConst("ResearchQueueSize")
  SetConst("RCRoverMaxRadius")
  SetConst("CommandCenterMaxRadius")
  SetConst("OmegaTelescopeBreakthroughsCount")
end

--called everytime we set a setting in menu
function ChoGGi.SettingFuncs.WriteSettings()
  local ChoGGi = ChoGGi
  local ThreadLockKey = ThreadLockKey
  local ThreadUnlockKey = ThreadUnlockKey

  --piss off if we're saving (probably be better to read file afterwards and check if it matches)
  if ChoGGi.Temp.SavingSettingsFile then
    print("Slow arsed hard drive, or something is wrong...")
    return
  end

  CreateRealTimeThread(function()
    ChoGGi.Temp.SavingSettingsFile = true

    local bak = ChoGGi.SettingsFile .. ".bak"
    --locks the file while we write (i mean it says thread, ah well can't hurt)?
    ThreadLockKey(bak)
    AsyncCopyFile(ChoGGi.SettingsFile,bak)
    ThreadUnlockKey(bak)

    ThreadLockKey(ChoGGi.SettingsFile)
    table.sort(ChoGGi.UserSettings)
    --and write it to disk
    local DoneFuckedUp = AsyncStringToFile(ChoGGi.SettingsFile,TableToLuaCode(ChoGGi.UserSettings))
    ThreadUnlockKey(ChoGGi.SettingsFile)

    if DoneFuckedUp then
      print("once", "Failed to save a settings to", ChoGGi.SettingsFile, ":", err)
      return false, DoneFuckedUp
    end

    ChoGGi.Temp.SavingSettingsFile = nil
  end)

end

--read saved settings from file
function ChoGGi.SettingFuncs.ReadSettings()
  local ChoGGi = ChoGGi
  local AsyncFileToString = AsyncFileToString
  local errormsg = "\n\nCheatMod_CheatMenu: Problem loading AppData/Surviving Mars/CheatMenuModSettings.lua\nIf you can delete it and still get this error; please send it and this log to the author.\n\n"

  --try to read settings
	local file_error, Settings = AsyncFileToString(ChoGGi.SettingsFile)
	if file_error then
    file_error = ""
    --no settings file so make a new one
    ChoGGi.SettingFuncs.WriteSettings()
    file_error, Settings = AsyncFileToString(ChoGGi.SettingsFile)
    if file_error then
      return file_error
    end
	end
  --and convert it to lua
  local code_error
  code_error, ChoGGi.UserSettings = LuaCodeToTuple(Settings)
	if code_error then
    print(errormsg)
		return code_error
	end

end

--OptionsApply is the earliest we can call Consts:GetProperties()
function ChoGGi.MsgFuncs.Defaults_OptionsApply()
  local ChoGGi = ChoGGi
  local Consts = Consts

  --if setting doesn't exist then add default
  for Key,Value in pairs(ChoGGi.Defaults) do
    if type(ChoGGi.UserSettings[Key]) == "nil" then
      ChoGGi.UserSettings[Key] = Value
    end
  end

  --get the default values for our Consts
  for SettingName,_ in pairs(ChoGGi.Consts) do
    local setting = Consts:GetDefaultPropertyValue(SettingName)
    if setting then
      ChoGGi.Consts[SettingName] = setting
    end
  end

  --get other defaults not stored in Consts
  ChoGGi.Consts.DroneFactoryBuildSpeed = DroneFactory:GetDefaultPropertyValue("performance")
  local CargoShuttle = CargoShuttle --any globals called more then once = local
  ChoGGi.Consts.StorageShuttle = CargoShuttle:GetDefaultPropertyValue("max_shared_storage")
  ChoGGi.Consts.SpeedShuttle = CargoShuttle:GetDefaultPropertyValue("max_speed")
  ChoGGi.Consts.ShuttleHubShuttleCapacity = ShuttleHub:GetDefaultPropertyValue("max_shuttles")
  ChoGGi.Consts.GravityColonist = 0
  ChoGGi.Consts.GravityDrone = 0
  ChoGGi.Consts.GravityRC = 0
  ChoGGi.Consts.SpeedDrone = Drone:GetDefaultPropertyValue("move_speed")
  ChoGGi.Consts.SpeedRC = RCRover:GetDefaultPropertyValue("move_speed")
  ChoGGi.Consts.SpeedColonist = Colonist:GetDefaultPropertyValue("move_speed")
  ChoGGi.Consts.RCTransportStorageCapacity = RCTransport:GetDefaultPropertyValue("max_shared_storage")
  ChoGGi.Consts.StorageUniversalDepot = UniversalStorageDepot:GetDefaultPropertyValue("max_storage_per_resource")
  --ChoGGi.Consts.StorageWasteDepot = WasteRockDumpSite:GetDefaultPropertyValue("max_amount_WasteRock")
  ChoGGi.Consts.StorageWasteDepot = 70 * ChoGGi.Consts.ResourceScale --^ that has 45000 as default...
  ChoGGi.Consts.StorageOtherDepot = 180 * ChoGGi.Consts.ResourceScale
  ChoGGi.Consts.StorageMechanizedDepot = 3950 * ChoGGi.Consts.ResourceScale
  --^ they're all UniversalStorageDepot

  ChoGGi.Consts.CameraZoomToggle = 8000
  ChoGGi.Consts.HigherRenderDist = 120 --hr.LODDistanceModifier
end

function ChoGGi.MsgFuncs.Defaults_ModsLoaded()
  local ChoGGi = ChoGGi
  local DataInstances = DataInstances
  local g_Classes = g_Classes
  --remove empty entries in BuildingSettings
  if next(ChoGGi.UserSettings.BuildingSettings) then
    --remove any empty building tables
    for Key,_ in pairs(ChoGGi.UserSettings.BuildingSettings) do
      if not next(ChoGGi.UserSettings.BuildingSettings[Key]) then
        ChoGGi.UserSettings.BuildingSettings[Key] = nil
      end
    end
  --if empty table then new settings file or old settings
  else
    --used to add old lists to new combined list
    local function AddOldSettings(OldCat,NewName)
      --is there anthing in the table?
      if type(ChoGGi.UserSettings[OldCat]) == "table" and next(ChoGGi.UserSettings[OldCat]) then
        --then loop through it
        for Key,Value in pairs(ChoGGi.UserSettings[OldCat]) do
          --it likely doesn't exist, but check first and add a blank table
          if not ChoGGi.UserSettings.BuildingSettings[Key] then
            ChoGGi.UserSettings.BuildingSettings[Key] = {}
          end
          --add it to vistors list?
          if NewName == "capacity" and DataInstances.BuildingTemplate[Key].max_visitors then
            ChoGGi.UserSettings.BuildingSettings[Key].visitors = Value
          else
            ChoGGi.UserSettings.BuildingSettings[Key][NewName] = Value
          end
        end
      end
      --remove old settings
      ChoGGi.UserSettings[OldCat] = nil
      --if not then we'll give an error msg for users
      return true
    end
    --then we check if this is an older version still using the old way of storing building settings and convert over to new
    local errormsg = "Error: Couldn't convert old settings to new settings: "
    if not AddOldSettings("BuildingsCapacity","capacity") then
      ChoGGi.Temp.StartupMsgs[#ChoGGi.Temp.StartupMsgs+1] = errormsg .. "BuildingsCapacity"
    end
    if not AddOldSettings("BuildingsProduction","production") then
      ChoGGi.Temp.StartupMsgs[#ChoGGi.Temp.StartupMsgs+1] = errormsg .. "BuildingsProduction"
    end
  end

  --build mysteries list (sometimes we need to reference Mystery_1, sometimes BlackCubeMystery
  ClassDescendantsList("MysteryBase",function(class)
    local scenario_name = g_Classes[class].scenario_name or "Missing Scenario Name"
    local display_name = ChoGGi.CodeFuncs.Trans(g_Classes[class].display_name) or "Missing Name"
    local description = ChoGGi.CodeFuncs.Trans(g_Classes[class].rollover_text) or "Missing Description"

    local temptable = {
      class = class,
      number = scenario_name,
      name = display_name,
      description = description
    }
    --we want to be able to access by for loop, Mystery 7, and WorldWar3
    ChoGGi.Tables.Mystery[scenario_name] = temptable
    ChoGGi.Tables.Mystery[class] = temptable
    ChoGGi.Tables.Mystery[#ChoGGi.Tables.Mystery+1] = temptable
  end)

end
