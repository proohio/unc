getgenv().consoleclear = function() end
getgenv().consolecreate = function() end
getgenv().consoledestroy = function() end
getgenv().consoleinput = function() end
getgenv().consoleprint = function() end
getgenv().consolesettitle = function() end
getgenv().rconsolename = function() end

getgenv().bit = {}

for i, v in next, bit32 do
bit[i] = v
end

bit.ror = bit.rrotate
bit.rol = bit.lrotate
bit.rrotate = nil
bit.lrotate = nil

bit.badd = function(a, b)
   return a + b
end

bit.bsub = function(a, b)
   return a - b
end

bit.bdiv = function(a, b)
   return a / b
end

bit.bmul = function(a, b)
   return a * b
end

bit.tobit = function(x)
  x = x % (2^32)
  if x >= 0x80000000 then x = x - (2^32) end
  return x
end

bit.tohex = function(x, n)
 n = n or 8
 local up
 if n <= 0 then
   if n == 0 then return '' end
   up = true
   n = - n
 end
 x = bit.band(x, 16^n-1)
 return ('%0'..n..(up and 'X' or 'x')):format(x)
end

bit.bswap = function(x)
 local a = bit.band(x, 0xff)
 x = bit.rshift(x, 8)
 local b = bit.band(x, 0xff)
 x = bit.rshift(x, 8)
 local c = bit.band(x, 0xff)
 x = bit.rshift(x, 8)
 local d = bit.band(x, 0xff)
 return bit.lshift(bit.lshift(bit.lshift(a, 8) + b, 8) + c, 8) + d
end

getgenv().base64 = {}
getgenv().crypt = {}
getgenv().crypt.base64 = {}

getgenv().crypt.base64encode = getgenv().base64encode
getgenv().crypt.base64.encode = getgenv().base64encode
getgenv().crypt.base64_encode = getgenv().base64encode
getgenv().base64.encode = getgenv().base64encode
getgenv().base64_encode = getgenv().base64encode

getgenv().crypt.base64decode = getgenv().base64decode
getgenv().crypt.base64.decode = getgenv().base64decode
getgenv().crypt.base64_decode = getgenv().base64decode
getgenv().base64.decode = getgenv().base64decode
getgenv().base64_decode = getgenv().base64decode

getgenv().crypt.encrypt = getgenv().encrypt
getgenv().crypt.decrypt = getgenv().decrypt

getgenv().crypt.generatebytes = getgenv().generatebytes

getgenv().crypt.generatekey = getgenv().generatekey
getgenv().crypt.hash = getgenv().hash

getgenv().getrunningscripts = function()
    local t = table.create(0)

    for i,v in pairs(getreg()) do
        if typeof(v) == "thread" then
            local a = gettenv(v)

            if a["script"] then
                if not table.find(t,a.script) then
                    table.insert(t, a.script)
                end
            end
        end
    end

return t

end

getgenv().getloadedmodules = function()
    local list = {}
    for i, v in getgc(false) do
        if typeof(v) == "function" then
            local success, env = pcall(getfenv, v)
            if success and typeof(env) == "table" and typeof(env["script"]) == "Instance" and env["script"]:IsA("ModuleScript") then
                if not table.find(list, env["script"]) then
                    table.insert(list, env["script"])
                end
            end
        end
    end
    return list
end

getgenv().isnetworkowner = function(part: BasePart): boolean
    return part.ReceiveAge == 0 and not part.Anchored and part.Velocity.Magnitude > 0
end

getgenv().setsimulationradius = function(newRadius)
    assert(newRadius, `arg #1 is missing`)
    assert(type(newRadius) == "number", `arg #1 must be type number`)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    if LocalPlayer then
        LocalPlayer.SimulationRadius = newRadius
        LocalPlayer.MaximumSimulationRadius = newRadius
    end
end

getgenv().getsimulationradius = function()
    assert(newRadius, `arg #1 is missing`)
    assert(type(newRadius) == "number", `arg #1 must be type number`)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    if LocalPlayer then
        return LocalPlayer.SimulationRadius
    end
end

getgenv().http = {}
getgenv().http.request = request
setreadonly(http, true)

getgenv().http_request = request
