--


LSP.Settings.Kind = "JSON"
print(LSP.Config.Language)
function LSP.Settings:GetCFGVar(cfgvar)
    return LSP.Config[cfgstr]
end