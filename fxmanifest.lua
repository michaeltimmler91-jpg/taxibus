fx_version 'cerulean'
game 'gta5'

name 'lst_shuttle'
author 'Los Santos Taxi / Michael Timmler'
description 'Los Santos Taxi Shuttle based on GTA V Tourbus'
version '1.0.0'

files {
    'data/vehicles.meta',
    'data/carvariations.meta',
    'data/carcols.meta',
    'data/handling.meta'
}

data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'

client_script 'vehicle_names.lua'
