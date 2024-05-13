Config = {}

Config.ped = {
    pedModel = 's_m_m_paramedic_01',
    coords = vector4(959.6696, -140.8214, 74.5007-1, 328.4872) ,
}

Config.prixmedecin = 100
Config.itempoursoigner = 'money' 
Config.nomitem = 'Argent'

Config.Notif = {
    ok = {
        titre = 'Tu viens d\'etre soigner',
        description = 'Soin effectuer'
    },

    nok = {
        titre = 'Tu n\'a assez d\'' .. Config.nomitem,
        description = Config.prixmedecin .. ' $' 
    },
}