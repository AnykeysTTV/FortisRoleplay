resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "KASH:DICEROLL"

client_scripts {
    "client/main.lua",
    "config.lua",
}

server_scripts {
    "server/main.lua",
    "config.lua",
}
client_script '@zb-guard/03923.lua'