--[[

  ____ _____    ____   ____   ____   ____
_/ ___\\__  \  /    \ /    \ /  _ \ /    \
\  \___ / __ \|   |  \   |  (  <_> )   |  \
 \___  >____  /___|  /___|  /\____/|___|  /
     \/     \/     \/     \/            \/
--]]

local poweruse = 5000
local range = 20
local speed = 10
local max_charge = 100000

technic.register_power_tool("technic_fight:cannon", max_charge)

minetest.register_tool("technic_fight:cannon", {
	description = "Cannon",
	inventory_image = "technic_mining_laser_mk1.png",
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user)
		local meta = minetest.deserialize(itemstack:get_metadata())
		if not meta or not meta.charge then
			return
		end
		if meta.charge >= poweruse then
			local look_dir = user:get_look_dir()
			local look_pos = vector.add(user:get_pos(), vector.divide(user:get_eye_offset(), 10))
			look_pos.y = look_pos.y + 1.625
			local b, node_pos = minetest.line_of_sight(look_pos,
					vector.add(look_pos, vector.multiply(look_dir, range)), 1)
			minetest.add_particle({
				pos = look_pos,
				velocity = vector.multiply(look_dir, speed),
				acceleration = {x=0, y=0, z=0},
				expirationtime = 5,
				size = 8,
				collisiondetection = true,
				collision_removal = true,
				vertical = false,
				texture = "technic_laser_beam_mk1.png^[transform"..math.random(0, 7),
				--~ animation = {Tile Animation definition},
				glow = 10
			})
			minetest.sound_play("technic_laser_mk1", {pos = look_pos, max_hear_distance = 15})
			if not b then
				-- x(t)=x(0)+t*v => t*v=x(t)-x(0) => t=(x(t)-x(0))/v
				minetest.after(vector.length(vector.divide(vector.subtract(node_pos, look_pos), speed)),
						tnt.boom, node_pos, {damage_radius = 3, radius = 2})
			end
			if not technic.creative_mode then
				meta.charge = meta.charge - poweruse
				technic.set_RE_wear(itemstack, meta.charge, max_charge)
				itemstack:set_metadata(minetest.serialize(meta))
			end
		end
		return itemstack
	end,
})