local M = {
	random_emoji = function()
		local animals = {
			{ "🦆", "🦖", "🐙", "🦀", "🐘", "🐒", "🦬", "🐱", "🐸" },
		}
		local tier = 1
		local count = 1
		while math.random(0, 1) == 1 do
			if animals[tier + 1] == nil then
				count = count + 1
			else
				tier = tier + 1
			end
		end

		local animal = animals[tier][math.random(#animals[tier])]
		local hatch = require("duck").hatch
		while count > 0 do
			hatch(animal)
			count = count - 1
		end
	end,
}

return M
