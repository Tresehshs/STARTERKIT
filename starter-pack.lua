-- Starter Pack Script
print("(Loaded) Starter Pack script for GrowSoft")

-- Items to give on first register
local starterItems = {
    { itemID = 9640,  itemCount = 1 },   -- Example: Fist
    { itemID = 20614, itemCount = 20 },  -- Example: Punch Jammer
    { itemID = 98,    itemCount = 1 },   -- Dirt Seed
    { itemID = 818,   itemCount = 1 },   -- Builder Lock
    { itemID = 20258, itemCount = 10 },  -- World Lock
    { itemID = 20616, itemCount = 20 },  -- Small Lock
    { itemID = 12600, itemCount = 5 },   -- Door
    { itemID = 25000, itemCount = 1 }    -- Custom Item
}

-- Gems to give
local starterGems = 100

-- Callback when a player registers
onPlayerRegisterCallback(function(world, player)

    -- Give starter items
    for i, item in ipairs(starterItems) do
        -- Show item effect animation
        world:useItemEffect(
            player:getNetID(),
            item.itemID,
            0,
            250 * i
        )

        -- Try adding to inventory
        if not player:changeItem(item.itemID, item.itemCount, 0) then
            -- If inventory full, send to backpack
            player:changeItem(item.itemID, item.itemCount, 1)
        end
    end

    -- Give gems
    player:addGems(starterGems, 1, 1)
    
    -- Optional: remove gems example
    if player:removeGems(25, 0, 0) then
        player:onConsoleMessage("Oh no! You lost 25 gems!")
    end

    -- Notification bubble
    player:onTalkBubble(
        player:getNetID(),
        "🎁 Starter Pack received!\n💎 Gems: " .. player:getGems(),
        1
    )

    -- Console message
    player:onConsoleMessage("Welcome to the server! Enjoy your starter kit 🎉")
end)
