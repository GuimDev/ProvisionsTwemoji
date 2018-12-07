local LC = LibStub('libChat-1.0')

local function TwemojiS_OnAddOnLoad(eventCode, addOnName)
	if (ProvTwemojiS.name ~= addOnName) then return end

	EVENT_MANAGER:UnregisterForEvent(ProvTwemojiS.name, EVENT_ADD_ON_LOADED)

	LC:registerText(function(channelID, from, text, isCustomerService)
		text = " " .. text .. " "

		for _, emoji in ipairs(ProvTwemojiS.emojiAlias) do
			for _, alias in pairs(emoji.shortcuts) do
				text = text:gsub("(%A)" .. alias .. "(%A)", "%1:" .. emoji.name .. ":%2")
			end
		end

		text = text:gsub('(%A)(:[a-zA-Z0-9_]+:)(%A)', function(l, word, r)
				local name = string.sub(word, 2, -2)
				local char = string.sub(name, 1, 1)
				local emote = (ProvTwemojiS.emojiTable[char] and ProvTwemojiS.emojiTable[char][name])

				if not emote then
					return selected
				else
					return l .. "|t18:18:ProvisionsTwemojiSupport/textures/twemoji_dds/" .. emote .. ".dds|t" .. r
				end
			end)

		return string.sub(text, 2, -2)
	end, ProvTwemojiS.name)
end

EVENT_MANAGER:RegisterForEvent(ProvTwemojiS.name, EVENT_ADD_ON_LOADED, TwemojiS_OnAddOnLoad)
