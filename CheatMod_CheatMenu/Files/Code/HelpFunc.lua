local CCodeFuncs = ChoGGi.CodeFuncs
local CComFuncs = ChoGGi.ComFuncs
local CConsts = ChoGGi.Consts
local CInfoFuncs = ChoGGi.InfoFuncs
local CSettingFuncs = ChoGGi.SettingFuncs
local CTables = ChoGGi.Tables
local CMenuFuncs = ChoGGi.MenuFuncs

local UsualIcon = "UI/Icons/Sections/attention.tga"

function CMenuFuncs.ShowInterfaceInScreenshots_Toggle()
  hr.InterfaceInScreenshot = hr.InterfaceInScreenshot ~= 0 and 0 or 1
  ChoGGi.UserSettings.ShowInterfaceInScreenshots = not ChoGGi.UserSettings.ShowInterfaceInScreenshots

  CSettingFuncs.WriteSettings()
  CComFuncs.MsgPopup("Interface in screenshots: " .. tostring(ChoGGi.UserSettings.ShowInterfaceInScreenshots),
    "Interface",UsualIcon
  )
end

function CMenuFuncs.TakeScreenshot(Bool)
  if Bool == true then
    CreateRealTimeThread(function()
      WaitNextFrame(3)
      LockCamera("Screenshot")
      MovieWriteScreenshot(GenerateScreenshotFilename("SSAA","AppData/"), 0, 64, false)
      UnlockCamera("Screenshot")
    end)
  else
    WriteScreenshot(GenerateScreenshotFilename("SS", "AppData/"))
  end
end

function CMenuFuncs.ResetECMSettings()
  local file = ChoGGi.SettingsFile
  local old = file .. ".old"

  local ResetSettings = function()
    ChoGGi.ResetSettings = true

    ThreadLockKey(old)
    AsyncCopyFile(file,old)
    ThreadUnlockKey(old)

    ThreadLockKey(file)
    AsyncFileDelete(ChoGGi.SettingsFile)
    ThreadUnlockKey(file)

    CComFuncs.MsgPopup("Restart to take effect.","Reset!",UsualIcon)

  end

  CComFuncs.QuestionBox("Are you sure you want to reset ECM settings?\n\nOld settings are saved as " .. old .. "\n\nRestart to take effect.",ResetSettings,"Reset!")
end

function CMenuFuncs.SignsInterface_Toggle()
  ToggleSigns()
  CComFuncs.MsgPopup("Sign, sign, everywhere a sign.\nBlockin' out the scenery, breakin' my mind.\nDo this, don't do that, can't you read the sign?",
    "Signs",UsualIcon,true
  )
end

function CMenuFuncs.OnScreenHints_Toggle()
  SetHintNotificationsEnabled(not HintsEnabled)
  UpdateOnScreenHintDlg()
  CComFuncs.MsgPopup(HintsEnabled,"Hints",UsualIcon)
end

function CMenuFuncs.OnScreenHints_Reset()
  g_ShownOnScreenHints = {}
  UpdateOnScreenHintDlg()
  CComFuncs.MsgPopup("Hints Reset!","Hints",UsualIcon)
end

function CMenuFuncs.NeverShowHints_Toggle()
  ChoGGi.UserSettings.DisableHints = not ChoGGi.UserSettings.DisableHints
  if ChoGGi.UserSettings.DisableHints then
    mapdata.DisableHints = true
    HintsEnabled = false
  else
    mapdata.DisableHints = false
    HintsEnabled = true
  end
  CSettingFuncs.WriteSettings()

  CComFuncs.MsgPopup(tostring(ChoGGi.UserSettings.DisableHints) .. ": Bye bye hints","Hints","UI/Icons/Sections/attention.tga")
end

function CMenuFuncs.MenuHelp_ReportBug()
  if Platform.ged then
    return
  end
  CreateRealTimeThread(function()
    CreateBugReportDlg()
  end)
end

function CMenuFuncs.MenuHelp_About()
  CreateRealTimeThread(
    WaitCustomPopupNotification,
    "Help",
    "Hover mouse over menu item to get description and enabled status" ..
      "\nIf there isn't a status then it's likely a list of options to choose from" ..
      "\n\nFor any issues; please report them to my github/nexusmods page, or email ECM@choggi.org",
    {"OK"}
  )
end
