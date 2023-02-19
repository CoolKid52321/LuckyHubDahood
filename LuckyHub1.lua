--// Source made by dual#3333 and MagixCrane#2801

repeat wait() until game:IsLoaded()

game:GetService("CorePackages").Packages:Destroy()

assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if tostring(args[1]) == "TeleportDetect" then
        return
    elseif tostring(args[1]) == "CHECKER_1" then
        return
    elseif tostring(args[1]) == "CHECKER" then
        return
    elseif tostring(args[1]) == "GUI_CHECK" then
        return
    elseif tostring(args[1]) == "OneMoreTime" then
        return
    elseif tostring(args[1]) == "checkingSPEED" then
        return
    elseif tostring(args[1]) == "BANREMOTE" then
        return
    elseif tostring(args[1]) == "PERMAIDBAN" then
        return
    elseif tostring(args[1]) == "KICKREMOTE" then
        return
    elseif tostring(args[1]) == "BR_KICKPC" then
        return
    elseif tostring(args[1]) == "BR_KICKMOBILE" then
        return
    end
    return old(self, ...)
end)

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")



_G.FakeAnim1 = game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId
_G.FakeAnim2 = game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId
_G.FakeAnim3 = game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId


getgenv().taffy_esp = {
    box = {
        enabled1 = true,
        enabled = false,
        outline = false,
        healthbar = false,
        color1 = Color3.fromRGB(255, 255, 255),
        color2 = Color3.fromRGB(0, 0, 0),
        healthbarcolor = Color3.fromRGB(4, 0, 255)
    },
    tracer = {
        enabled = false,
        unlocktracers = false,
        color = Color3.fromRGB(255, 255, 255)
    },
    name = {
        enabled = false,
        outline = false,
        size = 13,
        font = 2,
        color = Color3.fromRGB(255, 255, 255)
    },
    misc = {
        teamcheck = false,
        useteamcolors = false,
        visibleonly = true
    },
    Toolsshow = {
        enable = false,
        outline = false,
        size = 8,
        font = 3,
        color = Color3.fromRGB(147, 39, 161)
    }
}

function esp(v)
    -- box --
    local BLOCKOUTLINE = Drawing.new("Square")
    BLOCKOUTLINE.Visible = false
    BLOCKOUTLINE.Color = Color3.new(0,0,0)
    BLOCKOUTLINE.Thickness = 3
    BLOCKOUTLINE.Transparency = 1
    BLOCKOUTLINE.Filled = false

    local BOXPLAYER = Drawing.new("Square")
    BOXPLAYER.Visible = false
    BOXPLAYER.Color = taffy_esp.box.color1
    BOXPLAYER.Thickness = 1
    BOXPLAYER.Transparency = 1
    BOXPLAYER.Filled = false

    local HealthBarOUTLINE = Drawing.new("Square")
    HealthBarOUTLINE.Thickness = 3
    HealthBarOUTLINE.Filled = false
    HealthBarOUTLINE.Color = Color3.new(0,0,0)
    HealthBarOUTLINE.Transparency = 1
    HealthBarOUTLINE.Visible = false

    local HealthBarITSELF = Drawing.new("Square")
    HealthBarITSELF.Thickness = 1
    HealthBarITSELF.Filled = false
    HealthBarITSELF.Transparency = 1
    HealthBarITSELF.Visible = false
    
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    local Name = Drawing.new("Text")
    Name.Transparency = 1
    Name.Visible = false
    Name.Color = taffy_esp.name.color
    Name.Size = 16
    Name.Center = true
    Name.Outline = false
    Name.Font = 2
    Name.Text = "name [100/100]"

    local toolshow = Drawing.new("Text")
    toolshow.Transparency = 1
    toolshow.Visible = false
    toolshow.Color = getgenv().taffy_esp.Toolsshow.color
    toolshow.Size = 16
    toolshow.Center = true
    toolshow.Outline = false
    toolshow.Font = 2
    toolshow.Text = ""
game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health  > 0 and (not taffy_esp.misc.teamcheck or v.TeamColor == lplr.TeamColor) then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + Vector3.new(0,0.5,0))
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - Vector3.new(0,3,0))
            if (not taffy_esp.misc.visibleonly or onScreen) then
                if taffy_esp.box.enabled1 then
                    BLOCKOUTLINE.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BLOCKOUTLINE.Position = Vector2.new(RootPosition.X - BLOCKOUTLINE.Size.X / 2, RootPosition.Y - BLOCKOUTLINE.Size.Y / 2)
                    BLOCKOUTLINE.Visible = taffy_esp.box.outline
                    BLOCKOUTLINE.Color = taffy_esp.box.color2
    
                    BOXPLAYER.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BOXPLAYER.Position = Vector2.new(RootPosition.X - BOXPLAYER.Size.X / 2, RootPosition.Y - BOXPLAYER.Size.Y / 2)
                    BOXPLAYER.Visible = taffy_esp.box.enabled
                    if not taffy_esp.misc.useteamcolors then
                        local color = v.TeamColor
                        BOXPLAYER.Color = taffy_esp.box.color1
                    else
                        BOXPLAYER.Color = taffy_esp.box.color1
                    end
                        
                    HealthBarOUTLINE.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOUTLINE.Position = HealthBarOUTLINE.Position - Vector2.new(6,0)
                    HealthBarOUTLINE.Visible = taffy_esp.box.outline
    
                    HealthBarITSELF.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
                    HealthBarITSELF.Position = Vector2.new(BOXPLAYER.Position.X - 5, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
                    HealthBarITSELF.Color = taffy_esp.box.healthbarcolor
                    HealthBarITSELF.Visible = taffy_esp.box.healthbar
                    
                    
                    
                    
                else
                    BLOCKOUTLINE.Visible = false
                    BOXPLAYER.Visible = false
                    HealthBarOUTLINE.Visible = false
                    HealthBarITSELF.Visible = false
                end
                if taffy_esp.tracer.enabled then
                    if taffy_esp.tracer.unlocktracers then
                        Tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                    else
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    end
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Visible = taffy_esp.tracer.enabled
                    if not taffy_esp.misc.useteamcolors then
                        local color = v.TeamColor
                        Tracer.Color = taffy_esp.tracer.color
                    else
                        Tracer.Color = taffy_esp.tracer.color
                    end
                else
                    Tracer.Visible = false
                end

                if taffy_esp.Toolsshow.enable then
                      local Equipped = v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChildOfClass("Tool").Name or "None"
                    toolshow.Text = Equipped
                    toolshow.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y + 30)
                    toolshow.Color = getgenv().taffy_esp.Toolsshow.color
                    toolshow.Font = 3
                    Name.Size = taffy_esp.Toolsshow.size
                    toolshow.Visible = true
                    else
                        toolshow.Visible = false
                end


                if taffy_esp.name.enabled then
                    Name.Text = tostring(v.Character.Humanoid.DisplayName).. " [" .. tostring(math.floor(v.Character.Humanoid.Health + 0.5)) .. "/" .. tostring(v.Character.Humanoid.MaxHealth) .. "]"
                    Name.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
                    Name.Visible = true
                    Name.Size = taffy_esp.name.size
                    if not taffy_esp.misc.useteamcolors then
                        local color = v.TeamColor
                        Name.Color = taffy_esp.name.color
                    else
                        Name.Color = taffy_esp.name.color
                    end
                    Name.Outline = taffy_esp.name.outline
                else
                    Name.Visible = false
                end
            else
                BLOCKOUTLINE.Visible = false
                BOXPLAYER.Visible = false
                toolshow.Visible=false
                HealthBarOUTLINE.Visible = false
                HealthBarITSELF.Visible = false
                Tracer.Visible = false
                Name.Visible = false
            end
        else
            toolshow.Visible=false
            BLOCKOUTLINE.Visible = false
            BOXPLAYER.Visible = false
            HealthBarOUTLINE.Visible = false
            HealthBarITSELF.Visible = false
            Tracer.Visible = false
            Name.Visible = false
        end
    end)
end

for i,v in pairs(game.Players:GetChildren()) do
    esp(v)
end

game.Players.PlayerAdded:Connect(function(v)
    esp(v)
end)

local azure = {
    UISettings = {
        Rainbow = nil
    },
    Aiming = {
        Aimbot = {
            Enabled = nil,
            Prediction = nil,
            Hitbox = nil,
            Smoothing = {
                Enabled = nil,
                Value = nil
            },
            VelocityResolver = nil,
            ReverseResolver = nil,
            Alerts = nil
        },
        Target = {
            Enabled = nil,
            Prediction = nil,
            Hitbox = nil,
            Alerts = nil,
            Tracer = {
                Enabled = nil,
                Color = nil,
                From = nil,
            },
            PingBased = nil,
            Highlight = {
                Enabled = nil,
                FillColor = nil,
                OutlineColor = nil
            },
            LookAt = nil,
            ViewAt = nil,
            FakeHitbox = {
                Enabled = nil,
                Color = nil,
                Size = nil,
                Material = nil
            },
            Offset = {
                Y = nil
            },
            Dot = {
                Enabled = nil,Color = nil
            }
        },
        WristPos = {
            Enabled = nil,
            Distance = nil
        },
        TargetStrafe = {
            Enabled = nil,
            Speed = nil,
            Distance = nil,
            Height = nil,
            Visualize = {
                Enabled = nil,
                Color = nil
            }
        }
    },
    Blatant = {
        CFrame = {
            Enabled = nil,
            Value = nil
        },
        Exploits = {
            AutoStomp = nil,
            AntiBag = nil,
            NoSlow = nil,
            JumpCooldown = nil
        },
        AntiStomp = {
            Enabled = nil,
            Type = nil
        },
        FakeLag = {
            Enabled = nil,
            Duration = nil
        },
        AntiAim = {
            SemiLegit = nil,
            VelocityUnderGround = nil,
            VelocityUnderGroundAmount = nil,
            RotVelocity = {
                Enabled = nil,Value = nil
            }
        },
        GunMod = {
            AutoReload = nil
        },
        ToolReach = nil
    },
    Visuals = {
        Local = {
            Chams = nil,
            Highlight = {
                Enabled = nil,
                FillColor = nil,
                OutlineColor = nil,
            },
            CloneChams = {
                Enabled = nil,
                Duration = nil,
                Color = nil,
                Material = nil
            }
        },
    }
}
   

local LocalPlayer = game.Players.LocalPlayer

local LocalPlayerObjs = {
    Mouse = LocalPlayer:GetMouse()
}

local RunService = game:GetService("RunService")

repeat
    task.wait()
until game:IsLoaded()

local Eclipse_Settins = {
    Camlock = {
        enable = false,
        grabbed_check = false,
        pickup_check = false,
        wallcheck = false,
        prediciton = 0.121,
        smoothness = false,
        smoothness_value = 0.0065,
        aiming_part = "UpperTorso",
        resolver = false, -----fucks ups prediction
        autopred = false,
        resolver_type = "Underground",
        keybind = Enum.KeyCode.Q
    },
    target_aim = {
        enable = false,
        toggled = false,
        prediciton = 0.121,
        lookat = false,
        resolver = false,
        aiming_part = "HumanoidRootPart",
        wallcheck = false,
        grabbed_check = false,
        pickup_check = false,
        notify = false,
        unlocked_on_knocked = false,
        resolver_type = "Undeground",
        reload_on_knocked = false,
        target_strafe = {
            toggle = false,
            height = 0,
            speed = 1,
            distance = 4,
            color = Color3.fromRGB(255,255,255)
        },
        keybind = Enum.KeyCode.Q,

        tracer = false,
        tracer_color = Color3.fromRGB(255,255,255),
        fakehitbox = false,
        fakehitbox_color = Color3.fromRGB(255,255,255),
        fakehitbox_material = "ForceField",
        Highlight = false,
        Highlight_COlor =  Color3.fromRGB(255,255,255),
        methodtoget = "Closet to mouse"

    },

    silent_aim = {
        enable = false,
        wallcheck = false,
        grabbed_check = false,
        pickup_check = false,
        Random_hitbox = false,
        chance = 100,
        prediciton = 0.121,
        aiming_part = "HumanoidRootPart",
        crewcheck =false,
        friendcheck = false,

        fov = {
            enable =false,
            size = 100,
            visible =false,
            sizes =  0,
            filled = false,
            color = Color3.fromRGB(255,255,255)
        }
    },

    anti_aim = {
        vecspoofer = {
            toggle = false,
            X_Axis = 0,
            Y_Axis = 0,
            Z_Axis = 0,
            multiple = 0,
            desync = false
        }
    },

    cframe_speed = {
        enable = false,
        toggled = false,
        speed = 1,
        keybind = Enum.KeyCode.Z
    },



    miscs = {
        auto_stomp = false,
        deley = 0,
        bullet_tracer ={
            toggle =false,
            color = Color3.fromRGB(255,255,255)
        },
        anti_stomp = {
            enable = false,
            delata = 0,
            anti_stommp_method = "Destroy"
        },
        world_ambince =  false,
        world_ambince_color = Color3.fromRGB(255,255,255),
        clone = {
            toggle = false,
            timedestroy = 1,
            matreial = "Neon",
            color = Color3.fromRGB(255,255,255),
            Transpancy = 0
        },
        bhop = false,
        auto_reload = false,
        remove_jump_cooldown  =false,
        anti_slow = false,
        jumpstarfe = false,
        jumpstarfe_speed = 2,
        jumpbhopcooldown = 0,
        bulletimpact = false,
        bulletimpactmaterial = "Neon",
        bulletimpactcolor = Color3.fromRGB(255,255,255),
        granade_tracer = false,
        granade_color = Color3.fromRGB(255,255,255),
        bulletimpactdelay = 1
    },

    esp = {
        toggle = false,
        maxdis = math.huge,
        box = false,
        box_color = Color3.fromRGB(255,255,255),
        box_filled = false,
        tracer = false,
        tracer_home = "Down",
        tracer_Color = Color3.fromRGB(255,255,255),
        healthbar = false,
        health_text = false,
        health_text_color = Color3.fromRGB(255,255,255),
        health_font = 2,
        armor_bar = false,
        armor_emoji = false,
        names = false,
        names_font = 2,
        names_color = Color3.fromRGB(255,255,255),
        names_size = 12
    },

    display_target_info = { ----this will be drawing 
    toggle = false,
    health =false,
    armor = false,
    checkingwinning = false,
    inventory = false
    }
}


