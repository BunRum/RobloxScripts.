--Variables
local YouPlayer = game:GetService("Players").LocalPlayer;
local User = YouPlayer.Character;
local StandUser = User:FindFirstChild("Stand");
local CharacterRootPart = User.HumanoidRootPart;
local rs = game.ReplicatedStorage;

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://507184537"
sound.Volume = 0.5
sound.Name = "holamigo"
sound.Parent = User

local playing111 = User.holamigo
        workspace.CurrentCamera.FieldOfView = 70;

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
     Title = "Getting Started",
     Style = 3,
     SizeX = 250,
     SizeY = 500,
     Theme = "Dark"
})

local Page = UI.New({
    Title = "Buttons"
})


Page.Button({
    
    Text = "Gravity Inversion",
    Callback = function()
        rs.GravityInv:FireServer(10)
    end    
})

Page.Toggle({
    
    Text = "Infinite Heal",
    Callback = function(value)
        print(value)
        shared.toggle = value
        if shared.toggle == true then
            repeat wait()
                print("h")
                rs.Heal:FireServer(User.HumanoidRootPart.Position, 50, "rbxassetid://137579113", 2, 0.2);
            until shared.toggle == false
        elseif shared.toggle == false then return end    
    end,
    Enabled = false
})

Page.Toggle({
    Text = "Deflect",
    Callback = function(value)
        print(value)
        shared.toggle = value
        if shared.toggle == false then 
    	    rs.Deflect:FireServer(false);
    	    rs.RTZ:FireServer(false);
    	    playing111:Play()
        elseif shared.toggle == true then
            rs.Deflect:FireServer(true);
            rs.RTZ:FireServer(true);
            playing111:Play()
        end     
    end,
    Enabled = false
})

Page.Toggle({
    Text = "Menacing",
    Callback = function(value)
        print(value)
        shared.toggle = value
        if shared.toggle == false then 
            rs.Menacing:FireServer(false) 
            playing111:Play()
        elseif shared.toggle == true then 
            rs.Menacing:FireServer(true)
            playing111:Play()
        end     
    end,
    Enabled = false
})

Page.Toggle({
    Text = "Anti TimeStop",
    Callback = function(value)
        print(value)
        shared.toggle = value
        local hatched = false
        if shared.toggle == true then playing111:Play() elseif shared.toggle == false then playing111:Play() end
        while shared.toggle == true do wait()
            print("ye")
            if game.Lighting.TS.Value == true then
                rs.Anchor:FireServer(User["Torso"], hatched);
                rs.Anchor:FireServer(User["Right Arm"], hatched);
                rs.Anchor:FireServer(User["Left Arm"], hatched);
                rs.Anchor:FireServer(User["Left Leg"], hatched);
                rs.Anchor:FireServer(User["Right Leg"], hatched);
                rs.Anchor:FireServer(User["Head"], hatched);
                rs.Anchor:FireServer(User["HumanoidRootPart"], hatched);
                rs.Anchor:FireServer(StandUser["Stand Torso"], hatched);
                rs.Anchor:FireServer(StandUser["Stand Right Arm"], hatched);
                rs.Anchor:FireServer(StandUser["Stand Left Arm"], hatched);
                rs.Anchor:FireServer(StandUser["Stand Left Leg"], hatched);
                rs.Anchor:FireServer(StandUser["Stand Right Leg"], hatched);
                rs.Anchor:FireServer(StandUser["Stand Head"], hatched);
                rs.Anchor:FireServer(StandUser["StandHumanoidRootPart"], hatched);
            end
        end    
    end,
    Enabled = false
})

Page.Toggle({
    Text = "Disable TimeStop",
    Callback = function(value)
        print(value)
        shared.toggle = value
        if shared.toggle == true then
            repeat wait()
                game.Lighting.TS.Value = false
                game.Lighting.TSing.Value = false
                game:GetService("Lighting").Timestopping.Value = false
                game.Lighting.TSer.Value = nil
                game.Lighting.Timestopper.Value = "none"
            until shared.toggle == false
        end
    end,
    Enabled = false
})

Page.Button({
    
    Text = "Gravity Inversio1n",
    Callback = function()
        rs.Transparency:FireServer(StandUser.StandHumanoidRootPart, 1)
    end    
})

-- Note: This is just a snippet
Page.Slider({
    Text = "FOV Slider",
    Callback = function(value)
        print(value)
        workspace.CurrentCamera.FieldOfView = value;
        if workspace.CurrentCamera.FieldOfView == 70 then value = 70 end
    end,
    Min = 1,
    Max = 120,
    Def = 70
})

Page.Button({
    
    Text = " Reset FOV ",
    Callback = function()
        workspace.CurrentCamera.FieldOfView = 70;
    end    
})