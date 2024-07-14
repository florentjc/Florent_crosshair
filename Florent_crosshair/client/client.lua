local ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while Config.ForceDisplayCarRadio do
        local wait = 1000
        local ped = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(ped)
        if inVehicle then
            wait = 5
            ShowHudComponentThisFrame(16)
        end
        Citizen.Wait(wait)
    end
end)

local pedWasFreeAiming = nil
local isPedArmed = false
local isPedFreeAiming = false
local oldWeapon = nil
local currentWeapon = nil
local currentWeaponName = ""
local currentWeaponCrosshairType = nil

Citizen.CreateThread(function()
    while Config.UseHtmlCrosshair do
        local playerId = PlayerId()
        local ped = PlayerPedId()
        isPedArmed = IsPedArmed(ped, 1 | 2 | 4)
        isPedFreeAiming = IsPlayerFreeAiming(playerId) and true
        currentWeapon = GetSelectedPedWeapon(ped)
        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
    while Config.UseHtmlCrosshair do
        local ped = PlayerPedId()
        if isPedArmed then
            if oldWeapon == nil or oldWeapon ~= currentWeapon then
                oldWeapon = currentWeapon
                currentWeaponName = GetWeaponName(currentWeapon)
                currentWeaponCrosshairType = GetCrosshairTypeForThisWeapon(currentWeaponName)
            end
            if currentWeaponCrosshairType == false then
                SendNUIMessage({
                    action = "HideAll",
                })
                Citizen.Wait(500)
            elseif pedWasFreeAiming == nil or pedWasFreeAiming ~= isPedFreeAiming then
                pedWasFreeAiming = isPedFreeAiming
                SendNUIMessage({
                    action = currentWeaponCrosshairType,
                    display = isPedFreeAiming,
                })
            end
        else
            SendNUIMessage({
                action = "HideAll",
            })
        end
        Citizen.Wait(500)
    end
end)

function GetWeaponName(weaponModel)
    local WeaponList = ESX.GetWeaponList(true)
    for weaponHash, weaponData in pairs(WeaponList) do
        if weaponModel == weaponHash then
            return weaponData.name
        end
    end
    return nil
end

function GetCrosshairTypeForThisWeapon(weaponName)
    return Config.UseCrosshairOnWeaponCategories[weaponName] or false
end