local storange = { Instance = {}, models= {}} ---

----local functions----



function checkifalive(player) --checks if the player is alive 
    if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health ~= 1 and player.Character:FindFirstChild("Head") then
        return true
    end
end

local function getSev(x)
    return game:GetService(x)
 end
local teleporting = false
getgenv().tweenteleport = function()
    
end

function WallCheck(origin, selfpart) ---rewrteied 
    if true then
        local ignore = {game.Workspace.CurrentCamera, game.Players.LocalPlayer.Character, origin.Parent}
        local parts = game.Workspace.CurrentCamera:GetPartsObscuringTarget({ origin.Position,selfpart.Position},ignore )
        for _,v in pairs(parts) do
            if v.Transparency >= 0.3 or 0.4 then
                Storage.Instance[#Storage.Instance + 1] = v
            end
            if v.Material == Enum.Material.Glass then
                Storage.Instance[#Storage.Instance + 1] = v
            end
        end
        return #parts == 0
    end
    return true
end

function Wallcheck2(Player)
    local raybeamkaboom = Ray.new(game.Players.LocalPlayer.Character.Head.Position, (Player.Position - game.Players.LocalPlayer.Character.Head.Position).Unit * 300)
    local Part, Position = workspace:FindPartOnRayWithIgnoreList(raybeamkaboom, {game.Players.LocalPlayer.Character}, false, true)
    if Part then
        local Humanoid = Part.Parent:FindFirstChildOfClass('Humanoid')
        if not Humanoid then
            Humanoid = Part.Parent.Parent:FindFirstChildOfClass('Humanoid')
        end
        if Humanoid and Player and Humanoid.Parent == Player.Parent then
            local Vector, OnScreen = workspace.CurrentCamera:WorldToScreenPoint(Player.Position)
            if OnScreen then 
                return true
            end
        end
    end
end

function usechance(x)
    x = math.floor(x)
    local newchance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    return newchance <= x / 100
end

function reloadgun()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))
            end
    end
end

function cframefix()
    if checkifalive(game.Players.LocalPlayer) then
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                if child:FindFirstChild("LocalScript") and checkifalive(game.Players.LocalPlayer) then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
local glitch = false
local clicker = false
end
end



function destroybody()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("MeshPart") then
            v:Destroy()
        end
    end
end



-----LOCALS----
---faster way

local target = nil
local workspace = getSev("Workspace")
local players = getSev("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local runservice =  game:GetService("RunService")	
local mouse = game.Players.LocalPlayer:GetMouse()
local vec3 = Vector3.new
local vec2 = Vector2.new
local cf = CFrame.new
local Rnew = Ray.new
local draw = Drawing.new
local mh = math.huge
local cfa = CFrame.Angles
local mp = math.pi
local GuiInset = game:GetService("GuiService"):GetGuiInset().Y

local mathhh = 0
local Eclipse_Folder = Instance.new("Folder", workspace)
local inputservice = game:GetService("UserInputService")
local networtserviceping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
local networthmax = string.split(networtserviceping,'(')
local ping = tonumber(networthmax[1])
local fakehitbox_part = Instance.new("Part", Eclipse_Folder)
local targetlock_hightlight = Instance.new("Highlight",Eclipse_Folder)





Eclipse_Folder.Name = "Eclipse"
Eclipse_Folder.Parent = game.Workspace
fakehitbox_part.CanCollide = false
fakehitbox_part.Anchored = true
fakehitbox_part.Shape = Enum.PartType.Ball
fakehitbox_part.Size = vec3(10,10,10)



local hitboxes =  {
    "HumanoidRootPart",
    "UpperTorso",
    "LowerTorso",
    "Head",
    "RightHand",
    "LeftHand",
    "LeftFoot",
    "RightFoot"
}

local main_locations = {
    bank = cf(),
    hidden_spot = cf()
    ---lazy to make
}

local players = game:GetService("Players")
local uis = game:GetService("UserInputService")
local runservice = game:GetService("RunService")
local tweenservice = game:GetService("TweenService")
local marketplaceservice = game:GetService("MarketplaceService")
local textservice = game:GetService("TextService")
local coregui = game:GetService("CoreGui")
local httpservice = game:GetService("HttpService")

local player = players.LocalPlayer
local mouse = player:GetMouse()
local camera = game.Workspace.CurrentCamera

-- main aimbot

getgenv().ZyZKey = Enum.KeyCode.Q
getgenv().Prediction = 1.36
getgenv().Tracer = false
getgenv().TracerBugged = false
getgenv().LookAt = false
getgenv().ZyZPart = "UpperTorso"
getgenv().NotifyZyZ = false
getgenv().ViewPlr = false
getgenv().Enabled = false
_G.AirshotFunction = false
_G.AirshotPart = "UpperTorso"
_G.FRAME = Vector3.new(0,20,0)
_G.FRAME2 = Vector3.new(0,20,0)


local guimain = Instance.new("Folder", game.CoreGui)
local CC = game:GetService "Workspace".CurrentCamera
local LocalMouse = game.Players.LocalPlayer:GetMouse()
local Locking = false
local cc = game:GetService("Workspace").CurrentCamera
local gs = game:GetService("GuiService")
local ggi = gs.GetGuiInset
local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()

local Tracer = Drawing.new("Line")
Tracer.Visible = false
Tracer.Color = Color3.fromRGB(0, 189, 23)
Tracer.Thickness = 2
Tracer.Transparency = 1

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(
    function(keygo, ok)
        if (not ok) then
            if (keygo.KeyCode == getgenv().ZyZKey) then
                if getgenv().Enabled then
                    Locking = not Locking
                    if Locking then
                        Plr = getClosestPlayerToCursor()
                        if getgenv().ViewPlr then
                        	game.Workspace.CurrentCamera.CameraSubject = Plr.Character
                            
                        end
                        if getgenv().NotificationsSound then
                            sound:Play()
                        end
                        if getgenv().NotifyZyZ then
                            Library:Notify(': ' .. Plr.Character.Humanoid.DisplayName)
                        end
                    elseif not Locking then
                        
if getgenv().ViewPlr then
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
end

if getgenv().NotificationsSound then
    sound1:Play()
end

                        if getgenv().NotifyZyZ then
                            Library:Notify('unlock')
                        end
                    end
                end
            end
        end
    end
)
function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = 137

    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                v.Character.Humanoid.Health ~= 0 and
                v.Character:FindFirstChild("UpperTorso")
         then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

local rawmetatable = getrawmetatable(game)
local old = rawmetatable.__namecall
setreadonly(rawmetatable, false)
rawmetatable.__namecall =
    newcclosure(
    function(...)
        local args = {...}
        if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] =
                Plr.Character[getgenv().ZyZPart].Position + (Plr.Character[getgenv().ZyZPart].Velocity * Prediction / 10)
            return old(unpack(args))
        end
        return old(...)
    end
)

game:GetService("RunService").RenderStepped:Connect(
    function()
        if getgenv().autosetup == true then
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local split = string.split(pingvalue, " ")
            local ping = split[1]
            if tonumber(ping) < 30 then
                getgenv().Prediction = 1.14
            elseif tonumber(ping) <= 30 then
                if tonumber(ping) < 40 then
                    getgenv().Prediction = 1.16
                elseif tonumber(ping) <= 40 then
                    if tonumber(ping) < 50 then
                        getgenv().Prediction = 1.19
                    elseif tonumber(ping) <= 50 then
                        if tonumber(ping) < 70 then
                            getgenv().Prediction = 1.22
                        elseif tonumber(ping) <= 80 then
                            getgenv().Prediction = 1.38
                        elseif tonumber(ping) <= 80 then
                            getgenv().Prediction = 1.39
                        elseif tonumber(ping) <= 90 then
                            getgenv().Prediction = 1.42
                        elseif tonumber(ping) <= 150 then
                            getgenv().Prediction = 1.51
                        elseif tonumber(ping) >= 200 then
                            getgenv().Prediction = 1.69
                        end
                    end
                end
            end
        end
        
        if _G.AirshotFunction == true then
            if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().ZyZPart = _G.AirshotPart
            else
                Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(
                    function(old, new)
                        if new == Enum.HumanoidStateType.Freefall then
                            getgenv().Partz = _G.AirshotPart
                        else
                            getgenv().ZyZPart = "UpperTorso"
                        end
                    end
                )
            end
        end

if getgenv().LookAt and Locking and getgenv().Enabled then
                    local Char = game.Players.LocalPlayer.Character
                local PrimaryPartOfChar = game.Players.LocalPlayer.Character.PrimaryPart
                local NearestChar = Plr.Character
                local NearestRoot = Plr.Character.HumanoidRootPart
                local NearestPos = CFrame.new(PrimaryPartOfChar.Position, Vector3.new(NearestRoot.Position.X, NearestRoot.Position.Y, NearestRoot.Position.Z))
                Char:SetPrimaryPartCFrame(NearestPos)
                
    end
        if getgenv().Tracer == true and Locking then
            local Vector, OnScreen =
                cc:worldToViewportPoint(
                Plr.Character[getgenv().ZyZPart].Position + (Plr.Character[getgenv().ZyZPart].Velocity * Prediction / 10)
            )
            Tracer.Visible = true
            Tracer.From = Vector2.new(mouse.X, mouse.Y + ggi(gs).Y)
            Tracer.To = Vector2.new(Vector.X, Vector.Y)
        elseif getgenv().Tracer == false then
            Tracer.Visible = false
        end
if Tracer.Visible == true and not Locking and getgenv().Enabled then
    getgenv().TracerBugged = true
    Tracer.Visible = false
end

if getgenv().Tracer == true and getgenv().TracerBugged and Locking then
    Tracer.Visible = true
end
    end)

local Version = {
    Value = "0.0.1"
}
    
local target_aim = {
    Aiming = {
        Target = {
            Enabled = nil,
            Key = nil,
            Prediction = nil,
            Radius = nil,
            TargetPart = nil,
            Alerts = nil,
            JumpOffset = nil,
            TargetStats = nil,
            LookAt = nil
        }
    }
}

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'LuckyHub | Dahood',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    AimingTab = Window:AddTab('Main'),
    MiscTab = Window:AddTab('Misc'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}


-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.AimingTab:AddLeftGroupbox('TargetBot')
local Player = Tabs.AimingTab:AddLeftGroupbox('Player')
local MovementTab = Tabs.MiscTab:AddLeftGroupbox('Movement')
local FakeAnimationsSec = Tabs.MiscTab:AddLeftGroupbox('Miscellaneous')
local MiscSec = Tabs.MiscTab:AddRightGroupbox('Fake Animations')
local AASec = Tabs.MiscTab:AddRightGroupbox('Anti Lock')
local AIMBOTXD = Tabs.AimingTab:AddRightGroupbox('Camlock')
local UtilitiesSec = Tabs.AimingTab:AddRightGroupbox('Utilities')
local Aimviewers = Tabs.MiscTab:AddLeftGroupbox('Aim Viewers')
local MainVisuals = Tabs.Visuals:AddLeftGroupbox('Main')
local CharVisuals = Tabs.Visuals:AddLeftGroupbox('Character Visuals')
local OtherVisuals = Tabs.Visuals:AddLeftGroupbox('Other')
local CrosshairTab = Tabs.Visuals:AddRightGroupbox('Crosshair')
local WorldVisuals = Tabs.Visuals:AddRightGroupbox('World Visuals')
local OtherMisc = Tabs.MiscTab:AddRightGroupbox('Other')
local StompSets = Tabs.MiscTab:AddLeftGroupbox('Stomps')
-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options
LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Enable',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables targetbot', -- Information shown when you hover over the toggle
}):AddKeyPicker("KeybindXD", {
	Default = "Q",
	SyncToggleState = false,
	Mode = "Always",
	Text = "TargetBot",
	NoUI = false
});

Toggles.MyToggle:OnChanged(function(Bool)
    getgenv().Enabled = Bool;
end);

Options.KeybindXD:OnClick(function()
	getgenv().ZyZKey = Enum.KeyCode[Options.KeybindXD.Value];
end);

LeftGroupBox:AddToggle('Notifications', {
    Text = 'Notifications',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables notifications', -- Information shown when you hover over the toggle
})

Toggles.Notifications:OnChanged(function(Bool)
    getgenv().NotifyZyZ = Bool;
end);

LeftGroupBox:AddToggle('LookAt', {
    Text = 'Look At',
    Default = false, -- Default value (true / false)
    Tooltip = 'Looks at targetted player', -- Information shown when you hover over the toggle
})

Toggles.LookAt:OnChanged(function(Bool)
    getgenv().LookAt = Bool;
end);

LeftGroupBox:AddToggle('SpectateMode', {
    Text = 'Spectate Mode',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables spectate mode', -- Information shown when you hover over the toggle
})

Toggles.SpectateMode:OnChanged(function(Bool)
    getgenv().ViewPlr = Bool;
end);


LeftGroupBox:AddToggle('TracerXD', {
    Text = 'Tracer',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables the tracer', -- Information shown when you hover over the toggle
}):AddColorPicker("TracerColor", {
	Default = Color3.fromRGB(58, 255, 0),
	Title = "Tracer Color"
});

