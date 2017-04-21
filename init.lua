--[[
  __                .__           .__             _____.__       .__     __
_/  |_  ____   ____ |  |__   ____ |__| ____     _/ ____\__| ____ |  |___/  |_
\   __\/ __ \_/ ___\|  |  \ /    \|  |/ ___\    \   __\|  |/ ___\|  |  \   __\
 |  | \  ___/\  \___|   Y  \   |  \  \  \___     |  |  |  / /_/  >   Y  \  |
 |__|  \___  >\___  >___|  /___|  /__|\___  >____|__|  |__\___  /|___|  /__|
           \/     \/     \/     \/        \/_____/       /_____/      \/
--]]

local load_time_start = os.clock()

local modname = minetest.get_current_modname()
local path = minetest.get_modpath(modname)
if minetest.get_modpath("3d_armor") then
	dofile(path.."/armor.lua")
end
if not minetest.setting_getbool("technic_fight_disable_cannon") then
	dofile(path.."/cannon.lua")
end


local time = math.floor(tonumber(os.clock()-load_time_start)*100+0.5)/100
local msg = "["..modname.."] loaded after ca. "..time
if time > 0.05 then
	print(msg)
else
	minetest.log("info", msg)
end
