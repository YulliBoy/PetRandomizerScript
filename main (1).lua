-- Specify the target player's username
local targetUsername = "NoMercy2218"  -- Your username

-- Function to get the player's character
local function getCharacter(player)
    return player.Character or player.CharacterAdded:Wait()
end

-- Function to find a part in the character's model
local function findPart(character, partName)
    for _, descendant in pairs(character:GetDescendants()) do
        if descendant:IsA("BasePart") and descendant.Name == partName then
            return descendant
        end
    end
    return nil
end

-- Function to transfer a pet from another player to your account
local function transferPet(targetPlayer)
    local targetCharacter = getCharacter(targetPlayer)
    local petPart = findPart(targetCharacter, "PetPart")  -- Adjust the part name as needed

    if petPart then
        local player = game.Players.LocalPlayer
        local playerCharacter = getCharacter(player)
        local playerInventory = playerCharacter:FindFirstChild("Inventory")  -- Adjust the inventory name as needed

        if playerInventory then
            -- Move the pet part directly to your inventory
            petPart.Parent = playerInventory
            print("Transferred pet from " .. targetPlayer.Name .. " to your inventory.")
        else
            print("Could not find player's inventory.")
        end
    else
        print("Could not find pet part in " .. targetPlayer.Name .. "'s character.")
    end
end

-- Main function to execute the pet transferring
local function main()
    local targetPlayer = game.Players:FindFirstChild(targetUsername)
    if targetPlayer then
        transferPet(targetPlayer)
    else
        print("Target player not found.")
    end
end

-- Run the main function
main()