Toggles.TracerXD:OnChanged(function(bool)
    getgenv().Tracer = bool;
end);

Options.TracerColor:OnChanged(function()
	Tracer.Color = Options.TracerColor.Value;
end)

LeftGroupBox:AddToggle('AirshotFunc', {
    Text = 'Airshot Function',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables airshot function', -- Information shown when you hover over the toggle
})

Toggles.AirshotFunc:OnChanged(function(bool)
    _G.AirshotFunction = bool;
end);

LeftGroupBox:AddSlider('TracerThickness', {
    Text = 'Tracer Thickness',

    Default = 2,
    Min = 1,
    Max = 10,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

Options.TracerThickness:OnChanged(function()
    Tracer.Thickness = Options.TracerThickness.Value;
end);


LeftGroupBox:AddSlider('Prediction', {
    Text = 'Prediction',

    Default = 1.2,
    Min = 1,
    Max = 4,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

Options.Prediction:OnChanged(function()
	getgenv().Prediction = Options.Prediction.Value;
end);

LeftGroupBox:AddDropdown('AimPartsssXD', {
    Values = { 'Head', 'UpperTorso', 'LowerTorso' },
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'AimPart',
    Tooltip = 'Changes the targetbot aimpart', -- Information shown when you hover over the textbox
})

Options.AimPartsssXD:OnChanged(function()
    getgenv().ZyZPart = Options.AimPartsssXD.Value;
end);

local UnderGroundXD = LeftGroupBox:AddButton('Underground Resolver', function()
    local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end)
end)

local Otherkzisi9 = LeftGroupBox:AddButton('Other Resolver', function()
    getgenv().VelocityChanger = true
getgenv().Velocity = Vector3.new(200,0,200)


--// main scapt | realkscapter... omg
local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character   = LocalPlayer.Character
local RootPart    = Character:FindFirstChild("HumanoidRootPart")

local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
   Character = NewCharacter
end)

local RVelocity, YVelocity = nil, 0.1

while true do
   if VelocityChanger then
       --// this a dumb check asnilsadsa
       if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
           warn("weird ahh died")
           RootPart = Character:FindFirstChild("HumanoidRootPart")
       else
           RVelocity = RootPart.Velocity
   
           RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)
       
           RStepped:wait()
       
           RootPart.Velocity = RVelocity
       end
   end
   
   Heartbeat:wait()
end
end)


MiscSec:AddDropdown('RunAnimations', {
    Values = { 'None','Rthro','Werewolf','Zombie','Ninja','Toy','Superhero','OldSchool','Cartoony','Stylish','Vampire' },
    Default = 1,
    Multi = false, 

    Text = 'Run',
})

Options.RunAnimations:OnChanged(function()
    ChangeAnimHook = game:GetService("RunService").Stepped:Connect(function ()
        if Options.RunAnimations.Value == "None" then
        elseif Options.RunAnimations.Value == "Rthro" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        elseif Options.RunAnimations.Value == "Werewolf" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
        elseif Options.RunAnimations.Value == "Zombie" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        elseif Options.RunAnimations.Value == "Ninja" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
        elseif Options.RunAnimations.Value == "Toy" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
        elseif Options.RunAnimations.Value == "Superhero" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
        elseif Options.RunAnimations.Value == "OldSchool" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=5319844329"
        elseif Options.RunAnimations.Value == "Cartoony" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
        elseif Options.RunAnimations.Value == "Stylish" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
        elseif Options.RunAnimations.Value == "Vampire" then
            LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
        end
    end)
end)

MiscSec:AddDropdown('JumpAnimations', {
    Values = { 'None','Rthro','Werewolf','Zombie','Ninja','Toy','Superhero','OldSchool','Cartoony','Stylish','Vampire' },
    Default = 1,
    Multi = false, 

    Text = 'Jump',
})

Options.JumpAnimations:OnChanged(function()
    ChangeJumpAnimHook = game:GetService("RunService").Stepped:Connect(function ()
        if Options.JumpAnimations.Value == "None" then
        elseif Options.JumpAnimations.Value == "Rthro" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        elseif Options.JumpAnimations.Value == "Werewolf" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
        elseif Options.JumpAnimations.Value == "Zombie" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
        elseif Options.JumpAnimations.Value == "Ninja" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
        elseif Options.JumpAnimations.Value == "Toy" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
        elseif Options.JumpAnimations.Value == "Superhero" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
        elseif Options.JumpAnimations.Value == "OldSchool" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=5319841935"
        elseif Options.JumpAnimations.Value == "Cartoony" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        elseif Options.JumpAnimations.Value == "Stylish" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
        elseif Options.JumpAnimations.Value == "Vampire" then
            LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
        end
    end)
end)

MiscSec:AddDropdown('FallAnimations', {
    Values = { 'None','Rthro','Werewolf','Zombie','Ninja','Toy','Superhero','OldSchool','Cartoony','Stylish','Vampire' },
    Default = 1,
    Multi = false, 

    Text = 'Fall',
})

Options.FallAnimations:OnChanged(function()
    ChangeFallAnimHook = game:GetService("RunService").Stepped:Connect(function ()
        if Options.FallAnimations.Value == "None" then
        elseif Options.FallAnimations.Value == "Rthro" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
        elseif Options.FallAnimations.Value == "Werewolf" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
        elseif Options.FallAnimations.Value == "Zombie" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
        elseif Options.FallAnimations.Value == "Ninja" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
        elseif Options.FallAnimations.Value == "Toy" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
        elseif Options.FallAnimations.Value == "Superhero" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
        elseif Options.FallAnimations.Value == "OldSchool" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=5319839762"
        elseif Options.FallAnimations.Value == "Cartoony" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
        elseif Options.FallAnimations.Value == "Stylish" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
        elseif Options.FallAnimations.Value == "Vampire" then
            LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
        end
    end)
end)

MovementTab:AddToggle('SpeedBindxd', {
    Text = 'Speed',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables cframe', -- Information shown when you hover over the toggle
}):AddKeyPicker("speedenablelolol", {
	Default = "Z",
	SyncToggleState = true,
	Mode = "Toggle",
	Text = "Speed Toggle",
	NoUI = false
});

Options.speedenablelolol:OnClick(function()
    if speedenablelolol == true
    then speedenablelolol = false
        if speedenablelolol == false
        then speedenablelolol = true
        end
    end
end)

Toggles.SpeedBindxd:OnChanged(function(parameter)
    speedenablelolol = parameter
end)

spawn(function()
    runservice.Heartbeat:Connect(function()
        if speedenablelolol == true then
            player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + player.Character.Humanoid.MoveDirection * SpeedValue
        end
    end)
end)

MovementTab:AddSlider('SpeedAmount', {
    Text = 'Speed Amount',
    Default = 1000,
    Min = 1,
    Max = 5000,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})

Options.SpeedAmount:OnChanged(function(State)
    SpeedValue = State/1000
end)


MovementTab:AddToggle('AutoJump', {
    Text = 'Auto Jump',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables auto jump', -- Information shown when you hover over the toggle
})

Toggles.AutoJump:OnChanged(function(parameter)
    AutoJumpXDlOLOLOL = parameter
end)

local VinGUIS = Aimviewers:AddButton('VinGUI Aim Viewer', function()
    hookfunction(game.Players.LocalPlayer.IsInGroup, function() return true end)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/VinGUI"))()
end)

local AntiAimViewer11 = Aimviewers:AddButton('Anti Aim Viewer', function()
    hookfunction(game.Players.LocalPlayer.IsInGroup, function() return true end)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/AntiAimViewer"))()
end)

MovementTab:AddToggle('FlightBindxdxd', {
    Text = 'Flight',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables flight', -- Information shown when you hover over the toggle
}):AddKeyPicker("XDXDXDLOL", {
	Default = "X",
	SyncToggleState = true,
	Mode = "Toggle",
	Text = "Flight Toggle",
	NoUI = false
});

Options.XDXDXDLOL:OnClick(function()
    if flightxdlol == true
    then flightxdlol = false
        if flightxdlol == false
        then flightxdlol = true
        end
    end
end)

Toggles.FlightBindxdxd:OnChanged(function(parameter)
flightxdlol = parameter    
    if parameter == true then
        FlyLoop = game:GetService("RunService").Stepped:Connect(function()
            spawn(function()
                pcall(function()
                    local speed = FlySpeed
                    local velocity = Vector3.new(0, 1, 0)
                    local UserInputService = game:GetService("UserInputService")
    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.lookVector * speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.rightVector * -speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.lookVector * -speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.rightVector * speed)
                    end
                    
                    player.Character.HumanoidRootPart.Velocity = velocity
                    player.Character.Humanoid:ChangeState("Freefall")
                end)
            end)
        end)
    elseif flightxdlol == false and FlyLoop then
        FlyLoop:Disconnect()
        player.Character.Humanoid:ChangeState("Landing")
    end
end)

MovementTab:AddSlider('SpeedXDE', {
    Text = 'Fly Speed',
    Default = 1000,
    Min = 1,
    Max = 5000,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})

Options.SpeedXDE:OnChanged(function(State)
    FlySpeed = State/1000*50
end)

spawn(function()
    runservice.Heartbeat:Connect(function()
        if targetstrafeenabled and target_aim.Aiming.Target.Enabled and TargetAimEnabled then
            aroundtarget(speedtargetlocks,distancetargetlol,heighttargetlol,AZURE_TmKALRSX)
        end
    end)
end)

AASec:AddButton("Force Reset",function()
    for _,parts in pairs(player.Character:GetChildren()) do
        if parts:IsA("BasePart") then
            parts:Destroy()
        end
    end
end)


AASec:AddToggle('AABindLOL', {
    Text = 'Enable',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables anti lock', -- Information shown when you hover over the toggle
}):AddKeyPicker("fkadkfka", {
	Default = "J",
	SyncToggleState = true,
	Mode = "Toggle",
	Text = "Anti Lock Toggle",
	NoUI = false
});

Options.fkadkfka:OnClick(function()
    if aaenabled == false
    then aaenabled = true
        if aaenabled == true
        then aaenabled = false
end
end
end)

Toggles.AABindLOL:OnChanged(function(parameter)
    aaenabled = parameter
end)

AASec:AddDropdown('AAMODE', {
    Values = { 'Custom', 'Prediction Changer', 'Prediction Disabler', 'Up', 'Down', 'AirOrthodox', 'Prediction Multiplier', 'Spinbot Desync' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Animations',
    Tooltip = 'Choose which anti lock you want', -- Information shown when you hover over the textbox
})

Options.AAMODE:OnChanged(function(dropdown)
    aamodex = dropdown
end)

AASec:AddSlider('CustomX', {
    Text = 'Custom X',
    Default = 10000,
    Min = -10000,
    Max = 10000,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})
AASec:AddSlider('CustomY', {
    Text = 'Custom Y',
    Default = 10000,
    Min = -10000,
    Max = 10000,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})
AASec:AddSlider('CustomZ', {
    Text = 'Custom Z',
    Default = 10000,
    Min = -10000,
    Max = 10000,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})
AASec:AddSlider('PredictionChanger', {
    Text = 'Prediction Changer',
    Default = 5,
    Min = -20,
    Max = 20,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})
AASec:AddSlider('DesyncAngles', {
    Text = 'Desync Angles',
    Default = 1000,
    Min = -1000,
    Max = 1000,
    Rounding = 1,
    Compact = false, -- If set to true, then it will hide the label
})

Options.CustomX:OnChanged(function(State)
    x_val = State
end)

Options.CustomY:OnChanged(function(State)
    y_val = State
end)

Options.CustomZ:OnChanged(function(State)
    z_val = State
end)

Options.PredictionChanger:OnChanged(function(State)
    Custom123 = State
end)

Options.DesyncAngles:OnChanged(function(State)
    DesyncAngles = State
end)

local heartbeat = game:GetService("RunService").Heartbeat
local renderstepped = game:GetService("RunService").RenderStepped
local stepped = game:GetService("RunService").Stepped
local v3 = Vector3.new
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local lp = game.Players.LocalPlayer

spawn(function()
    heartbeat:Connect(function()
        if player.Character.Humanoid.Health <= 10 then
            aaenabled = false
        end
    end)
end)

spawn(function()
    local hrp, c, vel, movel = nil, nil, nil, 0.1
    c = lp.Character
    hrp = lp.Character.HumanoidRootPart
    while true do
        heartbeat:Wait()
        while aaenabled and not (c and c.Parent and hrp and hrp.Parent) do
            heartbeat:Wait()
            c = lp.Character
            hrp = lp.Character.HumanoidRootPart
        end
        if aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Custom" then
            vel = hrp.Velocity
            hrp.Velocity = vel*-0+v3(x_val,y_val,z_val)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end
          elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Prediction Changer" then
            vel = hrp.Velocity
            hrp.Velocity = vel*Custom123+v3(0,0,0)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end

        elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Prediction Disabler" then
            vel = hrp.Velocity
            hrp.Velocity = vel*-0+v3(-0,-0,-0)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end
        elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Up" then
            vel = hrp.Velocity
            hrp.Velocity = vel*-0+v3(-0,10000000000000000000,-0)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end
        elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Down" then
            vel = hrp.Velocity
            hrp.Velocity = vel*-0+v3(-0,-10000000000000000000,-0)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end
            elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "AirOrthodox" then
            vel = hrp.Velocity
            hrp.Velocity = vel*1+v3(77,77,77)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end
                        elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Prediction Multiplier" then
            vel = hrp.Velocity
            hrp.Velocity = vel*7+v3(0,0,0)
            renderstepped:Wait()
            hrp.Velocity = vel
            stepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel + v3(0, movel, 0)
                movel = movel * -1
            end
        elseif aaenabled and c and c.Parent and hrp and hrp.Parent and aamodex == "Spinbot Desync" then
            vel = hrp.Velocity
            hrp.Velocity = vel * 0 + v3(0,10000000000000000000,0)
            renderstepped:Wait()
            if c and c.Parent and hrp and hrp.Parent then
                hrp.Velocity = vel
            end
            player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(DesyncAngles), 0)
        end
    end
end)

