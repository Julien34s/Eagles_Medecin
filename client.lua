ESX = exports["es_extended"]:getSharedObject()



Citizen.CreateThread(function()
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()

  while not ESX.IsPlayerLoaded() do
    Wait(500)
  end
  onstart()
end)

onstart = function()
    medecinPed()
end

RegisterCommand('test', function()
    onstart()
end)

medecinPed = function()
    local pedModel = Config.ped.pedModel

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(500) 
    end

    local pos = Config.ped.coords
    
    local ped = CreatePed(1, pedModel, pos.x, pos.y, pos.z, pos.h, false, true)

    FreezeEntityPosition(ped,true)
    TaskSetBlockingOfNonTemporaryEvents(ped,true)
    SetEntityInvincible(ped,true)

    local input = {
        { 
          name = 'medecin_menu',
          event = "eagles_medecin:soin", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Me soigner'
        },
      }

      exports["ox_target"]:addLocalEntity(ped, input)
    


end 

RegisterNetEvent('eagles_medecin:soin', function ()
    
    lib.registerContext({
        id = 'soin_menu',
        title = 'Soin',
        options = {
            {
                title = 'Se soigner',
                description = 'Soin coutant',
                icon = 'suitcase-medical',
                event = 'eagles_medecin:soins'
            },
        },

    })
    lib.showContext('soin_menu')
end)

RegisterNetEvent('eagles_medecin:soins', function ()
    local count_item = exports.ox_inventory:Search('count', Config.itempoursoigner)

    if count_item >= Config.prixmedecin then 
        TriggerServerEvent('eagles_medecin:paiement')
        TriggerEvent('esx_ambulancejob:heal', 'big', true)
        lib.notify({
            title = Config.Notif.ok.titre,
            description = Config.Notif.ok.description,
            type = 'success'
        })
    else 
        lib.notify({
            title = Config.Notif.nok.titre,
            description = Config.Notif.nok.description,
            type = 'error'
        })
    end 
end)