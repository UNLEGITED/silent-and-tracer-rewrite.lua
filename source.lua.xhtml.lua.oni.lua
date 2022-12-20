local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/ugfYKa1H"))()

Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera



local SilentSettings = {

    SilentAim = true,

    AimLock = false,

    Prediction = 0.132,

    AimLockKeybind = Enum.KeyCode.E,

    Resolver = true,

}

getgenv().SilentSettings = SilentSettings



local GunSettings = {

    ["Double-Barrel SG"] = { --// dh

        ["FOV"] = 10

    },

    ["Double Barrel SG"] = { --// dhm

        ["FOV"] = 10

    },

    ["DoubleBarrel"] = { --// hood customs

    ["FOV"] = 10

    },

    ["Revolver"] = {

        ["FOV"] = 34

    },

    ["SMG"] = {

        ["FOV"] = 4

    },

    ["Shotgun"] = {

        ["FOV"] = 45

    }

}



function Aiming.Check()

    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then

        return false

    end

    local Character = Aiming.Character(Aiming.Selected)

    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value

    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

    if (KOd or Grabbed) then

        return false

    end

    return true

end



task.spawn(function()

    while task.wait() do

        if SilentSettings.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then

            local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity

            game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)

        end 

    end

end)



local Script = {Functions = {}}



Script.Functions.getToolName = function(name)

    local split = string.split(string.split(name, "[")[2], "]")[1]

    return split

end



Script.Functions.getEquippedWeaponName = function(player)

   if (player.Character) and player.Character:FindFirstChildWhichIsA("Tool") then

      local Tool =  player.Character:FindFirstChildWhichIsA("Tool")

      if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then 

         return Script.Functions.getToolName(Tool.Name)

      end

   end

   return nil

end



game:GetService("RunService").RenderStepped:Connect(function()

    if Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer) ~= nil then

        local WeaponSettings = GunSettings[Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer)]

        if WeaponSettings ~= nil then

            Aiming.FOV = WeaponSettings.FOV

        else

            Aiming.FOV = 5

        end

    end    

end)



local __index

__index = hookmetamethod(game, "__index", function(t, k)

    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then

        local SelectedPart = Aiming.SelectedPart

        if (SilentSettings.SilentAim and (k == "Hit" or k == "Target")) then

            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * SilentSettings.Prediction)

            return (k == "Hit" and Hit or SelectedPart)

        end

    end



    return __index(t, k)

end)



RunService:BindToRenderStep("AimLock", 0, function()

    if (SilentSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(SilentSettings.AimLockKeybind)) then

        local SelectedPart = Aiming.SelectedPart

        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * SilentSettings.Prediction)

        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)

    end
 end)

 local hotkey = "V" -- toggle key
local mouse = game.Players.LocalPlayer:GetMouse()


mouse.KeyDown:Connect(function(key)
if key == hotkey then
if getgenv().SilentSettings.SilentAim == true then
 getgenv().SilentSettings.SilentAim = false
else
getgenv().SilentSettings.SilentAim = true
end
end
end)

 
 wait(2)
 loadstring(game:HttpGet("https://raw.githubusercontent.com/whps/rewrite/main/autopred"))()
 wait(2)
 loadstring(game:HttpGet("https://raw.githubusercontent.com/fedstracer/ezu/main/AimingVars6"))()

 getgenv().Settings = {
    AimlockKey = "c",
    AimPart = "Head",
    CheckIfJumpedpart = "UpperTorso",
    AimRadius = 20,
    Disableontargetdeath = true,
    Disableonplayerdeath = false,
    ThirdPerson = true,
    FirstPerson = true,
    Undergroundresolver = true,
    DetectAntiLock = true,
    AntiLockSpeedDetection = 70,
    TeamCheck = false,
    PredictMovement = true,
    PredictionVelocity = 0.16221418,
    CheckIfJumped = true,
    Smoothness = true,
    Notificationmode = false,
    SmoothnessAmount = 0.019
}

getgenv().Visual = {
    Thickness = 3.4,
    Transparency = 1,
    Color = Color3.fromRGB(0, 255, 0),
    FOV = false,
    LINE = false
}

getgenv().Misc = {
    PermKorblox = false,
    PermHeadless = false
}


loadstring(game:HttpGet("https://raw.githubusercontent.com/whps/tracer-rewrite.lua/main/rewritten.lua"))()