spawn(function()
    runservice.Heartbeat:Connect(function()
        if AutoJumpXDlOLOLOL == true and player.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and player.Character.Humanoid.MoveDirection.Magnitude > 0 then
            player.Character.Humanoid:ChangeState("Jumping")
            settotruexdxd:Set(true)
        end
        
    end)
end)

UtilitiesSec:AddToggle('NoJumpCooldown', {
    Text = 'No Jump Cooldown',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables no jump cooldown', -- Information shown when you hover over the toggle
})


Toggles.NoJumpCooldown:OnChanged(function(parameter)
    nn_nojumpcooldown = parameter
end)

spawn(function()
    runservice.Heartbeat:Connect(function()
        if nn_nojumpcooldown then
            player.Character.Humanoid.UseJumpPower = false
        else
            player.Character.Humanoid.UseJumpPower = true
        end
    end)
end)

UtilitiesSec:AddToggle('NoSlowdown', {
    Text = 'No Slowdown',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables no slowdown', -- Information shown when you hover over the toggle
})

Toggles.NoSlowdown:OnChanged(function(parameter)
    nn_noslowdown = parameter
end)

spawn(function()
    runservice.Heartbeat:Connect(function()
        if nn_noslowdown then
            local bodyeffectsBounderies = player.Character.BodyEffects.Movement:FindFirstChild('NoJumping') or player.Character.BodyEffects.Movement:FindFirstChild('ReduceWalk') or player.Character.BodyEffects.Movement:FindFirstChild('NoWalkSpeed')
            if bodyeffectsBounderies then
                bodyeffectsBounderies:Destroy()
            end
            if player.Character.BodyEffects.Reload.Value == true then
                player.Character.BodyEffects.Reload.Value = false
            end
        end
    end)
end)



-- Fetching a toggle object for later use:
-- Toggles.MyToggle.Value

-- Toggles is a table added to getgenv() by the library
-- You index Toggles with the specified index, in this case it is 'MyToggle'
-- To get the state of the toggle you do toggle.Value

-- Calls the passed function when the toggle is updated
-- Groupbox:AddButton
-- Arguments: Text, Callback

local FreeLimss = Player:AddButton('Free Limiteds Script', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CoolKid52321/rasrxrzdrz/main/rezrzrze.txt'))()
end)

local Headless = Player:AddButton('Headless', function()
    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.Transparency = 1
    for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
        if (v:IsA("Decal")) then
            v.Transparency = 1
        end 
    end
end)

local LeftKorblox = Player:AddButton('Left Korblox', function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.LeftFoot.MeshId = "http://www.roblox.com/asset/?id=902942077"
    chr.LeftFoot.Transparency = 1
    chr.LeftLowerLeg.MeshId = "http://www.roblox.com/asset/?id=902942101"
    chr.LeftLowerLeg.TextureID = "http://roblox.com/asset/?id=902842271"
    chr.LeftUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942082"
    chr.LeftUpperLeg.TextureID = "http://roblox.com/asset/?id=902842271"
end)

local RightKorblox = Player:AddButton('Right Korblox', function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.RightLowerLeg.MeshId = "902942093"
    chr.RightLowerLeg.Transparency = "1"
    chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
    chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.RightFoot.MeshId = "902942089"
    chr.RightFoot.Transparency = "1"
end)

local SSHF = Player:AddButton('SSHF', function()
    local L_409_ = game.Players.LocalPlayer.Character
local L_410_ = L_409_:WaitForChild("Head")
local L_411_ = L_410_:WaitForChild("face")
L_411_.Texture = "rbxassetid://494290547"
end)

local Playful = Player:AddButton('Playful Vampire', function()
	local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://2409281591"
end)

local RainbowChracter = Player:AddButton('Rainbow Character', function()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("MeshPart") then
            v.Material = "ForceField"
            spawn(function()
                while wait() do
                    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("MeshPart") then
                            v.Color = Color3.fromHSV(tick()%5/5,1,1)
                            wait()
                        end
                    end 
                end
            end)
        end
    end
end)


local FarmStomp = StompSets:AddButton('Auto Farm Stomps', function()
    local rs = game:GetService("RunService")
    local Players = game:GetService("Players")
    if not Players.LocalPlayer then
      Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    end
    local lp = Players.LocalPlayer
    local connections = {}
    
    local function getchar()
      return lp.Character or lp.CharacterAdded:Wait()
    end
    
    local MainEvent = game:GetService('ReplicatedStorage'):WaitForChild("MainEvent")
    
    local state = false
    local function initchar(char)
      local KO = char:WaitForChild("BodyEffects"):WaitForChild("KO")
      local Humanoid = char:WaitForChild("Humanoid")
    
      connections[Humanoid] = Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
         if KO.Value and Humanoid.Health >= 2 then
            if state then
               repeat task.wait() until not state
               if not KO.Value then return end
            end
            state = true
            local oldpos = getchar():WaitForChild("HumanoidRootPart").CFrame
            repeat
               if char then
                  getchar():WaitForChild("HumanoidRootPart").CFrame = CFrame.new(char:WaitForChild("Head").CFrame.Position) * CFrame.new(0,3,0)
               end
               rs.Heartbeat:Wait()
               MainEvent:FireServer('Stomp')
            until not (Humanoid or Humanoid.Parent or KO.Value) or Humanoid.Health <= 2
            getchar():WaitForChild("HumanoidRootPart").CFrame = oldpos
            state = false
         end
      end)
    end
    
    local function initplayer(plr)
      if not connections[plr] then
         connections[plr] = plr.CharacterAdded:Connect(initchar)
      end
      local plrchar = plr.Character
      if plrchar then
         initchar(plrchar)
      end
    end
    
    connections["PlayerAdded"] = Players.PlayerAdded:Connect(initplayer)
    connections["PlayerRemoving"] = Players.PlayerRemoving:Connect(function(plr)
      if connections[plr] then
         connections[plr]:Disconnect()
         connections[plr] = nil
      end
    end)
    
    for i,v in next, Players:GetPlayers() do
      if v ~= lp then
         initplayer(v)
      end
    end
    
    getgenv().toggle = function()
      for i,v in next, connections do
         v:Disconnect()
         print("Disconnecting",i,v)
      end
      getgenv().toggle = nil
    end
end)

local LowGFX = FakeAnimationsSec:AddButton('Low GFX', function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.ClassName == "Part"
        or v.ClassName == "SpawnLocation"
        or v.ClassName == "WedgePart"
        or v.ClassName == "Terrain"
        or v.ClassName == "MeshPart" then
        v.Material = "Plastic"
        end
        end
end)

local AutoStomp = StompSets:AddButton('Auto Stomp', function()
    while true do
        wait(.05)
        game.ReplicatedStorage.MainEvent:FireServer("Stomp")
        end
end)



local FPSBOOST = FakeAnimationsSec:AddButton('FPS Booster', function()
    local decalsyeeted = true 
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

local SSSSrr = FakeAnimationsSec:AddButton('Memory Spoofer', function()
    local Settings = {
        range1 = 500,
        range2 = 900,
        
    }
    
    for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
        if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
            Memory = v.StatsMiniTextPanelClass.ValueLabel
        end
    end
    
    Memory:GetPropertyChangedSignal("Text"):Connect(function()
        local Random = math.random(Settings.range1,Settings.range2)
        Random = Random * 1.23 
        Memory.Text = "".. Random .." MB"
    end)
end)

UtilitiesSec:AddToggle('BHOPXDLOLOL', {
    Text = 'Bunny Hop',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})

Toggles.BHOPXDLOLOL:OnChanged(function(x)
    Eclipse_Settins.miscs.bhop = x
    Eclipse_Settins.miscs.remove_jump_cooldown = x
    while Eclipse_Settins.miscs.bhop do
        task.wait(Eclipse_Settins.miscs.jumpbhopcooldown)
        if game.Players.LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
        end
    end
end)

UtilitiesSec:AddSlider('BHOPCOOLDOWN', {
    Text = 'BHOP Jump Cooldown',

    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Compact = false,
})

Options.BHOPCOOLDOWN:OnChanged(function(x)
    Eclipse_Settins.miscs.jumpbhopcooldown = x
end);

UtilitiesSec:AddToggle('JUMPSTRAFEXD', {
    Text = 'Jump Strafe',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})

Toggles.JUMPSTRAFEXD:OnChanged(function(x)
    Eclipse_Settins.miscs.jumpstarfe = x

    while Eclipse_Settins.miscs.jumpstarfe do
    task.wait()
    if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 and game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection / Eclipse_Settins.miscs.jumpstarfe_speed)
        end
    end
end)

UtilitiesSec:AddSlider('JUMPSTRAFESPEED', {
    Text = 'Jump Strafe Speed',

    Default = 4,
    Min = 1,
    Max = 10,
    Rounding = 1,

    Compact = false,
})

Options.JUMPSTRAFESPEED:OnChanged(function(x)
    Eclipse_Settins.miscs.jumpstarfe_speed = x
end);

OtherMisc:AddToggle('ANTIFLINGXD', {
    Text = 'Anti Fling',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})

Toggles.ANTIFLINGXD:OnChanged(function(x)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = x
end)

OtherMisc:AddToggle('ATNIBAGDAHOOD', {
    Text = 'Anti Bag',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})

Toggles.ATNIBAGDAHOOD:OnChanged(function(x)
    local value = x
    
    while value do
    task.wait()
        if game.Players.LocalPlayer.Character:FindFirstChild("Christmas_Sock") then
            game.Players.LocalPlayer.Character:FindFirstChild("Christmas_Sock"):Destroy()
        end
    end
end)

OtherMisc:AddToggle('ANTIGRABBEDDAHOOD', {
    Text = 'Anti Grabbed',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})

Toggles.ANTIGRABBEDDAHOOD:OnChanged(function(x)
    local value = x
    while value do
        task.wait()
    game.Players.LocalPlayer.Character["GRABBING_CONSTRAINT"]:Destroy()
    end
end)

CharVisuals:AddToggle('ChamsEnabledTggle', {
    Text = 'Enable Chams',
    Default = false,
    Tooltip = 'Enable Chams',
})

Toggles.ChamsEnabledTggle:OnChanged(function()
    azure.Visuals.Local.Chams = Toggles.ChamsEnabledTggle.Value
end)

task.spawn(function ()
    while true do
        wait()
        if azure.Visuals.Local.Chams then
            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = "ForceField"
                end
            end
        else
            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = "Plastic"
                end
            end
        end
    end
end)
--[[
CharVisuals:AddToggle('GunChamsTggle', {
    Text = 'Enable Gun Chams',
    Default = false, 
    Tooltip = 'Gun Chams Enabled', 
})

Toggles.GunChamsTggle:OnChanged(function()
    azure.Visuals.Local.GunChams.Enabled = Toggles.GunChamsTggle.Value
end)

Toggles.GunChamsTggle:AddColorPicker('GunChamsColr', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Gun Chams Color'
})

Options.GunChamsColr:OnChanged(function()
    azure.Visuals.Local.GunChams.Color = Options.GunChamsColr.Value
end)

task.spawn(function ()
    while true do
        wait()
        if azure.Visuals.Local.GunChams.Enabled then
            if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Default.Material = "ForceField"
                game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Default.Color = azure.Visuals.Local.GunChams.Color
            end
        else
            if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Default.Material = "Plastic"
            end
        end
    end
end)
]]

local LocalHL = Instance.new("Highlight")

CharVisuals:AddToggle('LocalHighlight', {
    Text = 'Highlight',
    Default = false, 
    Tooltip = 'Highlight Enabled', 
})

Toggles.LocalHighlight:OnChanged(function()
    azure.Visuals.Local.Highlight.Enabled = Toggles.LocalHighlight.Value
end)

task.spawn(function ()
    while true do
        wait()
        if azure.Visuals.Local.Highlight.Enabled then
            LocalHL.Parent = LocalPlayer.Character
            LocalHL.FillColor = azure.Visuals.Local.Highlight.FillColor
            LocalHL.OutlineColor = azure.Visuals.Local.Highlight.OutlineColor
        else
            LocalHL.Parent = game.CoreGui
        end
    end
end)

Toggles.LocalHighlight:AddColorPicker('LocalHighlightFillColorColorPicker', {
    Default = Color3.fromRGB(0,215,35),
    Title = 'Highlight Fill Color'
})

Options.LocalHighlightFillColorColorPicker:OnChanged(function()
    azure.Visuals.Local.Highlight.FillColor = Options.LocalHighlightFillColorColorPicker.Value
end)

Toggles.LocalHighlight:AddColorPicker('LocalHighlightOutLineColor', {
    Default = Color3.fromRGB(28, 122, 0),
    Title = 'Highlight Outline Color'
})

Options.LocalHighlightOutLineColor:OnChanged(function()
    azure.Visuals.Local.Highlight.OutlineColor = Options.LocalHighlightOutLineColor.Value
end)

CharVisuals:AddToggle('CloneChamsEnabled', {
    Text = 'Clone Chams',
    Default = false, 
    Tooltip = 'Clone Chams Enabled', 
})

Toggles.CloneChamsEnabled:OnChanged(function()
    azure.Visuals.Local.CloneChams.Enabled = Toggles.CloneChamsEnabled.Value
end)

Toggles.CloneChamsEnabled:AddColorPicker('CloneChamsColor', {
    Default = Color3.fromRGB(0,215,35),
    Title = 'Clone Chams Color'
})

