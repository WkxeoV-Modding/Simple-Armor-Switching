function armorCheck()
  headCheck()
  --chestPlateCheck()
  --legsCheck()
  --bootsCheck()
end

--checking for helmet
local headToggle = 0
function headCheck()
  headItem = player:getItem(6)
  --Leather Helmet
  if headItem.id == "minecraft:leather_helmet" and models.model.root.Head.LeatherHelmet ~= nil  then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.LeatherHelmet:setVisible(true)
  else
  clearHead()
  end
  --Chainmail Helmet
  if headItem.id == "minecraft:chainmail_helmet" and models.model.root.Head.ChainmailHelmet ~= nil then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.ChainmailHelmet:setVisible(true)
  else
  clearHead()
  end
  --Iron Helmet
  if headItem.id == "minecraft:iron_helmet" and models.model.root.Head.IronHelmet ~= nil  then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.IronHelmet:setVisible(true)
  else
  clearHead()
  end
  --Gold Helmet
  if headItem.id == "minecraft:golden_helmet" and models.model.root.Head.GoldHelmet ~= nil  then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.GoldHelmet:setVisible(true)
  else
  clearHead()
  end
  --Diamond Helmet
  if headItem.id == "minecraft:diamond_helmet" and models.model.root.Head.DiamondHelmet ~= nil then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.DiamondHelmet:setVisible(true)
  else
  clearHead()
  end
  --Netherite Helmet
  if headItem.id == "minecraft:netherite_helmet" and models.model.root.Head.NetheriteHelmet ~= nil  then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.NetheriteHelmet:setVisible(true)
  else
  clearHead()
  end
  --Turtle Helmet
  if headItem.id == "minecraft:turtle_helmet" and models.model.root.Head.TurtleHelmet ~= nil  then
  if headToggle == 1 then
  models.model.root.Head.EmptyHead:setVisible(false)
  end
  if headToggle == 0 then
  models.model.root.Head.EmptyHead:setVisible(true)
  end
  clearHead()
  models.model.root.Head.TurtleHelmet:setVisible(true)
  else
  clearHead()
  end
  --If nothing is in the helmet slot then reset to OG head
  if headItem.id == "minecraft:air" then
  models.model.root.Head.EmptyHead:setVisible(true)
  clearHead()
  end
end

function clearHead()
headItem = player:getItem(6)
if models.model.root.Head.LeatherHelmet ~= nil and headItem.id ~= "minecraft:leather_helmet" then
  models.model.root.Head.LeatherHelmet:setVisible(false)
  end
  if models.model.root.Head.ChainmailHelmet ~= nil and headItem.id ~= "minecraft:chainmail_helmet" then
  models.model.root.Head.ChainmailHelmet:setVisible(false)
  end
  if models.model.root.Head.IronHelmet ~= nil and headItem.id ~= "minecraft:iron_helmet" then
  models.model.root.Head.IronHelmet:setVisible(false)
  end
  if models.model.root.Head.GoldHelmet ~= nil and headItem.id ~= "minecraft:golden_helmet" then
  models.model.root.Head.GoldHelmet:setVisible(false)
  end
  if models.model.root.Head.DiamondHelmet ~= nil and headItem.id ~= "minecraft:diamond_helmet" then
  models.model.root.Head.DiamondHelmet:setVisible(false)
  end
  if models.model.root.Head.NetheriteHelmet ~= nil and headItem.id ~= "minecraft:netherite_helmet" then
  models.model.root.Head.NetheriteHelmet:setVisible(false)
  end
  if models.model.root.Head.TurtleHelmet ~= nil and headItem.id ~= "minecraft:turtle_helmet" then
  models.model.root.Head.TurtleHelmet:setVisible(false)
  end
end

function headOn()
headToggle = 1
end

function headOff()
headToggle = 0
end

function events.tick()
    armorCheck()
end

--Armor Actions/Menu
local armorPage = action_wheel:newPage("Armor")

local action = armorPage:newAction()
	:title("Keep Head?")
	:item("minecraft:leather_helmet")
	:hoverColor(1, 0, 1)
	:setOnToggle(headOn)
	:setOnUntoggle(headOff)

function events.entity_init()
	local lastPage = action_wheel:getCurrentPage()
	local action = lastPage:newAction()
	:title("Armor Menu")
	:item("minecraft:iron_sword")
	:hoverColor(1, 0, 1)
	:setOnLeftClick(armorPageChange)
end

local previousMenu = ""

function armorPageChange()
previousMenu = action_wheel:getCurrentPage()
action_wheel:setPage(armorPage)
end

function returnPage()
action_wheel:setPage(previousMenu)
end

local action = armorPage:newAction()
	:title("Return")
	:item("minecraft:barrier")
	:hoverColor(1, 0, 1)
	:setOnLeftClick(returnPage)