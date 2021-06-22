local parser = require "united_love.packages.parser"

-- if you want to create new game object, there is two ways of that.
--
-- first method is, STATIC METHOD. just write <Name> = GameObject(<Name>) same as making new instance.
-- this way, you can use GameObject by directly using <Name>.
-- however, you can't create GameObject dynamically.
--
-- Second method is, DYNAMIC METHOD don't assign instance and just writs GameObject(<Name>) alone.
-- this way, you can't use GameObject directly by using its variable name, cause it dosen't has one. 
-- rather than call it by its variable name, you should use GameObject:find(<Name>).
-- but, you can create GameObject dynamically, maybe by use for loop.
--
-- Just remember... if you did first method, PLEASE REMOVE variable like "<Name>=nill"  or it will DISRUPT the GamObject.destroy.
-- and it may cause serious memory overflow problem.


require "united_love.united_love" 


-- if your united_love module folder is in the /package folder, please like this;
-- package.path = package.path .. ";packages/?.lua
-- require "united_love.united_love"

-- For here, declare GameObjects, which need to be decleared before game start.

local Banana_pic = GameObject("Banana_pic","T","G")
Banana_pic.graphics:newjpgImage("exp_sprites/banana.jpg")
local Banana_text = GameObject("Banana_text","T","G")
Banana_text.graphics:newText("Banana!", 15)
Banana_text.transform:changevar("y",100)
local Banana = GameObject("Banana", "T", "F")
Banana.folder:include(Banana_pic)
Banana.folder:include(Banana_text)
Transform.doRelationAll(Banana, Banana.folder.gbjstore, Transform.presetfunc.follow)
Banana.transform:changevar("x",100)
Banana.transform:changevar("y",300)
--[[
local Apple_pic = GameObject("Apple_pic","T","G")
Apple_pic.graphics:newjpgImage("exp_sprites/apple.jpg")
Apple_pic.transform:changevar("x",100)
Apple_pic.transform:changevar("y",100)

local Apple_text = GameObject("Apple_text","T","G")
Apple_text.graphics.drawable = love.graphics.newText(love.graphics.getFont(), "Apple!")
Apple_text.transform:changevar("x",100)
Apple_text.transform:changevar("y",75)
]]

--[[
local Apple = GameObject("Apple", "T", "F")
Apple.transform:changevar("x",100)
Apple.transform:changevar("y",100)
Apple.folder:include(Apple_pic)
Apple.folder:include(Apple_text)
for i,gbj in ipairs(Apple.folder.gbjstore) do
  Transform:relation(Apple.transform, "x", gbj.transform, "x", Transform.presetfunc.follow)
  Transform:relation(Apple.transform, "y", gbj.transform, "y", Transform.presetfunc.follow)
end
]]
local MAIN = GameObject("HIERARCHY", "F")
--MAIN.folder:include(Apple)
MAIN.folder:include(Banana)


Renderer_Main = Renderer()
local Camera = GameObject("Camera","T")
Camera.transform:changevar("x",512)
Camera.transform:changevar("y",320)
Renderer_Main:origin(Camera, 1024,640)
Renderer_Main:recept(Banana_text)
Renderer_Main:recept(Banana_pic)

return MAIN

--