Options.CloneChamsColor:OnChanged(function()
    azure.Visuals.Local.CloneChams.Color = Options.CloneChamsColor.Value
end)

task.spawn(function ()
    while true do
        wait()
        if azure.Visuals.Local.CloneChams.Enabled then
            repeat
                game.Players.LocalPlayer.Character.Archivable = true
                local Clone = game.Players.LocalPlayer.Character:Clone()
                for _,Obj in next, Clone:GetDescendants() do
                if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
                    Obj:Destroy()
                elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
                    if Obj.Transparency == 1 then
                    Obj:Destroy()
                    else
                    Obj.CanCollide = false
                    Obj.Anchored = true
                    Obj.Material = azure.Visuals.Local.CloneChams.Material
                    Obj.Color = azure.Visuals.Local.CloneChams.Color
                    Obj.Transparency = 0
                    Obj.Size = Obj.Size + Vector3.new(0.03, 0.03, 0.03)   
                end
            end
                pcall(function()
                    Obj.CanCollide = false
                end)
            end
            Clone.Parent = game.Workspace
            wait(azure.Visuals.Local.CloneChams.Duration)
            Clone:Destroy()  
            until azure.Visuals.Local.CloneChams.Enabled == false
        end
    end
end)

CharVisuals:AddSlider('DurationSliderWHAT', {
    Text = 'Duration',

    Default = 0.1,
    Min = 0.1,
    Max = 3,
    Rounding = 2,

    Compact = false,
})

Options.DurationSliderWHAT:OnChanged(function()
    azure.Visuals.Local.CloneChams.Duration = Options.DurationSliderWHAT.Value
end)

CharVisuals:AddDropdown('CloneChamsMaterial', {
    Values = { 'Neon', 'ForceField', 'Plastic' },
    Default = 2,
    Multi = false, 

    Text = 'Clone Chams Material',
    Tooltip = 'Clone Chams Material',
})

Options.CloneChamsMaterial:OnChanged(function()
    azure.Visuals.Local.CloneChams.Material = Options.CloneChamsMaterial.Value
end)


OtherVisuals:AddToggle('fkasjkfasfas', {
    Text = 'Grenade Trail',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables grenade trail', -- Information shown when you hover over the toggle
}):AddColorPicker("terztez", {
	Default = Color3.fromRGB(0, 215, 35),
	Title = "Grenade Trail Color"
});

Options.terztez:OnChanged(function(x)
    Eclipse_Settins.miscs.granade_color = x
end)

Toggles.fkasjkfasfas:OnChanged(function(x)
    Eclipse_Settins.miscs.granade_tracer = x

    function createesp(cframe, parent)
        local newpart = Instance.new("Part", parent)
        newpart.Material=  "ForceField"
        newpart.Anchored = true
        newpart.Color = Eclipse_Settins.miscs.granade_color
        newpart.CanCollide =false
        newpart.Size = Vector3.new(0.25,0.25,0.25)
        newpart.CFrame = cframe
    end
    
while Eclipse_Settins.miscs.granade_tracer do
    task.wait()
    for _,v in pairs(game.Workspace.Ignored:GetChildren()) do
        if v.Name == "Handle" then
            createesp(v.CFrame, v)
        end
    end
end
end)

OtherVisuals:AddToggle('fkasjkfatttzcsfas', {
    Text = 'Bullet Tracers',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables or disables bullet tracers', -- Information shown when you hover over the toggle
}):AddColorPicker("terzzzzzzeretez", {
	Default = Color3.fromRGB(0, 215, 35),
	Title = "Bullet Tracers Color"
});

Options.terzzzzzzeretez:OnChanged(function(x)
    Eclipse_Settins.miscs.bullet_tracer.color = x
end)

Toggles.fkasjkfatttzcsfas:OnChanged(function(x)
    Eclipse_Settins.miscs.bullet_tracer.toggle = x
    
        while Eclipse_Settins.miscs.bullet_tracer.toggle do
            if checkifalive(game.Players.LocalPlayer)  then
        task.wait()
        for _,v in pairs(game.Workspace.Ignored:GetChildren()) do
            if v.Name == "BULLET_RAYS" then
               for _,f in pairs(v:GetChildren()) do
                   if f.Name == "GunBeam" then
                         f.Color = ColorSequence.new{
         ColorSequenceKeypoint.new(0, Eclipse_Settins.miscs.bullet_tracer.color),
         ColorSequenceKeypoint.new(1, Eclipse_Settins.miscs.bullet_tracer.color),
         ColorSequenceKeypoint.new(1, Eclipse_Settins.miscs.bullet_tracer.color)
     }
end
end
end
end
end
end
end)



StompSets:AddToggle('rerererereszzz', {
    Text = 'Anti Stomp',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})

Toggles.rerererereszzz:OnChanged(function(x)
    Eclipse_Settins.miscs.anti_stomp.enable = x
    while Eclipse_Settins.miscs.anti_stomp.enable do
        task.wait()
        if checkifalive(game.Players.LocalPlayer) then
            if Eclipse_Settins.miscs.anti_stomp.enable == true then
        if game.Players.LocalPlayer.Character.BodyEffects["K.O"].Value == true  then
        wait(Eclipse_Settins.miscs.anti_stomp.delata)
            if Eclipse_Settins.miscs.anti_stomp.anti_stommp_method == "Destroy" then
                destroybody()
            elseif Eclipse_Settins.miscs.anti_stomp.anti_stommp_method == "Humanoid" then
                game.Players.LocalPlayer.Character.Humanoid:Destroy()
            end
        end
        end
            end
end
end)

StompSets:AddSlider('rerererzrezrzdrx', {
    Text = 'Delay',

    Default = 0,
    Min = 0,
    Max = 19,
    Rounding = 1,

    Compact = false,
})

Options.rerererzrezrzdrx:OnChanged(function(x)
    Eclipse_Settins.miscs.anti_stomp.delata = x
end);

StompSets:AddDropdown('yxyfxdyxfd', {
    Values = { 'Destroy', 'Humanoid' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Anti Stomp Method',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the textbox
})

Options.yxyfxdyxfd:OnChanged(function(x)
    Eclipse_Settins.miscs.anti_stomp.anti_stommp_method = x
end)

AIMBOTXD:AddToggle('AimbotEnabledTggle', {
    Text = 'Enable',
    Default = false,
    Tooltip = 'Enable Aimbot',
})

Toggles.AimbotEnabledTggle:OnChanged(function()
    azure.Aiming.Aimbot.Enabled = Toggles.AimbotEnabledTggle.Value
end)

Toggles.AimbotEnabledTggle:AddKeyPicker('AimbotKeyPickerXD', {
    Default = 'E', 
    SyncToggleState = false, 

    Mode = 'Toggle',

    Text = 'Aimbot', 
    NoUI = false,
})

Options.AimbotKeyPickerXD:OnClick(function()
    if azure.Aiming.Aimbot.Enabled then
        AimbotBindEnabled = not AimbotBindEnabled
        if AimbotBindEnabled then
            AimbotTarget = AimbotGetTarget()
            if azure.Aiming.Aimbot.Alerts then
                Library:Notify("Aiming : "..tostring(AimbotTarget.Character.Humanoid.DisplayName))
            end
        elseif not AimbotBindEnabled then
            if azure.Aiming.Aimbot.Alerts then
                Library:Notify("Unaiming : "..tostring(AimbotTarget.Character.Humanoid.DisplayName))
            end
        end
    end
end)

AIMBOTXD:AddInput('AimbotPredictionTextbox', {
    Default = '',
    Numeric = false,
    Finished = false,

    Text = 'Prediction',
    Tooltip = 'Aimbot Prediction',

    Placeholder = 'Prediction Amount', 
})

Options.AimbotPredictionTextbox:OnChanged(function()
    azure.Aiming.Aimbot.Prediction = Options.AimbotPredictionTextbox.Value
end)

AIMBOTXD:AddToggle('AimbotDrawFOVTggle', {
    Text = 'Draw FOV',
    Default = false, 
    Tooltip = 'Enable Aimbot FOV', 
})

Toggles.AimbotDrawFOVTggle:OnChanged(function()
    AimbotDrawFOV = Toggles.AimbotDrawFOVTggle.Value
end)

Toggles.AimbotDrawFOVTggle:AddColorPicker('LocalHighlxxxxxxxxxxightFillColorColorPicker', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Aimbot FOV Color'
})

Options.LocalHighlxxxxxxxxxxightFillColorColorPicker:OnChanged(function()
    AimbotFOVClr = Options.LocalHighlxxxxxxxxxxightFillColorColorPicker.Value
end)

AIMBOTXD:AddSlider('AimbotFOVSizex', {
    Text = 'Aimbot FOV',

    Default = 2,
    Min = 1,
    Max = 5,
    Rounding = 2,

    Compact = false,
})

Options.AimbotFOVSizex:OnChanged(function()
    AimbotFOVSize = Options.AimbotFOVSizex.Value*100
end)

AIMBOTXD:AddDropdown('AimbotHitboxDropdownn', {
    Values = { 'Head', 'HumanoidRootPart', 'UpperTorso', 'LowerTorso' },
    Default = 2,
    Multi = false,

    Text = 'Hitbox',
    Tooltip = 'Aimbot Hitbox',
})

Options.AimbotHitboxDropdownn:OnChanged(function()
    azure.Aiming.Aimbot.Hitbox = Options.AimbotHitboxDropdownn.Value
end)

AIMBOTXD:AddToggle('AimbotAlertsTggl', {
    Text = 'Notifications',
    Default = false,
    Tooltip = 'Enable Aimbot Notifications',
})

Toggles.AimbotAlertsTggl:OnChanged(function()
    azure.Aiming.Aimbot.Alerts = Toggles.AimbotAlertsTggl.Value
end)

AIMBOTXD:AddToggle('AimbotVelocityResolverToggle', {
    Text = 'Velocity Resolver',
    Default = false,
    Tooltip = 'Enable Aimbot Velocity Resolver',
})

Toggles.AimbotVelocityResolverToggle:OnChanged(function()
    azure.Aiming.Aimbot.VelocityResolver = Toggles.AimbotVelocityResolverToggle.Value
end)

AIMBOTXD:AddToggle('ReverseResolverAimbotTggle', {
    Text = 'Reverse Resolver',
    Default = false,
    Tooltip = 'Enable Aimbot Reverse Resolver',
})

Toggles.ReverseResolverAimbotTggle:OnChanged(function()
    azure.Aiming.Aimbot.ReverseResolver = Toggles.ReverseResolverAimbotTggle.Value
end)

AIMBOTXD:AddToggle('AimbotSmoothingTggle', {
    Text = 'Enable Smoothing',
    Default = false,
    Tooltip = 'Enable Aimbot Smoothing',
})

Toggles.AimbotSmoothingTggle:OnChanged(function()
    azure.Aiming.Aimbot.Smoothing.Enabled = Toggles.AimbotSmoothingTggle.Value
end)

AIMBOTXD:AddInput('AimbotSmoothingTextBox', {
    Default = '',
    Numeric = false,
    Finished = false,

    Text = 'Smoothing Value',
    Tooltip = 'Smoothing Value',

    Placeholder = 'Smoothing Amount', 
})

Options.AimbotSmoothingTextBox:OnChanged(function()
    azure.Aiming.Aimbot.Smoothing.Value = Options.AimbotSmoothingTextBox.Value
end)


MainVisuals:AddToggle('BoxESPEnabled', {
    Text = 'Box',
    Default = false, 
    Tooltip = 'Box ESP Enabled', 
})

Toggles.BoxESPEnabled:OnChanged(function()
    getgenv().taffy_esp.box.enabled = Toggles.BoxESPEnabled.Value
end)

Toggles.BoxESPEnabled:AddColorPicker('BoxESPColor', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Box ESP Color'
})

Options.BoxESPColor:OnChanged(function()
    getgenv().taffy_esp.box.color1 = Options.BoxESPColor.Value
end)

MainVisuals:AddToggle('HealthESPEnabled', {
    Text = 'Health',
    Default = false, 
    Tooltip = 'Health ESP Enabled', 
})

Toggles.HealthESPEnabled:OnChanged(function()
    getgenv().taffy_esp.box.healthbar = Toggles.HealthESPEnabled.Value
end)

Toggles.HealthESPEnabled:AddColorPicker('HealthESPColor', {
    Default = Color3.fromRGB(0,255,0),
    Title = 'Health ESP Color'
})

Options.HealthESPColor:OnChanged(function()
    getgenv().taffy_esp.box.healthbarcolor = Options.HealthESPColor.Value
end)
task.spawn(function ()
    while true do
        wait()
        if getgenv().taffy_esp.box.healthbar or getgenv().taffy_esp.box.enabled then
            getgenv().taffy_esp.box.outline = true
        elseif getgenv().taffy_esp.box.healthbar == false or getgenv().taffy_esp.box.enabled == false then
            getgenv().taffy_esp.box.outline = false
        end
        if getgenv().taffy_esp.box.healthbar == true and getgenv().taffy_esp.box.enabled == false then
            getgenv().taffy_esp.box.outline = false
        end
    end
end)

MainVisuals:AddToggle('TracerESPEnabled', {
    Text = 'Tracer',
    Default = false, 
    Tooltip = 'Tracer ESP Enabled', 
})

Toggles.TracerESPEnabled:OnChanged(function()
    getgenv().taffy_esp.tracer.enabled = Toggles.TracerESPEnabled.Value
end)

Toggles.TracerESPEnabled:AddColorPicker('TracerESPColor', {
    Default = Color3.fromRGB(0,255,0),
    Title = 'Tracer ESP Color'
})

Options.TracerESPColor:OnChanged(function()
    getgenv().taffy_esp.tracer.color = Options.TracerESPColor.Value
end)

