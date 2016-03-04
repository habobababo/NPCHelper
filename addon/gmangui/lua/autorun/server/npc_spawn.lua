concommand.Add("gman_save", function(ply, cmd, args)
	if ply:GetNWString("usergroup") != "superadmin" then return end

	local GmanSave = {}
	for k, v in pairs(ents.FindByClass("gman")) do
		local SaveGman = {}
		SaveGman.Pos = v:GetPos()
		SaveGman.Angle = v:GetAngles()
		table.insert(GmanSave, SaveGman)
	end
	
	local map = string.lower(game.GetMap())
	file.Write("gman/mapsave/" .. map .. ".txt", util.TableToJSON(GmanSave))
end)
	
hook.Add("InitPostEntity", "gman_postent", function()
	local map = string.lower(game.GetMap())
	local GetGmans = {}
	if file.Exists("gman/mapsave/" .. map .. ".txt", "DATA") then
		GetGmans = util.JSONToTable(file.Read("gman/mapsave/" .. map .. ".txt"))
	end
	for k, v in pairs(GetGmans) do
		local gman = ents.Create("gman")
		gman:SetPos(v.Pos)
		gman:SetAngles(v.Angle)
		gman:Spawn()
	end
end)
