repeat task.wait() until game:IsLoaded()

local notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Kaiddd/notificationstuff/main/src.lua", true))()
local function notify(title, duration)
    notification(
        {
            Text = title,
            Duration = duration
        }
    )
end

notify("Loading Kaid's Admin...",3)

local uis = game:GetService("UserInputService")
local tws = game:GetService("TweenService")
local ws = game:GetService("Workspace")
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local UI = game:GetObjects("rbxassetid://10789324558")[1]

local function getPlayers()
	return plrs:GetPlayers()
end

local function parentHui(ui)
    if gethui and not gethiddengui then
        ui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ui)
		if gethiddengui then
			ui.Parent = gethiddengui()
			return
		end
        ui.Parent = game:GetService("CoreGui")
    elseif gethiddengui then
        ui.Parent = gethiddengui()
    else
        ui.Parent = game:GetService("CoreGui")
    end
end

local b={}b.isType=function(c,d)return typeof(c)==d end;local e={}e.inTable=function(c,f)local g=false;for h,i in next,f do if i==c then g=true;break end end;return g end;e.map=function(j,k)local l={}for m,i in next,j do table.insert(l,m,k(i))end;return l end;local n=false;local o={}o.__index=o;o.ClassName="Signal"function o.new()local self=setmetatable({},o)self._bindableEvent=Instance.new("BindableEvent")self._argData=nil;self._argCount=nil;self._source=n and debug.traceback()or""return self end;function o:Fire(...)if not self._bindableEvent then warn(("Signal is already destroyed. %s"):format(self._source))return end;self._argData={...}self._argCount=select("#",...)self._bindableEvent:Fire()end;function o:Connect(p)if not(type(p)=="function")then error(("connect(%s)"):format(typeof(p)),2)end;return self._bindableEvent.Event:Connect(function()p(unpack(self._argData,1,self._argCount))end)end;function o:Wait()self._bindableEvent.Event:Wait()assert(self._argData,"Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")return unpack(self._argData,1,self._argCount)end;function o:Destroy()if self._bindableEvent then self._bindableEvent:Destroy()self._bindableEvent=nil end;self._argData=nil;self._argCount=nil;setmetatable(self,nil)end;local q={}q.__index=q;q.New=function(r,s)local s=setmetatable({},s)local self=setmetatable({},q)self._Obj=assert(b.isType(r,"Instance")and r.ClassName=="TextBox"and r or false,"Object to spawn on is NOT a TextBox!")self._Underline=Instance.new("ImageLabel")self.Active=false;self.onExpand=o.new()self.onContract=o.new()self.beforeContract=o.new()self.beforeExpand=o.new()self.DColor=b.isType(s.Color,"Color3")and s.Color or Color3.fromRGB(100,53,255)self.Color=self.DColor;self.__Hooked=false;self.__fHookedObj=nil;self.__flHookedObj=nil;self._Underline.Name="underline"self._Underline.Parent=r;self._Underline.BackgroundColor3=Color3.fromRGB(100,53,255)self._Underline.BackgroundTransparency=1.000;self._Underline.Position=UDim2.new(0.5,0,0.949999988,0)self._Underline.Size=UDim2.new(0,0,0.0500000007,0)self._Underline.ZIndex=81;self._Underline.Image="rbxassetid://3570695787"self._Underline.ImageColor3=self.Color;self._Underline.ScaleType=Enum.ScaleType.Slice;self._Underline.SliceCenter=Rect.new(100,100,100,100)self._Underline.SliceScale=0.130;return self end;function q:expand()local t=true;self.beforeExpand:Fire(function()t=false end)if t then self._Underline:TweenSizeAndPosition(UDim2.fromScale(1,.05),UDim2.fromScale(0,.95),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,.5,true)self.onExpand:Fire()self.Active=true end end;function q:contract()local t=true;self.beforeContract:Fire(function()t=false end)if t then self._Underline:TweenSizeAndPosition(UDim2.fromScale(0,.05),UDim2.fromScale(.5,.95),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,.5,true)self.onContract:Fire()self.Active=false end end;function q:resetColor()self._Underline.ImageColor3=self.DColor end;function q:changeColor(u)local v=assert(types.isType(u,"Color3")and u or false,"You must provide a Color3 argument to change the colour")self._Underline.ImageColor3=v;self.Color=v end;function q:hook()assert(not self.__Hooked or not self.__HookedObj or not self.__fHookedObj,"Already hooked!")self.__fHookedObj=self._Obj.Focused:Connect(function()self:expand()end)self.__flHookedObj=self._Obj.FocusLost:Connect(function()self:contract()end)self.__Hooked=true end;function q:unHook()assert(self.__Hooked,"Not hooked!")self.__fHookedObj:Disconnect()self.__flHookedObj:Disconnect()self.__Hooked=false end;function q:dispose()self._Underline:Destroy()self.onExpand:Destroy()self.onContract:Destroy()self.beforeExpand:Destroy()self.beforeContract:Destroy()self:unHook()self=nil end
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/Lua-Nametags/main/Nametags.lua",true))()

