local lastTaxibus = nil

local function notify(msg)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(false, false)
end

local function loadModel(model)
    local hash = joaat(model)

    if not IsModelInCdimage(hash) or not IsModelAVehicle(hash) then
        notify('~r~Taxibus: Fahrzeugmodell nicht gefunden: ' .. model)
        return nil
    end

    RequestModel(hash)

    local timeout = GetGameTimer() + 8000
    while not HasModelLoaded(hash) do
        Wait(0)
        if GetGameTimer() > timeout then
            notify('~r~Taxibus: Modell konnte nicht geladen werden.')
            return nil
        end
    end

    return hash
end

local function spawnTaxibus()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local modelHash = loadModel(Config.VehicleModel)
    if not modelHash then return end

    if Config.DeleteOldTaxibus and lastTaxibus and DoesEntityExist(lastTaxibus) then
        DeleteEntity(lastTaxibus)
        lastTaxibus = nil
    end

    local forward = GetEntityForwardVector(ped)
    local spawnCoords = vector3(
        coords.x + forward.x * 6.0,
        coords.y + forward.y * 6.0,
        coords.z
    )

    local vehicle = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, heading, true, false)
    if not DoesEntityExist(vehicle) then
        notify('~r~Taxibus: Fahrzeug konnte nicht erstellt werden.')
        SetModelAsNoLongerNeeded(modelHash)
        return
    end

    SetVehicleOnGroundProperly(vehicle)
    SetVehicleNumberPlateText(vehicle, Config.Plate or 'LSTAXI')
    SetVehicleColours(vehicle, Config.PrimaryColor or 88, Config.SecondaryColor or 0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleEngineOn(vehicle, true, true, false)

    if Config.WarpIntoDriverSeat then
        TaskWarpPedIntoVehicle(ped, vehicle, -1)
    end

    lastTaxibus = vehicle
    SetModelAsNoLongerNeeded(modelHash)

    notify('~y~Los Santos Taxi Shuttle~s~ gespawnt.')
end

RegisterCommand(Config.Command, function()
    spawnTaxibus()
end, false)

TriggerEvent('chat:addSuggestion', '/' .. Config.Command, 'Spawnt den Los Santos Taxi Shuttle')