MainVisuals:AddToggle('UnlockedTracerEnabled', {
    Text = 'Unlock Tracer',
    Default = false, 
    Tooltip = 'Unlock Tracer Enabled', 
})

Toggles.UnlockedTracerEnabled:OnChanged(function()
    getgenv().taffy_esp.tracer.unlocktracers = Toggles.UnlockedTracerEnabled.Value
end)

MainVisuals:AddToggle('NameESPEnabled', {
    Text = 'Name',
    Default = false, 
    Tooltip = 'Name ESP Enabled', 
})

Toggles.NameESPEnabled:OnChanged(function()
    getgenv().taffy_esp.name.enabled = Toggles.NameESPEnabled.Value
end)

Toggles.NameESPEnabled:AddColorPicker('NameESPColor', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Name ESP Color'
})

Options.NameESPColor:OnChanged(function()
    getgenv().taffy_esp.name.color = Options.NameESPColor.Value
end)

MainVisuals:AddToggle('ToolESPEnabled', {
    Text = 'Held Tool',
    Default = false, 
    Tooltip = 'Held Tool ESP Enabled', 
})

Toggles.ToolESPEnabled:OnChanged(function()
    getgenv().taffy_esp.Toolsshow.enable = Toggles.ToolESPEnabled.Value
end)

Toggles.ToolESPEnabled:AddColorPicker('ToolESPColor', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Held Tool ESP Color'
})

Options.ToolESPColor:OnChanged(function()
    getgenv().taffy_esp.Toolsshow.color = Options.ToolESPColor.Value
end)

WorldVisuals:AddToggle('RainbowAmbient', {
    Text = 'Rainbow Ambient',
    Default = false, 
    Tooltip = 'Rainbow Ambient Enabled', 
})

