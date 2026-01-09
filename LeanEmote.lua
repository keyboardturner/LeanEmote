
SLASH_LEAN1 = EMOTE628_CMD1 or EMOTE628_CMD2;
SlashCmdList["LEAN"] = function()
	if C_InstanceEncounter and C_InstanceEncounter.IsEncounterInProgress and C_InstanceEncounter.IsEncounterInProgress() then
		return -- does not work with Midnight API
	else
		if C_ChatInfo and C_ChatInfo.PerformEmote then
			C_ChatInfo.PerformEmote("LEAN", "player");
		else
			DoEmote("LEAN", "player");
		end
	end
end

local leanMessages = {
	-- enUS
	["%s leans back."] = true,
	["You lean back."] = true,

	-- frFR
	["%s se penche."] = true,
	["Vous vous penchez."] = true,

	-- deDE
	["%s lehnt sich zurück."] = true,
	["Ihr lehnt Euch zurück."] = true,

	-- esES
	["%s se inclina hacia atrás."] = true,
	["Te inclinas hacia atrás."] = true,

	-- esMX
	["%s se reclina."] = true,
	["Te reclinas."] = true,

	-- itIT
	["%s si appoggia."] = true,
	["Ti appoggi."] = true,

	-- koKR
	["%s|1이;가; 몸을 기댑니다."] = true,
	["당신은 몸을 기댑니다."] = true,

	-- ptBR
	["%s se inclina para trás."] = true,
	["Você se inclina para trás."] = true,

	-- ruRU
	["%s отклоняется назад."] = true,
	["Вы отклоняетесь назад."] = true,

	-- zhCN
	["%s向后倚靠。"] = true,
	["你向后倚靠。"] = true,

	-- zhTW
	["%s向後靠。"] = true,
	["你向後靠。"] = true,
};

-- Chat filter
local function LeanEmoteFilter(self, event, msg, author, ...)
	for pattern in pairs(leanMessages) do
		local luaPattern = pattern:gsub("%%s", ".+");
		if msg:match(luaPattern) then
			return true;
		end
	end
	return false;
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", LeanEmoteFilter); -- technically does not work in an encounter, but silently fails