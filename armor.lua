--[[

_____ _______  _____   ___________
\__  \\_  __ \/     \ /  _ \_  __ \
 / __ \|  | \/  Y Y  (  <_> )  | \/
(____  /__|  |__|_|  /\____/|__|
     \/            \/
--]]

--~ armor:register_armor("technic_fight:boots", {
	--~ description = "Boots",
	--~ inventory_image = "technic_fight_boots_inv.png",
	--~ texture = "technic_fight_boots.png",
	--~ preview = "technic_fight_boots_preview.png",
	--~ groups = {armor_feet=1, armor_use=500, physics_speed=1.2, flammable=1},
	--~ armor_groups = {fleshy=10, radiation=10},
	--~ damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	--~ reciprocate_damage = true,
	--~ on_destroy = function(player, stack)
		--~ local pos = player:getpos()
		--~ if pos then
			--~ minetest.sound_play({
				--~ name = "mod_name_break_sound",
				--~ pos = pos,
				--~ gain = 0.5,
			--~ })
		--~ end
	--~ end,
--~ })