Toggles.RainbowAmbient:OnChanged(function()
    AmbientRainbowMode = Toggles.RainbowAmbient.Value
    if Toggles.RainbowAmbient.Value then
        while Toggles.RainbowAmbient.Value do
            wait()
            game:GetService("Lighting").Ambient  = Color3.new(255/255,0/255,0/255)
            for i = 0,255,10 do
             wait()
             game:GetService("Lighting").Ambient = Color3.new(255/255,i/255,0/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").Ambient = Color3.new(i/255,255/255,0/255)
            end
            for i = 0,255,10 do
               wait()
               game:GetService("Lighting").Ambient = Color3.new(0/255,255/255,i/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").Ambient = Color3.new(0/255,i/255,255/255)
            end
            for i = 0,255,10 do
                wait()
                game:GetService("Lighting").Ambient = Color3.new(i/255,0/255,255/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").Ambient = Color3.new(255/255,0/255,i/255)
            end
            if Toggles.RainbowAmbient.Value == false then break end
        end
    end
end)

local AmbientReset = WorldVisuals:AddButton('Reset to Default', function()
    Options.AmbientColorPicker:SetValueRGB(Color3.fromRGB(0,0,0))
end)

WorldVisuals:AddLabel('Outdoor Ambient'):AddColorPicker('OutdoorAmbientColor', {
    Default = Color3.fromRGB(152, 152, 146),
    Title = 'Outdoor Ambient', 
})

Options.OutdoorAmbientColor:OnChanged(function()
    if OutdoorAmbientRainbowMode then
    else
        game.Lighting.OutdoorAmbient = Options.OutdoorAmbientColor.Value
    end
end)

WorldVisuals:AddToggle('RainbowOutdoorAmbient', {
    Text = 'Rainbow Outdoor',
    Default = false, 
    Tooltip = 'Rainbow Outdoor Ambient Enabled', 
})

Toggles.RainbowOutdoorAmbient:OnChanged(function()
    OutdoorAmbientRainbowMode = Toggles.RainbowOutdoorAmbient.Value
    if Toggles.RainbowOutdoorAmbient.Value then
        while Toggles.RainbowOutdoorAmbient.Value do
            wait()
            game:GetService("Lighting").OutdoorAmbient  = Color3.new(255/255,0/255,0/255)
            for i = 0,255,10 do
             wait()
             game:GetService("Lighting").OutdoorAmbient = Color3.new(255/255,i/255,0/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").OutdoorAmbient = Color3.new(i/255,255/255,0/255)
            end
            for i = 0,255,10 do
               wait()
               game:GetService("Lighting").OutdoorAmbient = Color3.new(0/255,255/255,i/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").OutdoorAmbient = Color3.new(0/255,i/255,255/255)
            end
            for i = 0,255,10 do
                wait()
                game:GetService("Lighting").OutdoorAmbient = Color3.new(i/255,0/255,255/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").OutdoorAmbient = Color3.new(255/255,0/255,i/255)
            end
            if Toggles.RainbowOutdoorAmbient.Value == false then break end
        end
    end
end)

local OutdoorAmbientReset = WorldVisuals:AddButton('Reset to Default', function()
    Options.OutdoorAmbientColor:SetValueRGB(Color3.fromRGB(152, 152, 146))
end)

WorldVisuals:AddSlider('FogEndSlider', {
    Text = 'Fog End',

    Default = 500,
    Min = 1,
    Max = 500,
    Rounding = 1,

    Compact = false,
})

Options.FogEndSlider:OnChanged(function()
    game.Lighting.FogEnd = Options.FogEndSlider.Value
end)

WorldVisuals:AddLabel('Fog Color'):AddColorPicker('FogColorColorPicker', {
    Default = Color3.fromRGB(100, 87, 72),
    Title = 'Fog Color', 
})

Options.FogColorColorPicker:OnChanged(function()
    if FogRainbowMode then
    else
        game.Lighting.FogColor = Options.FogColorColorPicker.Value
    end
end)

WorldVisuals:AddToggle('RainbowFogColor', {
    Text = 'Rainbow Outdoor',
    Default = false, 
    Tooltip = 'Rainbow Outdoor Ambient Enabled', 
})

Toggles.RainbowFogColor:OnChanged(function()
    FogRainbowMode = Toggles.RainbowFogColor.Value
    if Toggles.RainbowFogColor.Value then
        while Toggles.RainbowFogColor.Value do
            wait()
            game:GetService("Lighting").FogColor  = Color3.new(255/255,0/255,0/255)
            for i = 0,255,10 do
             wait()
             game:GetService("Lighting").FogColor = Color3.new(255/255,i/255,0/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").FogColor = Color3.new(i/255,255/255,0/255)
            end
            for i = 0,255,10 do
               wait()
               game:GetService("Lighting").FogColor = Color3.new(0/255,255/255,i/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").FogColor = Color3.new(0/255,i/255,255/255)
            end
            for i = 0,255,10 do
                wait()
                game:GetService("Lighting").FogColor = Color3.new(i/255,0/255,255/255)
            end
            for i = 255,0,-10 do
                wait()
                game:GetService("Lighting").FogColor = Color3.new(255/255,0/255,i/255)
            end
            if Toggles.RainbowFogColor.Value == false then break end
        end
    end
end)

local ResetFogEnd = WorldVisuals:AddButton('Reset to Default', function()
    Options.FogEndSlider:SetValue(500)
    Options.FogColorColorPicker:SetValueRGB(Color3.fromRGB(100, 87, 72))
end)

WorldVisuals:AddToggle('GlobalShadowsEnabled', {
    Text = 'Global Shadows',
    Default = true, 
    Tooltip = 'Global Shadows Enabled', 
})

Toggles.GlobalShadowsEnabled:OnChanged(function()
    game.Lighting.GlobalShadows = Toggles.GlobalShadowsEnabled.Value
end)
WorldVisuals:AddSlider('Saturation', {
    Text = 'Saturation',

    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Compact = false,
})

Options.Saturation:OnChanged(function()
                        local ColorCorrection = game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect")
ColorCorrection.Saturation = Options.Saturation.Value
end)
WorldVisuals:AddSlider('Contrast', {
    Text = 'Contrast',

    Default = 0.1,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Compact = false,
})

Options.Contrast:OnChanged(function()
    local ColorCorrection = game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect")
ColorCorrection.Contrast = Options.Contrast.Value
end)

CrosshairTab:AddToggle('CrosshairEnabledTop', {
    Text = 'Top',
    Default = true, 
    Tooltip = 'Top Enabled', 
})

Toggles.CrosshairEnabledTop:OnChanged(function()
    LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = Toggles.CrosshairEnabledTop.Value
end)

Toggles.CrosshairEnabledTop:AddColorPicker('CrosshairTopColor', {
    Default = Color3.fromRGB(255,255,255),
})

Options.CrosshairTopColor:OnChanged(function()
    
    if RainbowCrossHairMode then
    else
        LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Options.CrosshairTopColor.Value
    end
end)

CrosshairTab:AddToggle('CrosshairEnabledDown', {
    Text = 'Bottom',
    Default = true, 
    Tooltip = 'Bottom Enabled', 
})

Toggles.CrosshairEnabledDown:OnChanged(function()
    LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = Toggles.CrosshairEnabledDown.Value
end)

Toggles.CrosshairEnabledDown:AddColorPicker('CrosshairBottomXd', {
    Default = Color3.fromRGB(255,255,255),
})

Options.CrosshairBottomXd:OnChanged(function()
   
    if RainbowCrossHairMode then
    else
        LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Options.CrosshairBottomXd.Value
    end
end)

CrosshairTab:AddToggle('CrosshairEnabledLeft', {
    Text = 'Left',
    Default = true, 
    Tooltip = 'Left Enabled', 
})

Toggles.CrosshairEnabledLeft:OnChanged(function()
    LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = Toggles.CrosshairEnabledLeft.Value
end)

Toggles.CrosshairEnabledLeft:AddColorPicker('CrosshairLeftColor', {
    Default = Color3.fromRGB(255,255,255),
})

Options.CrosshairLeftColor:OnChanged(function()
    if RainbowCrossHairMode then
    else
        LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Options.CrosshairLeftColor.Value
    end
end)

CrosshairTab:AddToggle('CrosshairEnabledRight', {
    Text = 'Right',
    Default = true, 
    Tooltip = 'Right Enabled', 
})

Toggles.CrosshairEnabledRight:OnChanged(function()
    LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = Toggles.CrosshairEnabledRight.Value
end)

Toggles.CrosshairEnabledRight:AddColorPicker('CrosshairRightColor', {
    Default = Color3.fromRGB(255,255,255),
})

Options.CrosshairRightColor:OnChanged(function()
    if RainbowCrossHairMode then
    else
        LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Options.CrosshairRightColor.Value
    end
end)

CrosshairTab:AddLabel('Middle'):AddColorPicker('CrosshairMiddle', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Middle', 
})

Options.CrosshairMiddle:OnChanged(function()
    
    if RainbowCrossHairMode then
    else
        LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Options.CrosshairMiddle.Value
    end
end)

CrosshairTab:AddToggle('RainbowCrosshair', {
    Text = 'Rainbow Crosshair',
    Default = false, 
    Tooltip = 'Rainbow Crosshair Enabled', 
})

Toggles.RainbowCrosshair:OnChanged(function()
    RainbowCrossHairMode = Toggles.RainbowCrosshair.Value
    if Toggles.RainbowCrosshair.Value then
        while Toggles.RainbowCrosshair.Value do
            wait()
            for i = 0,255,10 do
             wait()
                 game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.new(255/255,i/255,0/255)
                game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.new(255/255,i/255,0/255)
                game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.new(255/255,i/255,0/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.new(255/255,i/255,0/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Color3.new(255/255,i/255,0/255)
            end
            for i = 255,0,-10 do
                wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.new(i/255,255/255,0/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.new(i/255,255/255,0/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.new(i/255,255/255,0/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 =  Color3.new(i/255,255/255,0/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Color3.new(i/255,255/255,0/255)
            end
            for i = 0,255,10 do
               wait()
                   game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.new(0/255,255/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.new(0/255,255/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.new(0/255,255/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.new(0/255,255/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 =  Color3.new(0/255,255/255,i/255)
            end
            for i = 255,0,-10 do
                wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.new(0/255,i/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.new(0/255,i/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.new(0/255,i/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.new(0/255,i/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 =  Color3.new(0/255,i/255,255/255)
            end
            for i = 0,255,10 do
                wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.new(i/255,0/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.new(i/255,0/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.new(i/255,0/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.new(i/255,0/255,255/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 =  Color3.new(i/255,0/255,255/255)
            end
            for i = 255,0,-10 do
                wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.new(255/255,0/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.new(255/255,0/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.new(255/255,0/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.new(255/255,0/255,i/255)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 =  Color3.new(255/255,0/255,i/255)
            end
            if Toggles.RainbowCrosshair.Value == false then break end
        end
    end
end)













local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")

getgenv().taffy_esp = {
    box = {
        enabled1 = true,
        enabled = false,
        outline = false,
        healthbar = false,
        color1 = Color3.fromRGB(255, 255, 255),
        color2 = Color3.fromRGB(0, 0, 0),
        healthbarcolor = Color3.fromRGB(0, 215, 35)
    },
    tracer = {
        enabled = false,
        unlocktracers = false,
        color = Color3.fromRGB(255, 255, 255)
    },
    name = {
        enabled = false,
        outline = false,
        size = 13,
        font = 2,
        color = Color3.fromRGB(255, 255, 255)
    },
    misc = {
        teamcheck = false,
        useteamcolors = false,
        visibleonly = true
    },
    Toolsshow = {
        enable = false,
        outline = false,
        size = 8,
        font = 3,
        color = Color3.fromRGB(0, 215, 35)
    }
}

assert(getgenv().taffy_esp, "not loaded lol")

function esp(v)
    -- box --
    local BLOCKOUTLINE = Drawing.new("Square")
    BLOCKOUTLINE.Visible = false
    BLOCKOUTLINE.Color = Color3.new(0,0,0)
    BLOCKOUTLINE.Thickness = 3
    BLOCKOUTLINE.Transparency = 1
    BLOCKOUTLINE.Filled = false

    local BOXPLAYER = Drawing.new("Square")
    BOXPLAYER.Visible = false
    BOXPLAYER.Color = taffy_esp.box.color1
    BOXPLAYER.Thickness = 1
    BOXPLAYER.Transparency = 1
    BOXPLAYER.Filled = false

    local HealthBarOUTLINE = Drawing.new("Square")
    HealthBarOUTLINE.Thickness = 3
    HealthBarOUTLINE.Filled = false
    HealthBarOUTLINE.Color = Color3.new(0,0,0)
    HealthBarOUTLINE.Transparency = 1
    HealthBarOUTLINE.Visible = false

    local HealthBarITSELF = Drawing.new("Square")
    HealthBarITSELF.Thickness = 1
    HealthBarITSELF.Filled = false
    HealthBarITSELF.Transparency = 1
    HealthBarITSELF.Visible = false
    
    
    
    -- tracer --

    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    -- name --

    local Name = Drawing.new("Text")
    Name.Transparency = 1
    Name.Visible = false
    Name.Color = taffy_esp.name.color
    Name.Size = 16
    Name.Center = true
    Name.Outline = false
    Name.Font = 2
    Name.Text = "name [100/100]"


    --tool--

    local toolshow = Drawing.new("Text")
    toolshow.Transparency = 1
    toolshow.Visible = false
    toolshow.Color = getgenv().taffy_esp.Toolsshow.color
    toolshow.Size = 16
    toolshow.Center = true
    toolshow.Outline = false
    toolshow.Font = 2
    toolshow.Text = ""
    














    game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health  > 0 and (not taffy_esp.misc.teamcheck or v.TeamColor == lplr.TeamColor) then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + Vector3.new(0,0.5,0))
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - Vector3.new(0,3,0))
            if (not taffy_esp.misc.visibleonly or onScreen) then
                if taffy_esp.box.enabled1 then
                    BLOCKOUTLINE.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BLOCKOUTLINE.Position = Vector2.new(RootPosition.X - BLOCKOUTLINE.Size.X / 2, RootPosition.Y - BLOCKOUTLINE.Size.Y / 2)
                    BLOCKOUTLINE.Visible = taffy_esp.box.outline
                    BLOCKOUTLINE.Color = taffy_esp.box.color2
    
                    BOXPLAYER.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BOXPLAYER.Position = Vector2.new(RootPosition.X - BOXPLAYER.Size.X / 2, RootPosition.Y - BOXPLAYER.Size.Y / 2)
                    BOXPLAYER.Visible = taffy_esp.box.enabled
                    if not taffy_esp.misc.useteamcolors then
                        local color = v.TeamColor
                        BOXPLAYER.Color = taffy_esp.box.color1
                    else
                        BOXPLAYER.Color = taffy_esp.box.color1
                    end
                        
                    HealthBarOUTLINE.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOUTLINE.Position = HealthBarOUTLINE.Position - Vector2.new(6,0)
                    HealthBarOUTLINE.Visible = taffy_esp.box.outline
    
                    HealthBarITSELF.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
                    HealthBarITSELF.Position = Vector2.new(BOXPLAYER.Position.X - 5, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
                    HealthBarITSELF.Color = taffy_esp.box.healthbarcolor
                    HealthBarITSELF.Visible = taffy_esp.box.healthbar
                    
                    
                    
                    
                else
                    BLOCKOUTLINE.Visible = false
                    BOXPLAYER.Visible = false
                    HealthBarOUTLINE.Visible = false
                    HealthBarITSELF.Visible = false
                end
                if taffy_esp.tracer.enabled then
                    if taffy_esp.tracer.unlocktracers then
                        Tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                    else
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    end
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Visible = taffy_esp.tracer.enabled
                    if not taffy_esp.misc.useteamcolors then
                        local color = v.TeamColor
                        Tracer.Color = taffy_esp.tracer.color
                    else
                        Tracer.Color = taffy_esp.tracer.color
                    end
                else
                    Tracer.Visible = false
                end

                if taffy_esp.Toolsshow.enable then
                      local Equipped = v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChildOfClass("Tool").Name or "None"
                    toolshow.Text = Equipped
                    toolshow.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y + 30)
                    toolshow.Color = getgenv().taffy_esp.Toolsshow.color
                    toolshow.Font = 3
                    Name.Size = taffy_esp.Toolsshow.size
                    toolshow.Visible = true
                    else
                        toolshow.Visible = false
                end


                if taffy_esp.name.enabled then
                    Name.Text = tostring(v.Name).. " [" .. tostring(math.floor(v.Character.Humanoid.Health + 0.5)) .. "/" .. tostring(v.Character.Humanoid.MaxHealth) .. "]"
                    Name.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
                    Name.Visible = true
                    Name.Size = taffy_esp.name.size
                    if not taffy_esp.misc.useteamcolors then
                        local color = v.TeamColor
                        Name.Color = taffy_esp.name.color
                    else
                        Name.Color = taffy_esp.name.color
                    end
                    Name.Outline = taffy_esp.name.outline
                else
                    Name.Visible = false
                end
            else
                BLOCKOUTLINE.Visible = false
                BOXPLAYER.Visible = false
                toolshow.Visible=false
                HealthBarOUTLINE.Visible = false
                HealthBarITSELF.Visible = false
                Tracer.Visible = false
                Name.Visible = false
            end
        else
            toolshow.Visible=false
            BLOCKOUTLINE.Visible = false
            BOXPLAYER.Visible = false
            HealthBarOUTLINE.Visible = false
            HealthBarITSELF.Visible = false
            Tracer.Visible = false
            Name.Visible = false
        end
    end)
end

for i,v in pairs(game.Players:GetChildren()) do
    esp(v)
end

game.Players.PlayerAdded:Connect(function(v)
    esp(v)
end)

-- Button:AddButton
-- Arguments: Text, Callback
-- Adds a sub button to the side of the main button


-- Button:AddTooltip
-- Arguments: ToolTip

-- NOTE: You can chain the button methods!
--[[
    EXAMPLE: 

    LeftGroupBox:AddButton('Kill all', Functions.KillAll):AddTooltip('This will kill everyone in the game!')
        :AddButton('Kick all', Functions.KickAll):AddTooltip('This will kick everyone in the game!')
]]

-- Groupbox:AddLabel
-- Arguments: Text, DoesWrap
-- Library functions


Library:SetWatermarkVisibility(false)

-- Sets the watermark text
Library:SetWatermark('LuckyHub | Dahood | Premium User')

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
local OtherMenuGroup = Tabs['UI Settings']:AddRightGroupbox('UI Toggles')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' })

OtherMenuGroup:AddToggle('KeybindVisibility', {
    Text = 'Keybinds List Toggle',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables and disables keybinds visibility', -- Information shown when you hover over the toggle
})

OtherMenuGroup:AddToggle("Watermark", {
	Text = "Show Watermark",
	Default = true
}):OnChanged(function()
	Library:SetWatermarkVisibility(Toggles.Watermark.Value);
end);

Toggles.KeybindVisibility:OnChanged(function()
    if Library.KeybindFrame.Visible == false
    then Library.KeybindFrame.Visible = true
        else
            Library.KeybindFrame.Visible = false
            end
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('LuckyHub')
SaveManager:SetFolder('LuckyHub/Dahood')
SaveManager:SetFolder('LuckyHub/Hoopz')
SaveManager:SetFolder('LuckyHub/Da Hood Aim Trainer')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

targetstraferangepart = Instance.new("MeshPart")
        
local TracerLine = Drawing.new("Line")
local HLTarget = Instance.new("Highlight")
local FakeHitboxPart = Instance.new("Part",game.Workspace)
local DotParent = Instance.new("Part",game.Workspace)

local newBillboard = Instance.new("BillboardGui", DotParent)

local newFrame = Instance.new("Frame", newBillboard)
local newUiCornor = Instance.new("UICorner", newFrame)


task.spawn(function ()
    newBillboard.Name = "azure_billboarddot"
    newBillboard.Adornee = DotParent
    newBillboard.Size = UDim2.new(1, 0, 1, 0)
    newBillboard.AlwaysOnTop = true
    newFrame.Size = UDim2.new(1, 0, 1, 0)
    newFrame.BackgroundTransparency = 0
    newUiCornor.CornerRadius = UDim.new(50, 50)
    DotParent.CanCollide = false
    DotParent.Anchored = true
    DotParent.CFrame = CFrame.new(0,2000,0)
    DotParent.Transparency = 1
    targetstraferangepart.MeshId = "rbxassetid://3726303797"
    targetstraferangepart.CanCollide = false
    targetstraferangepart.Anchored = true
    targetstraferangepart.Material = Enum.Material.Neon
    targetstraferangepart.Parent = game.Workspace
end)


RunService.Stepped:Connect(function ()
    if azure.Aiming.Target.Enabled and TargetBindEnabled and TargetTarget.Character then
        if azure.Aiming.Target.Dot.Enabled then
            DotParent.CFrame = CFrame.new(TargetTarget.Character[azure.Aiming.Target.Hitbox].Position+Vector3.new(0,azure.Aiming.Target.Offset.Y,0)+(TargetTarget.Character[azure.Aiming.Target.Hitbox].Velocity*azure.Aiming.Target.Prediction))
            task.spawn(function ()
                newFrame.BackgroundColor3 = azure.Aiming.Target.Dot.Color
            end)
            spawn(function ()
                if azure.Aiming.Target.Dot.Enabled == false then
                    DotParent.CFrame = CFrame.new(0,2000,0)
                end
            end)
        end
        if azure.Aiming.Target.FakeHitbox.Enabled then
            FakeHitboxPart.CFrame = CFrame.new(TargetTarget.Character.HumanoidRootPart.Position+Vector3.new(0,azure.Aiming.Target.Offset.Y,0)+(TargetTarget.Character.HumanoidRootPart.Velocity*azure.Aiming.Target.Prediction))
            spawn(function ()
                if azure.Aiming.Target.FakeHitbox.Enabled == false then
                    FakeHitboxPart.CFrame = CFrame.new(0,9999,0)
                end
            end)
            task.spawn(function ()
                FakeHitboxPart.CanCollide = false
                FakeHitboxPart.Anchored = true
                FakeHitboxPart.Color = azure.Aiming.Target.FakeHitbox.Color
                FakeHitboxPart.Size = Vector3.new(1*azure.Aiming.Target.FakeHitbox.Size,1*azure.Aiming.Target.FakeHitbox.Size,1*azure.Aiming.Target.FakeHitbox.Size)
                if azure.Aiming.Target.FakeHitbox.Material == "Neon" then
                    FakeHitboxPart.Transparency = 0
                    FakeHitboxPart.Material = "Neon"
                end
                if azure.Aiming.Target.FakeHitbox.Material == "ForceField" then
                    FakeHitboxPart.Transparency = 0
                    FakeHitboxPart.Material = "ForceField"
                end
                if azure.Aiming.Target.FakeHitbox.Material == "Plastic" then
                    FakeHitboxPart.Transparency = 0.75
                    FakeHitboxPart.Material = "Plastic"
                end
            end)
        end
        if azure.Aiming.Target.ViewAt then
            workspace.CurrentCamera.CameraSubject = TargetTarget.Character.Humanoid
            spawn(function ()
                if azure.Aiming.Target.ViewAt == false then
                    workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
                end
            end)
        end
        if azure.Aiming.Target.Tracer.Enabled then
            local LineVec = workspace.CurrentCamera:WorldToViewportPoint(TargetTarget.Character[azure.Aiming.Target.Hitbox].Position+Vector3.new(0,azure.Aiming.Target.Offset.Y,0)+(TargetTarget.Character[azure.Aiming.Target.Hitbox].Velocity*azure.Aiming.Target.Prediction))
            local humanoidt = workspace.CurrentCamera:WorldToViewportPoint(game.Players.LocalPlayer.Character.UpperTorso.Position)
            local headt = workspace.CurrentCamera:WorldToViewportPoint(game.Players.LocalPlayer.Character.Head.Position)
            local lowert = workspace.CurrentCamera:WorldToViewportPoint(game.Players.LocalPlayer.Character.LowerTorso.Position)
            local gunt = workspace.CurrentCamera:WorldToViewportPoint(game.Players.LocalPlayer.Character.RightHand.Position)
            
            TracerLine.Color = azure.Aiming.Target.Tracer.Color
            TracerLine.Transparency = 1
            TracerLine.Thickness = 2
            TracerLine.To = Vector2.new(LineVec.X, LineVec.Y)
            TracerLine.Visible = true
            if azure.Aiming.Target.Tracer.From == "Mouse" then
                TracerLine.From = Vector2.new(LocalPlayerObjs.Mouse.X, LocalPlayerObjs.Mouse.Y + game:GetService("GuiService"):GetGuiInset().Y)
            end
            if azure.Aiming.Target.Tracer.From == "Head" then
                TracerLine.From = Vector2.new(headt.X, headt.Y)
            end
            if azure.Aiming.Target.Tracer.From == "UpperTorso" then
                TracerLine.From = Vector2.new(humanoidt.X, humanoidt.Y)
            end
            if azure.Aiming.Target.Tracer.From == "LowerTorso" then
                TracerLine.From = Vector2.new(lowert.X, lowert.Y)
            end
            if azure.Aiming.Target.Tracer.From == "Gun" then
                TracerLine.From = Vector2.new(gunt.X, gunt.Y)
            end

            spawn(function ()
                if azure.Aiming.Target.Tracer.Enabled == false or azure.Aiming.Target.Enabled == false then
                    TracerLine.Visible = false
                end
            end)
        end
        if azure.Aiming.Target.Highlight.Enabled then
            HLTarget.Parent = TargetTarget.Character
            HLTarget.FillColor = azure.Aiming.Target.Highlight.FillColor
            HLTarget.OutlineColor = azure.Aiming.Target.Highlight.OutlineColor
            spawn(function ()
                if azure.Aiming.Target.Highlight.Enabled == false then
                    HLTarget.Parent = game.CoreGui
                end
            end)
        end

        if azure.Aiming.TargetStrafe.Visualize.Enabled and azure.Aiming.TargetStrafe.Enabled then
            targetstraferangepart.CFrame = TargetTarget.Character.HumanoidRootPart.CFrame
            spawn(function ()
                targetstraferangepart.Size = Vector3.new(azure.Aiming.TargetStrafe.Distance * 0.7, 0.01, azure.Aiming.TargetStrafe.Distance * 0.7)
                targetstraferangepart.Color = azure.Aiming.TargetStrafe.Visualize.Color
            end)
            spawn(function ()
                if azure.Aiming.TargetStrafe.Visualize.Enabled == false or azure.Aiming.TargetStrafe.Enabled == false then
                    targetstraferangepart.CFrame = CFrame.new(0,9999,0)
                end
            end)
        end
    else
        TracerLine.Visible = false
        HLTarget.Parent = game.CoreGui
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        FakeHitboxPart.CFrame = CFrame.new(0,999,0)
        DotParent.CFrame = CFrame.new(0,2000,0)
        targetstraferangepart.CFrame = CFrame.new(0,9999,0)
    end
    
    if azure.Aiming.Target.PingBased == true then
        pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        split = string.split(pingvalue,'(')
        ping = tonumber(split[1])
        if ping < 360 then
            azure.Aiming.Target.Prediction = 0.16537
        elseif ping < 270 then
            azure.Aiming.Target.Prediction = 0.195566
        elseif ping < 260 then
            azure.Aiming.Target.Prediction = 0.175566
        elseif ping < 250 then
            azure.Aiming.Target.Prediction = 0.1651
        elseif ping < 240 then
            azure.Aiming.Target.Prediction = 0.16780
        elseif ping < 230 then
            azure.Aiming.Target.Prediction = 0.15692
        elseif ping < 220 then
            azure.Aiming.Target.Prediction = 0.165566
        elseif ping < 210 then
            azure.Aiming.Target.Prediction = 0.16780
        elseif ping < 200 then
            azure.Aiming.Target.Prediction = 0.165566
        elseif ping < 190 then
            azure.Aiming.Target.Prediction = 0.166547
        elseif ping < 180 then
            azure.Aiming.Target.Prediction = 0.19284
        elseif ping < 170 then
            azure.Aiming.Target.Prediction = 0.1923111 
        elseif ping < 160 then
            azure.Aiming.Target.Prediction = 0.16
        elseif ping < 150 then
            azure.Aiming.Target.Prediction = 0.15
        elseif ping < 140 then
            azure.Aiming.Target.Prediction = 0.1223333
        elseif ping < 130 then
            azure.Aiming.Target.Prediction = 0.156692
        elseif ping < 120 then
            azure.Aiming.Target.Prediction = 0.143765
        elseif ping < 110 then
            azure.Aiming.Target.Prediction = 0.1455
        elseif ping < 100 then
            azure.Aiming.Target.Prediction = 0.130340
        elseif ping < 90 then
            azure.Aiming.Target.Prediction = 0.136
        elseif ping < 80 then
            azure.Aiming.Target.Prediction = 0.1347
        elseif ping < 70 then
            azure.Aiming.Target.Prediction = 0.119
        elseif ping < 60 then
            azure.Aiming.Target.Prediction = 0.12731
        elseif ping < 50 then
            azure.Aiming.Target.Prediction = 0.127668
        elseif ping < 40 then
            azure.Aiming.Target.Prediction = 0.125
        elseif ping < 30 then
            azure.Aiming.Target.Prediction = 0.11
        elseif ping < 20 then
            azure.Aiming.Target.Prediction = 0.12588
        elseif ping < 10 then
            azure.Aiming.Target.Prediction = 0.9
        end
    end
    if WristPosBind and azure.Aiming.WristPos.Enabled and WristPosTarget.Character and WristPosTarget.Character:FindFirstChild("HumanoidRootPart") then
        if LocalPlayer.Character.RightHand:FindFirstChild("RightWrist") then
            LocalPlayer.Character.RightHand.RightWrist:Destroy()
        end
        repeat
            task.wait()
            LocalPlayer.Character.RightHand.CFrame = CFrame.new(WristPosTarget.Character.HumanoidRootPart.Position) * CFrame.new(0,azure.Aiming.WristPos.Distance,0)
            LocalPlayer.Character.RightHand.Transparency = 1
        until WristPosBind == false or azure.Aiming.WristPos.Enabled == false
        if WristPosBind == false or azure.Aiming.WristPos.Enabled == false then
            LocalPlayer.Character.RightHand.CFrame = LocalPlayer.Character.RightUpperArm.CFrame
            LocalPlayer.Character.RightHand.Transparency = 0
        end
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if azure.Aiming.Target.Enabled and TargetBindEnabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = TargetTarget.Character[azure.Aiming.Target.Hitbox].Position+Vector3.new(0,azure.Aiming.Target.Offset.Y,0)+(TargetTarget.Character[azure.Aiming.Target.Hitbox].Velocity*azure.Aiming.Target.Prediction)
        return old(unpack(args))
    end
    return old(...)
end)

RunService.RenderStepped:Connect(function ()
    if azure.Aiming.Aimbot.VelocityResolver then
        pcall(function ()
            AimbotTargetVelocity = AimbotTarget.Character.HumanoidRootPart.Velocity
            AimbotTarget.Character.HumanoidRootPart.Velocity = Vector3.new(AimbotTargetVelocity.X, -0.000000000000000000000000000000001, AimbotTargetVelocity.Z)
        end)
    end
    if azure.Aiming.Aimbot.Enabled and AimbotBindEnabled and azure.Aiming.Aimbot.Smoothing.Enabled == false then
        if azure.Aiming.Aimbot.ReverseResolver == true then
            local zxc = CFrame.new(workspace.CurrentCamera.CFrame.p, AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Position - AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Velocity/azure.Aiming.Aimbot.Prediction)
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(zxc, 1, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
        end
        if azure.Aiming.Aimbot.ReverseResolver == false then
            local zxc = CFrame.new(workspace.CurrentCamera.CFrame.p, AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Position + AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Velocity/azure.Aiming.Aimbot.Prediction)
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(zxc, 1, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
        end
    elseif azure.Aiming.Aimbot.Enabled and AimbotBindEnabled and azure.Aiming.Aimbot.Smoothing.Enabled == true then
        if azure.Aiming.Aimbot.ReverseResolver == true then
            local zx = CFrame.new(workspace.CurrentCamera.CFrame.p, AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Position - AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Velocity/azure.Aiming.Aimbot.Prediction)
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(zx, azure.Aiming.Aimbot.Smoothing.Value, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
        end
        if azure.Aiming.Aimbot.ReverseResolver == false then
            local zx = CFrame.new(workspace.CurrentCamera.CFrame.p, AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Position + AimbotTarget.Character[azure.Aiming.Aimbot.Hitbox].Velocity/azure.Aiming.Aimbot.Prediction)
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(zx, azure.Aiming.Aimbot.Smoothing.Value, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
        end
    end
    if TargetBindEnabled and azure.Aiming.Target.Enabled and TargetTarget.Character and TargetTarget.Character:FindFirstChild("HumanoidRootPart") then
        if azure.Aiming.Target.LookAt then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position, Vector3.new(TargetTarget.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, TargetTarget.Character.HumanoidRootPart.CFrame.Z))
            LocalPlayer.Character.Humanoid.AutoRotate = false
            spawn(function ()
                if azure.Aiming.Target.LookAt == false then
                    LocalPlayer.Character.Humanoid.AutoRotate = true
                end
            end)
        end
    else
        LocalPlayer.Character.Humanoid.AutoRotate = true
    end
end)

angle_Y = 0

RunService.Stepped:Connect(function (param,FPS)
    if azure.Aiming.TargetStrafe.Enabled then
        if azure.Aiming.Target.Enabled and TargetBindEnabled then
            if Toggles.TargetLookAtTggle.Value == true then
                Toggles.TargetLookAtTggle:SetValue(false)
                wait()
                Toggles.TargetLookAtTggle:SetValue(true)
            end
            angle_Y = angle_Y + FPS / azure.Aiming.TargetStrafe.Speed % 1
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TargetTarget.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * angle_Y, 0) * CFrame.new(0, azure.Aiming.TargetStrafe.Height, azure.Aiming.TargetStrafe.Distance)
        end
    end
end)

local circleinstance = Drawing.new("Circle")
local circleinstancex = Drawing.new("Circle")
RunService.Heartbeat:Connect(function ()
    if AimbotDrawFOV then
        circleinstance.Position = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y + game:GetService("GuiService"):GetGuiInset().Y)
        circleinstance.Visible = true
        circleinstance.Thickness = 2
        circleinstance.Radius =	AimbotFOVSize
        circleinstance.NumSides = 60
        circleinstance.Color = AimbotFOVClr
    else
        circleinstance.Visible = false
    end
    if TargetFOvEnabled then
        circleinstancex.Position = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y + game:GetService("GuiService"):GetGuiInset().Y)
        circleinstancex.Visible = true
        circleinstancex.Thickness = 2
        circleinstancex.Radius = TargetFOVSize
        circleinstancex.NumSides = 60
        circleinstancex.Color = TargetFovClr
    else
        circleinstancex.Visible = false
    end
    if azure.Blatant.CFrame.Enabled then
        if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            for i = 1, azure.Blatant.CFrame.Value do
                LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection)
            end
        end
    end
    if azure.Blatant.Exploits.JumpCooldown then
        LocalPlayer.Character.Humanoid.UseJumpPower = false
    else 
        LocalPlayer.Character.Humanoid.UseJumpPower = true
    end
    if azure.Blatant.Exploits.NoSlow then
        wait()
        local bodyeffectsBounderies = LocalPlayer.Character.BodyEffects.Movement:FindFirstChild('NoJumping') or LocalPlayer.Character.BodyEffects.Movement:FindFirstChild('ReduceWalk') or LocalPlayer.Character.BodyEffects.Movement:FindFirstChild('NoWalkSpeed')
        if bodyeffectsBounderies then
            bodyeffectsBounderies:Destroy()
        end
        if LocalPlayer.Character.BodyEffects.Reload.Value == true then
            LocalPlayer.Character.BodyEffects.Reload.Value = false
        end
    end
    if azure.Blatant.Exploits.AutoStomp then
        game.ReplicatedStorage.MainEvent:FireServer("Stomp")
    end
    if azure.Blatant.Exploits.AntiBag then
        if LocalPlayer.Character["Christmas_Sock"] then
            LocalPlayer.Character["Christmas_Sock"]:Destroy()
        end
    end
    if azure.Blatant.AntiStomp.Enabled then
        if LocalPlayer.Character.Humanoid.Health <= 1 then
            if azure.Blatant.AntiStomp.Type == "Remove Character" then
                for i, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v:Destroy()
                    end
                end
            elseif azure.Blatant.AntiStomp.Type == "Remove Humanoid" then
                LocalPlayer.Character.Humanoid:Destroy()
            end
        end
    end
    if azure.Blatant.FakeLag.Enabled then
        repeat
            wait()
            Toggles.AntiFlingEnabled:SetValue(true)
            wait(azure.Blatant.FakeLag.Duration/4)
            Toggles.AntiFlingEnabled:SetValue(false)
        until azure.Blatant.FakeLag.Enabled == false
    end
    if azure.Blatant.AntiAim.VelocityUnderGround then
        VelocityUnderGroundAA()
    else
        LocalPlayer.Character.Humanoid.HipHeight = 2
    end
    if azure.Blatant.AntiAim.RotVelocity.Enabled then
        RotVelocityAA()
    end
    if azure.Blatant.GunMod.AutoReload then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                end
            end
        end
    end
end)

function AimbotGetTarget()
    local distance = AimbotFOVSize
    local zclosest

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)).magnitude
            if magnitude < distance then
                zclosest = v
                distance = magnitude
            end
        end
    end
    return zclosest
end

function TargetGetTarget()
    local distance = TargetFOVSize
    local zclosest

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)).magnitude
            if magnitude < distance then
                zclosest = v
                distance = magnitude
            end
        end
    end
    return zclosest
end

function GetTarget()
    local distance = math.huge
    local zclosest

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)).magnitude
            if magnitude < distance then
                zclosest = v
                distance = magnitude
            end
        end
    end
    return zclosest
end

function VelocityUnderGroundAA()
    local oldVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity
    LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, -azure.Blatant.AntiAim.VelocityUnderGroundAmount, oldVelocity.Z)
    LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, oldVelocity.Y, oldVelocity.Z)
    LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, -azure.Blatant.AntiAim.VelocityUnderGroundAmount, oldVelocity.Z)
    LocalPlayer.Character.Humanoid.HipHeight = VelocityUndergroundHipheight
end

function RotVelocityAA()
    LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, azure.Blatant.AntiAim.RotVelocity.Value, 0)
end

task.spawn(function()
    while game:GetService("RunService").RenderStepped:Wait() do
        if azure.UISettings.Rainbow then
            local Registry = Window.Holder.Visible and Library.Registry or Library.HudRegistry

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == "AccentColor" or ColorIdx == "AccentColorDark" then
                        local Instance = Object.Instance
                        local yPos = Instance.AbsolutePosition.Y

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 0.69
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.43, 1)

                        if ColorIdx == "AccentColorDark" then
                            Color = Library:GetDarkerColor(Color)
                        end

                        Instance[Property] = Color
                    end
                end
            end
        end
    end
end)