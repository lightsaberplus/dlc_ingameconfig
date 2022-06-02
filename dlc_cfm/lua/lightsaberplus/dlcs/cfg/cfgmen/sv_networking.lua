--
util.AddNetworkString("LSP.IGC.SetConfig")
util.AddNetworkString("LSP.IGC.GetConfig")

net.Receive("LSP.IGC.SetConfig", function(len,ply)
    local data = net.ReadTable()
    if file.Exists("lightsaberplus/config.json", "DATA") then
        file.Write("lightsaberplus/config.json", util.TableToJSON(data))
    else 
        file.CreateDir("lightsaberplus")
        file.Write("lightsaberplus/config.json", util.TableToJSON(data))
    end
    timer.Simple(0.1,function()
        LSP.Config = data
    end)
end)
net.Receive("LSP.IGC.GetConfig", function(len,ply)

end)
 