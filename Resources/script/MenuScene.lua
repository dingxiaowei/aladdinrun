module('MenuScene', package.seeall)
require "script/gxlua/logger"
require "script/gxlua/cocos"
require "script/gxlua/AudioEngine" 
require "script/gxlua/CCBReaderLoad"

-- function __G__TRACKBACK__(msg)
--     print("----------------------------------------")
--     print("LUA ERROR: " .. tostring(msg) .. "\n")
--     print(debug.traceback())
--     print("----------------------------------------")
-- end

-- function main()
-- 	local scene = CCScene:create()
-- 	-- ccb.MenuScene = MenuScene 
-- 	-- local gui = tolua.cast(CCBReaderLoad("ccbi/MenuScene.ccbi", GXCCBProxy:create(), true, "MenuScene"), "CCLayer")
-- 	-- scene:addChild(gui)
	
-- 	-- gui:registerScriptHandler(function(eventType)
-- 	-- 	if eventType == "enter" then
-- 	-- 		cclog("进入")
-- 	-- 	elseif eventType == "exit" then
-- 	-- 		cclog("离开")
-- 	-- 	end
-- 	-- end)
-- 	local sprite = CCSprite:create("dog.png")
-- 	scene:addChild(sprite)
-- 	CCDirector:sharedDirector():runWithScene(scene)
-- end

-- xpcall(main, __G__TRACKBACK__)
require "AudioEngine" 

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    local cclog = function(...)
        print(string.format(...))
    end

    -- require "hello2"
    -- cclog("result is " .. myadd(3, 5))

    ---------------

    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()

    -- create farm
    local function createLayerFarm()
        local layerFarm = CCLayer:create()

        -- add in farm background
        -- local bg = CCSprite:create("image/gui/MenuScene/MenuScene.jpg")
        -- bg:setPosition(origin.x + visibleSize.width / 2 , origin.y + visibleSize.height / 2)
        -- layerFarm:addChild(bg)

	    ccb.Avatar = MenuScene 
		local gui = tolua.cast(CCBReaderLoad("ccbi/Avatar.ccbi", GXCCBProxy:create(), true, "MenuScene"), "CCLayer")
		layerFarm:addChild(gui)

        return layerFarm
    end


    -- -- create menu
    -- local function createLayerMenu()
    --     local layerMenu = CCLayer:create()

    --     local menuPopup, menuTools, effectID

    --     local function menuCallbackClosePopup()
    --         -- stop test sound effect
    --         AudioEngine.stopEffect(effectID)
    --         menuPopup:setVisible(false)
    --     end

    --     local function menuCallbackOpenPopup()
    --         -- loop test sound effect
    --         local effectPath = CCFileUtils:sharedFileUtils():fullPathForFilename("effect1.wav")
    --         effectID = AudioEngine.playEffect(effectPath)
    --         menuPopup:setVisible(true)
    --     end

    --     -- add a popup menu
    --     local menuPopupItem = CCMenuItemImage:create("menu2.png", "menu2.png")
    --     menuPopupItem:setPosition(0, 0)
    --     menuPopupItem:registerScriptTapHandler(menuCallbackClosePopup)
    --     menuPopup = CCMenu:createWithItem(menuPopupItem)
    --     menuPopup:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
    --     menuPopup:setVisible(false)
    --     layerMenu:addChild(menuPopup)

    --     -- add the left-bottom "tools" menu to invoke menuPopup
    --     local menuToolsItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    --     menuToolsItem:setPosition(0, 0)
    --     menuToolsItem:registerScriptTapHandler(menuCallbackOpenPopup)
    --     menuTools = CCMenu:createWithItem(menuToolsItem)
    --     local itemWidth = menuToolsItem:getContentSize().width
    --     local itemHeight = menuToolsItem:getContentSize().height
    --     menuTools:setPosition(origin.x + itemWidth/2, origin.y + itemHeight/2)
    --     layerMenu:addChild(menuTools)

    --     return layerMenu
    -- end

    -- play background music, preload effect

    -- uncomment below for the BlackBerry version
    -- local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("background.ogg")
    local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("background.mp3")
    AudioEngine.playMusic(bgMusicPath, true)
    local effectPath = CCFileUtils:sharedFileUtils():fullPathForFilename("effect1.wav")
    AudioEngine.preloadEffect(effectPath)

    -- run
    local sceneGame = CCScene:create()
    sceneGame:addChild(createLayerFarm())
    CCDirector:sharedDirector():runWithScene(sceneGame)
end

xpcall(main, __G__TRACKBACK__)
