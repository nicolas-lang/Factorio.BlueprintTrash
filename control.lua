local function has_value(tab, val)
	if val and tab then
		for index, value in ipairs(tab) do
			if value == val then
				return true
			end
		end
	end
	return false
end
--===================================================================================================
-- AutoKill Blueprints in Trash inventory
--===================================================================================================
local function remove_blueprints(event)
	local player = game.players[event.player_index]
	if player.character ~= nil then
		local trash_inventory = player.get_inventory(defines.inventory.character_trash)
		for i = 1, #trash_inventory do
			local stack = trash_inventory[i]
			if stack.valid_for_read then
				if has_value({"blueprint", "blueprint-book", "deconstruction-planner", "upgrade-planner"}, stack.name) then
					local bp_string = stack.export_stack()
					log(bp_string)
					--if ((stack.custom_description) and (not string.find(stack.custom_description, "!!!"))) then
					trash_inventory[i].clear()
				end
			end
		end
	end
end

script.on_event(
	defines.events.on_player_trash_inventory_changed,
	(function(event)
		remove_blueprints(event)
	end)
)
