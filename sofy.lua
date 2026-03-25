local Players = game:GetService("Players")

-- Lista de nombres de las armas que deben estar en ServerStorage
local DUEL_KIT = {"ClassicSword", "Pistol", "Shield"}

local function giveDuelKit(player)
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character
    
    if backpack then
        for _, weaponName in pairs(DUEL_KIT) do
            -- Busca el arma en ServerStorage
            local weapon = game.ServerStorage:FindFirstChild(weaponName)
            if weapon then
                -- Clonamos el arma para el jugador
                local weaponClone = weapon:Clone()
                weaponClone.Parent = backpack
            else
                warn("El arma " .. weaponName .. " no se encontró en ServerStorage")
            end
        end
    end
end

-- Ejemplo: Dar armas cuando el jugador escribe "/duel"
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        if message == "/duel" then
            print("Entregando kit de duelo a: " .. player.Name)
            giveDuelKit(player)
        end
    end)
end)
