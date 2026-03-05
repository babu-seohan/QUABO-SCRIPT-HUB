loadstring(game:HttpGet'https://sirius.menu/rayfield')()
local R=loadstring(game:HttpGet'https://sirius.menu/rayfield')()
local W=R:CreateWindow({Name="QUABO"})
local T=W:CreateTab("Q")
local lp=game.Players.LocalPlayer
local RS,UIS,cam=game.RunService,game.UserInputService,workspace.CurrentCamera
local aim,esp,fly,nc,se,av,fs,fv=false,false,false,false,false,false,false,50

T:CreateToggle({Name="Aimbot+WB",Callback=function(v)aim=v end})
T:CreateToggle({Name="ESP",Callback=function(v)esp=v if v then for _,p in game.Players:GetPlayers()do if p\~=lp and p.Character then local h=Instance.new("Highlight",p.Character)h.FillColor=Color3.new(1,0,0)h.FillTransparency=.4 end end else for _,o in workspace:GetDescendants()do if o:IsA"Highlight"then o:Destroy()end end end end})
T:CreateToggle({Name="Fly",Callback=function(v)fly=v local hrp=lp.Character and lp.Character.HumanoidRootPart if not hrp then return end if v then local bv=Instance.new("BodyVelocity",hrp)bv.MaxForce=Vector3.new(1e9,1e9,1e9)RS.Heartbeat:Connect(function()if not fly then return end local m=Vector3.new()local c=cam.CFrame if UIS:IsKeyDown(Enum.KeyCode.W)then m+=c.LookVector end if UIS:IsKeyDown(Enum.KeyCode.S)then m-=c.LookVector end if UIS:IsKeyDown(Enum.KeyCode.A)then m-=c.RightVector end if UIS:IsKeyDown(Enum.KeyCode.D)then m+=c.RightVector end if UIS:IsKeyDown(Enum.KeyCode.Space)then m+=Vector3.new(0,1,0)end if UIS:IsKeyDown(Enum.KeyCode.LeftShift)then m-=Vector3.new(0,1,0)end bv.Velocity=m.Unit*fv end)else if bv then bv:Destroy()end end end})
T:CreateSlider({Name="Fly Spd",Range={30,300},CurrentValue=50,Callback=function(v)fv=v end})
T:CreateToggle({Name="Noclip",Callback=function(v)nc=v end})
T:CreateToggle({Name="Speed",Callback=function(v)se=v local h=lp.Character and lp.Character:FindFirstChild("Humanoid")if h then h.WalkSpeed=v and 100 or 16 end end})
T:CreateToggle({Name="AntiVoid",Callback=function(v)av=v end})
T:CreateToggle({Name="FastShoot",Callback=function(v)fs=v end})

RS.Stepped:Connect(function()if nc and lp.Character then for _,p in lp.Character:GetDescendants()do if p:IsA"BasePart"then p.CanCollide=false end end end end)
RS.Heartbeat:Connect(function()if av and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")and lp.Character.HumanoidRootPart.Position.Y<-200 then lp.Character.HumanoidRootPart.CFrame=CFrame.new(0,50,0)end end)

UIS.InputBegan:Connect(function(i)if fs and i.UserInputType==Enum.UserInputType.MouseButton1 then spawn(function()while fs and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do task.wait(.005)end end)end end)
UIS.InputBegan:Connect(function(i)if i.KeyCode==Enum.KeyCode.RightShift then R:ToggleUI()end end)

local u=game.ReplicatedStorage:FindFirstChild("Modules",true)if u and u:FindFirstChild("Utility")then local ut=require(u.Utility)local o=ut.Raycast ut.Raycast=function(...)local a={...}if aim then local t,d=nil,math.huge for _,p in game.Players:GetPlayers()do if p\~=lp and p.Character and p.Character.Head then local pos=cam:WorldToViewportPoint(p.Character.Head.Position)local dd=(Vector2.new(pos.X,pos.Y)-cam.ViewportSize/2).Magnitude if dd<d then t=p.Character.Head.Position d=dd end end end if t then a[3]=(t-a[1]).Unit*999 end end return o(unpack(a))end end

R:Notify({Title="QUABO",Content="RightShift"})
