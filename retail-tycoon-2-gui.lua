local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Maxgat5/UiLib/main/lua')))()
local w = library:CreateWindow("Retail Tycoon 2")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("Vehicle")
local g = w:CreateFolder("Character")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")
SelectedItemToPlace = ""
Items = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Sellables:GetChildren()) do
    for i,v1 in pairs(v.Variants:GetChildren()) do
        table.insert(Items,v1.Name)
    end
end

b:Dropdown("Select Item",Items,true,function(a)
    SelectedItemToPlace = a
end)
    
b:Toggle("Place Item",function(bool)
    shared.toggle = bool
    Place = bool
end)

b:Button("Place All Items (Buggy)",function()
    Plot = nil
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == "TextLabel" then
            if tostring(v.Name) == tostring("StoreName") then
                if tostring(v.Text) == tostring(game:GetService("Players").LocalPlayer.Name.."'s Store") then
                    Plot = v.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name
                end
            end
        end
    end
    for i,v in pairs(game:GetService("Workspace").Map.Plots[Plot].Objects:GetDescendants()) do
        if string.find(v.Name,"Shelves") then
            for i,v1 in pairs(game:GetService("ReplicatedStorage").Sellables:GetChildren()) do
                for i,v2 in pairs(v1.Variants:GetChildren()) do
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.StockShelfFunction:InvokeServer(v,tostring(v2.Name))
                    end)
                end
            end
        end
    end
end)

f:Button("Tp Base",function()
    Plot = nil
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == "TextLabel" then
            if tostring(v.Name) == tostring("StoreName") then
                if tostring(v.Text) == tostring(game:GetService("Players").LocalPlayer.Name.."'s Store") then
                    Plot = v.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name
                end
            end
        end
    end
    for i,v in pairs(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name]:GetChildren()) do
        if v.ClassName == "MeshPart" or v.ClassName == "Part" then
            v.CFrame = CFrame.new(game:GetService("Workspace").Map.Plots[Plot].Sign.SignBase.CFrame.Position + Vector3.new(-30,10,0))
        end
    end
end)

f:Button("Tp Market",function()
    for i,v in pairs(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name]:GetChildren()) do
        if v.ClassName == "MeshPart" or v.ClassName == "Part" then
            for i,v1 in pairs(game:GetService("Workspace").Map.Landmarks["Loading Dock"]:GetDescendants()) do
                if v1.Name == "Detector" then
                    v.CFrame = CFrame.new(v1.CFrame.Position + Vector3.new(-10,0,0))
                end
            end
        end
    end
end)

f:Button("Unload Truck",function()
    Plot = nil
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == "TextLabel" then
            if tostring(v.Name) == tostring("StoreName") then
                if tostring(v.Text) == tostring(game:GetService("Players").LocalPlayer.Name.."'s Store") then
                    Plot = v.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name
                end
            end
        end
    end
    for i,v in pairs(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name]:GetChildren()) do
        if v.ClassName == "MeshPart" or v.ClassName == "Part" then
            for i,v1 in pairs(game:GetService("Workspace").Map.Plots[Plot]:GetDescendants()) do
                if string.find(v1.Name,"Door") then
                    if v1:FindFirstChild("Base") then
                        spawn(function()
                            v1.Base.CanCollide = false
                            v.CFrame = CFrame.new(v1.Base.CFrame.Position + Vector3.new(0,0,0))
                        end)
                    end
                end
            end
        end
    end
    wait(1)
    game:GetService("ReplicatedStorage").Remotes.UnloadVehicle:InvokeServer()
end)

g:Button("Tp Base",function()
    Plot = nil
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == "TextLabel" then
            if tostring(v.Name) == tostring("StoreName") then
                if tostring(v.Text) == tostring(game:GetService("Players").LocalPlayer.Name.."'s Store") then
                    Plot = v.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name
                end
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Map.Plots[Plot].Sign.SignBase.CFrame.Position + Vector3.new(-30,10,0))
end)

g:Button("Tp Market",function()
    for i,v in pairs(game:GetService("Workspace").Map.Landmarks["Loading Dock"]:GetDescendants()) do
        if v.Name == "Detector" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.Position + Vector3.new(0,0,0))
        end
    end
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("maxgat5#8395",function()
    setclipboard("maxgat5#8395")
end)
 
u:Button("Discord Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)
 
game:GetService('RunService').Stepped:connect(function()
    spawn(function()
        if AntiAfk == true then
            local bb=game:service'VirtualUser'
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
        end
    end)
end)

while wait() do
    if Place == true then
        Plot = nil
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "TextLabel" then
                if tostring(v.Name) == tostring("StoreName") then
                    if tostring(v.Text) == tostring(game:GetService("Players").LocalPlayer.Name.."'s Store") then
                        Plot = v.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name
                    end
                end
            end
        end
        for i,v in pairs(game:GetService("Workspace").Map.Plots[Plot].Objects:GetDescendants()) do
            if string.find(v.Name,"Shelves") then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.StockShelfFunction:InvokeServer(v,SelectedItemToPlace)
                end)
            end
        end
    end
end