local textboxUnderliner = q.New(UI.CommandBar.CommandInput)
UI.CommandBar.CommandInput.underline.ImageColor3 = Color3.fromRGB(255, 170, 255)
textboxUnderliner:hook()

local spoofed = {}
local function spoof(obj,prop,val)
	local foundDel = true
	while foundDel do
		for i,v in pairs(spoofed) do
			if v.obj == nil or (v.obj == obj and v.prop == prop) or not v.obj:IsDescendantOf(game) then
				table.remove(spoofed,i)
				break
			end
		end
		foundDel = false
	end
	if obj ~= nil and prop ~= nil then
		table.insert(spoofed,{obj=obj,prop=prop,val=val})
	end
end
local function unspoof(obj,prop)
	for i,v in pairs(spoofed) do
		if v.obj == obj and v.prop == prop then
			table.remove(spoofed,i)
			break
		end
	end
end

local newcclosure = newcclosure or function(a) warn('Exploit missing newcclosure, some detections may occur!') return a end
local hookmetamethod = hookmetamethod or hook_meta_method or function(object,metamethod,hook)
    local getrawmetatable = getrawmetatable or debug.getmetatable or getmetatable
    if getrawmetatable and setreadonly then
        if getrawmetatable == getmetatable then
            warn("Exploit doesn't have getrawmetatable, hookmetamethod will fail on any protected metatables")
        end
        local objMt = getrawmetatable(object)
        local oldMm = objMt[metamethod]
        setreadonly(objMt, false)
        objMt[metamethod] = newcclosure(hook)
        setreadonly(objMt, true)
        return oldMm
    else
        error("Exploit does not support metamethod hooking")
    end
end

local oldIndex
oldIndex = hookmetamethod(game,"__index",function(obj,prop,...)
	if not checkcaller() then
		for i,v in pairs(spoofed) do
			if v.obj == obj and v.prop == prop then
				return v.val
			end
		end
	end
	return oldIndex(obj,prop,...)
end)

local function getHum(target)
	if not target then
		if plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid") then
			return plr.Character:FindFirstChildWhichIsA("Humanoid")
		else
			return nil
		end
	else
		if target.Character and target.Character:FindFirstChildWhichIsA("Humanoid") then
			return target.Character:FindFirstChildWhichIsA("Humanoid")
		else
			return nil
		end
	end
end

local function getRoot(target)
	if not target then
		local hum = getHum()
		if hum and hum.RootPart then
			return hum.RootPart
		else
			return nil
		end
	else
		local hum = getHum(target)
		if hum and hum.RootPart then
			return hum.RootPart
		else
			return nil
		end
	end
end

