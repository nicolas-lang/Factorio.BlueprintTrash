--===================================================================================================
-- AutoKill Blueprints in Trash inventory
--===================================================================================================
local function remove_blueprints (event)
	local player = game.players[event.player_index]
	if player.character ~= nil then
		local trash_inventory = player.get_inventory(defines.inventory.character_trash)
		trash_inventory.remove{name="blueprint", count=1}
		trash_inventory.remove{name="blueprint-book", count=1}
		trash_inventory.remove{name="deconstruction-planner", count=1}
		trash_inventory.remove{name="upgrade-planner", count=1}
	end
end

script.on_event(defines.events.on_player_trash_inventory_changed,  function(event) remove_blueprints(event) end)