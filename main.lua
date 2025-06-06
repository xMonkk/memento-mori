local hwid = gethwid()
print("got hwid:"..hwid)

local function encodeHwid(str)

    local function background_encode1(str)
        local hash = 0;
        local rand1 = 289;
        local rand2 = 198
        local encoded_hwid = base64.encode(str)
        for i = 1,#encoded_hwid do
            hash = hash + ((string.byte(encoded_hwid, i) * rand1) / rand2)
        end
        return hash
    end
    function encryption_decimals_to_letter(num)
        local integerPart = math.floor(num)
        local decimalPart = num - integerPart 

        local decimalPlaces = 0
        local tempNum = num

        while tempNum ~= math.floor(tempNum) do
            tempNum = tempNum * 10
            decimalPlaces = decimalPlaces + 1
        end

        local wholeDecimal = math.floor(decimalPart * (10 ^ decimalPlaces))
        return wholeDecimal
    end
    local hash1 = math.floor(background_encode1(str))
    local undone_hash2 = encryption_decimals_to_letter(background_encode1(str))
    function numberToTable(num)
        local digitTable = {}
        local numStr = tostring(num)

        for i = 1, #numStr do
            local digit = tonumber(numStr:sub(i, i))
            table.insert(digitTable, digit)
        end

        return digitTable
    end
    local hash2_table = numberToTable(undone_hash2)
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
    return hash1..hash2
end

local codedHwid = encodeHwid(hwid)
local real_hwid = game:HttpGet("https://candy-ablaze-marionberry.glitch.me/?key=".._G.Key)
print("got real hwid:"..real_hwid)
if #codedHwid ~= #real_hwid then print("THEY DONT MATCH") return end
local count = 0
for i = 1,#codedHwid do
    if string.byte(codedHwid:sub(i, i)) == string.byte(real_hwid:sub(i,i)) then
        count = count + 1
    end
end
if count == #codedHwid then
    print("Whitelisted")
end
