--
--
LSP.Settings = LSP.Settings or {}
LSP.Settings.UI = LSP.Settings.UI or {}
print("ssss")
 
local mb = "lightsaberplus/dlcs/cfg/cfgmen"
 
  
local function LoadFiles(dir)
	local files = file.Find(dir.. "/".. "*", "LUA")

	for k, v in pairs(files) do
		if string.StartWith(v, "cl") then
			if CLIENT then 
				local load = include(dir.. "/".. v)
				if load then load() end
			end

			AddCSLuaFile(dir.. "/".. v)
		end

		if string.StartWith(v, "sv") then
			if SERVER then 
				local load = include(dir.. "/".. v)
				if load then load() end
			end
		end

		if string.StartWith(v, "sh") then
			local load = include(dir.. "/".. v)
			if load then load() end

			AddCSLuaFile(dir.. "/".. v)
		end
	end
end   

if GAMEMODE then 
    LoadFiles("lightsaberplus/dlcs/cfg/cfgmen")
end
hook.Add("InitPostEntity", "LSP_LoadFiles", function()
    LoadFiles(mb)
end)