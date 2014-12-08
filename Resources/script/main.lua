--引入lua文件
require "script/Resource"
--引入gxlua库
require "script/gxlua/cocos"
require "script/gxlua/AudioEngine" 

-- cclog
-- local cclog = function(...)
--     print(string.format(...))
-- end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    
    cc.FileUtils:getInstance():addSearchPath("fonts")
    cc.FileUtils:getInstance():addSearchPath("image")
    cc.FileUtils.getInstance():addSearchPath("media")
    cc.FileUtils.getInstance():addSearchPath("script")
    
    cc.FileUtils:getInstance():addSearchPath("src/game/res")
    cc.FileUtils:getInstance():addSearchPath("src/game/start")
    cc.FileUtils:getInstance():addSearchPath("src/game/scene")
    cc.FileUtils:getInstance():addSearchPath("src/game/sprite")
    
    
    cc.FileUtils:getInstance():addSearchPath("res/game")
    cc.FileUtils:getInstance():addSearchPath("res/game/hero")
    cc.FileUtils:getInstance():addSearchPath("res/game/gem")
        
    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(480, 320, 0)
    cc.Director:getInstance():setDisplayStats(false)
    
    --进入游戏场景
    local scene = require("StartGame")
    local gameScene =scene:createScene()

    
    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(gameScene)
    else
        cc.Director:getInstance():runWithScene(gameScene)
    end

end