local function completeUsername(partialName)
	for i,v in pairs(getPlayers()) do
		if partialName:lower() == tostring(v):sub(1,#partialName):lower() then
			return v
		end
	end
end
local commands = {}
local function completeCommands(partialName)
	local matchingCmds = {}
	for i,v in pairs(commands) do
		if partialName:lower() == v.name:sub(1,#partialName):lower() then
			table.insert(matchingCmds,v)
		else
			for i,v1 in pairs(v.names) do
				if partialName:lower() == v1:sub(1,#partialName):lower() then
					table.insert(matchingCmds,v)
					break
				end
			end
		end
	end
	return matchingCmds
end

local function getCommand(name)
	for i,v in pairs(commands) do
		if v.name == name then
			return v
		end
	end
end

local function getClosestCommandString(cmd,partialName)
	if type(cmd) == "string" then
		cmd = getCommand(cmd)
	end
	table.sort(cmd.names)
	for i,v in pairs(cmd.names) do
		if partialName:lower() == v:sub(1,#partialName):lower() then
			return v
		end
	end
end

local function Split(s, delimiter) --Ngl forgot where I got this function but no I didn't write it, too lazy to rewrite it, it works
	local result = {};
	for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match);
	end
	return result;
end

local function createCommand(name,names,init,onRun,gameIds)
	if type(name) ~= "string" then
		error("Invalid Command Name | Expected string, got "..typeof(names))
		return false
	end

	for i,v in pairs(names) do
		if v ~= v:lower() then
			error("One of command \"names\" contains an uppercase character, this will not work.")
			return false
		end
	end

	if name:lower() == name then
		warn("Warning | Command name does not include capitalization, is this on purpose?")
	end

	if type(names) ~= "table" then
		error("Invalid Command Names | Expected table, got "..typeof(names))
		return false
	end

    if type(gameIds) == "table" then
		local pass = false
		for i,v in pairs(gameIds) do
			if v == game.PlaceId then
				pass = true
			end
		end
		if not pass then
			return false
		end
	elseif gameIds then
		warn("GameIds Argument is supplied but is not of type table | This argument will currently be ignored.")
	end

	local command = {}
    table.insert(commands,command)
	
    command.name = name
	command.names = names
    
    if init then
        command.init = init
    else
        command.init = function()end
    end

	command.init()

	command.onRun = onRun

	return command
end

local function callCommand(cmdIn,args)
	table.remove(args,1)
	for i,cmd in pairs(commands) do
		for i,v in pairs(cmd.names) do
			if v == cmdIn then
				cmd.onRun(args)
				return
			end
		end
	end
end

createCommand("Walkspeed",{"walkspeed","ws","speed"},nil,function(args)
	local hum = getHum()
	if hum then
		local foundPlr = false
		for i,v in pairs(getPlayers()) do
			if v ~= plr then
				local tHum = getHum(v)
				if tHum then
					foundPlr = true
					spoof(hum,"WalkSpeed",tHum.WalkSpeed)
					break
				end
			end
		end
		if not foundPlr then
			spoof(hum,"WalkSpeed",16)
		end
		hum.WalkSpeed = tonumber(args[1]) or 16
	end
end)
createCommand("JumpPower",{"jumppower","jp"},nil,function(args)
	local hum = getHum()
	if hum then
		local foundPlr = false
		for i,v in pairs(getPlayers()) do
			if v ~= plr then
				local tHum = getHum(v)
				if tHum then
					foundPlr = true
					spoof(hum,"JumpPower",tHum.JumpPower)
					break
				end
			end
		end
		if not foundPlr then
			spoof(hum,"JumpPower",50)
		end
		hum.JumpPower = tonumber(args[1]) or 50
	end
end)
createCommand("View",{"view","spectate"},nil,function(args)
	local target = args[1] and completeUsername(args[1]) or plr
	if target then
		local hum = getHum(target)
		local lHum = getHum()
		if hum then
			ws.CurrentCamera.CameraSubject = hum
		elseif lHum then
			ws.CurrentCamera.CameraSubject = lHum
		end
	end
end)
createCommand("UnView",{"unview","unspectate"},nil,function(args)
	local hum = getHum()
	if hum then
		ws.CurrentCamera.CameraSubject = hum
	end
end)
local storedHh
createCommand("HipHeight",{"hipheight","hh"},nil,function(args)
	local hum = getHum()
	if hum then
		local foundPlr = false
		for i,v in pairs(getPlayers()) do
			if v ~= plr then
				local tHum = getHum(v)
				if tHum then
					foundPlr = true
					spoof(hum,"HipHeight",tHum.HipHeight)
					break
				end
			end
		end

		if not storedHh then
			storedHh = hum.HipHeight
		end

		if not foundPlr then
			spoof(hum,"HipHeight",storedHh)
		end
		
		hum.HipHeight = tonumber(args[1]) or storedHh
	end
end)

UI.CommandBar.CommandInput.FocusLost:Connect(function(enter)
	if enter then
		local command = UI.CommandBar.CommandInput.Text:gsub("  "," ")
		local args = Split(command," ")
		if args ~= {} then
			args[1] = args[1]:lower()

			callCommand(args[1],args)
		end
	end
	UI.CommandBar.CommandInput.Text = ""
	tws:Create(UI.CommandBar,TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,.1),{["Position"]=UDim2.new(.5,0,1.25,0)}):Play()
	task.wait(.2)
	UI.CommandBar.Visible = false
end)

UI.CommandBar.Visible = false

uis.InputBegan:Connect(function(input,locked)
	if input.KeyCode == Enum.KeyCode.Semicolon and not locked then
		UI.CommandBar.Position = UDim2.new(.5,0,1.25,0)
		UI.CommandBar.Visible = true
		tws:Create(UI.CommandBar,TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,.1),{["Position"]=UDim2.new(.5,0,.95,0)}):Play()
		task.wait()
		UI.CommandBar.CommandInput.Text = ""
		UI.CommandBar.CommandInput:CaptureFocus()
		task.wait()
		UI.CommandBar.CommandInput.Text = ""
	end
end)

-- Command intellisense uwu
local intellisenseExpanded = false
UI.CommandBar.CommandInput:GetPropertyChangedSignal("Text"):Connect(function()
	if UI.CommandBar.CommandInput.Text:sub(#UI.CommandBar.CommandInput.Text,#UI.CommandBar.CommandInput.Text) == "	" then
		if completeCommands(UI.CommandBar.CommandInput.Text) ~= 0 then
			UI.CommandBar.CommandInput.Text = UI.CommandBar.Intellisense.Text.." "
			UI.CommandBar.CommandInput.CursorPosition = #UI.CommandBar.CommandInput.Text+1
		end
	end
	local cmdRecommendations = completeCommands(UI.CommandBar.CommandInput.Text)
	if UI.CommandBar.CommandInput.Text ~= "" and #cmdRecommendations ~= 0 then
		UI.CommandBar.Intellisense.Text = getClosestCommandString(cmdRecommendations[1],UI.CommandBar.CommandInput.Text)
		if not intellisenseExpanded then
			intellisenseExpanded = true
			UI.CommandBar.IntellisenseFrame.Size = UDim2.new(.8,0,0,12)
			UI.CommandBar.IntellisenseFrame.Position = UDim2.new(.1,0,-.2,0)
			UI.CommandBar.IntellisenseFrame.Visible = true
			tws:Create(UI.CommandBar.IntellisenseFrame,TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,.1),{["Position"]=UDim2.new(.1,0,-3,-3)}):Play()
			tws:Create(UI.CommandBar.IntellisenseFrame,TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,.1),{["Size"]=UDim2.new(.8,0,3,0)}):Play()
		end
	else
		UI.CommandBar.Intellisense.Text = ""
		if intellisenseExpanded then
			tws:Create(UI.CommandBar.IntellisenseFrame,TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,.1),{["Size"]=UDim2.new(.8,0,0,12)}):Play()
			local tween = tws:Create(UI.CommandBar.IntellisenseFrame,TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,.1),{["Position"]=UDim2.new(.1,0,-.2,0)})
			tween:Play()
			tween.Completed:Wait()
			UI.CommandBar.IntellisenseFrame.Visible = false
			intellisenseExpanded = false
		end
	end
end)

--Assuming all commands are already created by now, we sort the commands table alphabetically
local old = {}
for i,v in pairs(commands) do
    table.insert(old, v.name)
end
table.sort(old)
local new = {}
for _, v in pairs(old) do
    local com = getCommand(v)
    table.insert(new, com)
end
commands = new

UI.CommandBar.IntellisenseFrame.Visible = false
parentHui(UI)

notify("Fully loaded!\nUse commands by pressing ';'",3)
