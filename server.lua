local ox_inventory = exports.ox_inventory

RegisterNetEvent('eagles_medecin:paiement', function ()
    local playerId = source
    print(Config.prixmedecin)
    print(Config.itempoursoigner)
    ox_inventory:RemoveItem(playerId,Config.itempoursoigner,Config.prixmedecin)
end)