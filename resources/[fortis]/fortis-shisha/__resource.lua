resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_script {
    "client/client.lua",
    "config.lua",
}

server_scripts {
    "server/server.lua",
    "config.lua",
}
client_script '@fortis-guard/03923.lua'