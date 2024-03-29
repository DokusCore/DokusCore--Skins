--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function MSG(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("Skins", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function FixIssues(ID, Gender)
  Citizen.InvokeNative(0x77FF8D35EEC6BBC4, ID, 0, 0)
  while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ID) do Wait(0) end
  Citizen.InvokeNative(0x0BFA1BD465CDFEFD, ID) -- ResetPedComponents

  if (Up(Gender) == 'MP_MALE') then
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, 4132004136, false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, 174153218,  false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, 4042989040, false, true, true) -- ApplyShopItemToPed
  elseif (Up(Gender) == 'MP_FEMALE') then
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, 2458758467, false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, 4040004332, false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, 2636455686, false, true, true) -- ApplyShopItemToPed
  end

  -- Execute on all
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0x1D4C528A, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0x3F1F01E5, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0xDA0E2C55, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0x704C908E9C405136, ID) -- N_0x704c908e9c405136
  Citizen.InvokeNative(0xCC8CA3E88256E58F, ID, 0, 1, 1, 1, 0) --UpdatePedVariation
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetPedSkin(ID, Gender, Skin, Face)

  Citizen.InvokeNative(0x77FF8D35EEC6BBC4, ID, 0, 0)
  while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ID) do Wait(0) end
  Citizen.InvokeNative(0x0BFA1BD465CDFEFD, ID) -- ResetPedComponents

  if (Up(Gender) == 'MP_MALE') then
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Torso), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Legs), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Head), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Beard), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Hair), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Eyes), false, true, true) -- ApplyShopItemToPed
  elseif (Up(Gender) == 'MP_FEMALE') then
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Torso), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Legs), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Head), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Hair), false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, TN(Skin.Eyes), false, true, true) -- ApplyShopItemToPed
  end

  -- Set skin waist | size | face features and player height
  if (Skin.Waists ~= nil) then Citizen.InvokeNative(0x1902C4CFCC5BE57C, ID, TN(Skin.Waists)) end
  if (Skin.Size ~= nil) then Citizen.InvokeNative(0xA5BAE410B03E7371, ID, TN(Skin.Size), false, true) end
  for k,v in pairs(Face) do Citizen.InvokeNative(0x5653AB26C82938CF, ID, TN(v.Hash), v.Value) end
  SetPedScale(ID, MyPedSize)

  -- Execute on all
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0x1D4C528A, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0x3F1F01E5, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0xDA0E2C55, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0x704C908E9C405136, ID) -- N_0x704c908e9c405136
  Citizen.InvokeNative(0xCC8CA3E88256E58F, ID, 0, 1, 1, 1, 0) --UpdatePedVariation
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNPCMenuSkins(ID, Gender)
  Citizen.InvokeNative(0x77FF8D35EEC6BBC4, ID, 0, 0)
  while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ID) do Wait(0) end
  Citizen.InvokeNative(0x0BFA1BD465CDFEFD, ID) -- ResetPedComponents

  if (Up(Gender) == 'MP_Male') then
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Male['BODIES_UPPER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Male['BODIES_LOWER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Male['heads'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Male['eyes'], false, true, true) -- ApplyShopItemToPed
  else
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Female['BODIES_UPPER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Female['BODIES_LOWER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Female['heads'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ID, _Skins.Looks.Default.Female['eyes'], false, true, true) -- ApplyShopItemToPed
  end

  -- Execute on all
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0x1D4C528A, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0x3F1F01E5, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, ID, 0xDA0E2C55, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0x704C908E9C405136, ID) -- N_0x704c908e9c405136
  Citizen.InvokeNative(0xCC8CA3E88256E58F, ID, 0, 1, 1, 1, 0) --UpdatePedVariation

  SetModelAsNoLongerNeeded(Gender)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetSkinData()
  MaleData   = TSC('DokusCore:Core:DBGet:Data:Skins', { 'Male', 'All' }).Result
  FemaleData = TSC('DokusCore:Core:DBGet:Data:Skins', { 'Female', 'All' }).Result
  for k,v in pairs(MaleData)   do if (v.Type == 'heads')        then Tabi(MaleHeads, v)    end end
  for k,v in pairs(MaleData)   do if (v.Type == 'BODIES_UPPER') then Tabi(MaleTorsos, v)   end end
  for k,v in pairs(MaleData)   do if (v.Type == 'BODIES_LOWER') then Tabi(MaleLegs, v)     end end
  for k,v in pairs(MaleData)   do if (v.Type == 'eyes')         then Tabi(MaleEyes, v)     end end
  for k,v in pairs(MaleData)   do if (v.Type == 'teeth')        then Tabi(MaleTeeth, v)    end end
  for k,v in pairs(MaleData)   do if (v.Type == 'hair')         then Tabi(MaleHairs, v)    end end
  for k,v in pairs(MaleData)   do if (v.Type == 'beard')        then Tabi(MaleBeards, v)   end end
  for k,v in pairs(MaleData)   do if (v.Type == 'Mustache')     then Tabi(MaleMustache, v) end end
  for k,v in pairs(MaleData)   do if (v.Type == 'Beardstache')  then Tabi(Beardstache, v)  end end
  for k,v in pairs(FemaleData) do if (v.Type == 'heads')        then Tabi(FemaleHeads, v)  end end
  for k,v in pairs(FemaleData) do if (v.Type == 'BODIES_UPPER') then Tabi(FemaleTorsos, v) end end
  for k,v in pairs(FemaleData) do if (v.Type == 'BODIES_LOWER') then Tabi(FemaleLegs, v)   end end
  for k,v in pairs(FemaleData) do if (v.Type == 'eyes')         then Tabi(FemaleEyes, v)   end end
  for k,v in pairs(FemaleData) do if (v.Type == 'teeth')        then Tabi(FemaleTeeth, v)  end end
  for k,v in pairs(FemaleData) do if (v.Type == 'hair')         then Tabi(FemaleHairs, v)  end end
  return true
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CreateNPCs()
  local rMale   = _Skins.Outfits.Male[math.random(#_Skins.Outfits.Male)]
  local rFemale = _Skins.Outfits.Female[math.random(#_Skins.Outfits.Female)]

  for k,v in pairs(_Skins.PEDs) do
    LoadModel(v.Gender)
    local cPed = CreatePed(v.Gender, v.x, v.y, v.z, v.h, false, 0)
    Tabi(NPCs, cPed)
    Citizen.InvokeNative(0xED40380076A31506, cPed, v.Gender, false) --SetPlayerModel
    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, cPed, 0, 0) --EquipPedOutfitPreset
    -- while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, cPed) do Wait(100) end -- IsPedReadyToRender
    Citizen.InvokeNative(0x0BFA1BD465CDFEFD, cPed) -- ResetPedComponents

    if IsPedMale(cPed) then
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Male['BODIES_UPPER'], false, true, true) -- ApplyShopItemToPed
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Male['BODIES_LOWER'], false, true, true) -- ApplyShopItemToPed
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Male['heads'], false, true, true) -- ApplyShopItemToPed
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Male['eyes'], false, true, true) -- ApplyShopItemToPed
    else
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Female['BODIES_UPPER'], false, true, true) -- ApplyShopItemToPed
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Female['BODIES_LOWER'], false, true, true) -- ApplyShopItemToPed
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Female['heads'], false, true, true) -- ApplyShopItemToPed
      Citizen.InvokeNative(0xD3A7B003ED343FD9, cPed, _Skins.Looks.Default.Female['eyes'], false, true, true) -- ApplyShopItemToPed
    end

    Citizen.InvokeNative(0x704C908E9C405136, cPed) -- N_0x704c908e9c405136
    Citizen.InvokeNative(0x58A850EAEE20FAA3, cPed) --PlaceObjectOnGroundProperly
    NetworkGhosting(cPed, true)
    SetVehicleHasBeenOwnedByPlayer(cPed, true)
    if (Low(v.Gender) == 'mp_female') then
      SetPedOutfitPreset(cPed, rFemale)
      Citizen.InvokeNative(0xD710A5007C2AC539, cPed, 0x9925C067, 0) --RemoveTagFromMetaPed
      Citizen.InvokeNative(0xCC8CA3E88256E58F, cPed, 0, 1, 1, 1, 0) --UpdatePedVariation
    else
      SetPedOutfitPreset(cPed, rMale)
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoStartCam()
  StartCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
  EndCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
  SetCamCoord(StartCam, -555.925,-3778.709,238.597)
  SetCamRot(StartCam, -20.0, 0.0, 83)
  SetCameraActive('StartCam', true)
  RenderScriptCams(true, false, 1, true, true)
  SetCamCoord(EndCam, -561.206,-3776.224,239.597)
  SetCamRot(EndCam, -20.0, 0, 270.0)
  SetCamActive(EndCam, true)
  SetCamActiveWithInterp(EndCam, StartCam, 3900, true, true) Wait(3900)
  CamInUse = EndCam
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CreatePedCams()
  MaleCam   = { Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA"), Pos = nil, Rot = nil }
  FemaleCam = { Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA"), Pos = nil, Rot = nil }

  for k,v in pairs(NPCs) do
    local Offset = GetCoords(v)
    local Rotation = GetEntityRotation(v)
    if (k == 1) then MaleCam.Pos, MaleCam.Rot = Offset, Rotation end
    if (k == 2) then FemaleCam.Pos, FemaleCam.Rot = Offset, Rotation end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetTheiMaps()
  if not (iMapsSet) then
    iMapsSet = true
    RequestImap(-1699673416)
    RequestImap(1679934574)
    RequestImap(183712523)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetCameraActive(Type, Bool)
  if ((Type == 'StartCam') and (StartCam ~= nil))  then SetCamActive(StartCam, Bool) end
  if ((Type == 'EndCam') and (EndCam ~= nil))  then SetCamActive(EndCam,  Bool) end
  if ((Type == 'MaleCam') and (MaleCam ~= nil))  then SetCamActive(MaleCam.Cam,  Bool) end
  if ((Type == 'FemaleCam') and (FemaleCam ~= nil))  then SetCamActive(FemaleCam.Cam,  Bool) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SelectionCamera(Data, NPC, Gender, Type)
  local x, y, z = 0.0, 0.0, 0.0
  local Cam, Pos, Rot = Data.Cam, Data.Pos, Data.Rot

  if (Up(Gender) == 'MP_MALE')   then x,y,z = -1.0, -0.5, 0.5 end
  if (Up(Gender) == 'MP_FEMALE') then x,y,z = -1.0, 0.7, 0.5 end
  if (Up(Gender) == 'MP_MALE')   then AttachCamToEntity(Cam, NPC, x,y,z) end
  if (Up(Gender) == 'MP_FEMALE') then AttachCamToEntity(Cam, NPC, x,y,z) end
  if (Up(Gender) == 'MP_MALE')   then SetCamRot(Cam, -4.0, 0, 300.0) end
  if (Up(Gender) == 'MP_FEMALE') then SetCamRot(Cam, -4.0, 0, 230.0) end

  if (Type == 'Body')  then x,y,z = -1.3, 0.0, 0.4  end
  if (Type == 'Eyes')  then x,y,z = -0.3, 0.0, 0.6  end
  if (Type == 'Teeth') then x,y,z = -0.3, 0.1, 0.6  end
  if (Type == 'Face')  then x,y,z = -0.5, 0.0, 0.6  end
  if (Type == 'Legs')  then x,y,z = -1.3, 0.0, -0.2 end

  if (Up(Gender) == 'MP_MALE') then
    if (Type == 'Body')  then AttachCamToEntity(Cam, NPC, x,y,z) SetCamRot(Cam, 0.0, 0, 270.0) end
  else
    if (Type == 'Body')  then AttachCamToEntity(Cam, NPC, x,y,z) SetCamRot(Cam, 0.0, 0, 270.0) end
  end

  SetCamActiveWithInterp(Cam, CamInUse, 2400, true, true)
  CamInUse = Cam
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetAllCameras()
  if (StartCam ~= false)  then SetCamActive(StartCam, false)       DestroyCam(StartCam, true)       StartCam = false   end
  if (EndCam ~= false)    then SetCamActive(EndCam,  false)        DestroyCam(EndCam,  true)        EndCam  = false    end
  if (MaleCam ~= false)   then SetCamActive(MaleCam.Cam,  false)   DestroyCam(MaleCam.Cam,  true)   MaleCam  = false   end
  if (FemaleCam ~= false) then SetCamActive(FemaleCam.Cam,  false) DestroyCam(FemaleCam.Cam,  true) FemaleCam  = false end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetNPCModel(Gender)
  local Ped = nil
  if (Gender == 'MP_MALE') then Ped = NPCs[1] end
  if (Gender == 'MP_FEMALE') then Ped = NPCs[2] end
  Citizen.InvokeNative(0x77FF8D35EEC6BBC4, Ped, 0, 0)
  while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, Ped) do Wait(0) end
  Citizen.InvokeNative(0x0BFA1BD465CDFEFD, Ped) -- ResetPedComponents

  if (Gender == 'MP_MALE') then
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Male['BODIES_UPPER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Male['BODIES_LOWER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Male['heads'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Male['eyes'], false, true, true) -- ApplyShopItemToPed
  else
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Female['BODIES_UPPER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Female['BODIES_LOWER'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Female['heads'], false, true, true) -- ApplyShopItemToPed
    Citizen.InvokeNative(0xD3A7B003ED343FD9, Ped, _Skins.Looks.Default.Female['eyes'], false, true, true) -- ApplyShopItemToPed
  end

  -- Execute on all
  Citizen.InvokeNative(0xD710A5007C2AC539, Ped, 0x1D4C528A, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, Ped, 0x3F1F01E5, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0xD710A5007C2AC539, Ped, 0xDA0E2C55, 0) -- ApplyShopItemToPed
  Citizen.InvokeNative(0x704C908E9C405136, Ped) -- N_0x704c908e9c405136
  Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, 0, 1, 1, 1, 0) --UpdatePedVariation

  SetModelAsNoLongerNeeded(Gender)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Rotation(Dir)
  local Ped = nil
  if (MyGender == 'MP_MALE')   then Ped = NPCs[1] end
  if (MyGender == 'MP_FEMALE') then Ped = NPCs[2] end
  if (Ped ~= nil) then
    local Rot = (GetEntityHeading(Ped) + Dir)
    SetEntityHeading(Ped, (Rot % 360))
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TabiDelKey(tab, val)
  for i, v in ipairs (tab) do if (v.id == val) then tab[i] = nil end end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CustomCamera(Cam, Type)
  CamPos = Type
  local x, y, z = 0.0, 0.0, 0.0
  if (Type == 'Body')  then x,y,z = -1.3, 0.0, 0.4  end
  if (Type == 'Eyes')  then x,y,z = -0.3, 0.0, 0.6  end
  if (Type == 'Teeth') then x,y,z = -0.3, 0.1, 0.6  end
  if (Type == 'Face')  then x,y,z = -0.5, 0.0, 0.6  end
  if (Type == 'Legs')  then x,y,z = -1.3, 0.0, -0.2 end

  if (MyGender == 'MP_MALE')   then AttachCamToEntity(Cam, NPCs[1], x,y,z) end
  if (MyGender == 'MP_FEMALE') then AttachCamToEntity(Cam, NPCs[2], x,y,z) end

  SetCamRot(Cam, 0.0, 0, 270.0)
  SetCamActiveWithInterp(Cam, CamInUse, 2400, true, true)
  CamInUse = Cam
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetScriptForNextUse()
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  MyGender = nil
  CharData = {}
  CharData.Skin = {}
  CharData.Face = {}
  Prompt_Male        = nil
  Prompt_Female      = nil
  Prompt_Enter       = nil
  Group = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Error(Type)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local User = TSC('DokusCore:Core:DBGet:Settings', { 'User', { Sync.SteamID }})
  local Lang = User.Result[1].Language

  if (Type == 'Age') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrAge").MSG, 'Horn', Floor(MSG("ErrAge").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Name') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrName").MSG, 'Horn', Floor(MSG("ErrName").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Nationality') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrNatio").MSG, 'Horn', Floor(MSG("ErrNatio").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Torso') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrTorso").MSG, 'Horn', Floor(MSG("ErrTorso").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Legs') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrLegs").MSG, 'Horn', Floor(MSG("ErrLegs").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Head') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrHead").MSG, 'Horn', Floor(MSG("ErrHead").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Eyes') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrEyes").MSG, 'Horn', Floor(MSG("ErrEyes").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  elseif (Type == 'Hair') then
    SendNUIMessage({ Action = 'Hide' })
    NoteObjective(_("System", "Error", Lang).MSG, MSG("ErrHair").MSG, 'Horn', Floor(MSG("ErrHair").Time * 1000 ))
    SendNUIMessage({ Action = 'Show', Gender = MyGender })
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------













--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
