QBConfig = {}

QBConfig.MaxPlayers = GetConvarInt('sv_maxclients', 75) -- Gets max players from config file, default 32
QBConfig.IdentifierType = "steam" -- Set the identifier type (can be: steam, license)
QBConfig.DefaultSpawn = {x=-1035.71,y=-2731.87,z=12.86,a=0.0}

QBConfig.Money = {}
QBConfig.Money.MoneyTypes = {['cash'] = 1000, ['bank'] = 10000, ['crypto'] = 0 } -- ['type']=startamount - Add or remove money types for your server (for ex. ['blackmoney']=0), remember once added it will not be removed from the database!
QBConfig.Money.DontAllowMinus = {'cash', 'crypto'} -- Money that is not allowed going in minus

QBConfig.Player = {}
QBConfig.Player.MaxWeight = 120000 -- Max weight a player can carry (currently 120kg, written in grams)
QBConfig.Player.MaxInvSlots = 41 -- Max inventory slots for a player
QBConfig.Player.Bloodtypes = {
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
}

QBConfig.Server = {} 
QBConfig.Server.closed = false -- 
QBConfig.Server.closedReason = "🔸 Er is op dit moment onderhoud gaande... Join de Discord voor meer informatie: https://discord.gg/QGnSFmcWc4" -- Reason message to display when people can't join the server
QBConfig.Server.uptime = 0 -- Time the server has been up.
QBConfig.Server.whitelist = false -- Enable or disable whitelist on the server
QBConfig.Server.discord = "https://discord.gg/QGnSFmcWc4" -- Discord invite link
QBConfig.Server.PermissionList = {} -- permission list
