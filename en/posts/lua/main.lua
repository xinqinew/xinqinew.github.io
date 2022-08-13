numMainLua = 1.4
toast("主脚本:" .. numMainLua)
xiangMu = "stars"
appXiangMu = "stars"
serverIP = "1x9722733t.iask.in"
wanmaoIP = "192.168.1.34"
-- ftpName = "xinqinew"
-- ftpPassword = "Qwer1234"
ftpName = "anonymous"
ftpPassword = ""

init(1)
isUpdateLua = 0
luaGithub = "https://raw.githubusercontent.com/xinqinew/rise-of-stars/main/riseOfStars.lua"
luaXinQi = "https://xinqi.gq/posts/lua/riseOfStars.lua"
luaGitee = "https://gitee.com/xinqinew_admin/rise-of-stars/raw/master/riseOfStars.lua"
luaFakeGithub = "https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars/riseOfStars.lua"
luaFile = luaXinQi

require("tsnet")
-- 行号
-- local x = debug.getinfo(1).currentline
luaExitIfCall(false)
local sz = require("sz")
local ocr = require "cloudOcr";
ts = require("ts")
ts.ftp.setFTPTimeOut(1)


require "TSLib" -- 使用本函数库必须在脚本开头引用并将文件放到设备 lua 目录下
-- UINew()
-- UIShow() --显示 UI，UI 设置完成记得加上该函数，不然不能创建显示
-- require "TSLib"--使用本函数库必须在脚本开头引用并将文件放到设备 lua 目录下
-- toast(TSVersions())
-- lua_exit()
-- local ts = require("ts")
-- toast(ts.version())
-- lua_exit()
-- local mail = require "mail";   --载入扩展库
local plist = sz.plist
local szFtp = sz.ftp
local json = sz.json
version = getTSVer();
if version == "2.2.4" then
    -- setAutoLockTime(0);           --设置锁屏时间,0到5，0是代表永不锁屏，1~5位锁屏时间，单位为分

    -- if whoAmI() ~= 1 then
    -- http1 = sz.i82.http
    -- end
    luaPath = "/User/Media/TouchSprite"
    luaMuLu = luaPath .. "/lua/"
    -- dialog(version,0)
else
    setAssistiveTouchEnable(false); -- 关闭小圆点
    setReduceMotionEnable(true) -- 打开减弱动画效果 
    setVolumeLevel(0); -- 设置设备音量,范围 0 - 1
    setAutoLockTime(0); -- 设置锁屏时间,0到5，0是代表永不锁屏，1~5位锁屏时间，单位为分

    init(1)
    if whoAmI() ~= 1 then
        http1 = sz.i82.http
    end
    -- require "TSLib"--使用本函数库必须在脚本开头引用并将文件放到设备 lua 目录下
    -- if version == "2.4.1" then
    --         luaPath = "/User/Media/TouchSprite"
    -- else
    --         luaPath = userPath();
    -- end
    luaPath = userPath();
    if whoAmI() == 1 then
        luaMuLu = luaPath .. "/script/"
    else
        luaMuLu = luaPath .. "/lua/"
    end
    if version ~= "2.2.4" then
        -- setDeviceOrient(1); --设置屏幕方向,0 - 竖屏；1 - Home键在右边；2 - Home键在左边
        setRotationLockEnable(true); -- 打开方向锁定
    end
    -- ab = isFileExist(luaMuLu..xiangMu..".plist") --存在返回true，不存在返回false
    -- if ab == true then
    --         dialog("文件存在",0)
    -- else
    --         dialog("文件不存在",0)
    -- end
    -- appPath = appBundlePath(appXiangMu);   --获取"百度地图"安装路径
    -- dataPath = appDataPath(appXiangMu);
    -- dialog("安装路径"..appPath,0);
    -- --实例1
    -- local num = 0
    -- fwShowWnd("wid",100,100,200,500,1)
    -- fwShowTextView("wid","id1","点击：" .. num,"center","FF0000","FFDAB9",15,0,0,0,200,100)
    -- fwShowTextView("wid","id2","闪","center","FFFFFF","0000FF",15,0,300,0,400,100)
    -- fwShowWnd("wida",300,300,500,500,1)
    -- fwShowButton("wida","vid","点我","FFFFFF","FF0000","",15,0,0,100,100)
    -- while (true) do
    --     local vid = fwGetPressedButton()
    --     if vid == "vid" then
    --         num = num + 1
    --         fwShowTextView("wid","id1","点击：" .. num,"center","FF0000","FFDAB9",15,0,0,0,200,100)
    --         if num%2 == 0 then
    --             fwShowTextView("wid","id2","闪","center","FFFFFF","0000FF",15,0,300,0,400,100)
    --         else
    --             fwCloseView("wid","id2")
    --         end
    --     end
    -- end

    -- --实例2
    -- fwShowWnd("wid",0,0,200,200,1)
    -- fwShowButton("wida","vid","点我","FFFFFF","FF0000","",15,0,0,100,100)
    -- mSleep(10000)
    -- fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
    -- snapshot("1.png",400,400,600,500)
    -- mSleep(500)
    -- fwShowImageView("wid","picid","1.png",0,100,200,200)
    -- mSleep(3000)
    -- fwCloseView("wid","textid")
    -- mSleep(3000)
    -- -- fwCloseWnd("wid") --关闭窗口
    -- mSleep(1000)
    -- wndTab = fwGetWndPos("wid")
    -- dialog("窗口获取状态："..wndTab.ret.."\n".."左上角坐标："..wndTab.x..","..wndTab.y.."\n".."右下角坐标："..wndTab.x1..","..wndTab.y1, 2)
    -- mSleep(1000000)

    -- --webUI示例代码1
    -- local html = [[
    -- <!DOCTYPE html>
    -- <html>
    -- <head>
    --     <meta charset="utf-8">
    --     <title>数据提交简单示例</title>
    --     <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    --     <meta name="apple-mobile-web-app-capable" content="yes">
    --     <meta name="apple-mobile-web-app-status-bar-style" content="black">
    --     <!--标准mui.css-->
    --     <!--App自定义的css-->
    -- </head>
    -- <body>
    --     <form id="form1" name="showUI_commit" method="post" action="/set_event">
    --         <br>
    --         <h5>输入框-普通</h5>
    --         <label>输入框：
    --             <input type="text" name="com3" value="测试" placeholder="请输入">
    --         </label>
    --         <br>
    --         <h5>输入框-数字</h5>
    --         <label>输入框：
    --             <input type="number" name="com4" value="1" placeholder="请输入">
    --         </label>
    --         <br>
    --         <h5>输入框-多行</h5>
    --         <label>输入框：
    --             <textarea name="com7" placeholder="请输入" row="5">asd</textarea>
    --         </label>
    --         <br>
    --         <br>
    --         <button id="actions" type="button">提交</button>
    --         <button id="cancel" type="button">取消</button>
    --     </form>
    --     <script type="text/javascript">
    --     function actions(data) {//数据提交post请求
    --         var xhr = new XMLHttpRequest();
    --         xhr.open("POST", "/set_event", true);
    --         xhr.setRequestHeader("Content-type", "application/json");
    --         xhr.onreadystatechange = function() {
    --             var XMLHttpReq = xhr;
    --             if (XMLHttpReq.readyState == 4) {
    --                 if (XMLHttpReq.status == 200) {
    --                     var text = XMLHttpReq.responseText;
    --                     console.log(text);
    --                 } else {
    --                     console.log(XMLHttpReq.status)
    --                 }
    --             } else {
    --                 console.log(XMLHttpReq.readyState);
    --             }
    --         };
    --         alert('{"name": "showUI_commit","value":' + data + '}')
    --         xhr.send('{"name": "showUI_commit","value":"' + data + '"}');
    --     }
    --     function closed() {//取消post请求
    --         var xhr = new XMLHttpRequest();
    --         xhr.open("POST", "/set_event", true);
    --         xhr.setRequestHeader("Content-type", "application/json");
    --         xhr.onreadystatechange = function() {
    --             var XMLHttpReq = xhr;
    --             if (XMLHttpReq.readyState == 4) {
    --                 if (XMLHttpReq.status == 200) {
    --                     var text = XMLHttpReq.responseText;
    --                     console.log(text);
    --                 } else {
    --                     console.log(XMLHttpReq.status)
    --                 }
    --             } else {
    --                 console.log(XMLHttpReq.readyState);
    --             }
    --         };
    --         xhr.send('{"name": "showUI_cancel"}');
    --     }
    --     document.getElementById('actions').onclick = function() {//数据提交按钮点击
    --         var com3Val = document.getElementsByName('com3')[0].value; //获取name为com3的值
    --         var com4Val = document.getElementsByName('com4')[0].value; //获取name为com7的值
    --         var com7Val = document.getElementsByName('com7')[0].value; //获取name为com3的值
    --         var data = com3Val + "," + com4Val + "," + com7Val;
    --         actions(data);
    --     }
    --     document.getElementById('cancel').onclick = function() {//取消按钮点击
    --         closed();
    --     }
    --     </script>
    -- </body>
    -- </html>
    -- ]]
    -- local thread = require('thread')
    -- local event = require('event')
    -- --创建webview
    -- local showui_view,err = require('webview').new("myshowui",
    --     {html=html})
    -- assert(showui_view,err)
    -- event.register("showUI_commit",function(value)
    --     local sz = require('sz')
    --     local json = sz.json
    --     toast(json.encode(value),5)
    --     showui_view.close()
    -- end)
    -- event.register("showUI_cancel",function(value)
    --     showui_view.close()
    -- end)
    -- showui_view.show()
    -- thread.waitAllThreadExit()

    -- webUI示例代码2
    -- local html = [[
    -- <!DOCTYPE html>
    -- <html>
    -- <head>
    --     <meta charset="utf-8">
    --     <title>Hello 触动精灵 ShowUI</title>
    --     <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    --     <meta name="apple-mobile-web-app-capable" content="yes">
    --     <meta name="apple-mobile-web-app-status-bar-style" content="black">
    --     <!--标准mui.css-->
    --     <link rel="stylesheet" href="css/tsShowUI.css">
    --     <!--App自定义的css-->
    -- </head>
    -- <body>
    --     <header class="mui-bar mui-bar-nav">
    --         <button id="ts-cancle" class="mui-action-back mui-btn mui-btn-blue mui-btn-link mui-btn-nav mui-pull-left"><span class="mui-icon mui-icon-left-nav"></span><span class=" mui-tscancel">返回</span></button>
    --         <h1 class="mui-title mui-tstitle"></h1>
    --     </header>
    --     <footer class="mui-bar mui-bar-footer mui-bar-tsfooter">
    --         <button id="ts-post-btn" class="mui-ts-footerbth btn mui-btn-block mui-btn-blue mui-tsaction" data-loading-text="执行中" type="button">开始</button>
    --     </footer>
    --     <div class="mui-content">
    --         <form class="mui-tsform">
    --             <div class="mui-card" id="renderbox">
    --             </div>
    --         </form>
    --     </div>
    --     <script src="js/tsShowUI.js"></script>
    --     <script>
    --     (function($, doc) {
    --         var uiVersion=$.getVersion();//获取ui版本
    --         //json兼容原showui 格式
    --         var showui_json = {
    --             "title": "触动精灵脚本配置", //给页面添加标题（默认标题无）
    --             "cancelname": "取消", //给页面取消按钮添加文字（默认文字无）
    --             "config": "save_01",
    --             "okname": "开始", //给页面开始按钮添加文字（默认“开始”）
    --             "style": "default",
    --             "timer": 99,
    --             "orient": 0,
    --             "pagetype": "multi",
    --             "view": [{
    --                 "type": "Label",
    --                 "text": "标题1",
    --                 "size": 18,
    --                 "align": "center",
    --                 "color": "0,168,233"
    --             }, {
    --                 "type": "Image",
    --                 "src": "http://www.touchsprite.com/wp-content/uploads/2016/10/banner2_790x230-790x0.png"
    --             }, {
    --                 "type": "Label",
    --                 "text": "switches控件",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "type": "switches",
    --                 "list": "开关1,开关2,开关3",
    --                 "select": "0@2"
    --             }, {
    --                 "type": "Label",
    --                 "text": "RadioGroup控件",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi4",
    --                 "type": "RadioGroup",
    --                 "list": "选项1,选项2,选项3",
    --                 "select": "1"
    --             }, {
    --                 "type": "Label",
    --                 "text": "Edit控件（普通）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi5",
    --                 "type": "Edit",
    --                 "prompt": "请输入一个字母",
    --                 "text": "默认值",
    --                 "kbtype": "ascii"
    --             }, {
    --                 "type": "Label",
    --                 "text": "Edit控件（多行）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi6",
    --                 "type": "Edit",
    --                 "prompt": "请输入一个字母",
    --                 "text": "默认值",
    --                 "row": "5",
    --                 "kbtype": "ascii"
    --             }, {
    --                 "type": "Label",
    --                 "text": "Edit控件（滑块）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "type": "Edit",
    --                 "prompt": "请输入一个数字",
    --                 "text": "2",
    --                 "kbtype": "range",
    --                 "max": "100",
    --                 "min": "0",
    --             }, {
    --                 "type": "Label",
    --                 "text": "Edit控件（数字）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi7",
    --                 "type": "Edit",
    --                 "prompt": "请输入一个数字",
    --                 "text": "123456",
    --                 "kbtype": "number"
    --             }, {
    --                 "type": "Label",
    --                 "text": "Edit控件（密码）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi8",
    --                 "type": "Edit",
    --                 "prompt": "请输入密码",
    --                 "text": "hhkjkjh",
    --                 "kbtype": "password"
    --             }, {
    --                 "type": "Label",
    --                 "text": "CheckBoxGroup控件",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi9",
    --                 "type": "CheckBoxGroup",
    --                 "list": "选项1,选项2,选项3,选项4",
    --                 "select": "0@3",
    --             }, {
    --                 "type": "Label",
    --                 "text": "ComboBox控件（二级）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi10",
    --                 "type": "ComboBox",
    --                 "list": "选项1,选项2,选项3",
    --                 "select": "2",
    --                 "data": "子选项1,子选项2,子选项3,子选项4#子选项5,子选项6,子选项7#子选项8,子选项9",
    --                 "source": "test"
    --             }, {
    --                 "type": "Label",
    --                 "text": "ComboBox控件（一级）",
    --                 "size": 16,
    --                 "align": "left",
    --                 "color": "0,168,233"
    --             }, {
    --                 "id": "ceshi11",
    --                 "type": "ComboBox",
    --                 "list": "选项1,选项2,选项3,选项4,选项5,选项6,选项7",
    --                 "select": "1"
    --             }]
    --         };
    --         $.renderUI(showui_json);
    --     })(mui, document)
    --     </script>
    -- </body>
    -- </html>
    -- ]]
    -- local thread = require('thread')
    -- local event = require('event')
    -- local sz = require('sz')
    -- local json = sz.json
    -- --创建webview
    -- local showui_view,err = require('webview').new("myshowui",
    --     {html=html})
    -- assert(showui_view,err)
    -- event.register("showUI_commit",function(value)
    --     toast(json.encode(value),10)
    --     showui_view.close()
    -- end)
    -- event.register("showUI_cancel",function(value)
    --     showui_view.close()
    -- end)
    -- showui_view.show()
    -- thread.waitAllThreadExit()
end

-------------------色值---------------------

-------------------色值---------------------

-- math.modf(x/y),取整,取余,此函数,第一参数返回整数部分,第二个参数返回小数部分
-- function pushover( request )
--         local sz = require("sz")
--         local json = sz.json
--         local http = require("szocket.http")
--         local pushover_url = "https://api.pushover.net/1/messages.json"

--         local data_str = {}
--         for k,v in pairs(request) do
--                 table.insert(data_str, tostring(k) .. "=" .. tostring(v))
--         end
--         data_str = table.concat(data_str, "&")

--         local res, code = http.request(pushover_url, data_str)
--         local back = json.decode(res)
--         if (code ~= 200) then
--                 local errstr = "发送请求错误。错误代码: " .. tostring(code) .. ", 错误信息: " .. tostring(res)
--                 return false, errstr
--         elseif (back.status ~= 1) then
--                 local errstr = "信息推送错误: " .. tostring(res)
--                 return false, errstr
--         end

--         return true

-- end

-- local request = { token   = "abNRhRebF4UM4kqvMwohoE3QEJRqRK",
--                   user    = "uK1dVzvMEVxy59YkvcxdgtvUfyf6WC",
--                   device  = "iphone6",
--                   title   = "脚本运行错误",
--                   message = "请从新启动脚本"
--                 }

-- local success, err = pushover( request )

-- if (success) then
--   dialog("推送成功",0)
-- else
--   dialog("推送失败:\n" .. err,0)
-- end
-- lua_exit()

-- iphoneId = sz.system.mgcopyanswer("UserAssignedDeviceName") -- 获取设备名称
iphoneId = getDeviceName()
plistsTMP = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\r<plist version=\"1.0\">\r<dict/>\r</plist>\r"
plistsA = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\r<plist version=\"1.0\">\r<dict>\r\t<key>com.tongbu.sdk.key.assistantview.location</key>\r\t<string>{{0, 273}, {47, 47}}</string>\r\t<key>LastServerInfoID</key>\r\t<integer>"
plistsB = "</integer>\r</dict>\r</plist>\r"

APP1, APP2, APP = {}, {}, {}
APP1.No = 1
APP2.No = 2
-- playAudio("huochewang.mp3")
-- vibrator(); --振动

isXunHuanLua = true

nowTime = os.time();
nowDateTime = os.date("*t")
today = tonumber(os.date("%w", os.time()))
f = string.find;
httpDownNo = 0
ftpDownNo = 0
ftpUpNo = 0
numIphoneID = tonumber(iphoneId)
numQuanZi = math.modf(numIphoneID / 5)
numQuanZiXiaoHao = numIphoneID % 5

timeGengXinLua = nowTime
timeGengXinGame = nowTime - 10 * 60
timeWifi = nowTime
isChongZhiLua = false
timeQieHuanGame = nowTime
timeInitGame = nowTime

hdBaiQiShenJue, hdFenXiang, hdQianKunLu, hdMenPaiChuangGuan, hdZhongHua, hdQiChongTian = 1, 2, 3, 4, 5, 6
hdBuCanYu = { hdBaiQiShenJue, hdFenXiang, hdQianKunLu, hdMenPaiChuangGuan, hdZhongHua }
hdCanYu = { 0 }

fuWuQiLieBiao1, fuWuQiLieBiao2, fuWuQiLieBiao3, fuWuQiLieBiao4, fuWuQiLieBiao5, fuWuQiLieBiao6, fuWuQiLieBiao7, fuWuQiLieBiao8, fuWuQiLieBiao9, fuWuQiLieBiao10, fuWuQiLieBiao11, fuWuQiLieBiao12, fuWuQiLieBiao13, fuWuQiLieBiao14, fuWuQiLieBiao15 = "黑龙之巢", "白银之手", "魔力之源", "风之哀殇", "太阳神殿", "银色港湾", "灰烬之地",
    "毁灭风暴", "龙魂圣殿", "生命之森", "战神山麓", "巨龙年代", "上古战魂", "恶魔之瞳",
    "命运路口"
fuWuQiLieBiao_JianXie = { fuWuQiLieBiao1, fuWuQiLieBiao2, fuWuQiLieBiao3, fuWuQiLieBiao4, fuWuQiLieBiao5, fuWuQiLieBiao6,
    fuWuQiLieBiao7, fuWuQiLieBiao8, fuWuQiLieBiao9, fuWuQiLieBiao10, fuWuQiLieBiao11,
    fuWuQiLieBiao12, fuWuQiLieBiao13, fuWuQiLieBiao14, fuWuQiLieBiao15 }

fuWuQiLieBiao1, fuWuQiLieBiao2, fuWuQiLieBiao3, fuWuQiLieBiao4, fuWuQiLieBiao5, fuWuQiLieBiao6, fuWuQiLieBiao7, fuWuQiLieBiao8, fuWuQiLieBiao9, fuWuQiLieBiao10, fuWuQiLieBiao11, fuWuQiLieBiao12, fuWuQiLieBiao13, fuWuQiLieBiao14, fuWuQiLieBiao15 = "server=黑龙之巢-999920-1101011008", "server=白银之手-999950", "server=魔力之源-999990",
    "server=风之哀殇-999980", "server=太阳神殿-999970", "server=银色港湾-999960",
    "server=灰烬之地-999950", "server=毁灭风暴-999940", "server=龙魂圣殿-999930",
    "server=生命之森-999920", "server=战神山麓-999910", "server=巨龙年代-999910",
    "server=上古战魂-999990-1101011001", "server=恶魔之瞳-999890", "server=命运路口-999960-1101011004"
fuWuQiLieBiao = { fuWuQiLieBiao1, fuWuQiLieBiao2, fuWuQiLieBiao3, fuWuQiLieBiao4, fuWuQiLieBiao5, fuWuQiLieBiao6,
    fuWuQiLieBiao7, fuWuQiLieBiao8, fuWuQiLieBiao9, fuWuQiLieBiao10, fuWuQiLieBiao11, fuWuQiLieBiao12,
    fuWuQiLieBiao13, fuWuQiLieBiao14, fuWuQiLieBiao15 }

fuWuQiIP1, fuWuQiIP2, fuWuQiIP3, fuWuQiIP4, fuWuQiIP5, fuWuQiIP6, fuWuQiIP7, fuWuQiIP8, fuWuQiIP9, fuWuQiIP10, fuWuQiIP11, fuWuQiIP12, fuWuQiIP13, fuWuQiIP14, fuWuQiIP15 = "host=59.151.112.41", "host=59.151.112.41", "host=59.151.97.233", "host=59.151.97.236", "host=59.151.112.12",
    "host=59.151.112.9", "host=59.151.97.239", "host=59.151.112.50", "host=59.151.112.16", "host=59.151.112.17",
    "host=59.151.112.17", "host=59.151.112.47", "host=59.151.78.135", "host=59.151.78.142", "host=59.151.78.143"
fuWuQiIP = { fuWuQiIP1, fuWuQiIP2, fuWuQiIP3, fuWuQiIP4, fuWuQiIP5, fuWuQiIP6, fuWuQiIP7, fuWuQiIP8, fuWuQiIP9,
    fuWuQiIP10, fuWuQiIP11, fuWuQiIP12, fuWuQiIP13, fuWuQiIP14, fuWuQiIP15 }

ServerArea_MianFei, ServerArea_DianKa = "area=免费区", "area=点卡服"
ServerArea = { ServerArea_MianFei, ServerArea_MianFei, ServerArea_DianKa, ServerArea_DianKa, ServerArea_DianKa,
    ServerArea_DianKa, ServerArea_DianKa, ServerArea_DianKa, ServerArea_DianKa, ServerArea_DianKa,
    ServerArea_DianKa, ServerArea_MianFei, ServerArea_MianFei, ServerArea_DianKa, ServerArea_MianFei }

ServerList_MianFei, ServerList_DianKa = "免费区1=免费区", "点卡服1=点卡服"
ServerList = { ServerList_MianFei, ServerList_MianFei, ServerList_DianKa, ServerList_DianKa, ServerList_DianKa,
    ServerList_DianKa, ServerList_DianKa, ServerList_DianKa, ServerList_DianKa, ServerList_DianKa,
    ServerList_DianKa, ServerList_MianFei, ServerList_MianFei, ServerList_DianKa, ServerList_MianFei }

-- ############################
jinBiDict = { "0040380F07218460B83FFFFFE018$4$0.0.51$13", "100E0180618C318619E3FF18E$3$0.0.56$14",
    "0E3FC7184608C11823843F03E$5$0.0.54$13", "1E7FC7104608C11823843F03E$5$0.0.55$13",
    "1F0FF186606C0D811863FF1FE$9$0.0.64$14", "3FEFFF00400801003007FF3FE$0$0.0.55$13",
    "1FE7FD8C610C618C19C39F21E$6$0.0.66$14", "8010020040783D1C3E0780C00$7$0.0.31$13",
    "1C67DD9E618C318618E3FF1CE$8$0.0.69$14", "0040380F072184E1B83FFF80E008$4$0.0.44$13",
    "180601807FFFFE$1$0.0.32$13", "300E0581E03C0D8318C3F01C0$2$0.0.48$14",
    "100E0181E03C0D8318C3F81C0$2$0.0.48$14", "100E0581E03C0D8318C3F01C0$2$0.0.48$14" }
timeMaiLan = nowTime - 10 * 60
timeChiBang = nowTime - 10 * 60
timeTouXiang = nowTime - 10 * 60
timeXueTiao = nowTime
isHongDian = true
timeZhengLi = nowTime - 10 * 60
timeDingShiDianRenWu = nowTime - 60 * 60
timeJiNeng = nowTime - 10 * 60
timeQiangHua = nowTime - 10 * 60
timeJiaoSe = nowTime - 10 * 60
timeHuoDong = nowTime - 10 * 60
timeZhuanZhi = nowTime - 10 * 60
timeZiYuan = nowTime - 30 * 60
timeZhanMeng = nowTime - 60 * 60
timeChiBang = nowTime - 60 * 60 * 2
timeChengJiu = nowTime

yuMaoOrHuoZhong = "yuMao"
isBossTime = false
numBossTime = 0
numZhanMeng = 0
mbCon1, mbCon2, mbCon3 = 3, 4, 5
dictZL = 0
nameFuBen = "无"
timeXiaoHao = nowTime
timeCangKu = nowTime
numNextQiangHua = 0
timeYouJian = nowTime

timeHanHua = nowTime
jiaGeDiWang = 50
hanHuaNeiRong1 = "帝王书一千本" .. jiaGeDiWang .. "钻,点我交易."
hanHuaNeiRong2 = "精灵泪一千个" .. jiaGeDiWang .. "钻,点我交易."
hanHuaNeiRong3 = "出断魂,先知,女神之光，精灵泪,祝福,要的m"
-- 目标1
-- strTarget = "无,挂机,主线,研究,建造,生产"
muBiaoA, mb_Wu, mb_YouHua, mb_ZhuXian, mb_ZhiXian, mb_JianZao, mb_ShengChan, mb_WaKuang, mb_EveryDay, mb_WuZi, mb_ShiLianZhiDi, mb_WaBao, mb_WanMoTa, mb_SaoDang, mb_ZhanMengRiChang, mb_JinBi, mb_GuaJi = "无", "无", "优化", "主线", "研究", "建造", "生产", "挖矿", "日常", "物资", "试炼之地",
    "挖宝", "万魔塔", "扫荡", "战盟日常", "金币", "挂机";
--              1         2          3          4          5         6           7        8         9           10        11          12          13               14        15
muBiaoA, mm_Wu, mm_YouHua, mm_ZhuXian, mm_ZhiXian, mm_JianZao, mm_ShengChan, mm_WaKuang, mm_EveryDay, mm_WuZi, mm_ShiLianZhiDi, mm_WaBao, mm_WanMoTa, mm_SaoDang, mm_ZhanMengRiChang, mm_JinBi, mm_GuaJi = "无", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15";

-- 目标2
mb_5DaoJu, mb_CaiJi, mb_Reward, mb_JiNeng, mb_YouHua = "5道具", "采集", "收获", "技能", "优化";
--   1      2      3       4          5
mm_5DaoJu, mm_CaiJi, mm_Reward, mm_JiNeng, mm_YouHua = "1", "2", "3", "4", "5";

-- 目标3
mb_ZhengLi, mb_ChuHang, mb_FixShip, mb_MaiLan, mb_MaiHong, mb_HuanJiaoSe, mb_ZhengLiMaiLan, mb_ChiBang, mb_ChengHao, mb_JiaHaoYou, mb_FaSongSiXin, mb_DengDaiHuiFu, mb_DengDaiSiXin, mb_DengDaiJiaoYi, mb_QianWangJiaoYi, mb_XiaoHaoZhengLi, mb_JY_HuanJiaoSe, mb_CangKuZhengLi, mb_MaiShu = "整理", "出航", "修船", "买蓝", "买红", "换角色", "整理买蓝", "翅膀", "称号", "加好友",
    "发送私信", "等待回复", "等待私信", "等待交易", "前往交易", "小号整理", "交易换角色",
    "仓库整理", "卖书";
--   1       2         3           4          5           6             7               8           9          10                11               12             13                14               15          16                   17             18             19
mm_ZhengLi, mm_ChuHang, mm_FixShip, mm_MaiLan, mm_MaiHong, mm_HuanJiaoSe, mm_ZhengLiMaiLan, mm_ChiBang, mm_ChengHao, mm_JiaHaoYou, mm_FaSongSiXin, mm_DengDaiHuiFu, mm_DengDaiSiXin, mm_DengDaiJiaoYi, mm_QianWangJiaoYi, mm_XiaoHaoZhengLi, mm_JY_HuanJiaoSe, mm_CangKuZhengLi, mm_MaiShu = "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19";

-- ############################
-- 识字
-- 目前此库里只有 Ocr 和 SetDict  UseDict
-- 三个函数
-- 功能解说
-- x,y,x1,y1,颜色,色偏,相似度
-- Ocr(0,  0,1134,  639,0xf8f3ef,0x080c10,0.85)
-- 返回 识别到的字符串
-- 当然别全屏识别,全屏识别的效率还是很差的,局部识别的话效率还可以接受

-- id,字库路径
-- SetDict(0,luaPath.."/res/字库.txt")
-- 成功返回 1
-- 失败返回 0
-- 一般都会成功

-- 字库ID
-- UseDict(0)
-- 此函数用于切换字库的
-- 这个版本支持100个字库  id取值范围是0-99

-- FindStr函数,调用格式 by.FindStr(923,  155,965,  455,"朱雀",0xd8cd25,0x26260f,0.8)
-- 参数:   x,y,x1,y1,字符串,颜色,色偏,相似度
-- 注意:如果范围较大的话 查找起来会很慢,尽量把单个字库文件里的字放少一点 , 需要用的时候用UseDict 切换  UseDict的效率很高的 不会带来性能损失
-- 此函数只支持找单个字符 如果想找多个字符 请把多个字符采集为1个点阵数据比如:
-- 0240C8311C2F84308610C2184FFFFF8C7184308610C218C318630020000001106208630CC3B0700E03406A09FF207C198214C2C04C08C10C20C4$朱雀$0.0.302$20

::TZ_chongZhiLua::
sheBeiHao1 = "3d4c9dc359125bbc9fc19638c611e768fab1f5fa43f1bfdec174d03863a8c8eddd4d2c894fb84a605ac85d06b7cdcabdbe910a0dfca722af1924c9ff39201ec2f19db8f09029fd72ea0080f04af1194c7270f2886ec25998836025d1615069ce32921c820d6cf574afcda23da1d0feb1d5788deb79e9c938fdfe2d2d97474e8ea72c8049a4a7ad91f7ea6d4d24e8e8da40140be9dbeffd607bf7c80f6e7eb916b6d70501f865c5cd58bcb71c6f863ceb90df6027a8de2c3913ae3573f048db02ed75d6b64c7c67765ba43e98a6a6ce946941fe8c20d008200e94a2359f26e9609d00cc68dd2ccf906a2ad280760230c66c9c7fba759478249f993f93cb94837fca8c1dbfa64773b47173805541a87ebe7a8e82382fc68074af0956e3821fcfdf37f65c3c8889781279a30db65bd9f92d5c52336f9f8f935174c94bf147e39e95dfd2e647e30e1c9a28b942a5424edc42551efbd06845f87cf6dc84aa8768692717606e068d77491849e87165b29ac9fb6dfc91f3b7e06f9bec6a5a3ccc1f0597430e44a3eab76be046b7bbc55008774ea9bcf558c1feb5028c07c70f3e35c3c7d8505b141acd71da9311885c9c8fa457e809f566640390aef42bdeb2bec728c89829bbf894a520dfba43d4e2c755f63e9911f32ddf12d2a0145d15ad76dddf9a508887e7f5047794f590a57edca64a37ee629c82c02e8e85e0d32ea11227f6875ff701754b9a990c0064ddcecc849cba2ea4da22bea7fffe22e3aadbc86067901ceb0c269c9fed8cf3192cb4226027d17e156dd11002e8e6faee5fdda161d9010a3e362b7cc103901bb4f357623a61a6b3f634b3531a902ced8e6f358705dba6d48dd86385e74fd5aca7476056d1789cedb23002f7d75e843fb6d7f90a09790b05f174a2dea994c5ae00af5d30f102e4885d026b81ee3c890e6e25fc41784a7b024f4955b2b7f356c372935873612169f654d020de41cbbee01fc17c598b7f3c9bee21ac0decbdc02c8116612665d5f49911f32ddf12d2a0145d15ad76dddf9a2b0457e93242c8c7c116155fced563f17032e0e0e9ef7fef18ef92d0423ce25d12783033a94996803178b3a057c9db9a83a012259e445be5b96f8b4f2270beee"
sheBeiHao2 = "d3b3150ab9a410afa3e9f66955613e5a042a4756cc211d4af7626837f70fa333468889cfab75e6dc7ce88a31368c55f6db9f3ae7f9d72ec8bc29c9df49a5e81bdd973c6af9564d887f9650f9e366f8f29300c4406f97350c6bb4543ed11145670ca3f2f22228ad4b363da7136f26bd5e5415e38493d0e26aa220ec39c2c9a915cd77e8f4505c989bbcaceddce9835e04cb04dc9c4555efd2f054cfdbd73866722936b76117302d20c080217dae86f871e90a14cf89422c3d26e4165071990691d30712a8ee71483f97f4b0fae4cea70bcac66049c6c736f8d25a930ead476bb179af3e9ef0f0ed4164c170eab576259978a20719bbb219533345b1bd88307fdaafe1bdc73384ea5225093db18b1ae047a4045aabd8c7363ae96b7f9f8fd04ccf8143636da6f29634698ad9e45fd71a95cc5ea3584f067d8dcedc56c75ff380f3cac9bbc86f0d59e1c8eee1d026e375768cd9ae9c385b2a63448d6d1856ec824e35dc715dc8e5fad214b930c77e099d9455d8bc5e030300be9511304c024b35e5c630264599d3b8287600acdbe312112c3f7ebf9c94fe7822eff7eaf95fc9c0dcd62ff2c1f58a9abcdb58536ce079d8c7b3d994572af6dd6f31ce984b22fc06d0f2f01089bfc8adc7f44a1e3933b9104150b8911c364e813a11b5bac40c4d4bc35a6e192fd34b746682a1f1e46a1deda499b812c2de5abbc7abfb7d2f7aa7a6f0043b23a3ea3ed0680960a3a949cca0f524161d3c633b147ee5194337d03e6eec0d104776f65c0664ac5fa40a293f02568659b4e4486b3ce20bd8a2773ec3b5be22bea777e0298fe33287e243e2a0a29cb76021a1caf2448741b901b2b73e27b080641184125127fc3025dd5197c4763b1f0cf8aaa4e5fd994efb4428427ae26f36ea2b4e1eaaa2a1e024e1f292646326e68a8caa8c078a5fe418e2b94d38ff6b369dec7b19062ecb5d19d423c3c10bed944a76747e851ae8bd3d6ecea530c2c8075260fb8b91f74cabc6a6952797ab2897b9b9eab8042fbec62c9820db88e4f1607d7f1b74c579d8da38fd31d3201df9952a85227aa600241a1c8b17e2ef8c3b5a66817af0435607d31d3ffc5189d515769187929a30598049da32717d181120"
sheBeiHao3 = "1b6aea26c807a841155b4a0fdf3cded6571f2b58cd85b9bce8c3c0625fe6fd8bb69d52e34bd86b0e425f623f53bc547e0a1aad83c5c3f9230ce6b859aa4710d8cca953296d7ecc688d1880f0a02b762c6f8224ac92c0f8ae5c24c765dc75780bd64784babf0d26ef5e7b4de778cbe5355269738c63627db53272e35f02810c94fd5a3ef5ca301d90fbb072c4fd92a8826c32f0c6d59bb23765d1cec6e4efd1143bc016a96350f91ac92720033c7893539486e1e32f71232d5ee30705e678b2fe576e2e74065d2483a45e5916acc0e8e354c28e489f67c8778c63884c2cf6cc309d7f3fb115efae996c42fc9710893c40b7094f8448771537c30488028225af21ce6439eb8e4f52c00699487df169d78b4c7fe0974870e81594464283fcbbc3953d5c2e34efe3afc6ddbf5effe5f0491b8d50f43bfc97946e4b7e05978710fe8b78800210659aec4660927c03d97ded98b59ea68a8ed15bc942cce689065d300293c499df4e3bcba41969febb71f89989951242f1fa211bb5008a1187d6c82174f537fde331d186876ff0aae821806ac619116322cac96f16c08b3a3a6c4ff582d349f60daee02cd7529491dbaf4d667cb1cca7ca9792c97ad3d1b38c20320487504e8c8de97b4b6a83e7a86823804aa2d09356fe6197f9c29572246ada62549f198801a7ec02fa0c83f2541d6b881d6b51c04e066d2f5159aba725f989140c86100ebd91ea7acf51e7f7a6e047b36c12e751938fc710222af5aeefc3c853155f3a07b0a701d0a4a1fa5f78e1bdb4d0bb5110a09277b0ce43a9d8504b0a1514145df9cf8392353627234be68e0f3eda66b04d5aed3f70065821e6835b4d34d7f3f8613a559d6530e05830442fab0550c8c35cd10dbfa11aa02f196f4dea160bb257c35f93ca51b74b3b87eb3893f66d3035cecd821203dbd6378b42a316fd9452c0c113589c354ff8a74a9ae1d0035d479514575959a0d0ea64ce6691d0df128cbacb15f1a72532228d4c4a987b9fd020c2b514a244b959801a37c4d1f9c3b25351f80a2050eac4424b2ffd7d1d9893af714871937c7467964adb47f8e702f6f3162623a4216d90caaf61d031bc5f9200438ea9a4f1398fec87c1bae4b2af7526"
sheBeiHao4 = "9e189fe468d790b049bea8f2dbb5fc6ae751938fc710222af5aeefc3c853155f748258093155b7ce369db661f09cf16d64a0f6a778399e730e91386ba9e1fae5ed5c90a4fb9c19c141a19ec84e8fe4a8c0468431e83a4515edfdbfee2d7e3781d34a4166fdcbd3fa91001468cf96c75bf321433cdf891e6b3b31036f047786a1e1abc6f294b18236ebdade0b3abb726ce0f54b4b1f528554f883692392f58e6995df28bf2ca2ccf62fd6312e0376d71a5adb9962cb81eac6fe66a2a8b94e50755cdec38a98956ebd1a22863f9730608b14b4f5b23c35445036bae6026fe48047a37feac92c5edfdd54cf7a314b08286aac3a7173ed7263ba5c0e2cd6893c3cc06abcda7ecaf5ed0eb02bb5e2f906d6b143163a18a9f42021fa669e92d88972a2100ebd91ea7acf51e7f7a6e047b36c1245bda4cd5c122f0168d0b977757077419c6da67ec1bdcf602ef8603d64db1b4872b4d16d3e6e4a46c522e716f121ac8c3a07b0a701d0a4a1fa5f78e1bdb4d0bbdbc651fe0da0cf194262f7df877c117d2e291681aff3c9118fecbaa6f095ed98198801a7ec02fa0c83f2541d6b881d6bc1430f7b6f3bd410e9fef24d01489f0751c04e066d2f5159aba725f989140c865a6e192fd34b746682a1f1e46a1deda46f8224ac92c0f8ae5c24c765dc75780b0d104776f65c0664ac5fa40a293f0256043b23a3ea3ed0680960a3a949cca0f524161d3c633b147ee5194337d03e6eec50b8911c364e813a11b5bac40c4d4bc32ddf5d13224e4df10ac5c84946c35abf5e19258f70e9d67ee04d8ed9a42cb9da403105721a87156e5e24dd6a8b3a1945c6e45b2aec5a1a73d683017eab5ca01ba4318030a2dabb60ed210d228d1fe9b78495afb31494d2507b86f694e65afe18"
local w, h = getScreenSize()
State = {
    ["记录"] = false, -- 远程调试是否开启

    ["IP"] = wanmaoIP, -- 调试服务器IP
    -- ["IP"] = "127.12.34.56",                        --调试服务器IP
    ["Bid"] = xiangMu,

    ["屏幕宽"] = w,

    ["屏幕高"] = h,

    ["随机常量"] = 0,

    ["Path"] = luaMuLu,

    ["Move"] = luaPath .. "/QQ_Move.txt",

    ["姓氏"] = "赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶" ..

        "姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍" ..

        "史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常乐于时傅皮卞齐康伍余元卜顾" ..

        "孟平黄和穆萧尹姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈" ..

        "项祝董梁杜阮蓝闵席季麻强贾路娄危江童颜郭梅盛林刁钟徐邱骆高夏蔡" ..

        "田樊胡凌霍虞万支柯咎管卢莫经房裘缪干解应宗宣丁贲邓郁单杭洪包诸" ..

        "左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄曲家封芮羿储靳汲邴糜松井" ..

        "段富巫乌焦巴弓牧隗山谷车侯宓蓬全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎" ..

        "祖武符刘景詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲邰从鄂索咸籍赖卓蔺屠" ..

        "蒙池乔阴鬱胥能苍双闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍却璩桑桂濮牛" ..

        "寿通边扈燕冀郟浦尚农温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎戈" ..

        "廖庾终暨居衡步都耿满弘匡国文寇广禄阙东欧殳沃利蔚越夔隆师巩厍聂" ..

        "晁勾敖融冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后荆红游竺权" ..

        "逯盖益桓公万俟司马上官欧阳夏侯诸葛闻人东方赫连皇甫尉迟公羊澹台" ..

        "公冶宗政濮阳淳于单于太叔申屠公孙仲孙轩辕令狐钟离宇文长孙慕容鲜" ..

        "于闾丘司徒司空亓官司寇仉督子车颛孙端木巫马公西漆雕乐正壤驷公良" ..

        "拓拔夹谷宰父谷粱晋楚闫法汝鄢涂钦段干百里东郭南门呼延归海羊舌微" ..

        "生岳帅缑亢况后有琴梁丘左丘东门西门商牟佘佴伯赏南宫墨哈谯笪年爱" ..

        "阳佟第五言福百家姓终",

    ["名字"] = "安彤含祖赩涤彰爵舞深群适渺辞莞延稷桦赐帅适亭濮存城稷澄添悟绢绢澹迪婕箫识悟舞添剑深禄延涤" ..

        "濮存罡禄瑛瑛嗣嫚朵寅添渟黎臻舞绢城骥彰渺禾教祖剑黎莞咸浓芦澹帅臻渟添禾亭添亭霖深策臻稷辞" ..

        "悟悟澄涉城鸥黎悟乔恒黎鲲涉莞霖甲深婕乔程澹男岳深涉益澹悟箫乔多职适芦瑛澄婕朵适祖霖瑛坤嫚" ..

        "涉男珂箫芦黎珹绢芦程识嗣珂瑰枝允黎庸嗣赐罡纵添禄霖男延甲彰咸稷箫岳悟职祖恒珂庸琅男莞庸浓" ..

        "多罡延瑛濮存爵添剑益骥澄延迪寅婕程霖识瑰识程群教朵悟舞岳浓箫城适程禾嫚罡咸职铃爵渺添辞嫚" ..

        "浓寅鲲嗣瑛鸥多教瑛迪坤铃珹群黎益澄程莞深坤澹禄职澹赩澄藉群箫骥定彰寅臻渟枝允珹深群黎甲鲲" ..

        "亭黎藏浓涤渟莞寅辞嗣坤迪嫚添策庸策藉瑰彰箫益莞渺乔彰延舞祖婕澹渺鸥纵嗣瑛藏濮存婕职程芦群" ..

        "禾嫚程辞祖黎职浓桦藏渟禾彰帅辞铃铃黎允绢濮存剑辞禾瑰添延添悟赐祖咸莞男绢策婕藉禾浓珹涤祖" ..

        "汉骥舞瑛多稷赐莞渟黎舞桦黎群藏渺黎坤桦咸迪澈舞允稷咸剑定亭澄濮存鲲臻全鸥多赐程添瑛亭帅悟" ..

        "甲男帅涤适纵渟鲲亭悟琅亭添允舞禾庸咸瑛教鲲允箫芦允瑛咸鸥帅悟延珂黎珹箫爵剑霖剑霖禄鸥悟涉" ..

        "彰群悟辞帅渺莞澄桦瑛适臻益霖珹亭澹辞坤程嗣铃箫策澈枝赐莞爵渟禄群枝添芦群浓赐职益城澄赩琅" ..

        "延群乔珹鲲祖群悟黎定庸澄芦延霖罡鲲咸渺纵亭禄鸥赩涤剑澹藏纵濮存澄芦剑延瑰稷黎益赩澄允悟澈" ..

        "甲嗣绢朵益甲悟涤婕群咸臻箫鲲寅鸥桦益珂舞允庸芦藉寅渺咸赐澄程剑瑰霖瑰铃帅男铃悟识瑰仕仕城" ..

        "允莞全朵涤铃剑渺稷剑珂铃箫全仕益纵芦桦珂濮存城朵朵咸程剑澄定澈爵寅庸定莞瑛教彰黎箫仕黎桦" ..

        "赩深赩爵迪悟珹涤琅添箫桦帅瑛黎黎策识寅嫚涉迪策汉舞定彰允男祖教澄群瑛濮存男禾教莞禾鸥澈濮" ..

        "存岳城嫚深舞教岳澄亭禾坤朵亭职莞稷寅瑰城庸亭舞禾瑛恒坤浓彰莞澄澈鸥臻稷教琅辞益剑藉黎添瑛" ..

        "延舞坤仕岳多婕骥迪帅黎悟全澄识益甲桦纵适罡彰澄禾婕程黎城涤浓枝箫咸渟岳渟澹臻珹识珹澄箫辞" ..

        "浓鲲识悟允悟禾识群祖迪渟鲲群庸莞珹悟澹瑰悟鸥汉群甲莞庸职琅莞桦鲲朵深乔辞允彰渺朵瑰亭瑰朵" ..

        "定深男识群职霖益男舞城允舞爵赩枝罡罡群澹芦藉爵悟渟澹禾多庸箫坤乔芦甲濮存多渟藉珹赐汉纵亭" ..

        "禾城枝剑露以玉春飞慧娜悠亦元晔曜霜宁桃彦仪雨琴青筠逸曼代菀孤昆秋蕊语莺丝红羲盛静南淑震晴" ..

        "彭祯山霞凝柔隽松翠高骊雅念皓双洛紫瑞英思歆蓉娟波芸荷笑云若宏夏妍嘉彩如鹏寄芝柳凌莹蝶舒恬" ..

        "虹清爽月巧乾勋翰芳罗刚鸿运枫阳葳杰怀悦凡哲瑶凯然尚丹奇弘顺依雪菡君畅白振馨寻涵问洁辉忆傲" ..

        "伟经润志华兰芹修晨木宛俊博韶天锐溪燕家沈放明光千永溶昊梅巍真尔馥莲怜惜佳广香宇槐珺芷帆秀" ..

        "理柏书沛琪仙之竹向卉欣旻晓冬幻和雁淳浩歌荣懿文幼岚昕牧绿轩工旭颜醉玑卓觅叶夜灵胜晗恨流佁" ..

        "乐火音采睿翎萱民画梦寒泽怡丽心石邵玮佑旺壮名一学谷韵宜冰赫新蕾美晖项琳平树又炳骏气海毅敬" ..

        "曦婉爰伯珊影鲸容晶婷林子昌梧芙澍诗星冉初映善越原茂国腾孟水烟半峯莉绮德慈敏才戈梓景智盼霁" ..

        "琇苗熙姝从谊风发钰玛忍婀菲昶可荌小倩妙涛姗方图迎惠晤宣康娅玟奕锦濯穆禧伶丰良祺珍曲喆扬拔" ..

        "驰绣烁叡长雯颖辰慕承远彬斯薇成聪爱朋萦田致世实愫进瀚朝强铭煦朗精艺熹建忻晏冷佩东古坚滨菱" ..

        "囡银咏正儿瑜宝蔓端蓓芬碧人开珠昂琬洋璠桐舟姣琛亮煊信今年庄淼沙黛烨楠桂斐胤骄兴尘河晋卿易" ..

        "愉蕴雄访湛蓝媛骞娴儒妮旋友娇泰基礼芮羽妞意翔岑苑暖玥尧璇阔燎偲靖行瑾资漪晟冠同齐复吉豆唱" ..

        "韫素盈密富其翮熠绍澎淡韦诚滢知鹍苒抒艳义婧闳琦壤杨芃洲阵璟茵驹涆来捷嫒圣吟恺璞西旎俨颂灿" ..

        "情玄利痴蕙力潍听磊宸笛中好任轶玲螺郁畴会暄峻略琼琰默池温炫季雰司杉觉维饮湉许宵茉贤昱蕤珑" ..

        "锋纬渊超萍嫔大霏楚通邈飙霓谧令厚本邃合宾沉昭峰业豪达彗纳飒壁施欢姮甫湘漾闲恩莎祥启煜鸣品" ..

        "希融野化钊仲蔚生攸能衍菁迈望起微鹤荫靓娥泓金琨筱赞典勇斌媚寿喜飇濡宕茜魁立裕弼翼央莘绚焱" ..

        "奥萝米衣森荃航璧为跃蒙庆琲倚穹武甜璐俏茹悌格穰皛璎龙材湃农福旷童亘苇范寰瓃忠虎颐蓄霈言禹" ..

        "章花健炎籁暮升葛贞侠专懋澜量纶布皎源耀鸾慨曾优栋妃游乃用路余珉藻耘军芊日赡勃卫载时三闵姿" ..

        "麦瑗泉郎怿惬萌照夫鑫樱琭钧掣芫侬丁育浦磬献苓翱雍婵阑女北未陶干自作伦珧溥桀州荏举杏茗洽焕" ..

        "吹甘硕赋漠颀妤诺展俐朔菊秉苍津空洮济尹周江荡简莱榆贝萧艾仁漫锟谨魄蔼豫纯翊堂嫣誉邦果暎珏" ..

        "临勤墨薄颉棠羡浚兆环铄"

}
function iif(a, b, c)
    if a then
        return b
    else
        return c
    end
end

State["多选"] = { "多选1", "多选2", "多选3", "多选4" }

function StartTest()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local UIRet, UISet, UISave = 0, {}, State["Bid"] .. "_Set.dat"

    local StrUI = { {
        ["type"] = "Label",
        ["size"] = 25,
        ["align"] = "center",
        ["color"] = "255,50,50",
        ["text"] = "标签"
    }, {
        ["type"] = "Edit",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["prompt"] = "编辑框",
        ["text"] = ""
    }, {
        ["type"] = "RadioGroup",
        ["list"] = "单选1,单选2",
        ["select"] = "0"
    }, {
        ["type"] = "CheckBoxGroup",
        ["list"] = "多选1,多选2",
        ["select"] = "0"
    }, {
        ["type"] = "Image",
        ["src"] = "http://192.168.0.251/image/image.jpg"
    } -- {["type"]="ComboBox",                                ["list"]="下拉1,下拉2",        ["select"]="1"},
    }

    UIRet, UISet[1], UISet[2], UISet[3], UISet[4], UISet[5], UISet[6], UISet[7], UISet[8], UISet[9], UISet[10], UISet[11], UISet[12], UISet[13], UISet[14], UISet[15], UISet[16] = showUI([[{

                "style": "default", 

                "config": "]] .. UISave .. [[",

                "width": ]] .. State["屏幕宽"] .. [[,

                "height": ]] .. State["屏幕高"] .. [[,

                "cancelname": "取消",

                "okname": "确认",

                "timer": 5,

                "views": []] .. string.sub(TableToJson(StrUI), 2, -2) .. [[]  

        }]])

    if tonumber(UIRet) == 0 then
        lua_exit()
    end

    -- F_SavesW(luaPath.."/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))

end

function Start()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local UIRet, UISet, UISave = 0, {}, State["Bid"] .. "_Set.dat"

    local StrUI =
    { -- {["type"]="Label",        ["size"]=25,        ["align"]="center",        ["color"]="255,50,50",        ["text"]="欢迎"},
        -- {["type"]="Edit",        ["size"]=15,        ["align"]="left",        ["color"]="0,0,0",                ["prompt"]="编辑框",         ["text"]="",},
        -- {["type"]="RadioGroup",                                ["list"]="单选1,单选2",        ["select"]="0"},
        -- {["type"]="CheckBoxGroup",                                ["list"]="多选1,多选2",        ["select"]="0"},
        -- {["type"]="Image",        ["src"]="http://192.168.0.251/image/image.jpg"},
        -- {["type"]="ComboBox",                                ["list"]="下拉1,下拉2",        ["select"]="1"},
        -- {       ["type"]="Label",
        --         ["size"]=10,
        --         ["align"]="center",
        --         ["color"]="255,50,50",
        --         ["text"]="----------------------奇迹mu新----------------------"
        -- },
        -- {
        --     ["type"] = "ComboBox",
        --     ["list"] = "官方ios",
        --     ["select"] = "0"
        -- }, {
        --     ["type"] = "ComboBox",
        --     ["list"] = "地图 40,地图 冰风谷,地图 地下城,地图 120,地图 160,地图 200,地图 240,地图 280,地图 320,地图 360,大师 1,大师 2,大师 3,大师 4,大师 5,深渊1,深渊2,深渊3,深渊4,深渊5,深渊6A,深渊280,深渊320,深渊360,深渊6B,深渊7,深渊8",
        --     ["select"] = "2"
        -- }, {
        --     ["type"] = "ComboBox",
        --     ["list"] = "挂机点 随机,挂机点1,挂机点 2,挂机点 3,挂机点 4,挂机点 5,挂机点 6,挂机点 7,挂机点 8,挂机点 9,挂机点 10,挂机点 -1,挂机点 -2,挂机点 -3,挂机点 -4,挂机点 -5,挂机点 -6,挂机点 -7,挂机点 -8,挂机点 -9,挂机点 -10",
        --     ["select"] = "1"
        -- }, {
        --     ["type"] = "ComboBox",
        --     ["list"] = "试炼之地 随机,试炼之地 1,试炼之地 2,试炼之地 3,试炼之地 4,试炼之地 5,试炼之地 6,试炼之地 7,试炼之地 8,试炼之地 9,试炼之地 10",
        --     ["select"] = "7"
        -- }, -- danXuan1
        -- {
        --     ["type"] = "ComboBox",
        --     ["list"] = "boss 1a,boss 1b,boss 40a,boss 40b,boss 80a,boss 80b,boss 80c,boss 80d,boss 84a,boss 84b,boss 84c,boss 84d",
        --     ["select"] = "0"
        -- },
        -- duoXuan1
        -- {
        --     ["type"] = "CheckBoxGroup",
        --     ["list"] = "多选,每日重置,物资采集,纯流量,微信维护,仓库号,加好友,换无线1,换无线2,刷斗鱼",
        --     ["select"] = "0@1"
        -- },
        -- zongHeXuanXiang1
        {
            ["type"] = "CheckBoxGroup",
            ["list"] = "网段0,网段1,BUG汇报,网络调试,集中文件,测试,注销,在线脚本",
            ["select"] = "0"
        }, -- zongHeXuanXiang2
        {
            ["type"] = "CheckBoxGroup",
            ["list"] = "多选备用,删除配置,联盟任务,占位符,大号,成品号,小号,不生产,不挖粒子",
            ["select"] = "0"
        }, {
            ["type"] = "ComboBox",
            ["list"] = "目标1 无,目标1 优化,目标1 主线,目标1 研究,目标1 建造,目标1 生产,目标1 挖矿,目标1 日常,目标1 物资,目标1 试炼之地,目标1 挖宝,目标1 万魔塔,目标1 扫荡,目标1 战盟日常,目标1 金币,目标1 挂机",
            ["select"] = "0"
        }, {
            ["type"] = "ComboBox",
            ["list"] = "目标2 无,目标2 5道具,目标2 采集,目标2 收获,目标2 技能",
            ["select"] = "0"
        }, {
            ["type"] = "ComboBox",
            ["list"] = "目标3 无,目标3 整理,目标3 出航,目标3 修船,目标3 买蓝,目标3 买红,目标3 换角色,目标3 整理买蓝,目标3 翅膀,目标3 称号,目标3 加好友,目标3 发送私信,目标3 等待回复,目标3 等待私信,目标3 等待交易,目标3 前往交易,目标3 小号整理,目标3 交易换角色,目标3 仓库整理",
            ["select"] = "0"
        }, --  {
        --     ["type"] = "ComboBox",
        --     ["list"] = "默认角色1,默认角色2,默认角色3,默认角色4",
        --     ["select"] = "0"
        -- },  -- zongHeXuanXiang3
        {
            ["type"] = "CheckBoxGroup",
            ["list"] = "多选备用,交易次数归0,抢粒子,占位3,占位4,占位5,占位6,占位7,占位8,占位9",
            ["select"] = "0"
        }, -- zongHeXuanXiang4
        {
            ["type"] = "CheckBoxGroup",
            ["list"] = "多选备用,占位1,占位2,占位3,占位4,占位5,占位6,占位7,占位8,占位9",
            ["select"] = "0"
        }, -- {
        --     ["type"] = "ComboBox",
        --     ["list"] = "卖 无,卖 帝王书,卖 精灵泪,光喊话",
        --     ["select"] = "0"
        -- },
        {
            ["type"] = "Label",
            ["size"] = 50,
            ["align"] = "center",
            ["color"] = "255,50,50",
            ["text"] = "-                                                                                                                                                                                                                                                                                                                                                                                                   -"
        } }
    -- {\"style\": \"default\",\"config\": \"xing1.dat\",\"timer\": 5,
    -- UIRet, pingTai1, diTu, guaiWuDian, shiLianZhiDi, danXuan1, duoXuan1, zongHeXuanXiang1, zongHeXuanXiang2, muBiao1Con, muBiao2Con, muBiao3Con, moRenJiaoSe, zongHeXuanXiang3, danXuan4 =

    UIRet, zongHeXuanXiang1, zongHeXuanXiang2, muBiao1Con, muBiao2Con, muBiao3Con, zongHeXuanXiang3, zongHeXuanXiang4 = showUI([[{

                "style": "default", 

                "config": "]] .. UISave .. [[",

                "width": ]] .. State["屏幕宽"] .. [[,

                "height": ]] .. State["屏幕高"] .. [[,

                "cancelname": "停止脚本",

                "okname": "启动脚本",

                "timer": 5,

                "views": []] .. string.sub(TableToJson(StrUI), 2, -2) .. [[]  

        }]])

    if tonumber(UIRet) == 0 then
        lua_exit()
    end
    local tmpXuanXiang = string.find(zongHeXuanXiang1, "0")
    if tmpXuanXiang ~= nil then
        ftpMuLu = "ftp://xinqinew:Qwer1234@192.168.1.34/"
        -- ftpMuLu = "ftp://xinqinew:Qwer1234@xinqinew.win:2121/web/"
        -- ftpMuLu = "ftp://xinqinew:Qwer1234@192.168.0.251/web/"
        httpMuLu = "https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars@main/"
        cangKuName = "何足道H"
        Email = "xinqinew@me.com"
        appMiMa = "Qwer1234"
    end
    tmpXuanXiang = string.find(zongHeXuanXiang1, "1")
    if tmpXuanXiang ~= nil then
        ftpMuLu = "ftp://wanmao1986:19860802@wanmao.myDS.me/web/"
        -- ftpMuLu = "ftp://wanmao1986:19860802@192.168.1.251/web/"
        httpMuLu = "http://wanmao.myDS.me:81/"
        cangKuName = "白菜生意"
        Email = "pasj123456@163.com"
        appMiMa = "Wm123456"
    end
    local tmpXuanXiang = string.find(zongHeXuanXiang2, "1")
    if tmpXuanXiang ~= nil then
        writeConfig(State["Bid"] .. "_Set.dat", 8, "0")
        delFile(luaMuLu .. xiangMu .. ".plist")
    end

    danXuan2, danXuan3 = "0", "0"
    APP1.fuWuQi = fuWuQiLieBiao[tonumber(danXuan2)]
    APP2.fuWuQi = fuWuQiLieBiao[tonumber(danXuan3)]
    APP1.fuWuQiIP = fuWuQiIP[tonumber(danXuan2)]
    APP2.fuWuQiIP = fuWuQiIP[tonumber(danXuan3)]
    APP1.ServerArea = ServerArea[tonumber(danXuan2)]
    APP2.ServerArea = ServerArea[tonumber(danXuan3)]
    APP1.ServerList = ServerList[tonumber(danXuan2)]
    APP2.ServerList = ServerList[tonumber(danXuan3)]
    APP1.fuWuQi_JianXie = fuWuQiLieBiao_JianXie[tonumber(danXuan2)]
    APP2.fuWuQi_JianXie = fuWuQiLieBiao_JianXie[tonumber(danXuan3)]

    if muBiao1Con == "0" then
        muBiaoA1 = mb_Wu
    elseif muBiao1Con == "1" then
        muBiaoA1 = mb_YouHua
    elseif muBiao1Con == "2" then
        muBiaoA1 = mb_ZhuXian
    elseif muBiao1Con == "3" then
        muBiaoA1 = mb_ZhiXian
    elseif muBiao1Con == "4" then
        muBiaoA1 = mb_JianZao
    elseif muBiao1Con == "5" then
        muBiaoA1 = mb_ShengChan
    elseif muBiao1Con == "6" then
        muBiaoA1 = mb_WaKuang
    elseif muBiao1Con == "7" then
        muBiaoA1 = mb_EveryDay
    elseif muBiao1Con == "8" then
        muBiaoA1 = mb_WuZi
    elseif muBiao1Con == "9" then
        muBiaoA1 = mb_ShiLianZhiDi
    elseif muBiao1Con == "10" then
        muBiaoA1 = mb_WaBao
    elseif muBiao1Con == "11" then
        muBiaoA1 = mb_WanMoTa
    elseif muBiao1Con == "12" then
        muBiaoA1 = mb_SaoDang
    elseif muBiao1Con == "13" then
        muBiaoA1 = mb_ZhanMengRiChang
    elseif muBiao1Con == "14" then
        muBiaoA1 = mb_JinBi
    elseif muBiao1Con == "15" then
        muBiaoA1 = mb_GuaJi
    end
    if muBiao2Con == "0" then
        muBiaoA2 = mb_Wu
    elseif muBiao2Con == "1" then
        muBiaoA2 = mb_5DaoJu
    elseif muBiao2Con == "2" then
        muBiaoA2 = mb_CaiJi
    elseif muBiao2Con == "3" then
        muBiaoA2 = mb_Reward
    elseif muBiao2Con == "4" then
        muBiaoA2 = mb_JiNeng
    elseif muBiao2Con == "5" then
        muBiaoA2 = mb_YouHua
    end
    if muBiao3Con == "0" then
        muBiaoA3 = mb_Wu
    elseif muBiao3Con == "1" then
        muBiaoA3 = mb_ZhengLi
    elseif muBiao3Con == "2" then
        muBiaoA3 = mb_ChuHang
    elseif muBiao3Con == "3" then
        muBiaoA3 = mb_FixShip
    elseif muBiao3Con == "4" then
        muBiaoA3 = mb_MaiLan
    elseif muBiao3Con == "5" then
        muBiaoA3 = mb_MaiHong
    elseif muBiao3Con == "6" then
        muBiaoA3 = mb_HuanJiaoSe
    elseif muBiao3Con == "7" then
        muBiaoA3 = mb_ZhengLiMaiLan
    elseif muBiao3Con == "8" then
        muBiaoA3 = mb_ChiBang
    elseif muBiao3Con == "9" then
        muBiaoA3 = mb_ChengHao
    elseif muBiao3Con == "10" then
        muBiaoA3 = mb_JiaHaoYou
    elseif muBiao3Con == "11" then
        muBiaoA3 = mb_FaSongSiXin
    elseif muBiao3Con == "12" then
        muBiaoA3 = mb_DengDaiHuiFu
    elseif muBiao3Con == "13" then
        muBiaoA3 = mb_DengDaiSiXin
    elseif muBiao3Con == "14" then
        muBiaoA3 = mb_DengDaiJiaoYi
    elseif muBiao3Con == "15" then
        muBiaoA3 = mb_QianWangJiaoYi
    elseif muBiao3Con == "16" then
        muBiaoA3 = mb_XiaoHaoZhengLi
    elseif muBiao3Con == "17" then
        muBiaoA3 = mb_JY_HuanJiaoSe
    elseif muBiao3Con == "18" then
        muBiaoA3 = mb_CangKuZhengLi
    elseif muBiao3Con == "19" then
        muBiaoA3 = mb_MaiShu
    end
    -- if string.find(zongHeXuanXiang3, "1") ~= nil then
    --     writeConfig(State["Bid"] .. "_Set.dat", 13, "0")
    --     numJiaoYi = 0
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
    --     muBiao3 = mb_FaSongSiXin
    --     muBiao = muBiao3
    -- end

    -- F_SavesW(luaPath.."/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))
end

-- 图片
function iMageStart()

    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end

    local UIRet, UISet, UISave = 0, {}, State["Bid"] .. "_image.dat"

    local StrUI = { {
        ["type"] = "Image",
        ["src"] = "http://192.168.0.251/image/black.jpg"
    } }
    -- {\"style\": \"default\",\"config\": \"xing1.dat\",\"timer\": 5,
    UIRet, imageXuanXiang = showUI([[{

                "style": "default", 

                "config": "]] .. UISave .. [[",

                "width": ]] .. State["屏幕宽"] .. [[,

                "height": ]] .. State["屏幕高"] .. [[,

                "cancelname": "停止脚本",

                "okname": "启动脚本",

                "timer": 5,

                "views": []] .. string.sub(TableToJson(StrUI), 2, -2) .. [[]  

        }]])

    if tonumber(UIRet) == 0 then
        lua_exit()
    end

    -- F_SavesW(luaPath.."/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))
end

-- startLabel
function startLabel(s, d)

    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end

    local UIRet, UISet, UISave = 0, {}, State["Bid"] .. "_image.dat"

    local StrUI = { {
        ["type"] = "Label",
        ["size"] = d,
        ["align"] = "center",
        ["color"] = "255,50,50",
        ["text"] = s
    } }
    -- {\"style\": \"default\",\"config\": \"xing1.dat\",\"timer\": 5,
    UIRet, imageXuanXiang = showUI([[{

                "style": "default", 

                "config": "]] .. UISave .. [[",

                "width": ]] .. State["屏幕宽"] .. [[,

                "height": ]] .. State["屏幕高"] .. [[,

                "cancelname": "停止脚本",

                "okname": "启动脚本",

                "timer": 0,

                "views": []] .. string.sub(TableToJson(StrUI), 2, -2) .. [[]  

        }]])

    if tonumber(UIRet) == 0 then
        lua_exit()
    end

    -- F_SavesW(luaPath.."/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))
end

--[[写入文件内容(原有基础上追加写入)

nil = F_SavesA("7364235F")]]

function F_SavesA(File, text) -- 末尾无换行

    local sFlie = io.open(File, "a+");

    sFlie:write(text);
    -- sFlie:write(text .. "\r\n");

    sFlie:close();

end

--[[写入文件内容(直接清空写入)

nil = F_SavesW("7364235F")]]

function F_SavesW(File, text) -- 末尾无换行

    local sFlie = io.open(File, "w")

    sFlie:write(text);
    -- sFlie:write(text .. "\r\n");
    sFlie:close()

end

--[[Table to Json]]

function TableToJson(t)

    local function serialize(tbl)

        local tmp = {}

        for k, v in pairs(tbl) do

            local k_type = type(k)

            local v_type = type(v)

            local key = (k_type == "string" and "\"" .. k .. "\":") or (k_type == "number" and "")

            local value = (v_type == "table" and serialize(v)) or (v_type == "boolean" and tostring(v)) or
                (v_type == "string" and "\"" .. v .. "\"") or (v_type == "number" and v)

            tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil

        end

        return "{" .. table.concat(tmp, ",") .. "}"

    end

    assert(type(t) == "table")

    return serialize(t)

end

-- 避免触动大姨妈
if whoAmI() ~= 3 then
    os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");
end

::TZ_zhuangTai::
-- ret, pingTai,isQieHuanJiaoSe,duoKai,Email,IP,xuanXiang0,muLu1,muLu2,ftpMuLu,xuanXiang4 = showUI("{\"style\": \"default\",\"config\": \"xing1.dat\",\"timer\": 5,\"views\":[{\"type\":\"RadioGroup\",\"list\": \"苹果平台,PP平台,测试平台,同步推,备用,i4\", \"select\":\"0\"},{\"type\":\"RadioGroup\",\"list\": \"切换角色,NO\", \"select\":\"1\"},{\"type\":\"RadioGroup\",\"list\": \"新版多开,旧版多开\", \"select\":\"1\"},{\"type\":\"Edit\",\"prompt\":\"邮箱地址\", \"text\":\"\",\"size\":15,\"align\":\"left\", \"color\":\"255,0,0\"},{\"type\":\"Edit\",\"prompt\":\"IP\", \"text\":\"\",\"size\":15,\"align\":\"left\", \"color\":\"255,0,0\"},{\"type\":\"CheckBoxGroup\",\"list\": \"备用,节日福利,交易领福利,智能交易,合区服1,备用交易,合区服2,交易地点城内,交易地点野外\", \"select\":\"0\"},{\"type\":\"Edit\",\"prompt\":\"程序目录1\", \"text\":\"\",\"size\":15,\"align\":\"left\", \"color\":\"255,0,0\"},{\"type\":\"Edit\",\"prompt\":\"程序目录2\", \"text\":\"\",\"size\":15,\"align\":\"left\", \"color\":\"255,0,0\"},{\"type\":\"RadioGroup\",\"list\": \"本地FTP1,本地目FTP2,HTTP\", \"select\":\"0\"},{\"type\":\"CheckBoxGroup\",\"list\": \"备用,IG,不发邮件\", \"select\":\"0\"}]}");
-- Start()
init(1)

isXunHuanLua = true -- 影响下面两个if,妥协了

if isUpdateLua == 1 then
    isUpdateLua = 0
    isXunHuanLua = true
    -- goto TZ_updateLua
end
if isChongZhiLua == true then
    isChongZhiLua = false
    isXunHuanLua = true
    goto TZ_chongZhiLua
end
-- 避免触动大姨妈
-- F_SavesW(luaPath.."/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))
-- if ftpMuLu == "0" then
--      -- ftpMuLu = "ftp://xinqinew:Qwer1234@192.168.0.251/video/qj/"
--     ftpMuLu = "ftp://xinqinew:Qwer1234@192.168.0.251/web/"
--     httpMuLu = "http://192.168.0.251/"
-- elseif       ftpMuLu == "1" then
--      ftpMuLu = "ftp://wanmao1986:19860802@192.168.1.251/web/"
--     httpMuLu = "http://192.168.1.251/"
-- elseif       ftpMuLu == "2" then

-- end

apps1 = "apps1"
apps2 = "apps2"

appApple = appXiangMu
apps2 = appXiangMu
appDianKa = "P01.netease.zmq"
appApple2 = "P01.locojoy.mt3.chs"
appDianKa2 = "P01.locojoy.mt3.dk"
appPP = "com.tmsk.wmdcq.pp"
appI4 = "com.tmsk.wmdcq.i4"
appTongBu = "com.tongbu.tmsk.wmdcq"
appGuoPan = "com.tmsk.wmdcq.guopan"
appXY = "com.tmsk.wmdcq.xy"
appIapple = "rYldlNLiLVXPGWwJp.cdOFOsZF4YbsFDzGkY.ce0pzIUpVp3KeMtt2oo5Kn.c49ifGSVIH90"
appKuaiYong = "com.tmsk.wmdcq.kuaiyong"
appItools = "com.tmsk.wmdcq.itools.sky"
appTuTu = "com.tmsk.wmdcq.guopan.tutu2"

appStore = "com.apple.AppStore"
PPStore = "com.teiron.pphelperns"
appFilza = "com.tigisoftware.Filza"
if version == "2.2.4" then
    appXunLei = "com.xunlei.ithunder"
else
    appXunLei = appApple
end
appWeiXin = "com.tencent.xin"
appTouchSprite = "com.touchsprite.ios"

appss1 = "com.tianmashikong.qmqj.apps"
appss2 = "P01.tianmashikong.qmqj.apps"
pp1 = "com.tianmashikong.qmqj.pp"
pp2 = "P01.tianmashikong.qmqj.pp"
gp1 = "com.tianmashikong.qmqj.xxzs"
gp2 = "P01.tianmashikong.qmqj.pp"
i41 = "com.tianmashikong.qmqj.i4"
i42 = "P01.tianmashikong.qmqj.i4"
testFu1 = "com.tianmashikong.qmqj.yyty"
testFu2 = "P01.tianmashikong.qmqj.yyty"
tb1 = "com.tongbu.tmsk.qmqj"
tb2 = "P01.tongbu.tmsk.qmqj"
ig = "org.ioshack.iGrimace"
iFaker = "com.unkn0wn.iFaker"
wifi_zhushou = "com.penglee.tools.wifi"

if pingTai1 == "0" then
    apps1 = appApple
elseif pingTai1 == "1" then
    apps1 = appDianKa
elseif pingTai1 == "2" then
    apps1 = appI4
elseif pingTai1 == "3" then
    apps1 = appTongBu
elseif pingTai1 == "4" then
    apps1 = appGuoPan
elseif pingTai1 == "5" then
    apps1 = appXY
elseif pingTai1 == "6" then
    apps1 = appIapple
elseif pingTai1 == "7" then
    apps1 = appKuaiYong
elseif pingTai1 == "8" then
    apps1 = appItools
elseif pingTai1 == "9" then
    apps1 = appTuTu
elseif pingTai1 == "10" then
else
    apps1 = appApple
end
if pingTai2 == "0" then
    if apps1 == appDianKa then
        apps2 = appApple
    else
        apps2 = appApple2
    end
elseif pingTai2 == "1" then
    apps2 = appDianKa2
elseif pingTai2 == "2" then
    apps2 = appI4
elseif pingTai2 == "3" then
    apps2 = appTongBu
elseif pingTai2 == "4" then
    apps2 = appGuoPan
elseif pingTai2 == "5" then
    apps2 = appXY
elseif pingTai2 == "6" then
    apps2 = appIapple
elseif pingTai2 == "7" then
    apps2 = appKuaiYong
elseif pingTai2 == "8" then
    apps2 = appItools
elseif pingTai2 == "9" then
    apps2 = appTuTu
elseif pingTai2 == "10" then
end

APP1.name = apps1;
APP2.name = apps2;

-- dataPath1 = appDataPath(apps1);
-- dataPath2 = appDataPath(apps2);
-- dataDocuments1 = string.find(dataPath1, "/Documents");
-- dataDocuments2 = string.find(dataPath2, "/Documents");
-- if dataDocuments1 ~= nil then
--      dataPath1=string.sub(dataPath1, 1, dataDocuments1-1)
-- end
-- if dataDocuments2 ~= nil then
--      dataPath2=string.sub(dataPath2, 1, dataDocuments2-1)
-- end
ppSoft = "/var/mobile/Library/PPHelperNS3/Documents/User/Soft/*.ipa"

file_severIP1 = "/Library/Preferences/" .. apps1 .. ".plist"
file_severIP2 = "/Library/Preferences/" .. apps2 .. ".plist"
file_severIP3 = "/Library/Preferences/" .. appXunLei .. ".plist"

-- dialog(file_severIP2,0)
-- lua_exit()
if pingTai == "1" then
    file_severIP1 = "/Library/Preferences/com.tianmashikong.qmqj.pp.plist"
    file_severIP2 = "/Library/Preferences/P01.tianmashikong.qmqj.pp.plist"
end
if pingTai == "3" then
    file_severIP1 = "/Library/Preferences/com.tongbu.tmsk.qmqj.plist"
    file_severIP2 = "/Library/Preferences/P01.tongbu.tmsk.qmqj.plist"
end
if pingTai == "4" then
    file_severIP1 = "/Library/Preferences/com.tianmashikong.qmqj.xxzs.plist"
    file_severIP2 = "/Library/Preferences/P01.tianmashikong.qmqj.xxzs.plist"
end
if pingTai == "5" then
    file_severIP1 = "/Library/Preferences/com.tianmashikong.qmqj.i4.plist"
    file_severIP2 = "/Library/Preferences/P01.tianmashikong.qmqj.i4.plist"
end

file_AutoInstall = "/var/root/Media/Cydia/AutoInstall/"
PPmulu = "/var/mobile/Library/PPHelperNS3/Documents/User/Soft/"

-- -- 发邮件
-- function faYouJian(EmailNeiRong)
--      loadPlugin("k_lib");
--      callPlugin("k_lib","sendEmail","xinqinew@me.com,applesmtp.163.com,xinqinew,Qwer1234,邮件标题2,邮件内容2")
--      -- callPlugin("k_lib","sendEmail",Email..",smtp.163.com,xinqinew,Qwer1234,"..EmailNeiRong..","..EmailNeiRong)
--      unloadPlugin("k_lib");
-- end
-- faYouJian("TEST")

-- 截图到服务器
function jieTuToIP(...)
    loadPlugin("testDylib");
    -- callPlugin("testDylib","createPicAtPath","smb://192.168.1.1/smb/LUA,1.png")
    callPlugin("testDylib", "createPicAtPath", "smb://192.168.0.251/web/lua,1.png")
    unloadPlugin("testDylib");
end

-- 字符串分割函数
-- 传入字符串和分隔符,返回分割后的table
function string.split(str, delimiter)
    if str == nil or str == '' or delimiter == nil then
        return nil
    end

    local result = {}
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

-- 字符串按位分割函数
-- 传入字符串,返回分割后的table,必须为字母、数字,否则返回nil
function string.gsplit(str)
    local str_tb = {}
    if string.len(str) ~= 0 then
        for i = 1, string.len(str) do
            new_str = string.sub(str, i, i)
            if (string.byte(new_str) >= 48 and string.byte(new_str) <= 57) or
                (string.byte(new_str) >= 65 and string.byte(new_str) <= 90) or
                (string.byte(new_str) >= 97 and string.byte(new_str) <= 122) then
                table.insert(str_tb, string.sub(str, i, i))
            else
                return nil
            end
        end
        return str_tb
    else
        return nil
    end
end

-- 取一个数的整数部分
function getIntPart(x)
    if x <= 0 then
        return math.ceil(x);
    end

    if math.ceil(x) == x then
        x = math.ceil(x);
    else
        x = math.ceil(x) - 1;
    end
    return x;
end

function random(n, m)
    -- 思路是用随机结果放大处理以后再置随机种子,然后随机
    math.randomseed(os.clock() * math.random(1000000, 90000000) + math.random(1000000, 9000000))
    return math.random(n, m)
end

function Rnd_Word(strs, i, Length)

    local ret = ""

    local z

    if Length == nil then
        Length = 1
    end

    math.randomseed(tostring(os.time()):reverse():sub(1, 6) + State["随机常量"])

    math.random(string.len(strs) / Length)

    for i = 1, i do

        z = math.random(string.len(strs) / Length)

        ret = ret .. string.sub(strs, (z * Length) - (Length - 1), (z * Length))

    end

    return (ret)

end

-- 定义一个随机组合模式表
RDModel = {
    RSM_Capital = 1, -- 纯大写字母
    RSM_Letter = 2, -- 纯小写字母
    RSM_Cap_Let = 3, -- 大小写字母
    RSM_Number = 4, -- 纯数字
    RSM_Cap_Num = 5, -- 大写字母和数字
    RSM_Let_Num = 6, -- 小写字母和数字
    RSM_ALL = 7 -- 全部类型

}

-- 随机数字,len代表长度
function randomNumber(len)
    local rt = ""
    for i = 1, len, 1 do
        if i == 1 then -- 为了让数字第一个数不是0
            rt = rt .. random(1, 9)
        else
            rt = rt .. random(0, 9)
        end
    end
    return rt
end

-- for i=1,5 do
--  dialog(randomNumber(10),5)
-- end

-- 随机小写字母
function randomLetter(len)
    local rt = ""
    for i = 1, len, 1 do
        rt = rt .. string.char(random(97, 122))
    end
    return rt
end

-- for i=1,5 do
--  dialog(randomLetter(10),5)
-- end

-- mode,"w"清空后写入,"a"追加写入
-- function writeFile(file, string)
--     local f = io.open(file, 'w')
--     if f then
--         f:write(string)
--         f:close()
--     else
--         dialog(file .. "_" .. string, 0)
--     end
-- end

-- function readFile(file)
--     local string = ""
--     local f = io.open(file, 'r')
--     if f == nil then
--         f = io.open(file, 'w')
--     else
--         string = f:read("*all")
--     end
--     f:close()
--     return string
-- end

-- 读取第一行
function readFileOne(file)
    local string = ""
    local f = io.open(file, 'r')
    if f == nil then
        f = io.open(file, 'w')
    else
        string = f:read()
    end
    f:close()
    return string
end

-- 遍历文件每一行
fileHang = {}
function readFileEveryHang(file, num)
    local tmpHang = 0
    local string = ""
    local f = io.open(file, 'r')
    if f == nil then
        f = io.open(file, 'w')
    else
        for line in f:lines() do
            tmpHang = tmpHang + 1
            fileHang[num][tmpHang] = line
            -- print(line) -- 这里就是每次取一行
        end
    end
    f:close()
end

-- 读取某一行
function readFileHang(num, hang)
    return fileHang[num][hang]
end

-- 随机大写字母
function randomCapital(len)
    local rt = ""
    for i = 1, len, 1 do
        rt = rt .. string.char(random(65, 90))
    end
    return rt
end

-- for i=1,5 do
--  dialog(randomCapital(10),5)
-- end

-- 随机字符串
function randomString(len, model)
    local BC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local SC = "abcdefghijklmnopqrstuvwxyz"
    local NO = "0123456789"
    local maxLen = 0
    local templete = ""
    if model == nil then
        templete = BC -- 如果没有填写参数,默认生成纯大写字符
        maxLen = 26
    elseif model == RDModel.RSM_Capital then
        templete = BC -- 纯大写字符
        maxLen = 26
    elseif model == RDModel.RSM_Letter then
        templete = SC -- 纯小写
        maxLen = 26
    elseif model == RDModel.RSM_Cap_Let then
        templete = SC .. BC -- 大小写
        maxLen = 52
    elseif model == RDModel.RSM_Number then
        templete = NO -- 纯数字
        maxLen = 10
    elseif model == RDModel.RSM_Cap_Num then
        templete = NO .. BC -- 大写和数字
        maxLen = 36
    elseif model == RDModel.RSM_Let_Num then
        templete = NO .. SC -- 小写和数字
        maxLen = 36
    elseif model == RDModel.RSM_ALL then
        templete = NO .. SC .. BC
        maxLen = 62
    else
        templete = SC -- 如果填写了参数,但不正确,生成纯小写字符
        maxLen = 26
    end

    local srt = {}
    for i = 1, len, 1 do
        local index = random(1, maxLen)
        srt[i] = string.sub(templete, index, index)
    end
    return table.concat(srt, "")
end

-- 查找文件
function findFile(path)
    local a = io.popen("find " .. path .. " -prune");
    local f = {};
    for l in a:lines() do
        table.insert(f, l)
    end
    return f
    -- 返回值：返回一个table。
end

-- 检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    -- return f ~= nil and f:close()
    if f == nil then
        return false
    else
        f:close()
        return true
    end

end

-- 去除路径文件名
function stripfilename(filename)
    if filename ~= nil then
        return string.match(filename, "(.+)/[^/]*%.%w+$")
    end

end

-- 获取路径文件名
function strippath(filename)
    if filename ~= nil then
        return string.match(filename, ".+/([^/]*%.%w+)$")
    end
end

-- local str = "today is 2013-11-4"
-- dialog(string.match(str,"%d%d%d%d"),0)
-- lua_exit()

-- 去除路径扩展名
function stripextension(filename)
    local idx = filename:match(".+()%.%w+$")
    if (idx) then
        return filename:sub(1, idx - 1)
    else
        return filename
    end
end

-- 获取路径扩展名
function getextension(filename)
    return filename:match(".+%.(%w+)$")
end

-- 获取应用路径
function getAppPath(bid)
    function isValidChar(char)
        local validChar = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-_"
        if string.find(validChar, char) ~= nil then
            return true
        else
            return false
        end
    end

    if whoAmI() ~= 3 then
        os.execute(
            "find /Applications/*.app /private/var/mobile/Applications/*/*.app -prune > \"/tmp/lua_getAppPath.log\"")
    end
    local file = io.open("/tmp/lua_getAppPath.log", 'r')
    if file then
        local info, info_text
        local array = {}
        for line in file:lines() do
            array["path"] = line
            info = io.open(line .. "/Info.plist")
            if info then
                info_text = info:read("*a")
                info:close()
                index_a, index_b = string.find(info_text, bid)
                if index_a ~= nil and index_b ~= nil then
                    if isValidChar(string.sub(info_text, index_a - 1, index_a - 1)) == false and
                        isValidChar(string.sub(info_text, index_b + 1, index_b + 1)) == false then
                        file:close()
                        return line
                    end
                end
            end
        end
        file:close()
        return nil
    else
        return false
    end
end

-- 卸载应用（包括系统应用）
function removeApp(bid)
    path = getAppPath(bid)
    if path ~= nil then
        if string.sub(stripfilename(path), 1, 33) == "/private/var/mobile/Applications/" then
            if whoAmI() ~= 3 then
                os.execute("rm -rf " .. stripfilename(path))
            end
        elseif string.sub(stripfilename(path), 1, 15) == "/Applications/" then
            if whoAmI() ~= 3 then
                os.execute("rm -rf " .. path)
            end
        end
        if whoAmI() ~= 3 then
            os.execute("su mobile -c uicache")
        end
        return true
    else
        return false
    end
end

function find(path)
    return io.popen("find " .. path .. " -prune");
end

-- sysver = sz.system.osversion()
sysver = getOSVer()
if #sysver == 3 then
    sysver = sysver .. ".0"
end
sysint = tonumber(string.sub(sysver, 1, 1) .. string.sub(sysver, 3, 3) .. string.sub(sysver, 5, 5));
if version == "2.2.4" then
    if sysint >= 800 then
        tmpDataPlist1 = find("/private/var/mobile/Containers/Data/Application/*" .. file_severIP1)
        tmpDataPlist2 = find("/private/var/mobile/Containers/Data/Application/*" .. file_severIP2)
        tmpDataPlist3 = find("/private/var/mobile/Containers/Data/Application/*" .. file_severIP3)
        dataPlist1 = tmpDataPlist1:read("*all")
        dataPlist2 = tmpDataPlist2:read("*all")
        dataPlist3 = tmpDataPlist3:read("*all")
        dataPlist1 = string.sub(dataPlist1, 1, -2)
        dataPlist2 = string.sub(dataPlist2, 1, -2)
        dataPlist3 = string.sub(dataPlist3, 1, -2)
        dataPlist3a = string.sub(dataPlist3, 1, 85)
        dataPlist1a = string.sub(dataPlist1, 1, 85)
        dataPlist2a = string.sub(dataPlist2, 1, 85)
        appPath1 = appBundlePath(apps1);
        appPath2 = appBundlePath(apps2);
        appPath3 = appBundlePath(appXunLei);
        if sysint >= 900 then
            iTunesMetadata1 = string.sub(appPath1, 1, 80) .. "iTunesMetadata.plist"
            iTunesMetadata2 = string.sub(appPath2, 1, 80) .. "iTunesMetadata.plist"
            iTunesMetadata3 = string.sub(appPath3, 1, 80) .. "iTunesMetadata.plist"
        else
            iTunesMetadata1 = string.sub(appPath1, 1, 87) .. "iTunesMetadata.plist"
            iTunesMetadata2 = string.sub(appPath2, 1, 87) .. "iTunesMetadata.plist"
            iTunesMetadata3 = string.sub(appPath3, 1, 87) .. "iTunesMetadata.plist"
        end
        -- dialog(iTunesMetadata1,0)
    else
        tmpDataPlist1 = find("/private/var/mobile/Applications/*" .. file_severIP1)
        tmpDataPlist2 = find("/private/var/mobile/Applications/*" .. file_severIP2)
        tmpDataPlist3 = find("/private/var/mobile/Applications/*" .. file_severIP3)
        dataPlist1 = tmpDataPlist1:read("*all")
        dataPlist2 = tmpDataPlist2:read("*all")
        dataPlist3 = tmpDataPlist3:read("*all")
        dataPlist1 = string.sub(dataPlist1, 1, -2)
        dataPlist2 = string.sub(dataPlist2, 1, -2)
        dataPlist3 = string.sub(dataPlist3, 1, -2)
        dataPlist3a = string.sub(dataPlist3, 1, 70)
        dataPlist1a = string.sub(dataPlist1, 1, 70)
        dataPlist2a = string.sub(dataPlist2, 1, 70)
        iTunesMetadata1 = dataPlist1a .. "iTunesMetadata.plist"
        iTunesMetadata2 = dataPlist2a .. "iTunesMetadata.plist"
        iTunesMetadata3 = dataPlist3a .. "iTunesMetadata.plist"
    end
    APP1.appMuLu = dataPlist1a
    APP2.appMuLu = dataPlist2a
end
-- dialog(tmpDataPlist1,0)
-- dialog(dataPlist1,0)
-- dialog(dataPlist1a,0)
-- dialog(iTunesMetadata1,0)
-- lua_exit()

-- AZ进制
function AZjinZhi(...)
    dialog(tostring(1), 0)
end

-- HTTP下载
function httpDown(url, path)
    status, headers, body = http1.get(url)
    if status == 200 then
        httpDownNo = 0
        file = io.open(path, "wb")
        if file then
            file:write(body)
            file:close()
            return status;
        else
            return -1;
        end
    else
        -- dialog("HTTP下载失败,重新下载",1)
        -- dialog(url,1)
        -- mSleep(2000)
        httpDownNo = httpDownNo + 1
        if httpDownNo == 5 then
            httpDownNo = 0
            return
        else
            httpDown(url, path)
        end
        -- return status;
    end
end

-- 注销
function respring()
    if whoAmI() ~= 3 then
        os.execute("killall -9 SpringBoard");
    end
end

-- 重启
function reboot()
    if whoAmI() ~= 3 then
        os.execute("reboot");
    end
end

-- 清空缓存
function clearCache()
    if whoAmI() ~= 3 then
        os.execute("su mobile -c uicache");
    end
end

-- 停止脚本前运行
function beforeUserExit()
    setAssistiveTouchEnable(true) -- 打开小圆点
end

function ftpDownTSnet(ftpFile, localFile)
    -- require("tsnet")
    ftp.setTimeout(1)
    ftp.init(serverIP, ftpName, ftpPassword)
    ret, msg = ftp.download(localFile, ftpFile)
    if ret == 1 then
        toast("FTP下载完成", 1)
        ftp.clean()
        return true
    else
        toast("FTP下载失败", 1)
        ftp.clean()
        return false
    end
    ftp.clean()
    return false
end

function ftpDownTS(ftpFile, localFile)
    --脚本仅供参考不可直接使用
    -- ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    if status then
        -- toast("连接FTP成功", 0)
        local dwStatus = ts.ftp.download(localFile, ftpFile, 0)
        --下载服务器上的 love.png 文件到本地 res 文件夹
        if dwStatus then
            toast("FTP下载完成", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP下载失败", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 0)
        ts.ftp.close() --操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() --操作完成后，断开 FTP 服务器连接
    return false
end

-- FTP下载一个文件到本地
function ftpDown(mulu1, mulu2)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        _, err = szFtp.download(mulu1, mulu2)
        -- _, err = ftp.download(ftpMuLu..fileName, luaMuLu..fileName)
        if err then
            ftpDownNo = ftpDownNo + 1
            if ftpDownNo == 5 then
                ftpDownNo = 0
                return false
            end
            ftpDown(mulu1, mulu2)
        else
            ftpDownNo = 0
            return true
        end
    end
end

-- FTP下载一次
function ftpDownOnce(mulu1, mulu2)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        _, err = szFtp.download(mulu1, mulu2)
        -- _, err = ftp.download(ftpMuLu..fileName, luaMuLu..fileName)
        if err then
            return false
        else
            return true
        end
    end
end

-- FTP从本地上传一个文件到服务器
function ftpUp(fileName, muLu)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        if muLu == nil then
            _, err = szFtp.upload(luaMuLu .. fileName, ftpMuLu)
        else
            _, err = szFtp.upload(luaMuLu .. fileName, ftpMuLu .. muLu)
        end
        if err then
            ftpUpNo = ftpUpNo + 1
            if ftpUpNo == 5 then
                ftpUpNo = 0
                return err
            end
            ftpUp(fileName, muLu)
        else
            ftpUpNo = 0
        end
        return err
    end
end

function ftpUpPro(csMulu, csFuWuQi)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        _, err = szFtp.upload(csMulu, csFuWuQi)
        if err then
            ftpUpNo = ftpUpNo + 1
            if ftpUpNo == 5 then
                ftpUpNo = 0
                return err
            end
            ftpUp(csMulu, csFuWuQi)
        else
            ftpUpNo = 0
        end
        return err
    end
end

-- FTP从本地上传图片到服务器
function ftpUpTSnet(localFile, ftpFile)
    ftp.setTimeout(5)
    ftp.init(serverIP, ftpName, ftpPassword)
    mSleep(200)
    ret, msg = ftp.upload(localFile, ftpFile)
    if ret == 1 then
        toast("FTP上传完成", 1)
        ftp.clean()
        return true
    else
        toast("FTP上传失败", 1)
        ftp.clean()
        return false
    end
    ftp.clean()
    return false
end

-- FTP从本地上传图片到服务器
function ftpUpTS(localFile, ftpFile)
    --脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 0)
        mSleep(200)
        --下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() --操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() --操作完成后，断开 FTP 服务器连接
    return false
end

-- FTP从本地上传图片到服务器
function ftpUpPNG(fileName, muLu)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        _, err = szFtp.upload(luaPath .. "/res/" .. fileName, ftpMuLu .. muLu)
        -- if err then
        --     ftpUpNo = ftpUpNo + 1
        --     if ftpUpNo == 5 then
        --         ftpUpNo = 0
        --         return err
        --     end
        --     ftpUpPNG(fileName, muLu)
        -- else
        --     ftpUpNo = 0
        -- end
        -- return err
    end
end

-- FTP从本地上传到服务器 一次
function ftpUpOnce(fileName, muLu)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        _, err = szFtp.upload(luaPath .. "/lua/" .. fileName, ftpMuLu .. muLu)
    end
end

-- 从FTP服务器上删除一个文件
function ftpDel(fileName)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        _, err = szFtp.cmd("ftp://xinqinew:Qwer1234@192.168.0.251/video/qj/", "DELE 1.lua")
    end
end

-- 列出指定FTP服务器路径下的文件
function ftpList(muLu)
    if version ~= "2.2.4" and whoAmI() == 1 then
        return
    else
        msg, err = szFtp.cmd(ftpMuLu .. muLu, "LIST")
        return msg
    end
end

-- ftpList()
-- ftpUp("test.txt")
-- lua_exit()

-- 读取plist
function loadPlist(muLu, jian1, jian2)
    -- 读取键值
    local plfilename = muLu -- 设置plist路径
    local tmp = plist.read(plfilename) -- 读取plist文件内容并返回一个TABLE
    if tmp == nil then
        fi = io.open(muLu, 'w')
        if fi then
            fi:write(plistsTMP)
            fi:close()
            tmp = plist.read(plfilename) -- 读取plist文件内容并返回一个TABLE
        else
            if jian2 ~= nil then
                dialog(muLu .. "_" .. jian1 .. "_" .. jian2, 0)
            else
                dialog(muLu .. "_" .. jian1, 0)
            end
        end
    end
    if jian2 == nil then
        return tmp[jian1]
    else
        return tmp[jian1][jian2]
    end

end

-- 写入plist
function writePlist(muLu, jian, zhi)
    -- 写入键值
    local plfilename = muLu -- 设置plist路径
    local tmp = plist.read(plfilename) -- 读取plist文件内容并返回一个TABLE
    if tmp == nil then
        fi = io.open(muLu, 'w')
        if fi then
            fi:write(plistsTMP)
            fi:close()
            tmp = plist.read(plfilename) -- 读取plist文件内容并返回一个TABLE
        else
            dialog(muLu .. "_" .. jian .. "_" .. zhi, 0)
        end
    end
    tmp[jian] = zhi
    plist.write(plfilename, tmp) -- 将修改后的表写入PLIST文件
end

-- 写入plist
function writePlist2(muLu, jian1, jian2, zhi)
    -- 写入键值
    local plfilename = muLu -- 设置plist路径
    local tmp = plist.read(plfilename) -- 读取plist文件内容并返回一个TABLE
    if tmp == nil then
        fi = io.open(muLu, 'w')
        if fi then
            fi:write(plistsTMP)
            fi:close()
            tmp = plist.read(plfilename) -- 读取plist文件内容并返回一个TABLE
        else
            dialog(muLu .. "_" .. jian1 .. "_" .. jian2 .. "_" .. zhi, 0)
        end
    end
    tmp[jian1][jian2] = zhi
    plist.write(plfilename, tmp) -- 将修改后的表写入PLIST文件
end

-- 求整
function getIntPart(x)
    if x <= 0 then
        return math.ceil(x);
    end

    if math.ceil(x) == x then
        x = math.ceil(x);
    else
        x = math.ceil(x) - 1;
    end
    return x;
end

-- 自定义滑动
function touchMoveXY(x1, y1, x2, y2)
    touchDown(1, x1, y1)
    mSleep(100)
    local dx = x2 - x1
    local dy = y2 - y1
    dx = getIntPart(dx / 10)
    dy = getIntPart(dy / 10)
    for i = 1, 10 do
        touchMove(1, x1 + dx * i, y1 + dy * i)
        mSleep(50)
    end

    touchMove(1, x2, y2)
    mSleep(50)
    touchUp(1, x2, y2)
    mSleep(300)
end

-- 自定义滑动2(间断的)
function touchMoveXY2(x1, y1, x2, y2)
    touchDown(1, x1, y1)
    mSleep(100)
    local dx = x2 - x1
    local dy = y2 - y1
    dx = getIntPart(dx / 10)
    dy = getIntPart(dy / 10)
    for i = 1, 10 do
        touchMove(1, x1 + dx * i, y1 + dy * i)
        mSleep(50)
        if i == 10 then
            break
        end
        touchUp(1, x1 + dx * i, y1 + dy * i)
        touchDown(1, x1 + dx * i, y1 + dy * i)
    end

    touchMove(1, x2, y2)
    mSleep(50)
    touchUp(1, x2, y2)
    mSleep(300)
end

-- 自定义滑动快速
function touchMoveXYQ(x1, y1, x2, y2)
    touchDown(1, x1, y1)
    mSleep(100)
    touchMove(1, x2, y2)
    mSleep(100)
    touchUp(1, x2, y2)
    mSleep(100)
end

-- 自定义滑动快速2
function touchMoveXYQ2(x1, y1, x2, y2)
    touchDown(1, x1, y1)
    mSleep(100)
    touchMove(1, x2, y2)
    mSleep(1000)
    touchUp(1, x2, y2)
    mSleep(1000)
end

-- 解锁
function jieSuo(...)
    flag = deviceIsLock();
    if flag ~= 0 then
        unlockDevice(); -- 解锁屏幕
    end
end

-- 注销
function zhuXiao(...)
    flag = deviceIsLock();
    if flag ~= 0 then
        respring()
        mSleep(1000 * 60)
        APP1.dengLuCiShu = 0
        APP2.dengLuCiShu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "APP登录次数", 0)
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "PP登录次数", 0)
        -- faEmail()
        unlockDevice()
    end
end

-- 解压zip文件
function unzip(path, to)
    if whoAmI() ~= 3 then
        os.execute("unzip " .. path .. " -d " .. to);
    end
end

-- 创建文件夹
function newfolder(path)
    if whoAmI() ~= 3 then
        os.execute("mkdir " .. path);
    end
end

-- 复制文件
function copyfile(path, to)
    if whoAmI() ~= 3 then
        os.execute("cp -rf " .. path .. " " .. to);
    end
end

-- 移动文件
function movefile(path, to)
    if whoAmI() ~= 3 then
        os.execute("mv " .. path .. " " .. to);
    end
end

-- 删除文件
function delFile(path)
    if whoAmI() ~= 3 then
        os.execute("rm -rf " .. path);
    end
end

-- 今日的多少分钟
function howMuchMin(...)
    nowDateTime = os.date("*t")
    return nowDateTime.hour * 60 + nowDateTime.min
end

-- DEB插件下载
function debDown(...)
    -- if file_exists(luaPath.."/lua/iFaker.txt") then
    --     runApp(iFaker)
    --     lua_exit()
    -- else
    --     writeFile(luaPath.."/lua/iFaker.txt","1")
    --     httpDown(httpMuLu.."deb/iFaker.deb","/var/root/Media/Cydia/AutoInstall/iFaker.deb")
    --     mSleep(5000)
    --     reboot()
    --     lua_exit()
    -- end
end

-- 触动扩展库
function kuoZhanKuDown(...)
    -- if not(file_exists(luaPath.."/tessdata/eng.traineddata")) then
    --         newfolder(luaPath.."/tessdata")
    --         httpDown("http://wanmao.myDS.me:81/kuoZhanKu/eng.traineddata",luaPath.."/tessdata/eng.traineddata")
    -- end

    if not (file_exists(luaPath .. "/plugin/dy_xbox.txt")) then
        httpDown("http://wanmao.myDS.me:81/kuoZhanKu/dy_xbox.txt", "/User/Media/TouchSprite/plugin/dy_xbox.txt")
    end
    if version == "2.2.4" then
        dictXbox = 9
        by = require "by"
        by.SetDict(dictXbox, "/User/Media/TouchSprite/plugin/dy_xbox.txt")
    else
        dictXbox = addDmOcrDict("/User/Media/TouchSprite/plugin/dy_xbox.txt")
    end
end

-- 点击后,如果不是对应的颜色,则重新点击
function touchClickCheckHouSe(x, y, x1, y1, a, b, c, d)
    -- tiaoShi(x..","..y)
    local cs = math.random(1, 9);
    for i = 1, 10 do
        touchDown(cs, x, y);
        mSleep(300);
        touchUp(cs, x, y);
        mSleep(1000);
        if isColor(x1, y1, a, b, c, d) then
            break
        end
    end
end

-- 点击后,如果还是对应的颜色,则重新点击
function touchClickCheckQianSe(x, y, x1, y1, a, b, c, d)
    -- tiaoShi(x..","..y)
    local cs = math.random(1, 9);
    for i = 1, 10 do
        touchDown(cs, x, y);
        mSleep(300);
        touchUp(cs, x, y);
        mSleep(1000);
        if not (isColor(x1, y1, a, b, c, d)) then
            break
        end
    end
end

function touchClick(x, y, ...)

    local cs = math.random(1, 9);
    touchDown(cs, x, y);
    mSleep(300 + cs * 10);
    touchUp(cs, x, y);
    mSleep(1000 + cs * 10);
    -- debug(x..","..y)
end

function touchQuickly(x, y, ...)
    local cs = math.random(1, 9);
    touchDown(cs, x, y);
    mSleep(100 + cs);
    touchUp(cs, x, y);
    mSleep(100 + cs);
end

function touchSuper(x, y)
    local cs = math.random(1, 9);
    touchDown(cs, x, y);
    -- mSleep(100);
    touchUp(cs, x, y);
    -- mSleep(100);
end

-- 对比脚本版本号(更新脚本)
function contrastLua(...)
    -- local msg = ftpList("ftp://xinqinew:Qwer1234@192.168.0.251/web/lua/")
    -- local tmpWeiZhi = string.find(msg, "qj");
    -- local qjlua = string.sub(msg, tmpWeiZhi, -3)
    -- local x = tonumber(string.sub(qjlua, 3, -5))
    if nowTime - timeGengXinLua >= 10 * 60 then

        httpDown(httpMuLu .. "lua/lua" .. xiangMu .. ".plist", luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", "脚本版本")
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", "脚本版本")
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", "脚本版本", 0)
        end
        if tmpNum ~= nil and tmpNumBenDi ~= nil then
            if tmpNum > tmpNumBenDi then
                isUpdateLua = 1
                isXunHuanLua = false
                -- contrastSystem()
                -- dialog("对比脚本",0)
                writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", "脚本版本", tmpNum)
            end
        end
        timeGengXinLua = nowTime
    end
end

-- 对比游戏版本号(更新游戏)
function contrastGame(...)
    if nowTime - timeGengXinGame >= 10 * 60 then

        httpDown(httpMuLu .. "lua/lua" .. xiangMu .. ".plist", luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps1)
        local tmpNum2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps2)
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1)
        local tmpNumBenDi2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2)
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1, 0)
        end
        if tmpNumBenDi2 == nil then
            tmpNumBenDi2 = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, 0)
        end
        if tmpNum ~= nil and tmpNumBenDi ~= nil then
            if tmpNum ~= tmpNumBenDi then
                closeApp(apps1)
                mSleep(1000)
                init("0", 0)
                xunLeiXiaZai1(httpMuLu .. "APP/" .. apps1 .. ".ipa")
                mSleep(2000)
                runFilza()
                mSleep(2000)
                init(1)
                runApp(apps1)
                APP1.isYiDengLu = 0
                mSleep(5000)
                writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1, tmpNum)
            end
        end
        if tmpNum2 ~= nil and tmpNumBenDi2 ~= nil then
            if tmpNum2 ~= tmpNumBenDi2 then
                closeApp(apps2)
                mSleep(1000)

                init("0", 0)
                xunLeiXiaZai1(httpMuLu .. "APP/" .. apps2 .. ".ipa")
                mSleep(2000)
                runFilza()
                mSleep(2000)
                init(1)
                runApp(apps2)
                APP2.isYiDengLu = 0
                mSleep(5000)
                writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, tmpNum2)
            end
        end
        timeGengXinGame = nowTime
    end
end

-- 对比游戏版本号(更新游戏)
function contrastGame2(...)
    if nowTime - timeGengXinGame >= 5 * 60 then
        httpDown(httpMuLu .. "lua/lua" .. xiangMu .. ".plist", luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps1)
        local tmpNum2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps2)
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1)
        local tmpNumBenDi2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2)
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1, 0)
        end
        if tmpNumBenDi2 == nil then
            tmpNumBenDi2 = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, 0)
        end
        if tmpNum ~= nil and tmpNumBenDi ~= nil then
            if tmpNum ~= tmpNumBenDi then
                httpDown(httpMuLu .. "xinxi/shou.plist", luaPath .. "/lua/shou.plist")
                httpDown(httpMuLu .. "xinxi/wei.plist", luaPath .. "/lua/wei.plist")
                local tmpShou = loadPlist(luaPath .. "/lua/shou.plist", "首")
                local tmpWei = loadPlist(luaPath .. "/lua/wei.plist", "尾")
                if tmpShou - tmpWei <= 5 then
                    tmpShou = tmpShou + 1
                    writePlist(luaPath .. "/lua/shou.plist", "首", tmpShou)
                    for i = 1, 10 do
                        _, err = szFtp.upload(luaPath .. "/lua/shou.plist", ftpMuLu .. "xinxi/")
                        if err then
                        else
                            break
                        end
                    end
                    closeApp(apps1)
                    mSleep(1000)
                    init("0", 0)
                    xunLeiXiaZai1(httpMuLu .. "APP/" .. apps1 .. ".ipa")
                    mSleep(2000)
                    runFilza()
                    mSleep(2000)
                    init(1)
                    runApp(apps1)
                    APP1.isYiDengLu = 0
                    mSleep(5000)
                    writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1, tmpNum)
                    tmpWei = tmpWei + 1
                    writePlist(luaPath .. "/lua/wei.plist", "尾", tmpWei)
                    for i = 1, 10 do
                        _, err = szFtp.upload(luaPath .. "/lua/wei.plist", ftpMuLu .. "xinxi/")
                        if err then
                        else
                            break
                        end
                    end
                end
            end
        end
        if tmpNum2 ~= nil and tmpNumBenDi2 ~= nil then
            if tmpNum2 ~= tmpNumBenDi2 then
                httpDown(httpMuLu .. "xinxi/shou.plist", luaPath .. "/lua/shou.plist")
                httpDown(httpMuLu .. "xinxi/wei.plist", luaPath .. "/lua/wei.plist")
                local tmpShou = loadPlist(luaPath .. "/lua/shou.plist", "首")
                local tmpWei = loadPlist(luaPath .. "/lua/wei.plist", "尾")
                if tmpShou - tmpWei <= 5 then
                    tmpShou = tmpShou + 1
                    writePlist(luaPath .. "/lua/shou.plist", "首", tmpShou)
                    for i = 1, 10 do
                        _, err = szFtp.upload(luaPath .. "/lua/shou.plist", ftpMuLu .. "xinxi/")
                        if err then
                        else
                            break
                        end
                    end
                    closeApp(apps2)
                    mSleep(1000)

                    init("0", 0)
                    xunLeiXiaZai1(httpMuLu .. "APP/" .. apps2 .. ".ipa")
                    mSleep(2000)
                    runFilza()
                    mSleep(2000)
                    init(1)
                    runApp(apps2)
                    APP2.isYiDengLu = 0
                    mSleep(5000)
                    writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, tmpNum2)
                    tmpWei = tmpWei + 1
                    writePlist(luaPath .. "/lua/wei.plist", "尾", tmpWei)
                    for i = 1, 10 do
                        _, err = szFtp.upload(luaPath .. "/lua/wei.plist", ftpMuLu .. "xinxi/")
                        if err then
                        else
                            break
                        end
                    end
                end
            end
            timeGengXinGame = nowTime
        end
    end
end

-- 对比游戏版本号(更新游戏)
function contrastGame3(...)
    if nowTime - timeGengXinGame >= 60 then
        timeGengXinGame = nowTime
        httpDown(httpMuLu .. "lua/lua" .. xiangMu .. ".plist", luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps1)
        local tmpNum2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps2)
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1)
        local tmpNumBenDi2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2)
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1, tmpNumBenDi)
        end
        if tmpNumBenDi2 == nil then
            tmpNumBenDi2 = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, tmpNumBenDi2)
        end
        if tmpNum ~= nil and tmpNumBenDi ~= nil then
            if tmpNum ~= tmpNumBenDi then
                httpDown(httpMuLu .. "xinxi/now.plist", luaPath .. "/lua/now.plist")
                local tmpBiaoGan = loadPlist(luaPath .. "/lua/now.plist", "标杆")
                numIphoneID = tonumber(iphoneId)
                local tmpZhi = numIphoneID - tmpBiaoGan
                if tmpZhi <= 5 and tmpZhi > 0 then
                    closeApp(apps1)
                    mSleep(1000)
                    init("0", 0)
                    xunLeiXiaZai1(httpMuLu .. "APP/" .. apps1 .. ".ipa")
                    mSleep(2000)
                    runFilza()
                    mSleep(2000)
                    init(1)
                    runApp(apps1)
                    APP1.isYiDengLu = 0
                    mSleep(5000)
                    writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps1, tmpNum)
                    httpDown(httpMuLu .. "xinxi/now.plist", luaPath .. "/lua/now.plist")
                    tmpBiaoGan = loadPlist(luaPath .. "/lua/now.plist", "标杆")
                    tmpBiaoGan = tmpBiaoGan + 1
                    writePlist(luaPath .. "/lua/now.plist", "标杆", tmpBiaoGan)
                    for i = 1, 10 do
                        _, err = szFtp.upload(luaPath .. "/lua/now.plist", ftpMuLu .. "xinxi/")
                        if err then
                        else
                            break
                        end
                    end
                end
            end
        end
        if tmpNum2 ~= nil and tmpNumBenDi2 ~= nil then
            if tmpNum2 ~= tmpNumBenDi2 then
                httpDown(httpMuLu .. "xinxi/now.plist", luaPath .. "/lua/now.plist")
                local tmpBiaoGan = loadPlist(luaPath .. "/lua/now.plist", "标杆")
                numIphoneID = tonumber(iphoneId)
                local tmpZhi = numIphoneID - tmpBiaoGan
                if tmpZhi <= 5 and tmpZhi > 0 then
                    closeApp(apps2)
                    mSleep(1000)

                    init("0", 0)
                    xunLeiXiaZai1(httpMuLu .. "APP/" .. apps2 .. ".ipa")
                    mSleep(2000)
                    runFilza()
                    mSleep(2000)
                    init(1)
                    runApp(apps2)
                    APP2.isYiDengLu = 0
                    mSleep(5000)
                    writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, tmpNum2)
                    httpDown(httpMuLu .. "xinxi/now.plist", luaPath .. "/lua/now.plist")
                    tmpBiaoGan = loadPlist(luaPath .. "/lua/now.plist", "标杆")
                    tmpBiaoGan = tmpBiaoGan + 1
                    writePlist(luaPath .. "/lua/now.plist", "标杆", tmpBiaoGan)
                    for i = 1, 10 do
                        _, err = szFtp.upload(luaPath .. "/lua/now.plist", ftpMuLu .. "xinxi/")
                        if err then
                        else
                            break
                        end
                    end
                end
            end

        end
    end
end

-- 写入调试
function tiaoShi(tiaoShiNeiRong)
    -- local tmpXuanXiang = string.find(zongHeXuanXiang1, "3") -- 网络调试
    -- if tmpXuanXiang ~= nil then
    --     local tmpXuanXiang = string.find(zongHeXuanXiang1, "0")
    --     if tmpXuanXiang ~= nil then
    --         wLog(State["IP"],
    --             iphoneId .. " 目标1: " .. muBiao1 .. " 目标2: " .. muBiao2 .. " 目标3: " .. muBiao3 ..
    --                 "    操作:" .. tiaoShiNeiRong .. "   #" .. xiangMu .. "#   [DATE]")
    --         -- wLog(State["IP"], tiaoShiNeiRong.."   #mt#   [DATE]")
    --     end
    --     local tmpXuanXiang = string.find(zongHeXuanXiang1, "1")
    --     if tmpXuanXiang ~= nil then
    --         wLog(wanmaoIP,
    --             iphoneId .. " 目标1: " .. muBiao1 .. " 目标2: " .. muBiao2 .. " 目标3: " .. muBiao3 ..
    --                 "    操作:" .. tiaoShiNeiRong .. "   #" .. xiangMu .. "#   [DATE]")
    --     end
    -- end
    -- local tmpXuanXiang = string.find(zongHeXuanXiang1, "2")
    -- if tmpXuanXiang ~= nil then
    --     -- dialog(tiaoShiNeiRong,5)
    --     toast(
    --         "目标1: " .. muBiao1 .. " 目标2: " .. muBiao2 .. " 目标3: " .. muBiao3 .. "                操作:" ..
    --             tiaoShiNeiRong)
    --     mSleep(3000)
    -- end
end

-- 字符串去空格
function trim(s)
    return (string.gsub(s, "%s*(.-)%s*", "%1"))
end

-- 汉字转数字(带\)
function hanZiToNumberDaiGang(s)
    return "\\" .. table.concat({ string.byte(s, 1, -1) }, "\\")
end

-- 汉字转数字
function hanZiToNumber(s)
    local tmpHanzitoNum = "" .. table.concat({ string.byte(s, 1, -1) }, "")
    if string.len(tmpHanzitoNum) <= 27 then
        tmpHanzitoNum = tmpHanzitoNum .. "000000000"
    end
    return tmpHanzitoNum
end

-- 数字转汉字
function numberToHanZi(s)
    bb = string.gsub(s, "\\%d%d?%d?", function(v)
        return string.char(tonumber(v))
    end)
    return bb
end

-- 更改配置文件
function writeConfig(filename, number, neirong)
    local f = io.open(luaPath .. "/config/" .. filename, 'r')
    local tmpString = f:read("*all")
    local tmpWeiZhi = {}
    local tmpQianDuan = ""
    local tmpHouDuan = ""
    if number == 1 then
        tmpQianDuan = "ui_input::::"
        tmpWeiZhi[1] = string.find(tmpString, "###");
        tmpHouDuan = string.sub(tmpString, tmpWeiZhi[1], -1)
        f:close()
        f = io.open(luaPath .. "/config/" .. filename, 'w')
        -- dialog(tmpQianDuan..neirong..tmpHouDuan,0)
        f:write(tmpQianDuan .. neirong .. tmpHouDuan)
        f:close()
    end

    if number > 1 then
        for i = 1, number do
            if i == 1 then
                tmpWeiZhi[i] = string.find(tmpString, "###");
            else
                tmpWeiZhi[i] = string.find(tmpString, "###", tmpWeiZhi[i - 1] + 3);
            end

        end
        tmpQianDuan = string.sub(tmpString, 1, tmpWeiZhi[number - 1] + 2)
        tmpHouDuan = string.sub(tmpString, tmpWeiZhi[number], -1)

        f:close()
        f = io.open(luaPath .. "/config/" .. filename, 'w')
        f:write(tmpQianDuan .. neirong .. tmpHouDuan)
        f:close()
    end
end

function loadIni(file, jian)
    local string = ""
    local f = io.open(file, 'r')
    if f == nil then
        f = io.open(file, 'w')
        f:close()
        return nil
    else
        string = f:read("*all")
    end
    f:close()
    weizhi1 = string.find(string, "%[" .. jian .. "%]");
    if weizhi1 == nil then
        return nil
    end
    str1 = string.sub(string, weizhi1, weizhi1 + 7)
    weizhi2 = string.find(string, "%]", weizhi1 + 1);
    weizhi3 = string.find(string, "%[", weizhi1 + 1);
    if weizhi3 == nil then
        weizhi3 = #string
        str2 = string.sub(string, weizhi2 + 2, weizhi3)
    else
        str2 = string.sub(string, weizhi2 + 2, weizhi3 - 2)
    end
    return str2
end

function writeIni(file, jian, zhi)
    local string = ""
    local f = io.open(file, 'r')
    string = f:read("*all")
    f:close()
    weizhi1 = string.find(string, "%[" .. jian .. "%]");
    if weizhi1 == nil then
        string = string .. "\n" .. "[" .. jian .. "]" .. "\n" .. zhi
        return string
    end
    str1 = string.sub(string, weizhi1, weizhi1 + 7)
    weizhi2 = string.find(string, "%]", weizhi1 + 1);
    weizhi3 = string.find(string, "%[", weizhi1 + 1);
    if weizhi3 == nil then
        weizhi3 = #string
        str2 = string.sub(string, weizhi2 + 2, weizhi3)
    else
        str2 = string.sub(string, weizhi2 + 2, weizhi3 - 2)
    end
    str3 = string.sub(string, 1, weizhi2 + 1)
    if weizhi3 == #string then
        str4 = ""
    else
        str4 = string.sub(string, weizhi3, -1)
    end
    if weizhi3 == #string then
        string = str3 .. zhi
    else
        string = str3 .. zhi .. "\n" .. str4
    end
    F_SavesW(file, string)
end

-- 迅雷下载
function xunLeiXiaZai1(urlFile)
    movefile("/var/mobile/Documents/*.ipa", "/var/mobile/Documents/ipa.ipa");
    delFile("/var/mobile/Documents/ipa.ipa")
    runApp(appXunLei)
    mSleep(10000)
    for i = 1, 60 do
        if isColor(519, 316, 255, 255, 255, 0) and isColor(519, 306, 36, 89, 144, 0) then
            touchQuickly(519, 316)
            mSleep(1000)
        end
        if isColor(589, 86, 123, 123, 123, 0) then
            tiaoShi("下载图标")
            touchQuickly(589, 86) -- 下载图标
            mSleep(2000)
            break
        end
        mSleep(1000)
    end
    if isColor(500, 84, 0, 121, 255, 0) then
        tiaoShi("+号")
        touchQuickly(500, 84) -- "+"号
        mSleep(2000)
    else
        tiaoShi("关闭迅雷")
        closeApp(appXunLei)
        mSleep(5000)
        xunLeiXiaZai2(urlFile)
        return
    end
    touchDown(603, 981)
    mSleep(5000)
    touchUp(603, 981)
    mSleep(1000)
    inputText(urlFile)
    mSleep(2000)
    touchQuickly(309, 677) -- 下载
    mSleep(2000)
    for i = 1, 20 * 60 do
        if isColor(280, 81, 1, 95, 207, 0) and isColor(314, 80, 182, 188, 202, 0) then
            touchQuickly(318, 651) -- 重复下载
            mSleep(2000)
        end
        if isColor(345, 319, 115, 164, 255, 0) then
            -- dialog("下载完毕",5)
            break
        end
        mSleep(1000)
        if i == 20 * 60 then
            touchQuickly(591, 85) -- 菜单
            mSleep(1000)
            touchQuickly(520, 402) -- 删除
            mSleep(1000)
            touchQuickly(584, 86) -- 全选
            mSleep(1000)
            touchQuickly(322, 1083) -- 删除
            mSleep(1000)
            touchQuickly(473, 655) -- 确定
            mSleep(1000)
            closeApp(appXunLei)
            mSleep(2000)
            return
        end
    end
    movefile(dataPlist3a .. "Documents/download/*", "/var/mobile/Documents/ipa.ipa");
    touchQuickly(369, 82) -- 已完成
    mSleep(2000)
    touchQuickly(576, 85) -- 删除
    mSleep(2000)
    touchQuickly(576, 85) -- 全选
    mSleep(2000)
    touchQuickly(321, 1089) -- 删除
    mSleep(2000)
    touchQuickly(475, 652) -- 确定
    mSleep(2000)
    closeApp(appXunLei)
    mSleep(2000)
end

function xunLeiXiaZai2(urlFile)
    movefile("/var/mobile/Documents/*.ipa", "/var/mobile/Documents/ipa.ipa");
    delFile("/var/mobile/Documents/ipa.ipa")
    runApp(appXunLei)
    mSleep(10000)
    for i = 1, 60 do
        if isColor(519, 316, 255, 255, 255, 0) and isColor(519, 306, 36, 89, 144, 0) then
            touchQuickly(519, 316)
            mSleep(1000)
        end
        if isColor(589, 86, 123, 123, 123, 0) then
            tiaoShi("下载图标")
            touchQuickly(589, 86) -- 下载图标
            mSleep(2000)
            break
        end
        mSleep(1000)
    end
    if isColor(500, 84, 0, 121, 255, 0) then
        tiaoShi("+号")
        touchQuickly(500, 84) -- "+"号
        mSleep(2000)
    else
        tiaoShi("关闭迅雷")
        closeApp(appXunLei)
        mSleep(5000)
        xunLeiXiaZai1(urlFile)
        return
    end
    touchDown(603, 981)
    mSleep(5000)
    touchUp(603, 981)
    mSleep(1000)
    inputText(urlFile)
    mSleep(2000)
    touchQuickly(309, 677) -- 下载
    mSleep(2000)
    for i = 1, 20 * 60 do
        if isColor(280, 81, 1, 95, 207, 0) and isColor(314, 80, 182, 188, 202, 0) then
            touchQuickly(318, 651) -- 重复下载
            mSleep(2000)
        end
        if isColor(345, 319, 115, 164, 255, 0) then
            -- dialog("下载完毕",5)
            break
        end
        mSleep(1000)
        if i == 20 * 60 then
            touchQuickly(591, 85) -- 菜单
            mSleep(1000)
            touchQuickly(520, 402) -- 删除
            mSleep(1000)
            touchQuickly(584, 86) -- 全选
            mSleep(1000)
            touchQuickly(322, 1083) -- 删除
            mSleep(1000)
            touchQuickly(473, 655) -- 确定
            mSleep(1000)
            closeApp(appXunLei)
            mSleep(2000)
            return
        end
    end

    movefile(dataPlist3a .. "Documents/download/*", "/var/mobile/Documents/ipa.ipa")
    touchQuickly(369, 82) -- 已完成
    mSleep(2000)
    touchQuickly(576, 85) -- 删除
    mSleep(2000)
    touchQuickly(576, 85) -- 全选
    mSleep(2000)
    touchQuickly(321, 1089) -- 删除
    mSleep(2000)
    touchQuickly(475, 652) -- 确定
    mSleep(2000)
    closeApp(appXunLei)
    mSleep(2000)
end

-- 运行Filza
function runFilza(...)
    runApp(appFilza)
    mSleep(5000)
    for i = 1, 60 do
        if isColor(192, 1091, 0, 122, 255, 0) then
            break
        end
        mSleep(1000)
    end
    touchQuickly(320, 1092) -- 收藏目录
    mSleep(2000)
    touchQuickly(249, 241) -- Documents目录
    mSleep(2000)
    touchQuickly(54, 353) -- app
    mSleep(5000)
    touchQuickly(588, 88) -- 安装
    mSleep(5000)
    for i = 1, 180 do
        if isColor(569, 83, 0, 122, 255, 0) then
            closeApp(appFilza)
            mSleep(5000)
            delFile("/var/mobile/Documents/ipa.ipa")
            break
        end
        mSleep(5000)
    end
    closeApp(appFilza)
    mSleep(2000)
end

function isColor1(x, y, r, g, b, sim0)
    if sim0 == nil then
        sim0 = 5
    end
    local lr, lg, lb;
    lr, lg, lb = getColorRGB(x, y);
    if math.abs(lr - r) > sim0 then
        return false;
    end
    if math.abs(lg - g) > sim0 then
        return false;
    end
    if math.abs(lb - b) > sim0 then
        return false;
    end
    return true;
end

-- -- 单点比色
-- function isColor(x, y, r, g, b, sim0)
--     -- local r,g,b = getColorRGB(x, y)
--     -- local r1,g1,b1,wc = 0,0,0,0        --初始化定义
--     -- if c == nil then
--     --         r1,g1,b1 = math.modf(r0/65536),math.modf(r0/256)%256,r0%256
--     --         wc = b
--     -- else
--     --         r1,g1,b1 = r0,g0,b0
--     --         wc = d
--     -- end
--     -- if wc == nil then if r == r1 and g == g1 and b == b1 then return true else return false end end
--     -- if (math.abs(r-r1)/255)*100 > wc and
--     -- (math.abs(g-g1)/255)*100 > wc and
--     -- (math.abs(b-b1)/255)*100 > wc then
--     --         return true
--     -- else
--     --         return false
--     -- end
--     -- if muBiao == mb_FaSongSiXin or muBiao == mb_DengDaiHuiFu  or muBiao == mb_DengDaiSiXin or muBiao == mb_DengDaiJiaoYi or muBiao == mb_QianWangJiaoYi or muBiao == mb_XiaoHaoZhengLi or muBiao == mb_JY_HuanJiaoSe or muBiao == mb_CangKuZhengLi or muBiao == mb_MaiShu then
--     --         if (isColor1(524,508,168,130,82,5) and isColor1(617,530,167,111,55,5) and isColor1(567,567,25,182,211,5))
--     --         or (isColor1(524,508,167,127,77,5) and isColor1(617,530,167,112,55,5) and isColor1(567,567,39,191,222,5)) then
--     --                 tiaoShi("冥想")
--     --                 touchClick1(524,508,166,133,88)
--     --         end
--     --         if isColor1(524,508,166,133,88,5) and isColor1(617,530,167,111,57,5) and isColor1(567,567,42,181,208,5) then
--     --                 tiaoShi("冥想-旧")
--     --                 touchClick1(524,508,166,133,88)
--     --         end
--     --         if isColor1(520,539,165,122,67,5) and isColor1(613,560,172,110,55,5) and isColor1(511,224,214,181,51,5) then
--     --                 tiaoShi("冥想收益")
--     --                 touchClick1(569,545,169,130,80)
--     --         end
--     --         if isColor1(520,539,163,120,66,5) and isColor1(613,560,173,110,57,5) and isColor1(511,224,214,179,45,5) then
--     --                 tiaoShi("冥想收益-旧")
--     --                 touchClick1(569,545,169,130,80)
--     --         end
--     -- end
--     if sim0 == nil then
--         sim0 = 5
--     end
--     local lr, lg, lb;
--     lr, lg, lb = getColorRGB(x, y);
--     if math.abs(lr - r) > sim0 then
--         return false;
--     end
--     if math.abs(lg - g) > sim0 then
--         return false;
--     end
--     if math.abs(lb - b) > sim0 then
--         return false;
--     end
--     return true;
-- end
-- -- 多点比色
-- function multiColor(array, s)
--     -- s = math.floor(0xff*(100-s)*0.01)
--     keepScreen(true)
--     for var = 1, #array do
--         local lr, lg, lb = getColorRGB(array[var][1], array[var][2])
--         local r = array[var][3]
--         local g = array[var][4]
--         local b = array[var][5]
--         if math.abs(lr - r) > s or math.abs(lg - g) > s or math.abs(lb - b) > s then
--             keepScreen(false)
--             return false
--         end
--     end
--     keepScreen(false)
--     return true
-- end
-- 集中文件
function jiZhongWenJian(...)
    local tmpXuanXiang = string.find(zongHeXuanXiang1, "4")
    if tmpXuanXiang ~= nil then
        if isFileJiZhongJianCe == false then
            if nowDateTime.min >= 50 and nowDateTime.min <= 60 then
                isFileJiZhongJianCe = true
                writePlist("/User/Media/TouchSprite/lua/mt.plist", "文件集中检测", isFileJiZhongJianCe)
                tiaoShi("集中文件")
                tmpBianHao = "0"
                tmpNeiRong = "0"
                tmpGuZhangJiQi = ""
                for i = 1, 110 do
                    if i < 10 then
                        tmpBianHao = "0" .. i
                    else
                        tmpBianHao = i
                    end
                    httpDown(httpMuLu .. "xinxi/" .. tmpBianHao .. ".txt",
                        "/User/Media/TouchSprite/res/" .. tmpBianHao .. ".txt")
                    tmpNeiRong = getFile("/User/Media/TouchSprite/res/" .. tmpBianHao .. ".txt")
                    if i == 1 then
                        F_SavesW("/User/Media/TouchSprite/res/xinxi.txt", tmpNeiRong)
                    else
                        F_SavesA("/User/Media/TouchSprite/res/xinxi.txt", tmpNeiRong)
                    end
                    tmpZhaoShiJianX = string.find(tmpNeiRong, ":")
                    tmpZhaoShiJianA = string.sub(tmpNeiRong, 1, tmpZhaoShiJianX - 1)
                    tmpZhaoShiJianB = tonumber(tmpZhaoShiJianA)
                    if type(tmpZhaoShiJianB) == "number" then
                        if tmpZhaoShiJianB ~= nowDateTime.hour then
                            tmpGuZhangJiQi = tmpGuZhangJiQi .. i .. " "
                        end
                    end

                    -- local tmpZhaoShiJianB = 0
                    -- local tmpZhaoShiJianC = 0
                    -- local tmpZhaoShiJianD = 0
                    -- local tmpZhaoShiJianE = 0
                    -- local tmpZhaoShiJianF = 0
                    -- local tmpZhaoShiJianG = 0
                    -- for j=1,9 do
                    --         tmpZhaoShiJianC = string.find(tmpZhaoShiJianA,"\t",tmpZhaoShiJianB+1)
                    --         tmpZhaoShiJianB = tmpZhaoShiJianC
                    --         if j == 8 then
                    --                 tmpZhaoShiJianD = tmpZhaoShiJianC+1
                    --         end
                    --         if j == 9 then
                    --                 tmpZhaoShiJianE = tmpZhaoShiJianC-4
                    --         end
                    -- end
                    -- tmpZhaoShiJianF = string.sub(tmpZhaoShiJianA,tmpZhaoShiJianD,tmpZhaoShiJianE)
                    -- -- print(a3)
                    -- tmpZhaoShiJianG = tonumber(tmpZhaoShiJianF)
                    -- if type(tmpZhaoShiJianG) == "number" then
                    --         if tmpZhaoShiJianG ~= nowDateTime.hour then
                    --                 tmpGuZhangJiQi = tmpGuZhangJiQi..i.."\t"
                    --         end
                    --         -- print(tmpZhaoShiJianG)
                    -- end
                end
                local tmpXuanXiang = string.find(zongHeXuanXiang1, "0")
                if tmpXuanXiang ~= nil then
                    faEmail("没有按时更新的机器为" .. tmpGuZhangJiQi)
                end
                for i = 1, 10 do
                    _, err = szFtp.upload("/User/Media/TouchSprite/res/xinxi.txt", ftpMuLu .. "xinxi/")
                    if err then
                    else
                        break
                    end
                end
            end
        end
        if isFileJiZhongJianCe == true then
            if nowDateTime.min < 50 then
                tiaoShi("文件集中检测")
                isFileJiZhongJianCe = false
                writePlist("/User/Media/TouchSprite/lua/mt.plist", "文件集中检测", isFileJiZhongJianCe)
            end
        end
    end
end

-- wifi检测
function wifiJianCe(...)
    if nowTime - timeWifi >= 30 * 60 then
        timeWifi = nowTime
        if file_exists(luaPath .. "/plugin/wifi.txt") then
            delFile(luaPath .. "/plugin/wifi.txt")
        end
        httpDown(httpMuLu .. "wifi.txt", luaPath .. "/plugin/wifi.txt")
        if file_exists(luaPath .. "/plugin/wifi.txt") then
            return
        else
            setWifiEnable(false); -- 关闭 Wifi
            mSleep(5000)
            setWifiEnable(true); -- 打开 Wifi
            mSleep(1000)
        end
    end
end

-- 求表中的最大值及序号
function maximum(a)
    local mi = 1 -- maximum index
    local m = a[mi] -- maximum value
    for i, val in ipairs(a) do
        if val > m then
            mi = i
            m = val
        end
    end
    return m, mi
end

-- 求表中的最小值及序号
function minimum(a)
    local mi = 1 -- minimum index
    local m = a[mi] -- minimum value
    for i, val in ipairs(a) do
        if val < m then
            mi = i
            m = val
        end
    end
    return m, mi
end

-- 检测数组中是否包含某个值
-- 遍历数组
function IsInTable(value, tbl)
    for k, v in ipairs(tbl) do
        if v == value then
            return true;
        end
    end
    return false;
end

-- 判断一个字符是否存在某个数组
-- 判断字符b,是否存在于数组list中
function in_array(b, list)
    if not list then
        return false
    end
    if list then
        for k, v in pairs(list) do
            if v.tableName == b then
                return true
            end
        end
    end
end

------------------云打码函数定义部分,开始---------------------

-- 读文件至二进制
function read_file_byte(filepath)
    local h = io.open(filepath, "rb")
    if (h == nil) then
        return ""
    end
    local bin = h:read("*all")
    h:close()
    return bin
end

-- 二进制转十六进制字符串
function hex_encode(bytes)
    local t = {}
    for i = 1, string.len(bytes) do
        local charcode = tonumber(string.byte(bytes, i, i))
        table.insert(t, string.format("%02X", charcode))
    end
    return table.concat(t)
end

-- 读文件至十六进制字符串
function read_file_to_hex(filepath)
    local bin = read_file_byte(filepath)
    if (bin == "") then
        return ""
    else
        return hex_encode(bin)
    end
end

-- 查询剩余验证码点数
function CR_GetUserInfo(chaorenuser, chaorenpass)
    local postData = string.format("username=%s&password=%s", chaorenuser, chaorenpass)
    local re = httpPost("http://api2.sz789.net:88/GetUserInfo.ashx", postData)
    if re == false then
        return -1
    else
        return json.decode(re)['left']
    end
end

-- 上传验证码,等待返回识别结果
function CR_RecvBytes(chaorenuser, chaorenpass, softid, filepath)
    local re
    local image_hex = read_file_to_hex(filepath)
    if image_hex == "" then
        re = '{"info":-20,"result":"","imgId":""}'
    else
        local postData = string.format("username=%s&password=%s&softid=%s&imgdata=%s", chaorenuser, chaorenpass, softid,
            image_hex)
        re = httpPost("http://api2.sz789.net:88/RecvByte.ashx", postData)
    end
    if re == false then
        re = '{"info":-1,"result":"","imgId":""}'
    end
    return re
end

-- 如图片发生旋转,可以使用以下方法,指定图片顺时针旋转角度,旋转至正确的方向
-- 顺时针旋转图片并上传
function CR_RecvBytes2(chaorenuser, chaorenpass, softid, rotate, filepath)
    local image_hex = read_file_to_hex(filepath)
    if image_hex == "" then
        local re = '{"info":-20,"result":"","imgId":""}'
    else
        local postData = string.format("username=%s&password=%s&softid=%s&rotate=%s&imgdata=%s", chaorenuser,
            chaorenpass, softid, rotate, image_hex)
        local re = httpPost("http://api2.sz789.net:88/RecvByte2.ashx", postData)
    end
    if re == false then
        re = '{"info":-1,"result":"","imgId":""}'
    end
    return re
end

-- 验证码识别错误时，报告错误验证码
function CR_ReportError(chaorenuser, chaorenpass, imageID)
    local postData = string.format("username=%s&password=%s&imgid=%s", chaorenuser, chaorenpass, imageID)
    httpPost("http://api2.sz789.net:88/ReportError.ashx", postData)
end

------------------函数定义部分,结束---------------------

-----------------------通用部分--------------------------
-- 检查登录次数
function jianChaDengLuCiShu(...)
    if APP1.dengLuCiShu + APP2.dengLuCiShu >= 30 then
        APP1.dengLuCiShu = 0
        APP2.dengLuCiShu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "APP登录次数", 0)
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "PP登录次数", 0)
        -- faEmail()
        numChongQi = numChongQi + 1
        writePlist(luaMuLu .. xiangMu .. ".plist", "重启次数", numChongQi)
        require(xiangMu .. "0")
        -- reboot()
        lua_exit()
    end
    if numChongQi >= 5 then
        numChongQi = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "重启次数", numChongQi)
        faEmail()
        reboot()
    end
    if APP1.dengLuCiShu >= 20 and APP2.dengLuCiShu <= 10 then
        APP1.dengLuCiShu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "APP登录次数", 0)
        closeApp(apps1)
        mSleep(1000)
        runApp(apps1)
    end
    if APP2.dengLuCiShu >= 20 and APP1.dengLuCiShu <= 10 then
        APP2.dengLuCiShu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "PP登录次数", 0)
        closeApp(apps2)
        mSleep(1000)
        runApp(apps2)
    end
end

-- 定时切换游戏
function dingShiQieHuanGame(...)
    if pingTai2 ~= "10" then
        if nowTime - timeQieHuanGame >= 10 then
            timeQieHuanGame = nowTime
            qieHuanGame()
        end
    end
end

-- 切换游戏
function qieHuanGame(...)
    if pingTai2 ~= "10" then
        -- local tmpXuanXiang = string.find(duoXuan1,"1")
        -- if tmpXuanXiang ~= nil then
        tiaoShi("切换游戏")
        bid = frontAppBid()
        if bid == apps1 then
            runApp(apps2)
            -- APP2.isYiDengLu = 0
            APP = APP2
            mSleep(1000)
        elseif bid == apps2 then
            runApp(apps1)
            -- APP1.isYiDengLu = 0
            APP = APP1
            mSleep(1000)
        end
    end
end

-- 初次加载
function chuCiJiaZai(...)
    bianLiang()
    oncePlist()
    onceOther()
    dmOCR()
    if version ~= "2.2.4" then
        setBacklightLevel(0.5);
    end

    initLog(wanmaoIP, 2); -- 初始化日志,并以异步方式发送；把 2 换成 3  即为同步发
    -- tiaoShi("12345到司法所f等法规到是否感受到法国"");  --将日志发送到 192.168.1.1
    -- closeLog("192.168.0.215");

    -- local isChongQi = false
    -- if not(file_exists("/private/var/mobile/Library/Filza/")) then
    --         tiaoShi("filza")
    --         isChongQi = true
    --         httpDown(httpMuLu.."deb/Filza.deb",file_AutoInstall.."Filza.deb")
    -- end
    -- if not(file_exists("/private/var/lib/xcon/")) then
    --         tiaoShi("xcon")
    --         isChongQi = true
    --         httpDown(httpMuLu.."deb/xcon.deb",file_AutoInstall.."xcon.deb")
    -- end
    -- if isChongQi == true then
    --         -- dialog("重启",0)
    --         reboot()
    --         lua_exit()
    -- end
    -- if sysint >= 800 then
    --         Applications = "Application"
    -- else
    --         Applications = "Applications"
    -- end
    -- local isYouXunLei = string.find(iTunesMetadata3,Applications)
    -- if isYouXunLei == nil then
    --         tiaoShi("下载迅雷")
    --         init("0",0)
    --         httpDown(httpMuLu.."APP/xunlei.ipa", "/var/mobile/Documents/ipa.ipa")
    --         mSleep(2000)
    --         runFilza()
    --         mSleep(2000)
    --         runApp(appXunLei)
    --         mSleep(5000)
    --         if isColor(390,580,245,98,90,0) then
    --                 touchMoveXY(497,872,136,866)
    --                 mSleep(1000)
    --         end
    --         if isColor(398,455,245,98,90,0) then
    --                 touchMoveXY(497,872,136,866)
    --                 mSleep(1000)
    --         end
    --         if isColor(207,984,18,148,246,0) then
    --                 touchQuickly(311,981)
    --                 mSleep(1000)
    --                 if isColor(207,984,18,148,246,0) then
    --                         touchQuickly(311,981)
    --                         mSleep(1000)
    --                 end
    --         end
    --         isXunHuanLua = false
    --         isChongZhiLua = true
    --         init("0",1)
    --         return
    --         -- tmpDataPlist3 = find("/private/var/mobile/Applications/*"..file_severIP3)
    --         -- dataPlist3 = tmpDataPlist3:read("*all")
    --         -- dataPlist3a = string.sub(dataPlist3, 1, 70)
    --         -- iTunesMetadata3 = dataPlist3a.."iTunesMetadata.plist"

    -- -- else
    -- --         dialog(iTunesMetadata3,0)
    -- --         lua_exit()
    -- end

    -- if file_exists(luaMuLu..iphoneId..".txt") then
    -- else
    --     f = io.open(luaMuLu..iphoneId..".txt", 'w')
    --     f:close()
    -- end

    -- 日期早
    nowDay = loadJson("日期")
    if nowDay == nil then
        nowDay = nowDateTime.day
        writeJson("日期", nowDay)
    end
    -- 日期晚
    nowDayNight = loadJson("日期晚")
    if nowDayNight == nil then
        nowDayNight = nowDateTime.day
        writeJson("日期晚", nowDayNight)
    end
    -- --游戏版本
    -- local tmpGame1 = string.find(dataPlist1,Applications)
    -- if tmpGame1 == nil then
    --         tiaoShi("下载游戏1")
    --         init("0",0)
    --         xunLeiXiaZai1(httpMuLu.."APP/"..apps1..".ipa")
    --         mSleep(2000)
    --         runFilza()
    --         mSleep(2000)
    --         init("0",1)
    --         runApp(apps1)
    --         APP1.isYiDengLu = 0
    --         mSleep(5000)
    --         touchQuickly(448,441)     --关通知
    --         mSleep(1000)
    --         touchQuickly(448,441)     --关通知
    --         mSleep(1000)
    --         isXunHuanLua = false
    --         isChongZhiLua = true
    --         return
    -- end
    -- --游戏版本
    -- if pingTai2 ~= "10" then
    --         local tmpGame2 = string.find(dataPlist2,Applications)
    --         if tmpGame2 == nil then
    --                 tiaoShi("下载游戏2")
    --                 init("0",0)
    --                 xunLeiXiaZai1(httpMuLu.."APP/"..apps2..".ipa")
    --                 mSleep(2000)
    --                 runFilza()
    --                 mSleep(2000)
    --                 init("0",1)
    --                 runApp(apps2)
    --                 APP2.isYiDengLu = 0
    --                 mSleep(5000)
    --                 touchQuickly(448,441)     --关通知
    --                 mSleep(1000)
    --                 touchQuickly(448,441)     --关通知
    --                 mSleep(1000)
    --                 isXunHuanLua = false
    --                 isChongZhiLua = true
    --                 return
    --         end
    -- end
    -- --文件集中检测
    -- isFileJiZhongJianCe = loadPlist(luaMuLu..xiangMu..".plist","文件集中检测")
    -- if isFileJiZhongJianCe == nil then
    --         isFileJiZhongJianCe = false
    --         writePlist(luaMuLu..xiangMu..".plist","文件集中检测",isFileJiZhongJianCe)
    -- end
    -- --脚本故障检测
    -- -- isJiaoBenJianCe = loadPlist(luaMuLu..xiangMu..".plist","脚本故障检测")
    -- -- if isJiaoBenJianCe == nil then
    --         isJiaoBenJianCe = false
    --         writePlist(luaMuLu..xiangMu..".plist","脚本故障检测",isJiaoBenJianCe)
    -- -- end
    -- --脚本故障检测时间
    -- timeJiaoBenJianCe = loadPlist(luaMuLu..xiangMu..".plist","脚本故障检测时间")
    -- if timeJiaoBenJianCe == nil then
    --         timeJiaoBenJianCe = nowDateTime.hour..":"..nowDateTime.min
    --         writePlist(luaMuLu..xiangMu..".plist","脚本故障检测时间",timeJiaoBenJianCe)
    -- end
    -- isWeiXin62 = loadPlist(luaMuLu .. "WeiXin.plist", "isWeiXin62")
    -- if isWeiXin62 == nil or isWeiXin62 == false then
    --     weiXinPath = appDataPath(appWeiXin);
    --     copyfile(weiXinPath .. "/Library/WechatPrivate/wx.dat",
    --         "/var/mobile/Media/TouchSprite/res/" .. iphoneId .. "_wx.dat");
    --     if string.find(zongHeXuanXiang1, "0") ~= nil then
    --         ftp.upload("/var/mobile/Media/TouchSprite/res/" .. iphoneId .. "_wx.dat", ftpMuLu .. "WeiXin/0/")
    --     else
    --         ftp.upload("/var/mobile/Media/TouchSprite/res/" .. iphoneId .. "_wx.dat", ftpMuLu .. "WeiXin/1/")
    --     end
    --     isWeiXin62 = true
    --     writePlist(luaMuLu .. "WeiXin.plist", "isWeiXin62", isWeiXin62)
    -- end
    -- isXueSe = loadPlist(luaMuLu .. xiangMu .. ".plist", "isXueSe")
    -- if isXueSe == nil then
    --     isXueSe = false
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "isXueSe", isXueSe)
    -- end

    -- muBiao1 = loadPlist(luaMuLu..xiangMu..".plist","目标1")
    -- if muBiao1 == nil then
    --         muBiao1 = mb_Wu
    --         writeConfig(State["Bid"].."_Set.dat",mbCon1,muBiao1Con)
    -- end
    -- muBiao2 = loadPlist(luaMuLu..xiangMu..".plist","目标2")
    -- if muBiao2 == nil then
    --         muBiao2 = mb_Wu
    --         writeConfig(State["Bid"].."_Set.dat",mbCon2,muBiao2Con)
    -- end
    -- muBiao3 = loadPlist(luaMuLu..xiangMu..".plist","目标3")
    -- if muBiao3 == nil then
    --         muBiao3 = mb_Wu
    --         writeConfig(State["Bid"].."_Set.dat",mbCon3,muBiao3Con)
    -- end
    -- numDead = loadPlist(luaMuLu .. xiangMu .. ".plist", "死亡次数")
    -- if numDead == nil then
    --     numDead = 0
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "死亡次数", numDead)
    -- end

    nowTime = os.time()
    -- timeZhengLi = loadPlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi")
    -- if timeZhengLi == nil then
    --     timeZhengLi = nowTime - 10 * 60
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
    -- end
    numDay = loadJson("第几天")
    if numDay == nil then
        numDay = 0
        writeJson("第几天", numDay)
    end
    tiaoShi("初次加载")
end

-- 发邮件
function faEmail(EmailNeiRong)
    local mail = require "mail";  -- 载入扩展库
    a = mail.send("xinqinew@163.com", "xinqinew@163.com", EmailNeiRong, EmailNeiRong, "smtp.163.com",
        "xinqinew@163.com", "Qwer1234")
    -- if a == true then         --发送成功
    --     dialog("Succeed!", 0)
    -- else
    --     dialog(a, 0)
    -- end
end

-- 脚本故障检测
function jiaoBenGuZhangJianCe(...)
    if isJiaoBenJianCe == false then
        local tmpMin = tonumber(iphoneId) % 40
        if nowDateTime.min >= tmpMin and nowDateTime.min <= 45 then
            tiaoShi("脚本故障检测")
            isJiaoBenJianCe = true
            writePlist(luaMuLu .. xiangMu .. ".plist", "脚本故障检测", isJiaoBenJianCe)
            F_SavesW(luaPath .. "/res/" .. iphoneId .. ".txt", nowDateTime.hour .. ":" .. nowDateTime.min)
            timeJiaoBenJianCe = nowDateTime.hour .. ":" .. nowDateTime.min
            writePlist(luaMuLu .. xiangMu .. ".plist", "脚本故障检测时间", timeJiaoBenJianCe)
            -- writePlist(luaMuLu..iphoneId..".plist","等级1",APP1.dengJi)
            -- writePlist(luaMuLu..iphoneId..".plist","等级2",APP2.dengJi)
            for i = 1, 10 do
                _, err = szFtp.upload(luaPath .. "/res/" .. iphoneId .. ".txt", ftpMuLu .. xiangMu .. "/jb/")
                if err then
                else
                    break
                end
            end
            for i = 1, 10 do
                _, err = szFtp.upload(luaPath .. "/res/" .. iphoneId .. "jb1.jpg", ftpMuLu .. xiangMu .. "/RMB/")
                if err then
                else
                    break
                end
            end
            -- if pingTai2 ~= "10" then
            --         for i=1,10 do
            --                 _, err = ftp.upload(luaPath.."/res/"..iphoneId.."jb2.jpg", ftpMuLu..xiangMu.."/RMB/")
            --                 if err then
            --                 else
            --                         break
            --                 end
            --         end
            -- end
            -- for i=1,10 do
            --         _, err = ftp.upload(luaPath.."/res/"..iphoneId.."_jinbi1.txt", ftpMuLu..xiangMu.."/jinbi/")
            --         if err then
            --         else
            --                 break
            --         end
            -- end
            -- if pingTai2 ~= "10" then
            --         for i=1,10 do
            --                 _, err = ftp.upload(luaPath.."/res/"..iphoneId.."_jinbi2.txt", ftpMuLu..xiangMu.."/jinbi/")
            --                 if err then
            --                 else
            --                         break
            --                 end
            --         end
            -- end
            -- for i=1,10 do
            --         _, err = ftp.upload(luaPath.."/res/"..iphoneId.."_yinbi1.txt", ftpMuLu..xiangMu.."/yinbi/")
            --         if err then
            --         else
            --                 break
            --         end
            -- end
            -- if pingTai2 ~= "10" then
            --         for i=1,10 do
            --                 _, err = ftp.upload(luaPath.."/res/"..iphoneId.."_yinbi2.txt", ftpMuLu..xiangMu.."/yinbi/")
            --                 if err then
            --                 else
            --                         break
            --                 end
            --         end
            -- end
            -- for i=1,10 do
            --         _, err = ftp.upload(luaPath.."/res/"..iphoneId.."_dengji1.txt", ftpMuLu..xiangMu.."/dengji/")
            --         if err then
            --         else
            --                 break
            --         end
            -- end
            -- if pingTai2 ~= "10" then
            --         for i=1,10 do
            --                 _, err = ftp.upload(luaPath.."/res/"..iphoneId.."_dengji2.txt", ftpMuLu..xiangMu.."/dengji/")
            --                 if err then
            --                 else
            --                         break
            --                 end
            --         end
            -- end
            loadUpXinXi()
            delFile("/User/Media/TouchSprite/res/*.*")
        end
    end
    if isJiaoBenJianCe == true then
        if nowDateTime.min > 45 and nowDateTime.min <= 59 then
            tiaoShi("脚本故障检测")
            isJiaoBenJianCe = false
            writePlist(luaMuLu .. xiangMu .. ".plist", "脚本故障检测", isJiaoBenJianCe)
        end
    end
end

-- 读取上传信息
function loadUpXinXi(...)
    APP1.dengJi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "等级1")
    APP1.numJinBi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "金币1")
    APP1.numYinBi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "银币1")
    APP1.numHuoYueDu = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "活跃度1")
    APP1.isBeiBaoMan = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "背包已满1")
    timeJiaoBenJianCe = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "脚本故障检测时间")
    APP1.numZiDingJia = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "自定价1")
    APP1.numFuShi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "符石1")
    APP1.numXinYongZhi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "信用值1")
    APP1.isGaoJiCangBaoTu = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "高级藏宝图1")
    APP1.isPoZhuangBei = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "破装备1")
    APP1.jiaoSeName = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "人物名字1")
    APP1.dengLuCiShu = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "登录次数1")
    APP1.isZuoJi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "坐骑1")
    APP1.numHongBao = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "红包1")
    sysver = getOSVer();
    F_SavesW("/User/Media/TouchSprite/res/" .. iphoneId .. ".txt",
        timeJiaoBenJianCe .. "\t" .. iphoneId .. "A" .. "\t" .. APP1.fuWuQi_JianXie .. "\t" .. "LV." .. APP1.dengJi ..
        "\t" .. APP1.numJinBi .. "\t" .. APP1.numXinYongZhi .. "\t" .. APP1.numYinBi .. "\t" .. APP1.numHuoYueDu ..
        "\t" .. APP1.isBeiBaoMan .. "\t" .. APP1.numZiDingJia .. "\t" .. APP1.numFuShi .. "\t" ..
        APP1.isGaoJiCangBaoTu .. "\t" .. APP1.isPoZhuangBei .. "\t" .. APP1.jiaoSeName .. "\t" .. APP1.dengLuCiShu ..
        "\t" .. APP1.isZuoJi .. "\t" .. APP1.numHongBao .. "\t" .. sysver .. "\n")
    if pingTai2 ~= "10" then
        APP2.dengJi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "等级2")
        APP2.numJinBi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "金币2")
        APP2.numYinBi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "银币2")
        APP2.numHuoYueDu = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "活跃度2")
        APP2.isBeiBaoMan = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "背包已满2")
        timeJiaoBenJianCe = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "脚本故障检测时间")
        APP2.numZiDingJia = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "自定价2")
        APP2.numFuShi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "符石2")
        APP2.numXinYongZhi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "信用值2")
        APP2.isGaoJiCangBaoTu = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "高级藏宝图2")
        APP2.isPoZhuangBei = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "破装备2")
        APP2.jiaoSeName = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "人物名字2")
        APP2.dengLuCiShu = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "登录次数2")
        APP2.isZuoJi = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "坐骑2")
        APP2.numHongBao = loadPlist("/User/Media/TouchSprite/lua/mt.plist", "红包2")
        F_SavesA("/User/Media/TouchSprite/res/" .. iphoneId .. ".txt",
            timeJiaoBenJianCe .. "\t" .. iphoneId .. "B" .. "\t" .. APP2.fuWuQi_JianXie .. "\t" .. "LV." .. APP2.dengJi ..
            "\t" .. APP2.numJinBi .. "\t" .. APP2.numXinYongZhi .. "\t" .. APP2.numYinBi .. "\t" .. APP2.numHuoYueDu ..
            "\t" .. APP2.isBeiBaoMan .. "\t" .. APP2.numZiDingJia .. "\t" .. APP2.numFuShi .. "\t" ..
            APP2.isGaoJiCangBaoTu .. "\t" .. APP1.isPoZhuangBei .. "\t" .. APP2.isPoZhuangBei .. "\t" ..
            APP2.dengLuCiShu .. "\t" .. APP2.isZuoJi .. "\t" .. APP2.numHongBao .. "\t" .. sysver .. "\n")
    end
    for i = 1, 10 do
        _, err = szFtp.upload("/User/Media/TouchSprite/res/" .. iphoneId .. ".txt", ftpMuLu .. "xinxi/")
        if err then
        else
            break
        end
    end
end

-- 每日重置
function chongZhi(...)
    if nowDateTime.day ~= nowDayNight and nowDateTime.hour >= 23 and nowDateTime.min >= 55 then
        tiaoShi("晚重置")
        nowDayNight = nowDateTime.day
        writePlist(luaMuLu .. xiangMu .. ".plist", "日期晚", nowDayNight)
        numJiaoYi = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
        numJiaoYiChaoShi = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "交易超时", numJiaoYiChaoShi)
    end
    if numQuanShu ~= 0 then
        local tmpXuanXiang = string.find(duoXuan1, "1")
        if tmpXuanXiang ~= nil then
            if nowDateTime.day ~= nowDay then
                if nowDateTime.hour >= 8 and nowDateTime.min >= 0 then
                    tiaoShi("8点0分重置")
                    nowDay = nowDateTime.day
                    writePlist(luaMuLu .. xiangMu .. ".plist", "日期", nowDay)

                    -- today = tonumber(os.date("%w",os.time()))
                    -- if today == 1 then --如果是星期一
                    --         if APP1.isZhuZhan == 2 then
                    --                 APP1.isZhuZhan = 1
                    --                 writePlist(luaMuLu..xiangMu..".plist","助战1",APP1.isZhuZhan)
                    --         end
                    --         if APP2.isZhuZhan == 2 then
                    --                 APP2.isZhuZhan = 1
                    --                 writePlist(luaMuLu..xiangMu..".plist","助战2",APP2.isZhuZhan)
                    --         end
                    --         if APP1.isJiFenDuiHuan == 1 then
                    --                 APP1.isJiFenDuiHuan = 0
                    --                 writePlist(luaMuLu..xiangMu..".plist","积分兑换1",APP1.isJiFenDuiHuan)
                    --         end
                    --         if APP2.isJiFenDuiHuan == 1 then
                    --                 APP2.isJiFenDuiHuan = 0
                    --                 writePlist(luaMuLu..xiangMu..".plist","积分兑换2",APP2.isJiFenDuiHuan)
                    --         end
                    -- end
                    closeApp(appXiangMu)
                    numJiaoSe = 0
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    huanJiaoSeChongZhi()
                    timeMaiLan = nowTime
                    writePlist(luaMuLu .. xiangMu .. ".plist", "timeMaiLan", timeMaiLan)

                    isWeiXinWeiHu = false
                    writePlist(luaMuLu .. xiangMu .. ".plist", "微信维护", isWeiXinWeiHu)
                    hourWeiXin = random(10, 22)
                    minWeiXin = random(1, 50)
                    writePlist(luaMuLu .. xiangMu .. ".plist", "时", hourWeiXin)
                    writePlist(luaMuLu .. xiangMu .. ".plist", "分", minWeiXin)

                    numDay = numDay + 1
                    writePlist(luaMuLu .. xiangMu .. ".plist", "第几天", numDay)
                    gaiMuBiao(1, mb_YouHua, mm_YouHua)
                end
            end
        end
    end
end

-- 换角色重置
function huanJiaoSeChongZhi(...)
    timeMaiLan = nowTime
    writePlist(luaMuLu .. xiangMu .. ".plist", "timeMaiLan", timeMaiLan)
    numXunHuan = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "numXunHuan", numXunHuan)
    isXueSe = false
    writePlist(luaMuLu .. xiangMu .. ".plist", "isXueSe", isXueSe)
    isEMo = false
    writePlist(luaMuLu .. xiangMu .. ".plist", "isEMo", isEMo)
    isDuiWuing = false
    writePlist(luaMuLu .. xiangMu .. ".plist", "isDuiWuing", isDuiWuing)
    -- isTieXue = false
    -- writePlist(luaMuLu..xiangMu..".plist","isTieXue",isTieXue)
    isShiLianZhiDi = false
    writePlist(luaMuLu .. xiangMu .. ".plist", "isShiLianZhiDi", isShiLianZhiDi)
    -- muBiao1 = mb_YouHua
    -- muBiao1Con = mm_YouHua
    -- writeConfig(State["Bid"].."_Set.dat",mbCon1,muBiao1Con)
    -- muBiao2 = mb
    -- muBiao2Con = mm_Wu
    -- writeConfig(State["Bid"].."_Set.dat",mbCon2,muBiao2Con)
    gaiMuBiao(2, mb_YouHua, mm_YouHua)
    gaiMuBiao(3, mb_HuanJiaoSe, mm_HuanJiaoSe)
    -- muBiao3 = mb_HuanJiaoSe
    -- muBiao3Con = mm_HuanJiaoSe
    -- writeConfig(State["Bid"].."_Set.dat",mbCon3,muBiao3Con)
    numDead = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "死亡次数", numDead)
    numXueSe = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "血色次数", numXueSe)
    numEMo = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "恶魔次数", numEMo)
    numTieXue = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "铁血次数", numTieXue)
    numDiaoXian = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXian", numDiaoXian)
    isYouHua = false
    writePlist(luaMuLu .. xiangMu .. ".plist", "优化", isYouHua)
    numJinBi = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "金币", numJinBi)
    numFenZuan = 0
    writePlist(luaMuLu .. xiangMu .. ".plist", "粉钻", numFenZuan)

    muBiaoZhuanHuan()
end

-- 每小时掉线一次
function meiXiaoShiDiaoXian(...)
    if nowTime - timeInitGame >= 60 * 60 then
        timeInitGame = nowTime
        APP1.dengLuCiShu = 0
        APP2.dengLuCiShu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "APP登录次数", 0)
        writePlist(luaMuLu .. xiangMu .. ".plist", "账号" .. iphoneId .. "PP登录次数", 0)
        APP1.isYongZhe = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "勇者之路1", APP1.isYongZhe)
        APP1.isWanShou = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "万兽场1", APP1.isWanShou)
        APP2.isYongZhe = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "勇者之路2", APP2.isYongZhe)
        APP2.isWanShou = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "万兽场2", APP2.isWanShou)
        closeApp(apps1)
        closeApp(apps2)
        mSleep(1000)
        runApp(APP1)
        APP = APP1
        mSleep(5000)
        if pingTai2 ~= "10" then
            -- local tmpXuanXiang = string.find(duoXuan1,"1")
            -- if tmpXuanXiang ~= nil then
            APP = APP2
            runApp(apps2)
            mSleep(5000)
        end
    end
    -- if nowDateTime.min == 0 and nowDateTime.sec < 5 then
    --     if not(isColor(109,307,227,164,33,0)) and not(isColor(99,294,126,199,47,0)) then
    --         closeApp(apps1)
    --         mSleep(5000)
    --     end
    -- end
end

function getData() -- 获取数据（62数据）
    local getList = function(path)
        local a = io.popen("ls " .. path)
        local f = {};
        for l in a:lines() do
            table.insert(f, l)
        end
        return f
    end
    local Wildcard = getList("/var/mobile/Containers/Data/Application")
    for var = 1, #Wildcard do
        local file = io.open("/var/mobile/Containers/Data/Application/" .. Wildcard[var] ..
            "/Library/WechatPrivate/wx.dat", "rb")
        if file then
            local str = file:read("*a")
            file:close()
            --[[
                        require"sz"
                        local str = string.tohex(str) --16进制编码
                        ]]
            return str
        end
    end
end

function writeData(data) -- 写入数据（62数据）
    local getList = function(path)
        local a = io.popen("ls " .. path)
        local f = {};
        for l in a:lines() do
            table.insert(f, l)
        end
        return f
    end
    local Wildcard = getList("/var/mobile/Containers/Data/Application")
    for var = 1, #Wildcard do
        local file = io.open("/var/mobile/Containers/Data/Application/" .. Wildcard[var] ..
            "/Library/WechatPrivate/wx.dat", "w+")
        if file then
            file:write(data)
            file:close()
            return true
        end
    end
end

-- 识字
-- local tmpYinLiang = shiZi(dictYinLiang,87, 522, 769, 542,0xdcdee1,0x333333,85)
function shiZi(cs_dict, cs_x1, cs_y1, cs_x2, cs_y2, cs_se, cs_pianse, cs_sim)
    if version == "2.2.4" then
        by.UseDict(cs_dict)
        local tmpRet = by.Ocr(cs_x1, cs_y1, cs_x2, cs_y2, cs_se, cs_pianse, cs_sim / 100)
        return tmpRet
    else
        local tmpRet = dmOcrText(cs_dict, cs_x1, cs_y1, cs_x2, cs_y2,
            string.format("%x", cs_se) .. "," .. string.format("%x", cs_pianse), cs_sim)
        return tmpRet
    end
end

-- 找字
-- x, y = zhaoZi(dictBeiBao,925,489,1035,518,0x7d3b18,0x333333,85,"zc")
function zhaoZi(cs_dict, cs_x1, cs_y1, cs_x2, cs_y2, cs_se, cs_pianse, cs_sim, cs_zi)
    if version == "2.2.4" then
        by.UseDict(cs_dict)
        local tmpx, tmpy = by.FindStr(cs_x1, cs_y1, cs_x2, cs_y2, cs_zi, cs_se, cs_pianse, cs_sim / 100)
        return tmpx, tmpy
    else
        return dmFindText(cs_dict, cs_zi, cs_x1, cs_y1, cs_x2, cs_y2,
            string.format("%x", cs_se) .. "," .. string.format("%x", cs_pianse), cs_sim)
    end
end

-- 初次加载斗鱼
function chuCiJiaZaiDouYu(...)
    if string.find(duoXuan1, "9") ~= nil then
        require("douYu")
    end
end

-- 加截斗鱼
function jiaZaiDouYu(...)
    if string.find(duoXuan1, "9") ~= nil then
        douYu()
    end
end

function screenClick(intX, intY, color)
    for x = 1, 113, 1 do
        for y = 1, 63, 1 do
            if isColor(intX, intY, color, 95) == false then
                return
            end
            if math.abs(intX - x * 10) <= 40 and math.abs(intY - y * 10) <= 40 then

            else
                touchSuper(x * 10, y * 10)
            end
        end
    end
end

-- 10分钟不见血条
function jianCeXueTiao(...)
    if isColor(14, 86, 126, 31, 11, 5) and isColor(85, 25, 113, 112, 127, 5) and
        (isColor(829, 593, 116, 58, 19, 5) or isColor(829, 593, 89, 82, 78, 5)) then -- 有血条和自动战斗图标
        timeXueTiao = nowTime
    end
    if nowTime - timeXueTiao >= 10 * 60 then
        closeApp(appXiangMu)
        timeXueTiao = nowTime
        numDiaoXian = numDiaoXian + 1
        writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXian", numDiaoXian)
        if numDiaoXian >= 6 then
            numDiaoXian = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXian", numDiaoXian)
            numDiaoXianDengDai = numDiaoXianDengDai + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXianDengDai", numDiaoXianDengDai)
            -- dialog("掉线6次,等一小时",60*60)
        end
    end
end

-- 主界面
function zhuJieMian(...)
    if isColor(78, 26, 119, 105, 125, 5) and isColor(15, 79, 122, 30, 13, 5) and isColor(949, 5, 186, 193, 199, 5) then
        -- if isColor(78,26,110,109,122,5) and isColor(15,79,122,30,11,5) and isColor(949,5,193,201,204) then
        timeXueTiao = nowTime
        return true
    else
        return false
    end
end

-- 副本内
function fuBenNei(...)
    if (isColor(965, 27, 222, 221, 216, 5) and isColor(978, 46, 169, 163, 143, 5)) or
        (isColor(966, 27, 217, 216, 211, 5) and isColor(978, 46, 168, 162, 142, 5)) then -- 恶魔 试炼之地 万魔塔 血色
        if isColor(23, 157, 176, 163, 120) then
            nameFuBen = "万魔塔"
        elseif isColor(112, 152, 104, 103, 115, 5) and isColor(129, 147, 166, 160, 157, 5) then
            nameFuBen = "恶魔"
        elseif isColor(126, 155, 100, 99, 113, 5) and isColor(142, 152, 250, 237, 209, 5) then
            nameFuBen = "血色"
        elseif isColor(96, 152, 106, 105, 119) then
            nameFuBen = "未知副本1"
        else
            nameFuBen = "试炼之地"
        end
        return true
    elseif isColor(966, 27, 222, 221, 216, 5) and isColor(979, 46, 169, 163, 143, 5) then -- 副本
        if isColor(81, 162, 100, 99, 113, 5) and isColor(98, 155, 182, 174, 167, 5) then
            nameFuBen = "副本"
        else
            nameFuBen = "未知副本2"
        end
        return true
    elseif isColor(971, 22, 219, 218, 214, 5) and isColor(984, 41, 169, 164, 142, 5) then -- 经验副本
        nameFuBen = "经验副本"
        return true
    elseif isColor(931, 16, 222, 221, 216, 5) and isColor(944, 36, 144, 142, 129, 5) then -- 铁血路径
        if isColor(107, 151, 105, 104, 117, 5) and isColor(136, 146, 242, 230, 204, 5) then
            nameFuBen = "铁血路径"
        else
            nameFuBen = "未知副本3"
        end
        return true
    elseif isColor(967, 28, 221, 220, 215, 5) and isColor(980, 47, 169, 164, 142, 5) then -- 战盟
        if isColor(96, 152, 106, 105, 119) then
            nameFuBen = "未知副本4"
        else
            nameFuBen = "战盟"
        end
        return true
    else
        nameFuBen = "无"
        return false
    end
end

-- 退出副本
function tuiChuFuBen(...)
    if nameFuBen == "铁血" then
        touchClick(938, 26, 185, 182, 166)
    else
        touchClick(973, 37, 184, 181, 165)
    end
    if isColor(480, 397, 91, 121, 165, 5) and isColor(651, 398, 163, 118, 62, 5) then
        touchClick(651, 398, 163, 118, 62)
    end
end

-- 自动战斗
function ziDongZhanDou(...)
    if fuBenNei() then
        if isColor(839, 591, 235, 230, 200, 5) and muBiaoA1 ~= mb_ShiLianZhiDi then
            touchClick(839, 591, 235, 230, 200)
        end
    end
    if isColor(14, 86, 126, 31, 11, 5) and isColor(85, 25, 113, 112, 127, 5) and isColor(829, 593, 89, 82, 78, 5) and
        not (isColor(5, 146, 40, 26, 29)) then -- 有血条，有战斗图标（没自动）,没有任务栏
        tiaoShi("卡副本--自动战斗")
        touchClick(829, 593)
    end
end

-- 红点
function hongDian(...)
    if muBiaoA3 ~= mb_Wu then
        isHongDian = false
    elseif zhuJieMian() then
        isHongDian = false
        -- if isColor(905,16,255,91,56,5) and isColor(885,17,225,227,227,5) and nowTime - timeZiYuan >= 30 * 60 then
        --         tiaoShi("福利红点")
        --         touchClick(885,17,225,227,227)
        --         isHongDian = true
        --         mSleep(2000)
        -- elseif isColor(781,97,255,94,61,5) and isColor(773,106,201,198,196,5) then
        --         tiaoShi("社区红点")
        --         isHongDian = true
        --         touchClick(773,106)
        --         if isColor(832,192,255,91,57,5) then
        --                 tiaoShi("心悦特权")
        --                 touchClick(832,192,255,91,57)
        --         end
        -- elseif isColor(61,6,255,89,57,5) and (nowTime - timeJiNeng >= 10 * 60 or nowTime - timeQiangHua >= 10 * 60 or nowTime - timeJiaoSe >= 10 * 60) and nowTime - timeTouXiang >= 10 * 60 then
        --         tiaoShi("头像红点")
        --         isHongDian = true
        --         touchClick(42,35,121,35,24)
        --         mSleep(2000)
        -- elseif isColor(848,17,255,90,55,5) and isColor(829,23,190,182,179,5) then
        --         tiaoShi("新服狂欢红点")
        --         isHongDian = true
        --         touchClick(829,23,190,182,179)
        --         mSleep(2000)
        -- elseif (isColor(1068,130,255,89,50,5) and isColor(1035,142,255,255,198,5) and nowTime - timeYouJian > 60 * 60 ) or (isColor(1069,131,255,90,57,5) and isColor(1048,143,254,255,196,5) and nowTime - timeYouJian > 60 * 60 ) or (isColor(1069,131,255,74,40,5) and isColor(1048,143,254,255,196,5) and nowTime - timeYouJian > 60 * 60 ) then
        --         tiaoShi("邮件红点")
        --         isHongDian = true
        --         touchClick(1048,143,254,255,196)
        --         mSleep(2000)
        --         timeYouJian = nowTime
        -- elseif isColor(967,16,255,92,57,5) and isColor(947,8,193,200,202,5) and nowTime - timeHuoDong >= 10 * 60 then
        --         tiaoShi("活动红点")
        --         isHongDian = true
        --         touchClick(947,8,193,200,202)
        --         mSleep(2000)
        -- elseif isColor(718,98,249,87,52) and isColor(702,103,183,181,181) then
        --         tiaoShi("开服活动--红点")
        --         touchClick(702,103,183,181,181)
        --         mSleep(2000)
        --         isHongDian = true
        -- else
        --         isHongDian = false
        -- end
    end
    -- if (isColor(191,411,183,52,9,5) and isColor(1089,408,176,44,6,5))
    --         or (isColor(193,402,182,49,7,5) and isColor(1087,402,181,49,7,5))
    --         or (isColor(193,403,183,53,9,5) and isColor(1087,402,181,48,7,5)) then
    --         tiaoShi("开服活动界面")
    --         x,y = findColorInRegionFuzzy( 0xff5837, 80, 84,60,84,588)
    --         if x > 0 then
    --                 touchClick(x,y)
    --         else
    --                 closeForever()
    --         end
    --         if isColor(920,301,163,117,62) then
    --                 touchClick(920,301,163,117,62)
    --         end
    --         if isColor(916,414,164,116,60) then
    --                 touchClick(916,414,164,116,60)
    --         end
    -- end
    if (isColor(163, 124, 81, 128, 172, 5) and isColor(454, 125, 81, 132, 176, 5) and isColor(814, 121, 79, 126, 168, 5)) or
        (isColor(291, 519, 71, 71, 79, 5) and isColor(540, 516, 73, 73, 81, 5) and isColor(419, 523, 43, 187, 212, 5)) then
        tiaoShi("活动界面--iOS7")
        if muBiaoA == mb_JingJiChang then
            if isColor(191, 185, 253, 244, 212) then
                touchClick(398, 196, 225, 214, 197) -- 查看
            else
                closeForever()
                muBiaoA1 = mb_ZhuXian
                muBiao1Con = mm_ZhuXian
                writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                muBiaoZhuanHuan()
                timeDingShiDianRenWu = nowTime - 10
            end
        elseif isColor(1012, 149, 150, 100, 63, 5) and isColor(1077, 136, 255, 87, 52, 5) then
            tiaoShi("领取")
            touchClick(1012, 149, 150, 100, 63)
        elseif isColor(217, 270, 255, 89, 57) then -- 宝箱1
            touchClick(188, 292, 224, 163, 106)
        elseif isColor(338, 95, 255, 90, 55) then -- 宝箱2
            touchClick(312, 114, 134, 134, 134)
        elseif isColor(558, 107, 245, 88, 56) then -- 宝箱3
            touchClick(523, 118, 182, 123, 78)
        elseif isColor(660, 281, 255, 98, 63) then -- 宝箱4
            touchClick(636, 302, 186, 124, 78)
        elseif isColor(613, 434, 255, 92, 58) then -- 宝箱5
            touchClick(584, 449, 255, 210, 101)
        elseif isColor(71, 311, 255, 95, 61) then
            tiaoShi("每日必做--未选中")
            touchClick(71, 311, 255, 95, 61)
            mSleep(1000)
        else
            touchClick(31, 20) -- 退出
            timeHuoDong = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeHuoDong", timeHuoDong)
        end
    end
    if isColor(115, 34, 76, 82, 102, 5) and isColor(155, 34, 74, 80, 99, 5) then
        tiaoShi("活动界面")
        if muBiaoA == mb_JingJiChang then
            if isColor(191, 185, 253, 244, 212) then
                touchClick(398, 196, 225, 214, 197) -- 查看
            else
                closeForever()
                muBiaoA1 = mb_ZhuXian
                muBiao1Con = mm_ZhuXian
                writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                muBiaoZhuanHuan()
                timeDingShiDianRenWu = nowTime - 10
            end
        elseif isColor(1012, 149, 150, 100, 63, 5) and isColor(1077, 136, 255, 87, 52, 5) then
            tiaoShi("领取")
            touchClick(1012, 149, 150, 100, 63)
        elseif isColor(217, 270, 255, 89, 57) then -- 宝箱1
            touchClick(188, 292, 224, 163, 106)
        elseif isColor(338, 95, 255, 90, 55) then -- 宝箱2
            touchClick(312, 114, 134, 134, 134)
        elseif isColor(558, 107, 245, 88, 56) then -- 宝箱3
            touchClick(523, 118, 182, 123, 78)
        elseif isColor(660, 281, 255, 98, 63) then -- 宝箱4
            touchClick(636, 302, 186, 124, 78)
        elseif isColor(613, 434, 255, 92, 58) then -- 宝箱5
            touchClick(584, 449, 255, 210, 101)
        elseif isColor(71, 311, 255, 95, 61) then
            tiaoShi("每日必做--未选中")
            touchClick(71, 311, 255, 95, 61)
            mSleep(1000)
        else
            touchClick(31, 20) -- 退出
            timeHuoDong = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeHuoDong", timeHuoDong)
        end
    end
    if (isColor(203, 528, 168, 119, 62, 5) and isColor(351, 525, 89, 117, 161, 5) and
        isColor(967, 107, 255, 239, 205, 5)) or
        (isColor(203, 528, 170, 120, 63, 5) and isColor(351, 525, 105, 109, 126, 5) and
            isColor(967, 107, 255, 239, 205, 5)) then
        tiaoShi("邮件界面")
        touchClick(203, 524, 166, 120, 65) -- 全部领取
        if isColor(593, 399, 164, 118, 62) then
            touchClick(593, 399, 164, 118, 62) -- 没东西，确定
        end
        if isColor(535, 420, 167, 118, 62, 5) and isColor(289, 478, 7, 168, 212, 5) and
            isColor(849, 215, 255, 239, 205, 5) and isColor(848, 230, 193, 143, 71, 5) then
            tiaoShi("没有可以提取附件的邮件")
            touchClick(535, 420)
        end
        if isColor(644, 412, 172, 108, 55) then -- 装备传承
            touchClick(644, 412, 172, 108, 55)
        end
        if isColor(836, 525, 161, 116, 61) then -- 领取失败
            touchClick(967, 107, 255, 239, 205)
            if muBiaoA3 ~= mb_HuanJiaoSe and muBiaoA3 ~= mb_JY_HuanJiaoSe then
                muBiaoA3 = mb_ZhengLi
                muBiao3Con = mm_ZhengLi
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        end
        if isColor(967, 107, 255, 239, 205) then
            touchClick(967, 107, 255, 239, 205)
        end
    end
    if isColor(123, 14, 107, 119, 137, 5) and isColor(215, 33, 65, 69, 85, 5) and isColor(143, 192, 188, 212, 139, 5) then
        tiaoShi("新服狂欢界面")
        x, y = findColorInRegionFuzzy(0xff5a36, 80, 41, 597, 1084, 597)
        if x > 0 then
            touchClick(x, y)
        end
        if isColor(928, 282, 163, 118, 63, 5) then
            touchClick(928, 282, 163, 118, 63)
        elseif isColor(490, 192, 120, 223, 121) then
            touchClick(510, 122)
        elseif isColor(638, 192, 113, 207, 119) then
            touchClick(652, 121, 238, 200, 55)
        else
            touchClick(31, 20)
        end
    end
    if (isColor(182, 119, 110, 109, 103, 5) and isColor(1096, 136, 102, 102, 99, 5) and
        isColor(639, 54, 179, 177, 161, 5)) or
        (isColor(182, 119, 110, 109, 102, 5) and isColor(1096, 136, 100, 100, 98, 5) and
            isColor(639, 54, 180, 176, 155, 5)) or
        (isColor(182, 119, 110, 109, 102, 5) and isColor(1096, 136, 98, 98, 97, 5) and
            isColor(639, 54, 180, 173, 149, 5)) then
        -- if isColor(32,19,225,225,225,5) and isColor(159,33,86,91,111,5) and isColor(122,14,107,118,136,5) then
        tiaoShi("福利界面")
        if isColor(6, 134, 32, 26, 30) then
            touchClick(31, 20)
            return
        end
        if isColor(920, 301, 163, 117, 62) then
            touchClick(920, 301, 163, 117, 62)
        end
        x, y = findColorInRegionFuzzy(0xff613d, 80, 83, 75, 83, 619)
        if x > 0 then
            touchClick(x, y)
        else
            tiaoShi("没找到1")
            touchMoveXY(62, 582, 61, 113)
            mSleep(2000)
            x, y = findColorInRegionFuzzy(0xff613d, 80, 83, 75, 83, 619)
            if x > 0 then
                touchClick(x, y)
            else
                tiaoShi("没找到2")
                touchMoveXY(62, 582, 61, 113)
                mSleep(2000)
                x, y = findColorInRegionFuzzy(0xff613d, 80, 83, 75, 83, 619)
                if x > 0 then
                    touchClick(x, y)
                else
                    tiaoShi("没找到3")
                    touchMoveXY(62, 582, 61, 113)
                    mSleep(2000)
                    x, y = findColorInRegionFuzzy(0xff613d, 80, 83, 75, 83, 619)
                    if x > 0 then
                        touchClick(x, y)
                    else
                        tiaoShi("没找到4")
                        touchClick(30, 17, 219, 219, 218)
                        timeZiYuan = nowTime
                    end
                end
            end
        end
    end
    -- --timeJianGe(debug.getinfo(1).currentline)
    if (isColor(897, 563, 221, 209, 194, 5) and isColor(163, 38, 230, 218, 197, 5)) or
        (isColor(164, 41, 227, 214, 197, 5) and isColor(896, 562, 238, 230, 216, 5)) or
        (isColor(164, 41, 239, 230, 212, 5) and isColor(896, 562, 228, 218, 200, 5)) or
        (isColor(164, 41, 238, 229, 208, 5) and isColor(896, 562, 241, 229, 211, 5)) or
        (isColor(163, 39, 237, 224, 209, 5) and isColor(894, 563, 244, 232, 215, 5)) or
        (isColor(165, 39, 231, 217, 200, 5) and isColor(897, 562, 229, 211, 190, 5)) then
        tiaoShi("头像界面")
        if isColor(144, 122, 63, 65, 74) then
            tiaoShi("技能无红点")
            timeJiNeng = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeJiNeng", timeJiNeng)
        end
        if isColor(127, 210, 63, 65, 74) then
            tiaoShi("强化无红点")
            timeQiangHua = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeQiangHua", timeQiangHua)
        end
        if isColor(179, 36, 63, 66, 74) then
            tiaoShi("角色无红点")
            timeJiaoSe = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeJiaoSe", timeJiaoSe)
        end
        if muBiaoA == mb_ChuHang then
            tiaoShi("入盟")
            touchClick(975, 56, 191, 181, 166)
        elseif muBiaoA == mb_ChiBang then
            tiaoShi("优化翅膀")
            if isColor(113, 311, 154, 144, 128) then -- 翅膀已开放
                touchClick(129, 295, 255, 94, 59)
            else
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        elseif muBiaoA == mb_HuanJiaoSe or muBiaoA == mb_JY_HuanJiaoSe or muBiaoA == mb_YouHua then
            tiaoShi("设置")
            touchClick(909, 562, 202, 190, 172)
        elseif muBiaoA == mb_FixShip then
            tiaoShi("转职")
            touchClick(179, 36) -- 角色
            mSleep(2000)
            if isColor(0, 393, 199, 196, 184) or isColor(0, 393, 191, 188, 176) then -- 转职在第4排
                touchClick(44, 416, 203, 207, 213) -- 转职
                for i = 1, 10 do
                    mSleep(1000)
                    if isColor(1002, 542, 165, 121, 64) then
                        break
                    end
                end
                if isColor(1002, 542, 165, 121, 64) then -- 转职
                    x1, y1 = findColorInRegionFuzzy(0x7c3741, 80, 783, 433, 857, 433) -- 不可转
                    x, y = findColorInRegionFuzzy(0xd6484b, 80, 783, 433, 857, 433) -- 不可转
                    if x > 0 or x1 > 0 then
                        tiaoShi("不可转")
                        closeForever()
                        muBiaoA3 = mb_Wu
                        muBiao3Con = mm_Wu
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoZhuanHuan()
                        timeZhuanZhi = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                    else -- 可转
                        tiaoShi("可转")
                        -- dialog("可转",0)
                        -- lua_exit()
                        touchClick(1002, 542, 165, 121, 64) -- 转职
                        mSleep(5000)
                        touchClick(583, 569, 10, 15, 21) -- 空白处
                        closeForever()
                        muBiaoA3 = mb_Wu
                        muBiao3Con = mm_Wu
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoA1 = mb_ZhuXian
                        muBiao1Con = mm_ZhuXian
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        timeZhuanZhi = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                    end
                else
                    tiaoShi("不可转")
                    closeForever()
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    timeZhuanZhi = nowTime
                    writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                end
            elseif isColor(0, 418, 211, 208, 195) then -- 转职在第4排-旧
                touchClick(44, 368, 203, 207, 213) -- 转职
                for i = 1, 10 do
                    mSleep(1000)
                    if isColor(1002, 542, 165, 121, 64) then
                        break
                    end
                end
                if isColor(1002, 542, 165, 121, 64) then -- 转职
                    x, y = findColorInRegionFuzzy(0xd6484b, 80, 783, 433, 857, 433) -- 不可转
                    if x > 0 then
                        tiaoShi("不可转")
                        closeForever()
                        muBiaoA3 = mb_Wu
                        muBiao3Con = mm_Wu
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoZhuanHuan()
                        timeZhuanZhi = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                    else -- 可转
                        tiaoShi("可转")
                        -- dialog("可转",0)
                        -- lua_exit()
                        touchClick(1002, 542, 165, 121, 64) -- 转职
                        mSleep(5000)
                        touchClick(583, 569, 10, 15, 21) -- 空白处
                        closeForever()
                        muBiaoA3 = mb_Wu
                        muBiao3Con = mm_Wu
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoA1 = mb_ZhuXian
                        muBiao1Con = mm_ZhuXian
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        timeZhuanZhi = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                    end
                else
                    tiaoShi("不可转")
                    closeForever()
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    timeZhuanZhi = nowTime
                    writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                end
            else
                tiaoShi("不可转")
                closeForever()
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
                timeZhuanZhi = nowTime
                writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
            end
        elseif isColor(180, 462, 255, 94, 58) then
            tiaoShi("坐骑红点")
            touchClick(165, 479, 137, 105, 60)
        elseif isColor(129, 295, 255, 94, 59, 5) and nowTime - timeChiBang >= 2 * 60 * 60 then
            tiaoShi("翅膀红点")
            touchClick(129, 295, 255, 94, 59)
            timeChiBang = nowTime
            -- elseif isColor(1020,128,255,93,58,5) then
            --         tiaoShi("好友红点")
            -- touchClick(1020,128,255,93,58)

            -- elseif isColor(988,39,255,98,63) and nowTime - timeZhanMeng >= 60 * 60 then
            --         if numJinBi >= 1000000 and numJiaoSe == 0 then
            --                 tiaoShi("战盟红点--钱够100w")
            --                 touchClick(974,57,191,182,168)
            --         else
            --                 tiaoShi("战盟红点--钱不足")
            --                 timeZhanMeng = nowTime
            --         end
        elseif isColor(986, 463, 255, 84, 51, 5) and nowTime - timeChengJiu >= 60 * 60 then
            tiaoShi("成就红点")
            touchClick(986, 463, 255, 84, 51)
            timeChengJiu = nowTime
        elseif isColor(179, 36, 255, 91, 57, 5) and nowTime - timeJiaoSe >= 10 * 60 then
            tiaoShi("角色红点")
            touchClick(179, 36)
        elseif isColor(144, 122, 255, 91, 57, 5) and nowTime - timeJiNeng >= 60 * 60 then
            tiaoShi("技能红点")
            touchClick(144, 122, 255, 91, 57)
        elseif isColor(127, 210, 255, 89, 55, 5) and nowTime - timeQiangHua >= 60 * 60 then
            tiaoShi("强化红点")
            touchClick(127, 210, 255, 89, 55)
        else
            touchClick(581, 305, 62, 70, 92)
            timeTouXiang = nowTime
        end
    end
    if isColor(896, 563, 236, 224, 205, 5) and isColor(164, 44, 246, 242, 235, 5) then
        tiaoShi("头像界面1-旧")
        if isColor(144, 122, 63, 65, 74) then
            tiaoShi("技能无红点")
            timeJiNeng = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeJiNeng", timeJiNeng)
        end
        if isColor(127, 210, 63, 65, 74) then
            tiaoShi("强化无红点")
            timeQiangHua = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeQiangHua", timeQiangHua)
        end
        if isColor(179, 36, 63, 66, 74) then
            tiaoShi("角色无红点")
            timeJiaoSe = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeJiaoSe", timeJiaoSe)
        end
        if muBiaoA == mb_ChuHang then
            tiaoShi("入盟")
            touchClick(975, 56, 191, 181, 166)
        elseif muBiaoA == mb_ChiBang then
            tiaoShi("优化翅膀")
            if isColor(113, 311, 154, 144, 128) then -- 翅膀已开放
                touchClick(129, 295, 255, 94, 59)
            else
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        elseif muBiaoA == mb_HuanJiaoSe or muBiaoA == mb_JY_HuanJiaoSe or muBiaoA == mb_YouHua then
            tiaoShi("设置")
            touchClick(909, 562, 202, 190, 172)
        elseif muBiaoA == mb_FixShip then
            tiaoShi("转职")
            touchClick(179, 36) -- 角色
            mSleep(2000)
            if isColor(0, 418, 211, 208, 195) then -- 转职在第4排
                touchClick(44, 368, 203, 207, 213) -- 转职
                for i = 1, 10 do
                    mSleep(1000)
                    if isColor(1002, 542, 165, 121, 64) then
                        break
                    end
                end
                if isColor(1002, 542, 165, 121, 64) then -- 转职
                    x, y = findColorInRegionFuzzy(0xd6484b, 80, 783, 433, 857, 433) -- 不可转
                    if x > 0 then
                        tiaoShi("不可转")
                        closeForever()
                        muBiaoA3 = mb_Wu
                        muBiao3Con = mm_Wu
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoZhuanHuan()
                        timeZhuanZhi = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                    else -- 可转
                        tiaoShi("可转")
                        -- dialog("可转",0)
                        -- lua_exit()
                        touchClick(1002, 542, 165, 121, 64) -- 转职
                        mSleep(5000)
                        touchClick(583, 569, 10, 15, 21) -- 空白处
                        closeForever()
                        muBiaoA3 = mb_Wu
                        muBiao3Con = mm_Wu
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoA1 = mb_ZhuXian
                        muBiao1Con = mm_ZhuXian
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        timeZhuanZhi = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                    end
                else
                    tiaoShi("不可转")
                    closeForever()
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    timeZhuanZhi = nowTime
                    writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
                end
            else
                tiaoShi("不可转")
                closeForever()
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
                timeZhuanZhi = nowTime
                writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhuanZhi", timeZhuanZhi)
            end
        elseif isColor(180, 462, 255, 94, 58) then
            tiaoShi("坐骑红点")
            touchClick(165, 479, 137, 105, 60)
        elseif isColor(129, 295, 255, 94, 59, 5) and nowTime - timeChiBang >= 2 * 60 * 60 then
            tiaoShi("翅膀红点")
            touchClick(129, 295, 255, 94, 59)
            timeChiBang = nowTime
            -- elseif isColor(1020,128,255,93,58,5) then
            --         tiaoShi("好友红点")
            -- touchClick(1020,128,255,93,58)

        elseif isColor(988, 39, 255, 98, 63) and nowTime - timeZhanMeng >= 60 * 60 then
            if numJinBi >= 999999999 and numJiaoSe == 0 then
                tiaoShi("战盟红点--钱够100w")
                touchClick(974, 57, 191, 182, 168)
            else
                tiaoShi("战盟红点--钱不足")
                timeZhanMeng = nowTime
            end
        elseif isColor(986, 463, 255, 84, 51, 5) and nowTime - timeChengJiu >= 60 * 60 then
            tiaoShi("成就红点")
            touchClick(986, 463, 255, 84, 51)
            timeChengJiu = nowTime
        elseif isColor(179, 36, 255, 91, 57, 5) and nowTime - timeJiaoSe >= 10 * 60 then
            tiaoShi("角色红点")
            touchClick(179, 36)
        elseif isColor(144, 122, 255, 91, 57, 5) and nowTime - timeJiNeng >= 60 * 60 then
            tiaoShi("技能红点")
            touchClick(144, 122, 255, 91, 57)
        elseif isColor(127, 210, 255, 89, 55, 5) and nowTime - timeQiangHua >= 60 * 60 then
            tiaoShi("强化红点")
            touchClick(127, 210, 255, 89, 55)
        else
            touchClick(581, 305, 62, 70, 92)
            timeTouXiang = nowTime
        end
    end
    if (isColor(20, 136, 255, 255, 255, 5) and isColor(360, 576, 98, 129, 174, 5) and isColor(464, 602, 137, 97, 109, 5)) or
        (isColor(20, 136, 255, 255, 255, 5) and isColor(360, 576, 113, 120, 138, 5) and
            isColor(464, 602, 134, 94, 94, 5)) then
        tiaoShi("坐骑界面--卸下")
        if isColor(1025, 73, 255, 85, 52, 20) then -- 第三位红点
            tiaoShi("第三位红点")
            touchClick(993, 86, 82, 81, 83)
        elseif isColor(933, 72, 255, 91, 58, 20) then -- 第二位红点
            tiaoShi("第二位红点")
            touchClick(897, 87, 236, 236, 237)
        else
            tiaoShi("closeForever")
            closeForever()
        end
        if isColor(993, 584, 87, 123, 168) then -- 升阶--提升
            tiaoShi("升阶--提升")
            touchClick(777, 582, 166, 121, 66) -- 自动提升
            mSleep(1000)
            if isColor(578, 169, 187, 182, 178, 5) and isColor(851, 483, 186, 182, 177, 5) then -- 获取途径
                touchClick(31, 20)
            end
        elseif isColor(979, 601, 173, 111, 57) then -- 升级--一键升级
            tiaoShi("升级--一键升级")
            touchClick(888, 588, 163, 118, 63)
            mSleep(1000)
            if isColor(578, 169, 187, 182, 178, 5) and isColor(851, 483, 186, 182, 177, 5) then -- 获取途径
                touchClick(31, 20)
            end
        else
            tiaoShi("closeForever2")
            closeForever()
        end
    elseif isColor(20, 136, 255, 255, 255, 5) and isColor(359, 575, 167, 139, 102, 5) and
        isColor(465, 601, 174, 108, 54, 5) then
        tiaoShi("坐骑界面--乘骑")
        touchClick(361, 575, 100, 134, 177) -- 乘骑
    end
    if isColor(983, 536, 164, 127, 82, 5) and isColor(1094, 557, 172, 107, 54, 5) and
        isColor(1056, 431, 85, 113, 156, 5) then
        tiaoShi("转职界面")
        touchClick(31, 20)
    end

    if (isColor(736, 567, 102, 111, 137, 5) and isColor(768, 587, 103, 90, 101, 5) and
        isColor(1056, 310, 123, 91, 106, 5)) or
        (isColor(777, 302, 250, 115, 54, 5) and isColor(780, 385, 0, 153, 215, 5) and isColor(783, 458, 25, 200, 1, 5)) or
        (isColor(736, 567, 104, 109, 140, 5) and isColor(768, 587, 106, 90, 99, 5) and
            isColor(1129, 83, 130, 118, 114, 5)) then
        tiaoShi("角色界面--属性")
        if not (isColor(71, 431, 116, 112, 116)) and isColor(70, 447, 118, 114, 118) then
            tiaoShi("圣徽红点")
            touchClick(71, 431, 255, 90, 55)
            mSleep(2000)
            for i = 1, 10 do
                touchClick(896, 530, 166, 124, 66)
                if isColor(682, 180, 72, 79, 105) then
                    tiaoShi("获取途径")
                    touchClick(555, 585, 26, 32, 51)
                    touchClick(31, 20)
                    break
                end
            end
            closeForever()
        elseif isColor(1107, 16, 255, 95, 61, 5) then
            tiaoShi("炼金红点")
            touchClick(1099, 24, 88, 96, 121)
        elseif isColor(105, 124, 255, 87, 54) then
            tiaoShi("属性红点")
            if isColor(1094, 76, 255, 94, 59) then
                touchClick(1094, 76, 255, 94, 59) -- 果实
            end
            if isColor(1024, 304, 168, 120, 63) then
                touchClick(1024, 304, 168, 120, 63)
            end
            if isColor(1026, 375, 161, 116, 61) then
                touchClick(1026, 375, 161, 116, 61)
            end
            if isColor(1029, 453, 165, 118, 62) then
                touchClick(1029, 453, 165, 118, 62)
            end
            if isColor(1027, 529, 164, 116, 60) then
                touchClick(1027, 529, 164, 116, 60)
            end
        elseif isColor(71, 507, 255, 94, 60) then
            tiaoShi("称号红点")
            touchClick(71, 507, 255, 94, 60)
            -- elseif isColor(71,201,255,91,55,5) then
            --         tiaoShi("背包红点")
            --         closeForever()
            --         timeJiaoSe = nowTime
            -- elseif isColor(71,198,255,93,59,5) or isColor(71,201,255,91,56) then
            --         tiaoShi("背包红点2")
            --         touchClick(71,201,255,91,55)
            --         if isColor(947,165,167,122,66) then
            --                 touchClick(947,165,167,122,66)
            --         end
        else
            touchClick(31, 21, 184, 184, 183)
            timeJiaoSe = nowTime
        end
    end
    if (isColor(122, 14, 87, 96, 114, 5) and isColor(161, 33, 74, 78, 95, 5)) or
        (isColor(122, 14, 85, 93, 108, 5) and isColor(161, 33, 73, 77, 93, 5)) or
        (isColor(751, 364, 251, 246, 196, 5) and isColor(751, 398, 253, 247, 194, 5) and
            isColor(751, 433, 245, 234, 165, 5) and isColor(669, 561, 97, 126, 168, 5)) or
        (isColor(285, 529, 250, 228, 59, 5) and isColor(590, 523, 212, 118, 238, 5) and
            isColor(885, 516, 5, 229, 254, 5)) then
        tiaoShi("战盟界面")
        if muBiaoA3 == mb_ChuHang then
            if isColor(817, 433, 163, 114, 60) then
                touchQuickly(817, 433, 163, 114, 60) -- 一键申请
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            elseif isColor(577, 558, 95, 126, 171, 5) and isColor(675, 580, 135, 96, 111, 5) then
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        elseif isColor(518, 548, 249, 88, 61) then
            touchClick(497, 563, 204, 194, 182) -- 战盟礼包
        elseif isColor(71, 311, 255, 95, 61) then -- 战盟捐献--红点--未选中
            touchClick(71, 311, 255, 95, 61)
        elseif isColor(104, 311, 255, 97, 62) then -- 战盟捐献--红点--已选中
            if isColor(270, 512, 170, 129, 71, 5) and isColor(407, 511, 255, 93, 59, 5) then
                touchClick(340, 522, 207, 184, 156)
                if isColor(652, 396, 161, 119, 64) then -- 战盟达到上限
                    touchClick(652, 396, 161, 119, 64) -- 同意
                end
                if isColor(483, 180, 71, 79, 106) then -- 金币不足
                    touchClick(31, 20)
                    closeForever()
                    timeZhanMeng = nowTime
                end
            else
                touchClick(579, 114, 227, 207, 170)
                touchClick(788, 113, 255, 252, 203)
                touchClick(1008, 116, 246, 216, 140)
            end
        else
            closeForever()
            timeZhanMeng = nowTime
        end
    end
    if (isColor(122, 14, 101, 111, 128, 5) and isColor(161, 32, 75, 82, 101, 5) and isColor(1105, 24, 41, 44, 60)) or
        (isColor(122, 14, 99, 109, 125, 5) and isColor(161, 32, 73, 79, 96, 5) and isColor(1105, 24, 38, 42, 53, 5)) or
        (isColor(269, 232, 225, 190, 46, 5) and isColor(840, 243, 180, 29, 34, 5) and isColor(272, 270, 252, 224, 61, 5)) or
        (isColor(269, 232, 228, 191, 45, 5) and isColor(840, 243, 187, 30, 33, 5) and isColor(272, 270, 252, 223, 59, 5)) then
        tiaoShi("炼金界面")
        if isColor(321, 470, 255, 89, 54, 5) then
            tiaoShi("免费兑换金币--1")
            touchClick(321, 470, 255, 89, 54)
        elseif isColor(355, 470, 255, 90, 55, 5) then
            tiaoShi("免费兑换金币--2")
            touchClick(355, 470, 255, 90, 55)
        elseif isColor(321, 470, 255, 93, 56) or isColor(321, 470, 255, 85, 51) then
            tiaoShi("免费兑换金币--3")
            touchClick(281, 476, 161, 156, 143)
        elseif isColor(866, 470, 255, 89, 54, 5) then
            tiaoShi("战盟贡献--2")
            touchClick(866, 470, 255, 89, 54)
            if isColor(866, 470, 255, 89, 54) then -- 未入盟
                closeForever()
                muBiaoA3 = mb_ChuHang
                muBiao3Con = mm_ChuHang
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        elseif isColor(900, 470, 255, 90, 55) or isColor(900, 470, 255, 85, 51) then
            tiaoShi("战盟贡献--3")
            touchClick(900, 470, 255, 90, 55)
            if isColor(900, 470, 255, 90, 55) then -- 未入盟
                closeForever()
                muBiaoA3 = mb_ChuHang
                muBiao3Con = mm_ChuHang
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        elseif isColor(611, 470, 255, 85, 52) then
            tiaoShi("声望兑换--3")
            touchClick(611, 470, 255, 85, 52)
        else
            touchClick(32, 20, 200, 199, 199)
        end
    end
    if isColor(20, 230, 255, 255, 255, 5) and isColor(957, 562, 20, 23, 33, 5) and isColor(768, 567, 163, 117, 62, 5) then
        tiaoShi("背包--新手")
        closeForever()
        if muBiaoA == mb_ZhengLi or muBiaoA == mb_ZhengLiMaiLan then
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    end
    if (isColor(22, 230, 255, 255, 255, 5) and isColor(764, 566, 168, 122, 66, 5)) or
        (isColor(22, 220, 255, 255, 255, 5) and isColor(764, 566, 168, 122, 65, 5)) then
        tiaoShi("背包界面")
        if muBiaoA == mb_ChengHao then
            if isColor(0, 580, 207, 204, 191) then -- 6栏
                touchClick(40, 609, 94, 97, 101)
            elseif isColor(0, 486, 201, 198, 186) then -- 5栏
                touchClick(38, 513, 198, 203, 209)
            elseif isColor(0, 394, 188, 185, 172) then -- 4栏
                touchClick(44, 415, 100, 98, 106)
            else
                closeForever()
            end
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        elseif muBiaoA == mb_CangKuZhengLi then
            touchClick(1073, 568, 151, 112, 59) -- 整理
            mSleep(1000)
            closeForever()
            gaiMuBiao(3, mb_DengDaiSiXin, mm_DengDaiSiXin)
            timeCangKu = nowTime
        else
            if isColor(957, 562, 94, 125, 170) or isColor(957, 562, 107, 117, 136) then -- 有熔炼字样
                touchClick(1073, 568, 151, 112, 59) -- 整理
                mSleep(2000)
                -- if isColor(793,182,189,255,179,9) then
                --         touchClick(793,182,189,255,179)
                --         if isColor(628,589,182,146,98) then
                --                 touchClick(628,589,182,146,98)
                --         elseif isColor(769,588,184,149,99) then
                --                 touchClick(769,588,184,149,99)
                --         end
                --         if isColor(646,413,168,104,53) then
                --                 touchClick(646,413,168,104,53)
                --         end
                -- end
                -- if isColor(870,182,186,255,176,9) then
                --         touchClick(870,182,186,255,176)
                --         if isColor(628,589,182,146,98) then
                --                 touchClick(628,589,182,146,98)
                --         elseif isColor(769,588,184,149,99) then
                --                 touchClick(769,588,184,149,99)
                --         end
                --         if isColor(646,413,168,104,53) then
                --                 touchClick(646,413,168,104,53)
                --         end
                -- end
                -- if isColor(946,182,191,255,180,9) then
                --         touchClick(946,182,191,255,180)
                --         if isColor(628,589,182,146,98) then
                --                 touchClick(628,589,182,146,98)
                --         elseif isColor(769,588,184,149,99) then
                --                 touchClick(769,588,184,149,99)
                --         end
                --         if isColor(646,413,168,104,53) then
                --                 touchClick(646,413,168,104,53)
                --         end
                -- end
                -- if isColor(1023,182,188,255,178,9) then
                --         touchClick(1023,182,188,255,178)
                --         if isColor(628,589,182,146,98) then
                --                 touchClick(628,589,182,146,98)
                --         elseif isColor(769,588,184,149,99) then
                --                 touchClick(769,588,184,149,99)
                --         end
                --         if isColor(646,413,168,104,53) then
                --                 touchClick(646,413,168,104,53)
                --         end
                -- end
                -- if isColor(1099,182,193,255,182,9) then
                --         touchClick(1099,182,193,255,182)
                --         if isColor(628,589,182,146,98) then
                --                 touchClick(628,589,182,146,98)
                --         elseif isColor(769,588,184,149,99) then
                --                 touchClick(769,588,184,149,99)
                --         end
                --         if isColor(646,413,168,104,53) then
                --                 touchClick(646,413,168,104,53)
                --         end
                -- end
                rongLian()
                touchClick(63, 212, 114, 111, 116) -- 背包
                mSleep(1000)
                touchClick(1073, 568, 151, 112, 59) -- 整理
                mSleep(1000)
                maiLaJi()
                timeZhengLi = nowTime
                writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
                if numQuanShu ~= 0 then
                    x, y = findMultiColorInRegionFuzzy(0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103, 1108, 529)
                    if x > 0 then
                        touchClick(x, y)
                    else
                        touchMoveXY(1033, 508, 1033, 125 + 32)
                        mSleep(2000)
                        x, y = findMultiColorInRegionFuzzy(0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103, 1108,
                            529)
                        if x > 0 then
                            touchClick(x, y)
                        else
                            touchMoveXY(1033, 508, 1033, 125 + 32)
                            mSleep(2000)
                            x, y = findMultiColorInRegionFuzzy(0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103,
                                1108, 529)
                            if x > 0 then
                                touchClick(x, y)
                            else

                            end
                        end
                    end
                    if isColor(442, 497, 105, 123, 169, 5) and isColor(598, 499, 178, 140, 94, 5) then
                        touchClick(442, 497) -- 出售
                    end
                    if isColor(326, 459, 181, 145, 99, 5) and isColor(574, 494, 121, 123, 132, 5) then
                        touchClick(326, 459, 180, 144, 100) -- 出售
                    end
                    if isColor(442, 458, 104, 123, 166, 5) and isColor(605, 458, 183, 146, 98, 5) then
                        touchClick(442, 458, 104, 123, 166) -- 出售-旧
                    end
                    if isColor(326, 459, 180, 144, 100, 5) and isColor(574, 459, 118, 120, 130, 5) then
                        touchClick(326, 459, 180, 144, 100) -- 出售-旧
                    end
                end
                -- if isColor(104,198,255,95,59) or isColor(104,201,255,92,56) then
                --         tiaoShi("背包红点1")
                --         x,y = findMultiColorInRegionFuzzy( 0x42c0c8, "24|4|0x72f4fc,23|38|0x48ea51", 90, 731, 121, 1110, 523)--2倍经验
                --         if x > 0 then
                --                 touchClick(x,y)
                --                 mSleep(2000)
                --                 touchClick(523,460,181,144,98)
                --         end
                --         x,y = findMultiColorInRegionFuzzy( 0x139299, "23|6|0x70f2fb,6|35|0x016d72", 90, 731, 121, 1110, 523)--3倍经验
                --         if x > 0 then
                --                 touchClick(x,y)
                --                 mSleep(2000)
                --                 touchClick(523,460,181,144,98)
                --         end
                --         touchClick(47,137,58,58,60)--属性

                if muBiaoA == mb_WaBao then
                    tiaoShi("找藏宝图")
                    x, y = findMultiColorInRegionFuzzy(0xbf9e8c, "-14|27|0x282d32,29|4|0xf6d2be,23|36|0x654637", 90,
                        731, 121, 1110, 523) -- 藏宝图
                    if x > 0 then
                        touchClick(x, y)
                        mSleep(2000)
                        touchClick(602, 461, 179, 142, 96)
                        mSleep(60 * 1000)
                    else
                        closeForever()
                        muBiaoA1 = mb_WanMoTa
                        muBiao1Con = mm_WanMoTa
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        timeDingShiDianRenWu = nowTime - 60
                    end
                else
                    touchClick(31, 20)
                end
                if muBiaoA == mb_ZhengLi then
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                elseif muBiaoA == mb_XiaoHaoZhengLi then
                    gaiMuBiao(3, mb_DengDaiHuiFu, mm_DengDaiHuiFu)
                elseif muBiaoA == mb_ZhengLiMaiLan then
                    muBiaoA3 = mb_MaiLan
                    muBiao3Con = mm_MaiLan
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                end
            else
                closeForever()
                if muBiaoA == mb_ZhengLi then
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                elseif muBiaoA == mb_ZhengLiMaiLan then
                    muBiaoA3 = mb_MaiLan
                    muBiao3Con = mm_MaiLan
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                end
            end
        end
    end
    if isColor(22, 209, 255, 255, 255, 5) and isColor(764, 566, 168, 123, 65, 5) then
        tiaoShi("背包界面1-旧")
        if muBiaoA == mb_ChengHao then
            if isColor(0, 495, 203, 200, 188) then -- 6或7栏
                touchClick(44, 520, 104, 101, 110)
            elseif isColor(0, 418, 210, 207, 194) then -- 5栏
                touchClick(37, 440, 194, 196, 198)
            elseif isColor(0, 394, 186, 183, 170) then -- 4栏
                touchClick(37, 417, 95, 95, 102)
            else
                closeForever()
            end
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        elseif muBiaoA == mb_CangKuZhengLi then
            touchClick(1073, 568, 151, 112, 59) -- 整理
            mSleep(1000)
            closeForever()
            gaiMuBiao(3, mb_DengDaiSiXin, mm_DengDaiSiXin)
            timeCangKu = nowTime
        else
            if isColor(957, 562, 94, 125, 170) or isColor(957, 562, 107, 117, 136) then -- 有熔炼字样
                touchClick(1073, 568, 151, 112, 59) -- 整理
                mSleep(2000)
                if isColor(793, 182, 189, 255, 179, 9) then
                    touchClick(793, 182, 189, 255, 179)
                    if isColor(628, 589, 182, 146, 98) then
                        touchClick(628, 589, 182, 146, 98)
                    elseif isColor(769, 588, 184, 149, 99) then
                        touchClick(769, 588, 184, 149, 99)
                    end
                    if isColor(646, 413, 168, 104, 53) then
                        touchClick(646, 413, 168, 104, 53)
                    end
                end
                if isColor(870, 182, 186, 255, 176, 9) then
                    touchClick(870, 182, 186, 255, 176)
                    if isColor(628, 589, 182, 146, 98) then
                        touchClick(628, 589, 182, 146, 98)
                    elseif isColor(769, 588, 184, 149, 99) then
                        touchClick(769, 588, 184, 149, 99)
                    end
                    if isColor(646, 413, 168, 104, 53) then
                        touchClick(646, 413, 168, 104, 53)
                    end
                end
                if isColor(946, 182, 191, 255, 180, 9) then
                    touchClick(946, 182, 191, 255, 180)
                    if isColor(628, 589, 182, 146, 98) then
                        touchClick(628, 589, 182, 146, 98)
                    elseif isColor(769, 588, 184, 149, 99) then
                        touchClick(769, 588, 184, 149, 99)
                    end
                    if isColor(646, 413, 168, 104, 53) then
                        touchClick(646, 413, 168, 104, 53)
                    end
                end
                if isColor(1023, 182, 188, 255, 178, 9) then
                    touchClick(1023, 182, 188, 255, 178)
                    if isColor(628, 589, 182, 146, 98) then
                        touchClick(628, 589, 182, 146, 98)
                    elseif isColor(769, 588, 184, 149, 99) then
                        touchClick(769, 588, 184, 149, 99)
                    end
                    if isColor(646, 413, 168, 104, 53) then
                        touchClick(646, 413, 168, 104, 53)
                    end
                end
                if isColor(1099, 182, 193, 255, 182, 9) then
                    touchClick(1099, 182, 193, 255, 182)
                    if isColor(628, 589, 182, 146, 98) then
                        touchClick(628, 589, 182, 146, 98)
                    elseif isColor(769, 588, 184, 149, 99) then
                        touchClick(769, 588, 184, 149, 99)
                    end
                    if isColor(646, 413, 168, 104, 53) then
                        touchClick(646, 413, 168, 104, 53)
                    end
                end
                rongLian()
                touchClick(63, 212, 114, 111, 116) -- 背包
                mSleep(1000)
                touchClick(1073, 568, 151, 112, 59) -- 整理
                mSleep(1000)
                maiLaJi()
                timeZhengLi = nowTime
                writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
                if numQuanShu ~= 0 then
                    x, y = findMultiColorInRegionFuzzy(0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103, 1108, 529)
                    if x > 0 then
                        touchClick(x, y)
                    else
                        touchMoveXY(1033, 508, 1033, 125 + 32)
                        mSleep(2000)
                        x, y = findMultiColorInRegionFuzzy(0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103, 1108,
                            529)
                        if x > 0 then
                            touchClick(x, y)
                        else
                            touchMoveXY(1033, 508, 1033, 125 + 32)
                            mSleep(2000)
                            x, y = findMultiColorInRegionFuzzy(0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103,
                                1108, 529)
                            if x > 0 then
                                touchClick(x, y)
                            else

                            end
                        end
                    end
                    if isColor(442, 458, 104, 123, 166, 5) and isColor(605, 458, 183, 146, 98, 5) then
                        touchClick(442, 458, 104, 123, 166) -- 出售
                    end
                    if isColor(326, 459, 180, 144, 100, 5) and isColor(574, 459, 118, 120, 130, 5) then
                        touchClick(326, 459, 180, 144, 100) -- 出售
                    end
                end
                -- if isColor(104,198,255,95,59) or isColor(104,201,255,92,56) then
                --         tiaoShi("背包红点1")
                --         x,y = findMultiColorInRegionFuzzy( 0x42c0c8, "24|4|0x72f4fc,23|38|0x48ea51", 90, 731, 121, 1110, 523)--2倍经验
                --         if x > 0 then
                --                 touchClick(x,y)
                --                 mSleep(2000)
                --                 touchClick(523,460,181,144,98)
                --         end
                --         x,y = findMultiColorInRegionFuzzy( 0x139299, "23|6|0x70f2fb,6|35|0x016d72", 90, 731, 121, 1110, 523)--3倍经验
                --         if x > 0 then
                --                 touchClick(x,y)
                --                 mSleep(2000)
                --                 touchClick(523,460,181,144,98)
                --         end
                --         touchClick(47,137,58,58,60)--属性

                if muBiaoA == mb_WaBao then
                    tiaoShi("找藏宝图")
                    x, y = findMultiColorInRegionFuzzy(0xbf9e8c, "-14|27|0x282d32,29|4|0xf6d2be,23|36|0x654637", 90,
                        731, 121, 1110, 523) -- 藏宝图
                    if x > 0 then
                        touchClick(x, y)
                        mSleep(2000)
                        touchClick(602, 461, 179, 142, 96)
                        mSleep(60 * 1000)
                    else
                        closeForever()
                        muBiaoA1 = mb_WanMoTa
                        muBiao1Con = mm_WanMoTa
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        timeDingShiDianRenWu = nowTime - 60
                    end
                else
                    touchClick(31, 20)
                end
                if muBiaoA == mb_ZhengLi then
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                elseif muBiaoA == mb_XiaoHaoZhengLi then
                    gaiMuBiao(3, mb_DengDaiHuiFu, mm_DengDaiHuiFu)
                elseif muBiaoA == mb_ZhengLiMaiLan then
                    muBiaoA3 = mb_MaiLan
                    muBiao3Con = mm_MaiLan
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                end
            else
                closeForever()
                if muBiaoA == mb_ZhengLi then
                    muBiaoA3 = mb_Wu
                    muBiao3Con = mm_Wu
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                elseif muBiaoA == mb_ZhengLiMaiLan then
                    muBiaoA3 = mb_MaiLan
                    muBiao3Con = mm_MaiLan
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                end
            end
        end
    end
    if (isColor(122, 14, 110, 121, 139, 5) and isColor(161, 32, 80, 86, 105, 5) and isColor(337, 602, 48, 48, 56, 5)) or
        (isColor(278, 96, 105, 105, 106, 5) and isColor(251, 222, 108, 108, 107, 5) and
            isColor(242, 362, 107, 107, 104, 5)) then
        tiaoShi("技能界面")
        if isColor(396, 142, 244, 67, 37, 20) then
            tiaoShi("装配扩展技能")
            touchClick(367, 153, 221, 169, 227)
            touchClick(628, 490, 203, 180, 146)
        end
        if isColor(12, 240, 86, 86, 99) then
            tiaoShi("装配转到升级")
            touchClick(12, 240, 86, 86, 99)
        end
        if isColor(719, 487, 96, 128, 172) or isColor(719, 487, 109, 119, 138) then
            tiaoShi("技能升级界面")
            if isColor(471, 489, 165, 120, 64) then -- 开放一键升级
                for i = 1, 10 do
                    if isColor(656, 554, 255, 94, 58, 20) then -- 能量球
                        touchClick(631, 579, 248, 189, 242)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(338, 103, 255, 91, 56, 20) then -- 左1
                        touchClick(301, 129, 246, 242, 244)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(281, 230, 255, 94, 58, 20) then -- 左2
                        touchClick(253, 264, 204, 251, 249)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(271, 365, 255, 97, 62, 20) then -- 左3
                        touchClick(248, 403, 173, 111, 63)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(311, 494, 255, 97, 61, 20) then -- 左4
                        touchClick(300, 534, 177, 153, 223)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(972, 86, 255, 90, 59, 20) then -- 右1
                        touchClick(959, 127, 252, 251, 248)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(1027, 226, 255, 88, 54, 20) then -- 右2
                        touchClick(1008, 263, 20, 138, 175)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(1036, 370, 255, 90, 55, 20) then -- 右3
                        touchClick(1007, 403, 167, 251, 246)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    elseif isColor(994, 510, 255, 90, 56, 20) then -- 右4
                        touchClick(955, 541, 246, 240, 250)
                        touchClick(471, 489, 165, 120, 64) -- 一键升级
                        touchClick(651, 400, 163, 115, 61) -- 确定
                    else
                        touchClick(30, 21, 183, 184, 183) -- 退出
                        timeJiNeng = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeJiNeng", timeJiNeng)
                        break
                    end
                end
            else
                for i = 1, 99 do
                    if isColor(338, 103, 255, 91, 56, 20) then -- 左1
                        touchQuickly(301, 129, 246, 242, 244)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                    elseif isColor(281, 230, 255, 94, 58, 20) then -- 左2
                        touchQuickly(253, 264, 204, 251, 249)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                    elseif isColor(271, 365, 255, 97, 62, 20) then -- 左3
                        touchQuickly(248, 403, 173, 111, 63)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                        -- elseif isColor(312,494,255,88,55,5) then--左4
                        --         touchQuickly(298,541,87,68,115)
                        --         touchQuickly(719,485,95,130,175)
                        -- elseif isColor(657,554,255,88,54,5) then--能量球
                        --         touchQuickly(629,586,188,19,204)
                        --         touchQuickly(719,485,95,130,175)
                    elseif isColor(972, 86, 255, 90, 59, 20) then -- 右1
                        touchQuickly(959, 127, 252, 251, 248)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                    elseif isColor(1027, 226, 255, 88, 54, 20) then -- 右2
                        touchQuickly(1008, 263, 20, 138, 175)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                    elseif isColor(1036, 370, 255, 90, 55, 20) then -- 右3
                        touchQuickly(1007, 403, 167, 251, 246)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                    elseif isColor(994, 510, 255, 90, 56, 20) then -- 右4
                        touchQuickly(955, 541, 246, 240, 250)
                        touchQuickly(719, 485, 95, 130, 175)
                        mSleep(1000)
                    else
                        touchClick(30, 21, 183, 184, 183) -- 退出
                        timeJiNeng = nowTime
                        writePlist(luaMuLu .. xiangMu .. ".plist", "timeJiNeng", timeJiNeng)
                        break
                    end
                end
            end
        end
    end
    -- --timeJianGe(debug.getinfo(1).currentline)
    if isColor(190, 571, 102, 112, 139, 5) and isColor(221, 591, 94, 83, 92, 5) and isColor(1017, 52, 82, 80, 84, 5) and
        isColor(1103, 344, 73, 75, 85, 5) then
        tiaoShi("强化界面")
        if isColor(105, 124, 255, 87, 54, 5) then
            tiaoShi("强化红点--已选中")
            if isColor(1012, 310, 255, 89, 54, 30) and not (isColor(614, 462, 180, 232, 243)) then
                tiaoShi("已选装备--红点")
                touchClick(707, 588, 164, 120, 65) -- 强化
                mSleep(1000)
            else
                touchClick(998, 446, 202, 203, 203) -- 下一件
                mSleep(1000)
                numNextQiangHua = numNextQiangHua + 1
                if numNextQiangHua >= 5 then
                    numNextQiangHua = 0
                    touchClick(30, 21, 183, 184, 183) -- 退出
                    timeQiangHua = nowTime
                    writePlist(luaMuLu .. xiangMu .. ".plist", "timeQiangHua", timeQiangHua)
                end
            end
            if isColor(429, 170, 181, 176, 172, 5) and isColor(439, 175, 73, 79, 105, 5) and
                isColor(704, 483, 194, 189, 183, 5) and isColor(700, 480, 73, 80, 105, 5) then
                tiaoShi("金币不足")
                touchClick(31, 20)
            end
            if isColor(578, 169, 187, 182, 178, 5) and isColor(852, 484, 193, 188, 182, 5) then
                tiaoShi("材料不足")
                touchClick(31, 20)
            end
        else
            touchClick(30, 21, 183, 184, 183) -- 退出
            timeQiangHua = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeQiangHua", timeQiangHua)
        end
    end
    if isColor(190, 571, 101, 110, 136, 5) and isColor(221, 591, 104, 88, 98, 5) and isColor(1017, 52, 83, 81, 85, 5) and
        isColor(1103, 344, 74, 75, 86, 5) then
        tiaoShi("强化界面-旧")

        if isColor(105, 124, 255, 87, 54, 5) then
            tiaoShi("强化红点--已选中")
            if isColor(1014, 307, 255, 92, 57, 30) and not (isColor(614, 462, 187, 240, 250)) then
                tiaoShi("已选装备--红点")
                touchClick(707, 588, 164, 120, 65) -- 强化
                mSleep(1000)
            else
                touchClick(998, 446, 202, 203, 203) -- 下一件
                mSleep(1000)
                numNextQiangHua = numNextQiangHua + 1
                if numNextQiangHua >= 5 then
                    numNextQiangHua = 0
                    touchClick(30, 21, 183, 184, 183) -- 退出
                    timeQiangHua = nowTime
                    writePlist(luaMuLu .. xiangMu .. ".plist", "timeQiangHua", timeQiangHua)
                end
            end
            if isColor(429, 170, 181, 176, 172, 5) and isColor(439, 175, 73, 79, 105, 5) and
                isColor(704, 483, 194, 189, 183, 5) and isColor(700, 480, 73, 80, 105, 5) then
                tiaoShi("金币不足")
                touchClick(31, 20)
            end
            if isColor(578, 169, 187, 182, 178, 5) and isColor(852, 484, 193, 188, 182, 5) then
                tiaoShi("材料不足")
                touchClick(31, 20)
            end
        else
            touchClick(30, 21, 183, 184, 183) -- 退出
            timeQiangHua = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeQiangHua", timeQiangHua)
        end
    end
    if (isColor(778, 486, 248, 248, 195, 5) and isColor(788, 496, 254, 254, 244, 5)) or
        (isColor(771, 510, 254, 253, 130, 5) and isColor(799, 467, 152, 37, 10, 5)) or
        (isColor(777, 484, 36, 200, 223, 5) and isColor(802, 466, 73, 119, 240, 5)) then
        tiaoShi("翅膀界面")
        mSleep(2000)
        if (isColor(1051, 560, 255, 94, 60, 5) and isColor(1050, 577, 102, 109, 145, 5)) or
            (isColor(1051, 560, 255, 94, 60, 5) and isColor(1050, 577, 114, 104, 115, 5)) then
            tiaoShi("提升--红点")
            touchClick(1050, 577, 102, 109, 145)
        elseif isColor(322, 564, 165, 121, 64, 5) then
            tiaoShi("佩戴")
            touchClick(322, 564)
        elseif muBiaoA == mb_ChiBang then
            if isColor(777, 496, 79, 57, 43) then
                yuMaoOrHuoZhong = "huoZhong"
            elseif isColor(776, 496, 20, 60, 81) then
                yuMaoOrHuoZhong = "yuMao"
            elseif isColor(791, 491, 59, 233, 243) then
                closeForever()
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            elseif isColor(786, 493, 198, 91, 16) then
                closeForever()
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            else
                closeForever()
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
            touchClick(788, 486, 248, 248, 195) -- +
            mSleep(2000)
            if isColor(634, 328, 250, 240, 225) then
                touchClick(634, 328, 250, 240, 225) -- 粉钻商城
            else
                touchClick(707, 333, 57, 63, 83) -- 粉钻商城
            end
            mSleep(2000)
        else
            touchClick(30, 21, 183, 184, 183) -- 退出
        end
    end
    if isColor(20, 136, 255, 255, 255, 5) and isColor(377, 554, 165, 120, 69, 5) and isColor(615, 557, 165, 119, 63, 5) and
        isColor(853, 557, 165, 120, 63, 5) then
        tiaoShi("好友界面")
        if muBiaoA == mb_JiaHaoYou or muBiaoA == mb_DengDaiSiXin then
            local tmpXuanXiang = string.find(duoXuan1, "5")
            if tmpXuanXiang ~= nil then -- 仓库号
                if isColor(104, 124, 255, 95, 59, 5) then
                    tiaoShi("好友申请")
                    touchClick(376, 555, 166, 121, 67)
                    mSleep(1000)
                    touchClick(749, 497, 162, 117, 61) -- 同意
                    mSleep(1000)
                    if isColor(834, 122, 255, 239, 205, 5) then -- 关闭
                        touchClick(834, 122, 255, 239, 205)
                    end
                else
                    touchClick(31, 20)
                end
            else -- 小号
                if isColor(240, 92, 195, 190, 184) or isColor(240, 92, 188, 188, 188) then -- 已经有好友
                    dialog("加好友--完毕", 0)
                    lua_exit()
                elseif isColor(853, 557, 166, 121, 65) then -- 添加好友
                    touchClick(853, 557, 166, 121, 65) -- 添加好友
                    touchClick(568, 327, 89, 110, 131) -- 搜索框
                    mSleep(3000)
                    inputText(cangKuName)
                    mSleep(1000)
                    touchClick(1078, 599, 0, 0, 0) -- 隐藏
                    touchClick(659, 413, 213, 197, 174) -- 搜索
                    mSleep(3000)
                    if isColor(683, 495, 165, 121, 66) then
                        tiaoShi("搜索成功")
                        touchClick(683, 495, 165, 121, 66) -- 确定
                        muBiaoA3 = mb_HuanJiaoSe
                        muBiao3Con = mm_HuanJiaoSe
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                        muBiaoZhuanHuan()
                        numJiaoSe = numJiaoSe + 1
                        if numJiaoSe >= 4 then
                            numJiaoSe = 1
                        end
                        writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                        closeForever()
                    else
                        tiaoShi("搜索失败")
                        touchClick(869, 220, 255, 239, 205) -- 关闭
                    end
                else
                    closeForever()
                end
            end
        elseif muBiaoA == mb_FaSongSiXin then
            if isColor(425, 144, 136, 166, 193) or isColor(426, 144, 109, 134, 159) then -- 好友在线
                touchClick(239, 126, 193, 192, 200) -- 好友头像
                touchClick(309, 181, 69, 76, 103) -- 私人聊天
                mSleep(3000)
                if isColor(424, 602, 163, 117, 62) then -- 有发送图标
                    touchClick(178, 599, 49, 53, 71) -- 输入框
                    mSleep(2000)
                    inputText(randomString(8, 7))
                    mSleep(1000)
                    touchClick(1025, 597, 155, 166, 180) -- return
                    mSleep(1000)
                    for i = 1, 120 do
                        nowDateTime = os.date("*t")
                        if nowDateTime.sec > 0 and nowDateTime.sec < 5 then
                            touchClick(430, 600, 165, 121, 64) -- 发送
                            break
                        end
                        mSleep(1000)
                    end
                    mSleep(5000)
                end
                touchClick(43, 95, 52, 53, 56) -- 世界频道
                touchClick(552, 307, 216, 209, 176) -- 关闭
                touchClick(1094, 49, 141, 133, 120) -- 地图
                mSleep(2000)
                touchClick(37, 227, 68, 67, 71) -- 世界地图
                mSleep(1000)
                touchClick(616, 357, 214, 212, 209) -- 120级
                mSleep(1000)
                gaiMuBiao(3, mb_XiaoHaoZhengLi, mm_XiaoHaoZhengLi)
            elseif isColor(425, 144, 138, 138, 138) then -- 好友不在线
                touchClick(31, 20)
            elseif isColor(853, 557, 166, 121, 65) then -- 没有好友
                touchClick(853, 557, 166, 121, 65) -- 添加好友
                touchClick(568, 327, 89, 110, 131) -- 搜索框
                mSleep(3000)
                inputText(cangKuName)
                mSleep(1000)
                touchClick(1078, 599, 0, 0, 0) -- 隐藏
                touchClick(659, 413, 213, 197, 174) -- 搜索
                mSleep(3000)
                if isColor(683, 495, 165, 121, 66) then
                    tiaoShi("搜索成功")
                    touchClick(683, 495, 165, 121, 66) -- 确定
                else
                    tiaoShi("搜索失败")
                    touchClick(869, 220, 255, 239, 205) -- 关闭
                end
                mSleep(5000)
            end
        elseif isColor(104, 124, 255, 95, 59, 5) then
            tiaoShi("好友申请")
            touchClick(376, 555, 166, 121, 67)
            mSleep(1000)
            touchClick(556, 490, 100, 128, 171) -- 拒绝
            mSleep(1000)
            if isColor(834, 122, 255, 239, 205, 5) then
                touchClick(834, 122, 255, 239, 205)
            end
        else
            touchClick(30, 21, 183, 184, 183) -- 退出
        end
    end
    if (isColor(136, 15, 89, 99, 118, 5) and isColor(164, 21, 64, 70, 86, 5)) or
        (isColor(136, 15, 87, 95, 111, 5) and isColor(164, 21, 59, 65, 77, 5)) or
        (isColor(202, 124, 114, 115, 124, 5) and isColor(292, 124, 117, 117, 124, 5) and
            isColor(715, 129, 182, 53, 233, 5)) then
        tiaoShi("成就界面")
        if isColor(945, 124, 164, 119, 63, 5) then
            tiaoShi("领取--红点")
            touchClick(945, 124, 164, 119, 63)
        elseif isColor(71, 218, 255, 91, 56, 5) then
            tiaoShi("历练红点")
            touchClick(71, 218, 255, 91, 56)
        elseif isColor(71, 405, 255, 93, 59) then
            tiaoShi("社交红点")
            touchClick(71, 405, 255, 93, 59)
        elseif isColor(71, 499, 255, 91, 56, 5) then
            tiaoShi("活跃红点")
            touchClick(71, 499, 255, 91, 56)
        elseif isColor(71, 312, 255, 88, 53) then
            tiaoShi("活动红点")
            touchClick(71, 312, 255, 88, 53)
        else
            touchClick(31, 20, 197, 196, 196) -- 退出
        end
    end
    -- --timeJianGe(debug.getinfo(1).currentline)
    if isColor(800, 279, 246, 221, 95, 5) and isColor(935, 366, 180, 121, 193, 5) then
        tiaoShi("在线奖励")
        touchClick(903, 531, 164, 120, 65)
        if isColor(896, 535, 166, 118, 62) then -- 领取失败
            closeForever()
            timeZhengLi = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
            muBiaoA3 = mb_ZhengLi
            muBiao3Con = mm_ZhengLi
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    elseif (isColor(416, 518, 221, 156, 95, 5) and isColor(601, 518, 223, 160, 98, 5) and
        isColor(856, 518, 223, 160, 98, 5) and isColor(893, 187, 165, 117, 61, 5) and isColor(993, 174, 255, 89, 54, 5)) or
        (isColor(341, 515, 225, 169, 109, 5) and isColor(604, 514, 226, 167, 101, 5) and
            isColor(856, 518, 222, 160, 97, 5) and isColor(892, 178, 166, 123, 67, 5)) then
        tiaoShi("直购礼包")
        touchClick(893, 187, 165, 117, 61)
    elseif isColor(818, 128, 155, 105, 62, 5) and isColor(872, 134, 147, 95, 64, 5) and
        isColor(875, 124, 255, 88, 55, 5) then
        tiaoShi("每日签到")
        touchClick(818, 128, 155, 105, 62)
        mSleep(1000)
        if isColor(875, 124, 255, 88, 55, 5) then
            closeForever()
            timeZhengLi = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
            muBiaoA3 = mb_ZhengLi
            muBiao3Con = mm_ZhengLi
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    elseif isColor(748, 486, 170, 127, 69, 5) and isColor(824, 507, 169, 110, 56, 5) and
        isColor(832, 490, 255, 93, 58, 20) then
        tiaoShi("每日签到--累计签到奖励")
        touchClick(748, 486, 170, 127, 69)
        mSleep(1000)
        if isColor(759, 495, 161, 116, 61) then
            closeForever()
            timeZhengLi = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
            muBiaoA3 = mb_ZhengLi
            muBiao3Con = mm_ZhengLi
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    elseif isColor(841, 129, 228, 198, 99, 5) and isColor(949, 198, 182, 120, 191, 5) then
        tiaoShi("等级或战力礼包")
        if isColor(922, 301, 162, 117, 62, 5) then
            touchClick(921, 303, 163, 117, 62)
            mSleep(2000)
            if isColor(922, 301, 162, 117, 62, 5) then
                tiaoShi("等级或战力礼包--领取失败")
                closeForever()
                timeZhengLi = nowTime
                writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
                muBiaoA3 = mb_ZhengLi
                muBiao3Con = mm_ZhengLi
                muBiaoA3 = mb_Wu
                muBiao3Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            end
        else
            closeForever()
        end
    elseif isColor(844, 123, 240, 223, 122, 5) and isColor(950, 197, 187, 127, 191, 5) then
        tiaoShi("boss克星")
        if isColor(920, 301, 163, 117, 62) then
            touchClick(920, 301, 163, 117, 62)
        elseif isColor(919, 397, 167, 122, 67) then
            touchClick(919, 397, 167, 122, 67)
        elseif isColor(918, 492, 165, 121, 66) then
            touchClick(918, 492, 165, 121, 66)
        end
    elseif isColor(318, 131, 230, 205, 156, 5) and isColor(585, 172, 250, 238, 166, 5) and
        isColor(607, 167, 97, 95, 214, 5) then
        tiaoShi("累计登录")
        if isColor(956, 364, 248, 240, 197) then
            touchClick(953, 314, 189, 64, 195)
        elseif isColor(730, 364, 213, 173, 22) then
            touchClick(725, 322, 247, 214, 123)
        elseif isColor(516, 364, 184, 129, 11) then
            touchClick(514, 313, 70, 23, 29)
        elseif isColor(370, 364, 184, 118, 11) then
            touchClick(372, 314, 134, 83, 49)
        end
        touchClick(578, 573, 162, 117, 63)
        closeForever()
    elseif isColor(371, 298, 229, 132, 250, 5) and isColor(779, 298, 230, 134, 248, 5) then
        tiaoShi("粉钻找回--2019-05-18")
        touchClick(499, 130) -- 金币找回
    elseif isColor(371, 298, 226, 136, 246, 5) and isColor(779, 298, 240, 146, 252, 5) then
        tiaoShi("粉钻找回--2020-08-10")
        touchClick(499, 130) -- 金币找回
    elseif isColor(370, 303, 225, 117, 251, 5) and isColor(779, 303, 226, 119, 252, 5) then
        tiaoShi("粉钻找回")
        touchClick(499, 130) -- 金币找回
    elseif isColor(370, 308, 184, 104, 216, 5) and isColor(780, 307, 201, 116, 228, 5) then
        tiaoShi("粉钻找回-ios7--新")
        touchClick(483, 130, 57, 69, 82) -- 金币找回
    elseif isColor(370, 308, 192, 108, 219, 5) and isColor(780, 307, 209, 118, 235, 5) then
        tiaoShi("粉钻找回-ios7")
        touchClick(483, 130, 57, 69, 82) -- 金币找回
    elseif isColor(360, 293, 171, 128, 71, 5) and isColor(501, 315, 170, 110, 56, 5) and
        isColor(370, 306, 215, 120, 241, 5) then
        tiaoShi("粉钻找回")
        touchClick(483, 130, 57, 69, 82) -- 金币找回
    elseif isColor(370, 311, 227, 118, 249, 5) and isColor(779, 312, 227, 118, 250, 5) then
        tiaoShi("粉钻找回")
        touchClick(483, 130, 57, 69, 82) -- 金币找回
    elseif isColor(779, 479, 227, 116, 246, 5) and isColor(369, 479, 220, 108, 242, 5) then
        tiaoShi("粉钻找回")
        touchClick(483, 130, 57, 69, 82) -- 金币找回
    elseif (isColor(369, 312, 254, 222, 50, 5) and isColor(384, 315, 172, 115, 59, 5)) or
        (isColor(369, 303, 243, 223, 54, 5) and isColor(779, 301, 247, 225, 68, 5)) or
        (isColor(370, 307, 224, 209, 94, 5) and isColor(780, 307, 218, 199, 75, 5) and
            isColor(361, 296, 168, 123, 70, 5)) or
        (isColor(360, 293, 171, 128, 71, 5) and isColor(498, 318, 171, 106, 54, 5) and
            isColor(369, 304, 228, 207, 82, 5)) or
        (isColor(359, 286, 170, 129, 71, 5) and isColor(501, 307, 170, 109, 55, 5) and
            isColor(370, 302, 242, 210, 57, 5)) or
        (isColor(370, 312, 237, 208, 51, 5) and isColor(499, 319, 172, 107, 54, 5) and
            isColor(257, 184, 236, 232, 184, 5)) or
        (isColor(370, 301, 231, 211, 62, 5) and isColor(499, 310, 172, 107, 54, 5) and
            isColor(257, 175, 237, 237, 186, 5)) or
        (isColor(370, 301, 240, 216, 66, 5) and isColor(779, 302, 240, 213, 62, 5) and
            isColor(358, 288, 169, 127, 66, 5)) or
        (isColor(370, 301, 229, 208, 71, 5) and isColor(779, 302, 243, 221, 66, 5) and
            isColor(358, 288, 168, 126, 69, 5)) or
        (isColor(371, 301, 240, 222, 79, 5) and isColor(775, 299, 229, 214, 110, 5) and
            isColor(359, 287, 170, 127, 70, 5)) then
        tiaoShi("金币找回1--ios7")
        if numJinBi >= 3000000 and numJiaoSe == 0 then
            for i = 1, 10 do
                touchClick(369, 304, 228, 207, 82)
                touchClick(160, 64, 6, 9, 17)
            end
        end
        closeForever()
        timeZiYuan = nowTime
        writePlist(luaMuLu .. xiangMu .. ".plist", "timeZiYuan", timeZiYuan)
    elseif isColor(552, 316, 76, 88, 123, 5) and isColor(591, 133, 166, 187, 234, 5) and
        isColor(680, 136, 82, 91, 120, 5) then
        tiaoShi("无资源可找回")
        touchClick(31, 20)
    end
    -- timeJianGe(debug.getinfo(1).currentline)
    if isColor(124, 179, 191, 179, 131, 5) and isColor(538, 451, 128, 120, 87, 5) then
        tiaoShi("恭喜获得1")
        touchClick(560, 611, 39, 46, 53)
    end
    if isColor(124, 179, 185, 175, 127, 5) and isColor(538, 451, 126, 119, 84, 5) then
        tiaoShi("恭喜获得")
        touchClick(560, 611, 39, 46, 53)
    end
    if isColor(124, 179, 188, 176, 129, 5) and isColor(538, 451, 134, 126, 92, 5) then
        tiaoShi("恭喜获得-旧")
        touchClick(560, 611, 39, 46, 53)
    end
    if isColor(614, 498, 38, 56, 139, 5) and isColor(763, 499, 34, 61, 146, 5) and isColor(687, 382, 252, 230, 70, 5) then
        tiaoShi("心悦特权--每周礼包")
        touchClick(614, 498, 38, 56, 139)
    end
    if isColor(1063, 379, 107, 107, 107, 5) and isColor(743, 503, 34, 40, 47, 5) then
        tiaoShi("心悦特权--每周礼包--领取成功")
        touchClick(565, 400, 0, 122, 255)
    end
    if isColor(607, 500, 64, 69, 76, 5) and isColor(1060, 379, 178, 178, 178, 5) then
        tiaoShi("心悦特权--每周礼包--已领取")
        touchClick(1033, 594, 56, 56, 56)
    end
    if isColor(35, 596, 200, 200, 200, 5) and isColor(950, 593, 200, 200, 200, 5) and
        isColor(511, 592, 200, 200, 200, 5) and isColor(287, 594, 51, 51, 51, 5) and isColor(659, 437, 255, 255, 255, 5) then
        tiaoShi("心悦特权--打开失败")
        touchClick(1033, 594)
    end
end

-- 熔炼
function rongLian(...)
    tiaoShi("魂器")
    touchClick(896, 564, 95, 127, 172) -- 熔炼
    shiBieJinBi()
    shiBieFenZuan()
    if isColor(752, 328, 53, 71, 105) then -- 绿
        touchClick(752, 328)
    end
    if isColor(833, 328, 53, 70, 104) then -- 蓝
        touchClick(833, 328, 53, 70, 104)
    end
    if isColor(915, 328, 53, 71, 104) then -- 紫
        touchClick(915, 328, 53, 71, 104)
    end
    if isColor(997, 328, 53, 71, 105) then
        touchClick(997, 328, 53, 71, 105) -- 橙色
    end
    if isColor(1079, 328, 53, 71, 105) then
        touchClick(1079, 328, 53, 71, 105) -- 红色
    end
    -- if not(isColor(1079,249,193,246,254,5)) then
    --         touchClick(1079,249,193,246,254)
    -- end
    -- if isColor(997,249,191,243,250,50) then
    --                touchClick(997,249,191,243,250)--取消橙色
    --        end

    --        if isColor(782,328,255,255,255) then--第一个装备已勾选
    --        elseif isColor(782,328,34,37,48) then--第一个没装备
    -- elseif isColor(754,292,251,130,9,20) then--第一件是橙装
    --        else
    --                touchClick(782,328,34,37,48)--强行勾选第一件装备
    --        end

    -- if isColor(762,344,255,255,207) then--选有锁橙装-榨
    --         touchClick(793,313,130,138,139)
    -- end
    -- if isColor(838,344,255,255,207) then
    --         touchClick(863,311,170,154,91)
    -- end
    -- if isColor(915,344,255,255,212) then
    --         touchClick(940,313,93,84,55)
    -- end
    -- if isColor(993,344,255,255,202) then
    --         touchClick(1022,316,64,52,34)
    -- end
    -- if isColor(1068,344,255,255,207) then
    --         touchClick(1097,318,72,61,42)
    -- end
    -- if isColor(763,418,255,255,204) then
    --         touchClick(796,386,64,43,22)
    -- end
    -- if isColor(838,418,255,255,208) then
    --         touchClick(867,383,32,17,10)
    -- end
    -- if isColor(916,418,255,255,210) then
    --         touchClick(948,389,85,81,53)
    -- end
    -- if isColor(993,418,255,255,204) then
    --         touchClick(1018,391,80,177,191)
    -- end
    -- if isColor(1069,418,255,240,206) then
    --         touchClick(1097,386,94,213,200)

    -- end
    -- if isColor(756,339,243,218,226) then--1-1
    --         touchClick(793,313,130,138,139)
    -- end
    -- if isColor(756,338,255,227,231) then--2-1
    --         touchClick(793,313,130,138,139)
    -- end
    -- if isColor(832,336,213,195,191) then--2-2
    --         touchClick(863,311,170,154,91)
    -- end
    -- if isColor(756,338,255,228,231) then--3-1
    --         touchClick(793,313,130,138,139)
    -- end
    -- if isColor(832,335,226,206,207) then--3-2
    --         touchClick(863,311,170,154,91)
    -- end
    -- if isColor(909,338,255,227,230) then--3-3
    --         touchClick(940,313,93,84,55)
    -- end
    -- if isColor(756,338,254,222,231) then--4-1
    --         touchClick(793,313,130,138,139)
    -- end
    -- if isColor(833,333,216,196,193) then--4-2
    --         touchClick(863,311,170,154,91)
    -- end
    -- if isColor(909,334,255,209,203) then--4-3
    --         touchClick(940,313,93,84,55)
    -- end
    -- if isColor(986,338,254,223,231) then--4-4
    --         touchClick(1022,316,64,52,34)
    -- end
    -- if isColor(756,338,255,229,231) then--5-1
    --         touchClick(793,313,130,138,139)
    -- end
    -- if isColor(832,335,225,206,207) then--5-2
    --         touchClick(863,311,170,154,91)
    -- end
    -- if isColor(909,338,255,230,230) then--5-3
    --         touchClick(940,313,93,84,55)
    -- end
    -- if isColor(986,338,255,227,231) then--5-4
    --         touchClick(1022,316,64,52,34)
    -- end
    -- if isColor(1062,338,234,223,230) then--5-5
    --         touchClick(1097,318,72,61,42)

    -- end
    -- if isColor(985,343,255,253,209) then--宽-1-4
    --         touchClick(1012,313,139,54,47)
    -- end

    touchClick(456, 596, 162, 118, 63) -- 熔炼
    tiaoShi("熔炼")
    mSleep(2000)
    if isColor(651, 418, 166, 118, 65, 5) then
        touchClick(651, 418)
        mSleep(2000)
    end
    if isColor(651, 418, 166, 118, 65, 5) then
        touchClick(651, 418)
        mSleep(2000)
    end
    if isColor(651, 398, 163, 118, 62) then
        touchClick(651, 398)
        mSleep(2000)
    end
    if isColor(651, 398, 163, 118, 62) then
        touchClick(651, 398)
        mSleep(2000)
    end
end

-- 关闭一次
function closeOne(...)
    if isColor(31, 20, 197, 196, 196) then
        touchClick(31, 20, 197, 196, 196)
    elseif isColor(27, 18, 219, 219, 219) then
        touchClick(27, 18, 219, 219, 219)
    end
end

-- 彻底关闭
function closeForever(...)
    for i = 1, 10 do
        if isColor(31, 20, 197, 196, 196) then
            touchClick(31, 20, 197, 196, 196)
        elseif isColor(27, 18, 219, 219, 219) then
            touchClick(27, 18, 219, 219, 219)
        elseif isColor(31, 20, 205, 205, 205) then
            touchClick(31, 20)
        elseif isColor(27, 18, 213, 213, 213) then
            touchClick(27, 18, 213, 213, 213)
        elseif isColor(28, 19, 224, 224, 224) then
            touchClick(28, 19, 224, 224, 224)
        else
            break
        end
    end
end

-- 定时点任务
function dingShiDianRenWu(...)
    if muBiaoA ~= mb_ZhanMengRiChang then
        if fuBenNei() and nameFuBen == "战盟" then
            tuiChuFuBen()
        end
    end
    if muBiaoA == mb_ZhuXian then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测主线")
            timeDingShiDianRenWu = nowTime
            -- touchClick(101,157,72,59,36)
            touchClick(16, 170, 130, 31, 11) -- 任务
            mSleep(2000)
            if isColor(60, 148, 243, 243, 247) then -- 主线
                if isColor(559, 79, 176, 60, 34, 5) and isColor(550, 135, 236, 199, 186, 5) then
                    tiaoShi("NPC让我点加号")
                    touchClick(1104, 24, 87, 94, 119)
                    return
                end
                x, y = findColorInRegionFuzzy(0xeb4c4c, 80, 762, 140, 924, 140)
                x1, y1 = findColorInRegionFuzzy(0x803b43, 80, 762, 140, 924, 140)
                if x > 0 or x1 > 0 then
                    muBiaoA1 = mb_ZhiXian
                    muBiao1Con = mm_ZhiXian
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    touchClick(31, 20)
                    timeDingShiDianRenWu = nowTime - 10
                else
                    touchClick(31, 20)
                    touchClick(101, 157, 72, 59, 36)
                end
            elseif isColor(60, 153, 240, 241, 245) then -- 主线-旧
                if isColor(559, 79, 176, 60, 34, 5) and isColor(550, 135, 236, 199, 186, 5) then
                    tiaoShi("NPC让我点加号")
                    touchClick(1104, 24, 87, 94, 119)
                    return
                end
                x, y = findColorInRegionFuzzy(0xeb4c4c, 80, 762, 140, 924, 140)
                if x > 0 then
                    muBiaoA1 = mb_ZhiXian
                    muBiao1Con = mm_ZhiXian
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    touchClick(31, 20)
                    timeDingShiDianRenWu = nowTime - 10
                else
                    touchClick(31, 20)
                    touchClick(101, 157, 72, 59, 36)
                end
            else
                touchClick(31, 20)
            end
        end
    end
    if muBiaoA == mb_ZhiXian then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测支线")
            timeDingShiDianRenWu = nowTime
            -- touchClick(101,157,72,59,36)
            touchClick(16, 170, 130, 31, 11) -- 任务
            mSleep(2000)
            if isColor(74, 227, 237, 240, 243) or isColor(74, 227, 196, 199, 206) then -- 支线在二号位
                touchClick(74, 232, 236, 239, 242)
            elseif isColor(74, 232, 236, 239, 242) then -- 支线在二号位-旧
                touchClick(74, 232, 236, 239, 242)
            elseif isColor(74, 293, 240, 242, 245) then -- 支线在三号位
                touchClick(74, 293, 240, 242, 245)
            elseif isColor(74, 298, 241, 243, 246) then -- 支线在三号位-旧
                touchClick(74, 298, 241, 243, 246)
            end
            for i = 1, 10 do
                if isColor(744, 527, 232, 226, 217, 5) then -- 领取奖励
                    touchClick(744, 527, 232, 226, 217)
                else
                    touchClick(31, 20, 197, 196, 196) -- 退出
                    muBiaoA1 = mb_EveryDay
                    muBiao1Con = mm_EveryDay
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    timeDingShiDianRenWu = nowTime - 10
                    break
                end
            end
        end
    end
    if muBiaoA == mb_EveryDay then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测日常")
            timeDingShiDianRenWu = nowTime
            touchClick(118, 211, 36, 86, 99) -- 日常
            mSleep(2000)
            if isColor(6, 312, 66, 32, 34) then
                tiaoShi("日常已做完")
                closeForever()
                muBiaoA1 = mb_JingYan
                muBiao1Con = mm_JingYan
                writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                muBiaoZhuanHuan()
                timeDingShiDianRenWu = nowTime - 10
            end
            -- touchClick(16,170,130,31,11)--任务
            -- mSleep(8000)
            -- if isColor(74,237,188,194,204) then--有日常
            -- else
            --         muBiao1 = mb_JingYan
            --         writeConfig(State["Bid"].."_Set.dat",mbCon1,muBiao1Con)
            --         muBiaoZhuanHuan()
            --         timeDingShiDianRenWu = nowTime - 10
            -- end
            -- touchClick(31,20)
            -- timeDingShiDianRenWu = nowTime
        end
    end
    if muBiaoA == mb_JingYan or muBiaoA == mb_JinBi or muBiaoA == mb_WanMoTa or muBiaoA == mb_EveryDay or muBiaoA ==
        mb_SaoDang then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测经验、金币、万魔塔、副本、扫荡")
            timeDingShiDianRenWu = nowTime
            if (isColor(891, 104, 189, 186, 186, 5) and isColor(878, 102, 110, 92, 84, 5)) or
                (isColor(891, 104, 151, 149, 149, 5) and isColor(878, 102, 88, 73, 67, 5)) then -- 副本在右2
                touchClick(891, 104)
                mSleep(1000)
            elseif isColor(829, 104, 189, 186, 186, 5) and isColor(816, 102, 110, 92, 84, 5) then -- 副本在右3
                touchClick(829, 104)
                mSleep(1000)
            elseif isColor(829, 104, 151, 149, 149, 5) and isColor(816, 102, 88, 74, 67, 5) then -- 副本在右3
                touchClick(829, 104)
                mSleep(1000)
            elseif isColor(829, 104, 188, 182, 183, 5) and isColor(816, 102, 113, 90, 82, 5) then -- 副本在右3
                touchClick(829, 104)
                mSleep(1000)
            end
        end
    end
    if muBiaoA == mb_WaKuang then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测崇拜")
            timeDingShiDianRenWu = nowTime
            if (isColor(765, 12, 214, 217, 214, 5) and isColor(765, 22, 90, 72, 61, 5)) or
                (isColor(765, 12, 215, 218, 215, 5) and isColor(765, 22, 125, 112, 105, 5)) then -- 排行右4
                tiaoShi("排行右4")
                touchClick(765, 22)
            elseif isColor(703, 12, 216, 218, 216, 5) and isColor(690, 22, 79, 64, 57, 5) then -- 排行右5
                touchClick(703, 12)
            else
                muBiaoA1 = mb_EveryDay
                muBiao1Con = mm_EveryDay
                writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                muBiaoZhuanHuan()
            end
        end
    end
    if muBiaoA == mb_JingJiChang then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测竞技场")
            timeDingShiDianRenWu = nowTime
            touchClick(951, 24, 188, 186, 184) -- 活动
        end
    end
    if muBiaoA == mb_ShiLianZhiDi then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测试炼之地")
            timeDingShiDianRenWu = nowTime
            touchClick(366, 33, 192, 192, 192) -- 我要变强
            mSleep(1000)
            touchClick(367, 266, 178, 124, 69) -- 我要经验
            mSleep(1000)
            if isColor(453, 261, 244, 238, 229) then
                if isColor(527, 332, 114, 119, 130, 5) and isColor(585, 342, 160, 157, 144, 5) then
                    touchClick(823, 352, 97, 108, 132) -- 试炼之地第3位
                elseif isColor(529, 333, 156, 157, 158, 5) and isColor(587, 334, 134, 136, 140, 5) then
                    touchClick(823, 352, 97, 108, 132) -- 试炼之地第3位
                else
                    touchClick(867, 262, 100, 108, 131) -- 试炼之地第2位
                end
                mSleep(1000)
            else
                muBiaoA1 = mb_ZhuXian
                muBiao1Con = mm_ZhuXian
                writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                muBiaoZhuanHuan()
            end
        end
        if nowTime - timeDingShiDianRenWu >= 60 and fuBenNei() and isShiLianZhiDi == true then
            tiaoShi("试炼之地内")
            touchClick(1094, 49, 141, 133, 120) -- 地图
            mSleep(2000)
            if shiLianZhiDi == "1" then
                touchClick(1010, 178, 78, 95, 112)
            elseif shiLianZhiDi == "2" then
                touchClick(1010, 213, 23, 27, 35)
            elseif shiLianZhiDi == "3" then
                touchClick(1010, 247, 24, 28, 39)
            elseif shiLianZhiDi == "4" then
                touchClick(1010, 278, 103, 124, 145)
            elseif shiLianZhiDi == "5" then
                touchClick(1013, 314, 92, 112, 130)
            elseif shiLianZhiDi == "6" then
                touchClick(1012, 348, 29, 34, 47)
            elseif shiLianZhiDi == "7" then
                touchClick(1014, 381, 78, 94, 113)
            elseif shiLianZhiDi == "8" then
                touchClick(1014, 416, 29, 34, 47)
            elseif shiLianZhiDi == "9" then
                touchClick(1012, 452, 29, 34, 47)
            elseif shiLianZhiDi == "10" then
                touchClick(1011, 483, 29, 34, 47)
            end
            closeForever()
            mSleep(1000)
            timeDingShiDianRenWu = nowTime
        end
    end
    if muBiaoA == mb_Reward then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and
            (nowDateTime.hour == 9 or nowDateTime.hour == 12 or nowDateTime.hour == 15 or nowDateTime.hour == 18 or
                nowDateTime.hour == 21) then
            -- if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isTieXue == false and (nowDateTime.hour == 9 or nowDateTime.hour == 12 or nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21) then
            touchClick(366, 33, 192, 192, 192) -- 我要变强
            mSleep(1000)
            touchClick(364, 319, 178, 125, 70) -- 我要金币
            mSleep(1000)
            if isColor(458, 170, 237, 226, 211) then
                if isColor(529, 242, 143, 147, 155, 5) and isColor(585, 255, 96, 94, 84, 5) then -- 铁血在第二格
                    touchClick(821, 265, 96, 106, 129)
                else
                    touchClick(821, 174, 97, 107, 131) -- 铁血在第一格
                    mSleep(1000)
                end
            else
                numTieXue = 2
                writePlist(luaMuLu .. xiangMu .. ".plist", "铁血次数", numTieXue)
                -- isTieXue = false
                -- writePlist(luaMuLu..xiangMu..".plist","isTieXue",isTieXue)
                muBiaoA2 = mb_Wu
                muBiao2Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
                muBiaoZhuanHuan()
            end
            timeDingShiDianRenWu = nowTime
        end
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and
            (nowDateTime.hour ~= 9 and nowDateTime.hour ~= 12 and nowDateTime.hour ~= 15 and nowDateTime.hour ~= 18 and
                nowDateTime.hour ~= 21) then
            -- if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isTieXue == false and (nowDateTime.hour ~= 9 and nowDateTime.hour ~= 12 and nowDateTime.hour ~= 15 and nowDateTime.hour ~= 18 and nowDateTime.hour ~= 21) then
            muBiaoA2 = mb_Wu
            muBiao2Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
            muBiaoZhuanHuan()
            timeDingShiDianRenWu = nowTime
        end
        if nowTime - timeDingShiDianRenWu >= 5 and isColor(334, 28, 129, 31, 21) then -- 铁血副本内
            -- if nowTime - timeDingShiDianRenWu >= 5 and isTieXue == true and isColor(334,28,129,31,21) then--铁血副本内
            timeDingShiDianRenWu = nowTime
            touchClick(155, 306, 243, 99, 31)
        end
    end
    if muBiaoA == mb_CaiJi then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isEMo == false and
            (nowDateTime.min == 15 or nowDateTime.min == 16 or nowDateTime.min == 45 or nowDateTime.min == 46) then
            touchClick(366, 33, 192, 192, 192) -- 我要变强
            mSleep(1000)
            touchClick(316, 217, 184, 130, 80) -- 我要装备
            mSleep(1000)
            touchMoveXY(692, 473, 696, 175)
            mSleep(2000)
            if isColor(821, 475, 97, 108, 132) then
                touchClick(843, 475, 95, 102, 114) -- 恶魔
                mSleep(1000)
            else
                numEMo = 3
                writePlist(luaMuLu .. xiangMu .. ".plist", "恶魔次数", numEMo)
                isEMo = false
                writePlist(luaMuLu .. xiangMu .. ".plist", "isEMo", isEMo)
                muBiaoA2 = mb_Wu
                muBiao2Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
                muBiaoZhuanHuan()
            end
            timeDingShiDianRenWu = nowTime
        end
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isEMo == false and
            (nowDateTime.min ~= 15 and nowDateTime.min ~= 16 and nowDateTime.min ~= 45 and nowDateTime.min ~= 46) then
            muBiaoA2 = mb_Wu
            muBiao2Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
            muBiaoZhuanHuan()
        end
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isEMo == true then
            timeDingShiDianRenWu = nowTime
            liDui()
        end
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isDuiWuing == true then
            timeDingShiDianRenWu = nowTime
            liDui()
        end
        if nowTime - timeDingShiDianRenWu >= 10 and fuBenNei() and isEMo == true and isDuiWuing == true then
            touchClick(179, 248, 60, 71, 89) -- 点击任务框
            timeDingShiDianRenWu = nowTime
        end
        if nowTime - timeDingShiDianRenWu >= 10 and fuBenNei() and isEMo == true and isDuiWuing == false then
            timeDingShiDianRenWu = nowTime
            zuDui()
        end
    end
    if muBiaoA == mb_5DaoJu then
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isXueSe == false and
            (nowDateTime.min == 0 or nowDateTime.min == 1 or nowDateTime.min == 30 or nowDateTime.min == 31) then
            touchClick(366, 33, 192, 192, 192) -- 我要变强
            mSleep(1000)
            touchClick(313, 371, 102, 110, 132) -- 我要宝石
            mSleep(1000)
            if isColor(454, 441, 242, 233, 223) then
                touchClick(847, 441, 140, 144, 151) -- 血色
                mSleep(1000)
            else
                numXueSe = 3
                writePlist(luaMuLu .. xiangMu .. ".plist", "血色次数", numXueSe)
                isXueSe = false
                writePlist(luaMuLu .. xiangMu .. ".plist", "isXueSe", isXueSe)
                muBiaoA2 = mb_Wu
                muBiao2Con = mm_Wu
                writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
                muBiaoZhuanHuan()
            end
            timeDingShiDianRenWu = nowTime
        end
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isXueSe == false and
            (nowDateTime.min ~= 0 and nowDateTime.min ~= 1 and nowDateTime.min ~= 30 and nowDateTime.min ~= 31) then
            muBiaoA2 = mb_Wu
            muBiao2Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
            muBiaoZhuanHuan()
        end
        if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false and isXueSe == true then
            numXueSe = numXueSe + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "血色次数", numXueSe)
            isXueSe = false
            writePlist(luaMuLu .. xiangMu .. ".plist", "isXueSe", isXueSe)
            muBiaoA2 = mb_Wu
            muBiao2Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
            muBiaoZhuanHuan()
            timeDingShiDianRenWu = nowTime
        end
        if nowTime - timeDingShiDianRenWu >= 10 and fuBenNei() and isXueSe == true then
            touchClick(179, 248, 60, 71, 89) -- 点击任务框
            timeDingShiDianRenWu = nowTime
        end

    end
    if muBiaoA == mb_ZhanMengRiChang then
        if numDay >= 3 then
            gaiMuBiao(1, mb_JinBi, mm_JinBi)
        else
            if nowTime - timeDingShiDianRenWu >= 10 and zhuJieMian() and isHongDian == false then
                tiaoShi("战盟日常--打开任务栏")
                touchClick(16, 168, 245, 238, 237) -- 任务栏
                mSleep(2000)
                if isColor(66, 372, 175, 185, 203, 5) and isColor(137, 357, 140, 144, 152, 5) then
                    tiaoShi("战盟日常--第4位")
                    touchClick(105, 371, 109, 118, 139)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(66, 377, 175, 185, 202, 5) and isColor(137, 362, 124, 127, 137, 5) then
                    tiaoShi("战盟日常--第4位-旧")
                    touchClick(105, 371, 109, 118, 139)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(66, 299, 197, 205, 218, 5) and isColor(137, 291, 167, 170, 175, 5) then
                    tiaoShi("战盟日常--第3位")
                    touchClick(100, 304, 203, 208, 215)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(69, 295, 184, 191, 207, 5) and isColor(137, 311, 149, 157, 168, 5) then
                    tiaoShi("战盟日常--第3位-旧")
                    touchClick(100, 304, 203, 208, 215)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(66, 432, 197, 204, 217, 5) and isColor(137, 424, 149, 152, 157, 5) then
                    tiaoShi("战盟日常--第5位")
                    touchClick(102, 434, 57, 66, 87)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(69, 428, 191, 197, 211, 5) and isColor(137, 444, 123, 130, 140, 5) then
                    tiaoShi("战盟日常--第5位-旧")
                    touchClick(102, 434, 57, 66, 87)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(55, 170, 124, 142, 182) then
                    tiaoShi("没有战盟日常")
                    closeForever()
                    muBiaoA1 = mb_JinBi
                    muBiao1Con = mm_JinBi
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    if isColor(977, 37, 184, 181, 165) then
                        touchClick(977, 37, 184, 181, 165) -- 离开战盟
                    end
                elseif isColor(55, 170, 118, 139, 176) then
                    tiaoShi("没有战盟日常-旧")
                    closeForever()
                    muBiaoA1 = mb_JinBi
                    muBiao1Con = mm_JinBi
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    if isColor(977, 37, 184, 181, 165) then
                        touchClick(977, 37, 184, 181, 165) -- 离开战盟
                    end
                end
                timeDingShiDianRenWu = nowTime
            end
            if nowTime - timeDingShiDianRenWu >= 10 and fuBenNei() and nameFuBen == "战盟" then
                touchClick(16, 168, 245, 238, 237) -- 任务栏
                mSleep(2000)
                if isColor(66, 372, 175, 185, 203, 5) and isColor(137, 357, 140, 144, 152, 5) then
                    tiaoShi("战盟日常--第4位-旧")
                    touchClick(105, 371, 109, 118, 139)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(66, 377, 175, 185, 202, 5) and isColor(137, 362, 124, 127, 137, 5) then
                    tiaoShi("战盟日常--第4位-旧")
                    touchClick(105, 371, 109, 118, 139)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(66, 299, 197, 205, 218, 5) and isColor(137, 291, 167, 170, 175, 5) then
                    tiaoShi("战盟日常--第3位")
                    touchClick(100, 304, 203, 208, 215)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(69, 295, 184, 191, 207, 5) and isColor(137, 311, 149, 157, 168, 5) then
                    tiaoShi("战盟日常--第3位-旧")
                    touchClick(100, 304, 203, 208, 215)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(66, 432, 197, 204, 217, 5) and isColor(137, 424, 149, 152, 157, 5) then
                    tiaoShi("战盟日常--第5位")
                    touchClick(102, 434, 57, 66, 87)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(69, 428, 191, 197, 211, 5) and isColor(137, 444, 123, 130, 140, 5) then
                    tiaoShi("战盟日常--第5位-旧")
                    touchClick(102, 434, 57, 66, 87)
                    if isColor(725, 543, 64, 71, 93) then
                        tiaoShi("已完成")
                        closeForever()
                        muBiaoA1 = mb_JinBi
                        muBiao1Con = mm_JinBi
                        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                        muBiaoZhuanHuan()
                        if isColor(977, 37, 184, 181, 165) then
                            touchClick(977, 37, 184, 181, 165) -- 离开战盟
                        end
                    else
                        numZhanMeng = numZhanMeng + 1
                        if numZhanMeng >= 10 then
                            numZhanMeng = 1
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                        else
                            touchClick(732, 459, 167, 122, 67) -- 立即前往
                            touchClick(116, 269, 161, 161, 162) -- 战盟日常
                        end
                    end
                elseif isColor(55, 170, 124, 142, 182) then
                    tiaoShi("没有战盟日常")
                    closeForever()
                    muBiaoA1 = mb_JinBi
                    muBiao1Con = mm_JinBi
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    if isColor(977, 37, 184, 181, 165) then
                        touchClick(977, 37, 184, 181, 165) -- 离开战盟
                    end
                elseif isColor(55, 170, 118, 139, 176) then
                    tiaoShi("没有战盟日常-旧")
                    closeForever()
                    muBiaoA1 = mb_JinBi
                    muBiao1Con = mm_JinBi
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                    if isColor(977, 37, 184, 181, 165) then
                        touchClick(977, 37, 184, 181, 165) -- 离开战盟
                    end
                end
                timeDingShiDianRenWu = nowTime
            end
        end
    end
    if muBiaoA == mb_WuZi then
        local tmpXuanXiang = string.find(duoXuan1, "2")
        if tmpXuanXiang ~= nil then
            if nowTime - timeDingShiDianRenWu >= 30 and zhuJieMian() and isHongDian == false then
                touchClick(16, 168, 245, 238, 237) -- 任务栏
                mSleep(1000)
                if isColor(66, 369, 150, 155, 169, 5) and isColor(139, 378, 117, 123, 133, 5) then
                    tiaoShi("物资采集--第4位")
                    touchClick(99, 368, 178, 182, 189)
                    if isColor(732, 530, 164, 119, 63) then
                        touchClick(732, 530, 164, 119, 63) -- 前往
                    end
                elseif isColor(69, 295, 182, 188, 205, 5) and isColor(139, 311, 154, 163, 176, 5) then
                    tiaoShi("物资采集--第3位")
                    touchClick(99, 302)
                    if isColor(732, 530, 164, 119, 63) then
                        touchClick(732, 530, 164, 119, 63) -- 前往
                    end
                else
                    muBiaoA1 = mb_ShiLianZhiDi
                    muBiao1Con = mm_ShiLianZhiDi
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
                    muBiaoZhuanHuan()
                end
                timeDingShiDianRenWu = nowTime
            end
        else
            muBiaoA1 = mb_ShiLianZhiDi
            muBiao1Con = mm_ShiLianZhiDi
            writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
            muBiaoZhuanHuan()
        end
    end
    if muBiaoA == mb_WaBao then
        if nowTime - timeDingShiDianRenWu >= 60 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测挖宝")
            touchClick(768, 595, 128, 113, 92) -- 背包
        end
    end
    if muBiaoA == mb_GuaJi then
        if zhuJieMian() and isColor(839, 591, 235, 230, 200, 5) then
            timeDingShiDianRenWu = nowTime - 60 * 60
        end
        if nowTime - timeDingShiDianRenWu >= 60 * 10 and zhuJieMian() and isHongDian == false then
            tiaoShi("点任务--检测挂机")
            touchClick(1094, 49, 141, 133, 120) -- 地图

            mSleep(2000)
            numDiTu = tonumber(diTu)
            if numDiTu <= 14 then
                touchClick(37, 227, 68, 67, 71) -- 世界地图
            elseif numDiTu > 14 then
                touchClick(44, 320, 162, 134, 127) -- 深渊位面
            end
            mSleep(1000)
            if diTu == "0" then
                touchClick(334, 445, 92, 86, 72)
            elseif diTu == "1" then
                touchClick(212, 135, 114, 108, 97)
            elseif diTu == "2" then
                touchClick(370, 257, 175, 172, 165)
            elseif diTu == "3" then
                touchClick(620, 356, 97, 92, 79)
            elseif diTu == "4" then
                touchClick(548, 205, 233, 209, 136)
            elseif diTu == "5" then
                touchClick(477, 498, 207, 206, 201)
            elseif diTu == "6" then
                touchClick(1010, 139, 202, 200, 195)
            elseif diTu == "7" then
                touchClick(696, 170, 201, 198, 194)
            elseif diTu == "8" then
                touchClick(696, 550, 60, 53, 37)
            elseif diTu == "9" then
                touchClick(812, 283, 84, 78, 65)
            elseif diTu == "10" then
                touchClick(430, 112, 73, 49, 34)
            elseif diTu == "11" then
                touchClick(994, 363, 78, 71, 57)
            elseif diTu == "12" then
                touchClick(1029, 529, 187, 184, 178)
            elseif diTu == "13" then
                touchClick(572, 573)
            elseif diTu == "14" then
                touchClick(739, 404, 98, 92, 79)
            elseif diTu == "15" then
                touchClick(763, 187, 60, 53, 37)
            elseif diTu == "16" then
                touchClick(843, 406, 53, 47, 32)
            elseif diTu == "17" then
                touchClick(485, 363, 139, 134, 125)
            elseif diTu == "18" then
                touchClick(850, 285, 145, 132, 123)
            elseif diTu == "19" then
                touchClick(717, 474, 90, 84, 70)
            elseif diTu == "20" then
                touchClick(756, 90, 62, 55, 40)
            elseif diTu == "21" then
                touchClick(426, 245, 182, 179, 173)
            elseif diTu == "22" then
                touchClick(414, 490, 144, 140, 131)
            elseif diTu == "23" then
                touchClick(149, 176, 32, 44, 79)
            elseif diTu == "24" then
                touchClick(714, 352, 94, 87, 71)
            elseif diTu == "25" then
                touchClick(601, 191, 79, 73, 59)
            elseif diTu == "26" then
                touchClick(934, 502, 235, 234, 233)
            end
            -- if isColor(553,165,255,255,255,50) and isColor(481,470,255,6,6,50) then
            --         tiaoShi("亚特兰蒂斯--120")
            --         touchClick(620,356,97,92,79)
            -- elseif isColor(480,467,255,254,248,50) and isColor(999,108,255,0,0,50) then
            --         tiaoShi("死亡沙漠--160")
            --         touchClick(548,205,233,209,136)
            -- elseif isColor(594,320,255,253,248,50) and isColor(534,190,255,0,0,50) then
            --         tiaoShi("帝纽特--80")
            --         touchClick(370,257,175,172,165)
            -- elseif isColor(353,225,255,255,253,50) and isColor(595,325,255,0,0,50) then
            --         tiaoShi("仙踪林--40")
            --         touchClick(334,445,92,86,72)
            -- elseif isColor(339,410,255,253,246,50) and isColor(353,227,255,14,22,50) then
            --         tiaoShi("仙踪林--40--0")
            --         touchClick(334,445,92,86,72)
            -- end
            mSleep(2000)
            if isColor(159, 362, 255, 254, 242) or isColor(419, 211, 255, 253, 249) then
                tiaoShi("在同一个地图")
                touchClick(35, 135, 174, 176, 179)
                if guaiWuDian == "1" then
                    touchClick(1010, 178, 78, 95, 112)
                elseif guaiWuDian == "2" then
                    touchClick(1010, 213, 23, 27, 35)
                elseif guaiWuDian == "3" then
                    touchClick(1010, 247, 24, 28, 39)
                elseif guaiWuDian == "4" then
                    touchClick(1010, 278, 103, 124, 145)
                elseif guaiWuDian == "5" then
                    touchClick(1013, 314, 92, 112, 130)
                elseif guaiWuDian == "6" then
                    touchClick(1012, 348, 29, 34, 47)
                elseif guaiWuDian == "7" then
                    touchClick(1014, 381, 78, 94, 113)
                elseif guaiWuDian == "8" then
                    touchClick(1014, 416, 29, 34, 47)
                elseif guaiWuDian == "9" then
                    touchClick(1012, 452, 29, 34, 47)
                elseif guaiWuDian == "10" then
                    touchClick(1011, 483, 29, 34, 47)
                else
                    touchMoveXY(1009, 485, 1015, 189)
                    touchMoveXY(1009, 485, 1015, 189)
                    mSleep(2000)
                    if guaiWuDian == "11" then
                        touchClick(1015, 492, 128, 155, 181)
                    elseif guaiWuDian == "12" then
                        touchClick(1020, 459, 111, 135, 157)
                    elseif guaiWuDian == "13" then
                        touchClick(1012, 425, 130, 158, 185)
                    elseif guaiWuDian == "14" then
                        touchClick(997, 390, 103, 125, 148)
                    elseif guaiWuDian == "15" then
                        touchClick(997, 356, 107, 129, 152)
                    elseif guaiWuDian == "16" then
                        touchClick(1004, 322, 30, 36, 49)
                    elseif guaiWuDian == "17" then
                        touchClick(1006, 288, 110, 134, 158)
                    elseif guaiWuDian == "18" then
                        touchClick(1010, 255, 120, 146, 171)
                    elseif guaiWuDian == "19" then
                        touchClick(1010, 220, 57, 68, 80)
                    elseif guaiWuDian == "20" then
                        touchClick(1009, 186, 19, 22, 30)
                    end
                end
                closeForever()
                tmpXuanXiang = string.find(zongHeXuanXiang1, "6")
                if tmpXuanXiang ~= nil then
                    touchClick(829, 593)
                end
                timeDingShiDianRenWu = nowTime
            else
                timeDingShiDianRenWu = nowTime - 60 * 10
            end
        end
    end
    if muBiaoA == mb_JiNeng then
        if zhuJieMian() and isColor(839, 591, 235, 230, 200, 5) then
            timeDingShiDianRenWu = nowTime - 60 * 60
        end
        if nowTime - timeDingShiDianRenWu >= 30 and zhuJieMian() then
            tiaoShi("点任务--检测BOSS")
            touchClick(1094, 49, 141, 133, 120) -- 地图
            mSleep(2000)
            touchClick(37, 227, 68, 67, 71) -- 世界地图
            mSleep(1000)
            -- 40,冰风谷,地下城,120,160,200,240,280,320,360,400
            -- 1a,1b,40a,40b,80a,80b,80c,80d,120a,120b
            if danXuan1 == "0" or danXuan1 == "1" then
                touchClick(159, 388, 80, 73, 53) -- 1级
            elseif danXuan1 == "2" or danXuan1 == "3" then
                touchClick(333, 445, 189, 187, 181) -- 40级
            elseif danXuan1 == "4" or danXuan1 == "5" then
                touchClick(212, 137, 234, 233, 232) -- 80级冰风谷
            elseif danXuan1 == "6" or danXuan1 == "7" then
                touchClick(373, 254, 119, 114, 103) -- 80级地下城
            elseif danXuan1 == "8" or danXuan1 == "9" then
                if nowDateTime.hour >= 18 or nowDateTime.hour <= 1 then
                    touchClick(159, 388, 80, 73, 53) -- 1级
                else
                    touchClick(212, 137, 234, 233, 232) -- 80级冰风谷
                end
            elseif danXuan1 == "10" or danXuan1 == "11" then
                if nowDateTime.hour >= 18 or nowDateTime.hour <= 1 then
                    touchClick(333, 445, 189, 187, 181) -- 40级
                else
                    touchClick(373, 254, 119, 114, 103) -- 80级地下城
                end
            end

            -- if isColor(553,165,255,255,255,50) and isColor(481,470,255,6,6,50) then
            --         tiaoShi("亚特兰蒂斯--120")
            --         touchClick(620,356,97,92,79)
            -- elseif isColor(480,467,255,254,248,50) and isColor(999,108,255,0,0,50) then
            --         tiaoShi("死亡沙漠--160")
            --         touchClick(548,205,233,209,136)
            -- elseif isColor(594,320,255,253,248,50) and isColor(534,190,255,0,0,50) then
            --         tiaoShi("帝纽特--80")
            --         touchClick(370,257,175,172,165)
            -- elseif isColor(353,225,255,255,253,50) and isColor(595,325,255,0,0,50) then
            --         tiaoShi("仙踪林--40")
            --         touchClick(334,445,92,86,72)
            -- elseif isColor(339,410,255,253,246,50) and isColor(353,227,255,14,22,50) then
            --         tiaoShi("仙踪林--40--0")
            --         touchClick(334,445,92,86,72)
            -- end
            mSleep(2000)
            if isColor(159, 362, 255, 254, 242) then
                tiaoShi("在同一个地图")
                touchClick(35, 135, 174, 176, 179)
                if danXuan1 == "0" then
                    numBoss = "10"
                elseif danXuan1 == "1" then
                    numBoss = "16"
                elseif danXuan1 == "2" then
                    numBoss = "9"
                elseif danXuan1 == "3" then
                    numBoss = "10"
                elseif danXuan1 == "4" then
                    numBoss = "9"
                elseif danXuan1 == "5" then
                    numBoss = "10"
                elseif danXuan1 == "6" then
                    numBoss = "3"
                elseif danXuan1 == "7" then
                    numBoss = "4"
                elseif danXuan1 == "8" then
                    if nowDateTime.hour >= 18 or nowDateTime.hour <= 1 then
                        numBoss = "10"
                    else
                        numBoss = "9"
                    end
                elseif danXuan1 == "9" then
                    if nowDateTime.hour >= 18 or nowDateTime.hour <= 1 then
                        numBoss = "16"
                    else
                        numBoss = "10"
                    end
                elseif danXuan1 == "10" then
                    if nowDateTime.hour >= 18 or nowDateTime.hour <= 1 then
                        numBoss = "9"
                    else
                        numBoss = "3"
                    end
                elseif danXuan1 == "11" then
                    if nowDateTime.hour >= 18 or nowDateTime.hour <= 1 then
                        numBoss = "10"
                    else
                        numBoss = "4"
                    end
                end
                if numBoss == "1" then
                    touchClick(1010, 178, 78, 95, 112)
                elseif numBoss == "2" then
                    touchClick(1010, 213, 23, 27, 35)
                elseif numBoss == "3" then
                    touchClick(1010, 247, 24, 28, 39)
                elseif numBoss == "4" then
                    touchClick(1010, 278, 103, 124, 145)
                elseif numBoss == "5" then
                    touchClick(1013, 314, 92, 112, 130)
                elseif numBoss == "6" then
                    touchClick(1012, 348, 29, 34, 47)
                elseif numBoss == "7" then
                    touchClick(1014, 381, 78, 94, 113)
                elseif numBoss == "8" then
                    touchClick(1014, 416, 29, 34, 47)
                elseif numBoss == "9" then
                    touchClick(1012, 452, 29, 34, 47)
                elseif numBoss == "10" then
                    touchClick(1011, 483, 29, 34, 47)
                else
                    touchMoveXY(1009, 485, 1015, 189)
                    touchMoveXY(1009, 485, 1015, 189)
                    mSleep(2000)
                    if numBoss == "11" then
                        touchClick(1015, 492, 128, 155, 181)
                    elseif numBoss == "12" then
                        touchClick(1020, 459, 111, 135, 157)
                    elseif numBoss == "13" then
                        touchClick(1012, 425, 130, 158, 185)
                    elseif numBoss == "14" then
                        touchClick(997, 390, 103, 125, 148)
                    elseif numBoss == "15" then
                        touchClick(997, 356, 107, 129, 152)
                    elseif numBoss == "16" then
                        touchClick(1004, 322, 30, 36, 49)
                    elseif numBoss == "17" then
                        touchClick(1006, 288, 110, 134, 158)
                    elseif numBoss == "18" then
                        touchClick(1010, 255, 120, 146, 171)
                    elseif numBoss == "19" then
                        touchClick(1010, 220, 57, 68, 80)
                    elseif numBoss == "20" then
                        touchClick(1009, 186, 19, 22, 30)
                    end
                end
                closeForever()
                timeDingShiDianRenWu = nowTime
            else
                timeDingShiDianRenWu = nowTime - 60
            end
        end
    end
end

-- 整理
function zhengLi(...)
    local tmpXuanXiang = string.find(duoXuan1, "3")
    if tmpXuanXiang == nil then
        local tmpTime = 10 * 60
        if muBiaoA1 == mb_ShiLianZhiDi then
            tmpTime = 2 * 60
        elseif muBiaoA2 == mb_JiNeng then
            tmpTime = 2 * 60
        else
            tmpTime = 10 * 60
        end
        if zhuJieMian() and nowTime - timeZhengLi >= tmpTime and muBiaoA3 == mb_Wu then
            timeZhengLi = nowTime
            writePlist(luaMuLu .. xiangMu .. ".plist", "timeZhengLi", timeZhengLi)
            muBiaoA3 = mb_ZhengLi
            muBiao3Con = mm_ZhengLi
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    end
end

-- 转职
function zhuanZhi(...)
    if zhuJieMian() and nowTime - timeZhuanZhi >= 10 * 60 and muBiaoA3 == mb_Wu then
        muBiaoA3 = mb_FixShip
        muBiao3Con = mm_FixShip
        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
        muBiaoZhuanHuan()
    end
end

-- 优化翅膀
function youHuaChiBang(...)
    if zhuJieMian() and nowTime - timeChiBang >= 10 * 60 and muBiaoA3 == mb_Wu and numFenZuan >= 300 and numJinBi >=
        1000000 and numJiaoSe == 0 then
        timeChiBang = nowTime
        writePlist(luaMuLu .. xiangMu .. ".plist", "timeChiBang", timeChiBang)
        muBiaoA3 = mb_ChiBang
        muBiao3Con = mm_ChiBang
        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
        muBiaoZhuanHuan()
    end
end

-- 优化称号
function youHuaChengHao(...)
    if zhuJieMian() and nowTime - timeChengHao >= 60 * 60 and muBiaoA3 == mb_Wu then
        timeChengHao = nowTime
        writePlist(luaMuLu .. xiangMu .. ".plist", "timeChengHao", timeChengHao)
        muBiaoA3 = mb_ChengHao
        muBiao3Con = mm_ChengHao
        writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
        muBiaoZhuanHuan()
    end
end

-- boss时间
function bossTime(...)
    -- if muBiao == mb_FaSongSiXin or muBiao == mb_DengDaiHuiFu  or muBiao == mb_DengDaiSiXin or muBiao == mb_DengDaiJiaoYi or muBiao == mb_QianWangJiaoYi or muBiao == mb_XiaoHaoZhengLi or muBiao == mb_JY_HuanJiaoSe or muBiao == mb_CangKuZhengLi then
    --         return
    -- end
    if string.find(zongHeXuanXiang1, "5") ~= nil then -- 测试
        return
    end
    if (muBiaoA == mb_FaSongSiXin or muBiaoA == mb_DengDaiHuiFu or muBiaoA == mb_QianWangJiaoYi or muBiaoA ==
        mb_XiaoHaoZhengLi or muBiaoA == mb_JY_HuanJiaoSe) and nowDateTime.hour >= 7 then
        return
    end
    if string.find(duoXuan1, "5") ~= nil then
        if nowDateTime.hour >= 8 then
            numBossTime = 6
        elseif (nowDateTime.hour == 0 or nowDateTime.hour == 24) and nowDateTime.min >= 50 then
            numBossTime = 4
        elseif nowDateTime.hour == 1 then
            numBossTime = 4
        else
            numBossTime = 5
        end
        -- numBossTime = 4
    elseif numQuanShu == 0 then
        numBossTime = 3
    elseif danXuan1 == "0" or danXuan1 == "1" or danXuan1 == "2" or danXuan1 == "3" then -- 40级
        -- if (nowDateTime.hour >= 9 and nowDateTime.hour <= 17) and nowDateTime.min >= 45 and nowDateTime.min < 55 then
        --         numBossTime = 1
        if (nowDateTime.hour >= 9 and nowDateTime.hour <= 17) and nowDateTime.min >= 55 then
            numBossTime = 2
        elseif (nowDateTime.hour >= 10 and nowDateTime.hour <= 18) and nowDateTime.min < 3 then
            numBossTime = 2
        elseif (nowDateTime.hour >= 10 and nowDateTime.hour <= 18) and nowDateTime.min >= 3 then
            numBossTime = 3
        elseif nowDateTime.hour == 1 and nowDateTime.min >= 3 and numBossTime ~= 5 then
            numBossTime = 4
        elseif (nowDateTime.hour >= 2 and nowDateTime.hour <= 7) or (nowDateTime.hour == 8 and nowDateTime.min < 30) then
            numBossTime = 5
            if muBiaoA3 ~= mb_Wu then
                numJiaoSe = 0
                writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                numJiaoYi = 0
                writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
                gaiMuBiao(1, mb_YouHua, mm_YouHua)
                gaiMuBiao(3, mb_Wu, mm_Wu)
                closeApp(appXiangMu)
                mSleep(3000)
            end
        else
            numBossTime = 3
        end
    elseif danXuan1 == "4" or danXuan1 == "5" or danXuan1 == "6" or danXuan1 == "7" then -- 80级
        -- if (nowDateTime.hour == 12 or  nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21 or nowDateTime.hour == 24 or nowDateTime.hour == 0) and nowDateTime.min >= 45 and nowDateTime.min < 55 then
        --         numBossTime = 1
        -- elseif (nowDateTime.hour == 14 or  nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and nowDateTime.min >= 15 and nowDateTime.min < 25 then
        --         numBossTime = 1
        if (nowDateTime.hour == 12 or nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21 or
            nowDateTime.hour == 24 or nowDateTime.hour == 0) and nowDateTime.min >= 55 then
            numBossTime = 2
        elseif (nowDateTime.hour == 13 or nowDateTime.hour == 16 or nowDateTime.hour == 19 or nowDateTime.hour == 22 or
            nowDateTime.hour == 1) and nowDateTime.min < 3 then
            numBossTime = 2
        elseif (nowDateTime.hour == 14 or nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and
            nowDateTime.min >= 25 and nowDateTime.min < 33 then
            numBossTime = 2
        elseif (nowDateTime.hour == 13 or nowDateTime.hour == 16 or nowDateTime.hour == 19 or nowDateTime.hour == 22 or
            nowDateTime.hour == 1) and nowDateTime.min >= 3 then
            numBossTime = 3
        elseif (nowDateTime.hour == 14 or nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and
            nowDateTime.min >= 33 then
            numBossTime = 3
        elseif nowDateTime.hour == 1 and nowDateTime.min >= 3 and numBossTime ~= 5 then
            numBossTime = 4
        elseif (nowDateTime.hour >= 2 and nowDateTime.hour <= 7) or (nowDateTime.hour == 8 and nowDateTime.min < 15) then
            numBossTime = 5
            if muBiaoA3 ~= mb_Wu then
                numJiaoSe = 0
                writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                numJiaoYi = 0
                writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
                gaiMuBiao(1, mb_YouHua, mm_YouHua)
                gaiMuBiao(3, mb_Wu, mm_Wu)
                closeApp(appXiangMu)
                mSleep(3000)
            end
        else
            numBossTime = 3
        end
    elseif danXuan1 == "8" or danXuan1 == "9" or danXuan1 == "10" or danXuan1 == "11" then -- 4080级
        -- if nowDateTime.hour == 9 and nowDateTime.min >= 45 and nowDateTime.min < 55 then
        --         numBossTime = 1
        -- elseif nowDateTime.hour == 11 and nowDateTime.min >= 15 and nowDateTime.min < 25 then
        --         numBossTime = 1
        -- elseif (nowDateTime.hour >= 18 or nowDateTime.hour < 1) and nowDateTime.min >= 45 and nowDateTime.min < 55 then
        --         numBossTime = 1
        if nowDateTime.hour == 9 and nowDateTime.min >= 55 then
            numBossTime = 2
        elseif nowDateTime.hour == 10 and nowDateTime.min < 3 then
            numBossTime = 2
        elseif nowDateTime.hour == 11 and nowDateTime.min >= 25 and nowDateTime.min < 33 then
            numBossTime = 2
        elseif (nowDateTime.hour >= 18 or nowDateTime.hour < 1) and nowDateTime.min >= 55 then
            numBossTime = 2
        elseif (nowDateTime.hour >= 19 or nowDateTime.hour < 2) and nowDateTime.min < 3 then
            numBossTime = 2
        elseif nowDateTime.hour == 10 and nowDateTime.min >= 3 then
            numBossTime = 3
        elseif nowDateTime.hour == 11 and nowDateTime.min >= 33 then
            numBossTime = 3
        elseif (nowDateTime.hour >= 19 or nowDateTime.hour < 2) and nowDateTime.min >= 3 then
            numBossTime = 3
        elseif nowDateTime.hour == 1 and nowDateTime.min >= 3 and numBossTime ~= 5 then
            numBossTime = 4
        elseif (nowDateTime.hour >= 2 and nowDateTime.hour <= 7) or (nowDateTime.hour == 8 and nowDateTime.min < 5) then
            numBossTime = 5
            if muBiaoA3 ~= mb_Wu then
                numJiaoSe = 0
                writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                numJiaoYi = 0
                writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
                gaiMuBiao(1, mb_YouHua, mm_YouHua)
                gaiMuBiao(3, mb_Wu, mm_Wu)
                closeApp(appXiangMu)
                mSleep(3000)
            end
        else
            numBossTime = 3
        end
    end
    -- if numQuanShu == 0 then
    --         numBossTime = 3
    -- elseif danXuan1 == "0" or danXuan1 == "1" or danXuan1 == "2" or danXuan1 == "3" then--40级
    --         if (nowDateTime.hour >= 9 and nowDateTime.hour <= 12) and nowDateTime.min >= 45 and nowDateTime.min < 55 then
    --                 numBossTime = 1
    --         elseif (nowDateTime.hour >= 9 and nowDateTime.hour <= 12) and nowDateTime.min >= 55 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour >= 10 and nowDateTime.hour <= 12) and nowDateTime.min < 3 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour >= 10 and nowDateTime.hour <= 12) and nowDateTime.min >= 3 then
    --                 numBossTime = 3
    --         elseif nowDateTime.hour == 13 and nowDateTime.min >= 45 and numBossTime ~= 5 then
    --                 numBossTime = 4
    --         elseif nowDateTime.hour >= 14 then
    --                 numBossTime = 5
    --         else
    --                 numBossTime = 3
    --         end
    -- elseif danXuan1 == "4" or danXuan1 == "5" or danXuan1 == "6" or danXuan1 == "7" then--80级
    --         if (nowDateTime.hour == 12 or  nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21 or nowDateTime.hour == 24 or nowDateTime.hour == 0) and nowDateTime.min >= 45 and nowDateTime.min < 55 then
    --                 numBossTime = 1
    --         elseif (nowDateTime.hour == 14 or  nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and nowDateTime.min >= 15 and nowDateTime.min < 25 then
    --                 numBossTime = 1
    --         elseif (nowDateTime.hour == 12 or  nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21 or nowDateTime.hour == 24 or nowDateTime.hour == 0) and nowDateTime.min >= 55 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour == 13 or  nowDateTime.hour == 16 or nowDateTime.hour == 19 or nowDateTime.hour == 22 or nowDateTime.hour == 1) and nowDateTime.min < 3 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour == 14 or  nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and nowDateTime.min >= 25 and nowDateTime.min < 33 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour == 13 or  nowDateTime.hour == 16 or nowDateTime.hour == 19 or nowDateTime.hour == 22 or nowDateTime.hour == 1) and nowDateTime.min >= 3 then
    --                 numBossTime = 3
    --         elseif (nowDateTime.hour == 14 or  nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and nowDateTime.min >= 33 then
    --                 numBossTime = 3
    --         elseif nowDateTime.hour == 1 and nowDateTime.min >= 3 and numBossTime ~= 5 then
    --                 numBossTime = 4
    --         elseif (nowDateTime.hour >= 2 and nowDateTime.hour <= 8) or (nowDateTime.hour == 9 and nowDateTime.min < 5) then
    --                 numBossTime = 5
    --         else
    --                 numBossTime = 3
    --         end
    -- elseif danXuan1 == "8" or danXuan1 == "9" or danXuan1 == "10" or danXuan1 == "11" then--4080级
    --         if nowDateTime.hour == 9 and nowDateTime.min >= 45 and nowDateTime.min < 55 then
    --                 numBossTime = 1
    --         elseif nowDateTime.hour == 11 and nowDateTime.min >= 15 and nowDateTime.min < 25 then
    --                 numBossTime = 1
    --         elseif (nowDateTime.hour >= 18 or nowDateTime.hour < 1) and nowDateTime.min >= 45 and nowDateTime.min < 55 then
    --                 numBossTime = 1
    --         elseif nowDateTime.hour == 9 and nowDateTime.min >= 55 then
    --                 numBossTime = 2
    --         elseif nowDateTime.hour == 10 and nowDateTime.min < 3 then
    --                 numBossTime = 2
    --         elseif nowDateTime.hour == 11 and nowDateTime.min >= 25 and nowDateTime.min < 33 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour >= 18 or nowDateTime.hour < 1) and nowDateTime.min >= 55 then
    --                 numBossTime = 2
    --         elseif (nowDateTime.hour >= 19 or nowDateTime.hour < 2) and nowDateTime.min < 3 then
    --                 numBossTime = 2
    --         elseif nowDateTime.hour == 10 and nowDateTime.min >= 3 then
    --                 numBossTime = 3
    --         elseif nowDateTime.hour == 11 and nowDateTime.min >= 33 then
    --                 numBossTime = 3
    --         elseif (nowDateTime.hour >= 19 or nowDateTime.hour < 2) and nowDateTime.min >= 3 then
    --                 numBossTime = 3
    --         elseif nowDateTime.hour == 1 and nowDateTime.min >= 3 and numBossTime ~= 5 then
    --                 numBossTime = 4
    --         elseif (nowDateTime.hour >= 2 and nowDateTime.hour <= 7) or (nowDateTime.hour == 8 and nowDateTime.min < 5) then
    --                 numBossTime = 5
    --         else
    --                 numBossTime = 3
    --         end
    -- end
    -- if numBossTime == 1 and muBiao1 ~= mb_GuaJi then
    --         muBiao1 = mb_GuaJi
    --         muBiao1Con = mm_GuaJi
    --         writeConfig(State["Bid"].."_Set.dat",mbCon1,muBiao1Con)
    --         muBiaoZhuanHuan()
    --         timeDingShiDianRenWu = nowTime - 60 * 60
    if numBossTime == 2 and muBiaoA2 ~= mb_JiNeng and muBiaoA2 ~= mb_YouHua then
        gaiMuBiao(2, mb_JiNeng, mm_JiNeng)
        timeDingShiDianRenWu = nowTime - 60 * 60
        -- timeZhengLi = nowTime - 10 * 60
    elseif numBossTime == 3 and muBiaoA2 == mb_JiNeng then
        gaiMuBiao(3, mb_HuanJiaoSe, mm_HuanJiaoSe)
        gaiMuBiao(2, mb_Wu, mm_Wu)
        timeDingShiDianRenWu = nowTime - 60 * 60
        numJiaoSe = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
    elseif numBossTime == 4 and muBiaoA ~= mb_FaSongSiXin and muBiaoA ~= mb_DengDaiHuiFu and muBiaoA ~= mb_DengDaiSiXin and
        muBiaoA ~= mb_DengDaiJiaoYi and muBiaoA ~= mb_QianWangJiaoYi and muBiaoA ~= mb_XiaoHaoZhengLi and muBiaoA ~=
        mb_JY_HuanJiaoSe and muBiaoA ~= mb_CangKuZhengLi then
        if string.find(duoXuan1, "5") ~= nil then
            gaiMuBiao(3, mb_DengDaiSiXin, mm_DengDaiSiXin)
        else
            gaiMuBiao(3, mb_FaSongSiXin, mm_FaSongSiXin)
        end
        -- elseif numBossTime == 6 and string.find(duoXuan1,"9") ~= nil then
        --         gaiMuBiao(3,mb_MaiShu,mm_MaiShu)
    elseif numBossTime == 6 and danXuan4 ~= "0" then
        gaiMuBiao(3, mb_MaiShu, mm_MaiShu)
    end
    if numBossTime == 2 then
        if fuBenNei() then
            tuiChuFuBen()
        end
    end
end

-- 换角色时间
function huanJiaoSeTime(...)
    if numQuanShu ~= 0 then
        if danXuan1 == "0" or danXuan1 == "1" or danXuan1 == "2" or danXuan1 == "3" then -- 40级
            if nowDateTime.hour >= 9 and nowDateTime.hour <= 17 and nowDateTime.min >= 55 then
                if nowDateTime.hour >= 9 and nowDateTime.hour <= 11 and numJiaoSe ~= 1 then
                    numJiaoSe = 1
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif nowDateTime.hour >= 12 and nowDateTime.hour <= 14 and numJiaoSe ~= 2 then
                    numJiaoSe = 2
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif nowDateTime.hour >= 15 and nowDateTime.hour <= 17 and numJiaoSe ~= 3 then
                    numJiaoSe = 3
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                end
            end
        elseif danXuan1 == "4" or danXuan1 == "5" or danXuan1 == "6" or danXuan1 == "7" then -- 80级
            if (nowDateTime.hour == 12 or nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21 or
                nowDateTime.hour == 0 or nowDateTime.hour == 24) and nowDateTime.min >= 55 then
                if (nowDateTime.hour == 12 or nowDateTime.hour == 15) and numJiaoSe ~= 1 then
                    numJiaoSe = 1
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif nowDateTime.hour == 18 and numJiaoSe ~= 2 then
                    numJiaoSe = 2
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif (nowDateTime.hour == 21 or nowDateTime.hour == 0 or nowDateTime.hour == 24) and numJiaoSe ~= 3 then
                    numJiaoSe = 3
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                end
            elseif (nowDateTime.hour == 14 or nowDateTime.hour == 17 or nowDateTime.hour == 20 or nowDateTime.hour == 23) and
                nowDateTime.min >= 25 and nowDateTime.min < 30 then
                if nowDateTime.hour == 14 and numJiaoSe ~= 1 then
                    numJiaoSe = 1
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif (nowDateTime.hour == 17 or nowDateTime.hour == 20) and numJiaoSe ~= 2 then
                    numJiaoSe = 2
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif nowDateTime.hour == 23 and numJiaoSe ~= 3 then
                    numJiaoSe = 3
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                end
            end
        elseif danXuan1 == "8" or danXuan1 == "9" or danXuan1 == "10" or danXuan1 == "11" then -- 4080级
            if (nowDateTime.hour == 9 or nowDateTime.hour == 18 or nowDateTime.hour == 19 or nowDateTime.hour == 20 or
                nowDateTime.hour == 21 or nowDateTime.hour == 22 or nowDateTime.hour == 23 or nowDateTime.hour == 24 or
                nowDateTime.hour == 0) and nowDateTime.min >= 55 then
                if (nowDateTime.hour == 9 or nowDateTime.hour == 18) and numJiaoSe ~= 1 then
                    numJiaoSe = 1
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif (nowDateTime.hour == 19 or nowDateTime.hour == 20 or nowDateTime.hour == 21) and numJiaoSe ~= 2 then
                    numJiaoSe = 2
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                elseif (nowDateTime.hour == 22 or nowDateTime.hour == 23 or nowDateTime.hour == 24 or nowDateTime.hour ==
                    0) and numJiaoSe ~= 3 then
                    numJiaoSe = 3
                    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                    muBiaoA3 = mb_HuanJiaoSe
                    muBiao3Con = mm_HuanJiaoSe
                    writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                    muBiaoZhuanHuan()
                    huanJiaoSeChongZhi()
                end
            elseif nowDateTime.hour == 11 and nowDateTime.min >= 25 and nowDateTime.min < 30 and numJiaoSe ~= 1 then
                numJiaoSe = 1
                writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
                muBiaoA3 = mb_HuanJiaoSe
                muBiao3Con = mm_HuanJiaoSe
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
                huanJiaoSeChongZhi()
            end
        end
    end
end

-- 切换目标
function qieHuanMuBiao(...)
    if numQuanShu == 0 then
        isBossTime = false
    elseif (nowDateTime.hour == 9 and nowDateTime.min >= 45) or nowDateTime.hour >= 10 or nowDateTime.hour == 0 or
        (nowDateTime.hour == 1 and nowDateTime.min <= 10) then
        isBossTime = true
    else
        isBossTime = false
    end
    if muBiaoA == mb_ChuHang or muBiaoA == mb_FixShip or muBiaoA == mb_HuanJiaoSe or muBiaoA == mb_JY_HuanJiaoSe or muBiaoA ==
        mb_YouHua or muBiaoA == mb_ChiBang then
        if isColor(13, 82, 123, 30, 11, 5) and isColor(83, 24, 114, 113, 127, 5) then -- 有战斗力
            touchClick(42, 35, 121, 35, 24) -- 头像
        end
    elseif muBiaoA == mb_ZhengLi or muBiaoA == mb_ZhengLiMaiLan or muBiaoA == mb_ChengHao or muBiaoA == mb_CangKuZhengLi or
        muBiaoA == mb_XiaoHaoZhengLi then
        if isColor(13, 82, 123, 30, 11, 5) and isColor(83, 24, 114, 113, 127, 5) then -- 有战斗力
            touchClick(768, 595, 128, 113, 92) -- 背包
        elseif isColor(13, 82, 122, 30, 10, 5) and isColor(83, 24, 120, 118, 129, 5) then
            touchClick(768, 595, 128, 113, 92) -- 背包
        end
    elseif muBiaoA == mb_JiaHaoYou and string.find(duoXuan1, "5") == nil then
        if isColor(13, 82, 123, 30, 11, 5) and isColor(83, 24, 114, 113, 127, 5) then -- 有战斗力
            touchClick(374, 595, 173, 158, 137) -- 好友
        end
    elseif muBiaoA == mb_JiaHaoYou and string.find(duoXuan1, "5") ~= nil then
        if isColor(13, 82, 123, 30, 11, 5) and isColor(83, 24, 114, 113, 127, 5) and isColor(396, 587, 255, 88, 54) then -- 有战斗力和好友红点
            touchClick(374, 595, 173, 158, 137) -- 好友
        end
    elseif muBiaoA == mb_MaiLan then
        if isColor(13, 82, 123, 30, 11, 5) and isColor(83, 24, 114, 113, 127, 5) then -- 有战斗力
            touchClick(685, 503, 255, 255, 254) -- 药不足图标
            mSleep(5000)
            for i = 1, 5 do
                touchClick(969, 153, 0, 27, 170) -- 蓝药
                if isColor(663, 483, 36, 49, 58) then
                    touchClick(710, 479, 42, 55, 75) -- 最大
                    touchClick(600, 568, 238, 234, 229) -- 购买
                elseif isColor(615, 475, 33, 49, 52) then
                    touchClick(663, 470, 85, 112, 154) -- 最大
                    touchClick(585, 554, 179, 146, 100) -- 购买
                else -- 旧
                    touchClick(662, 430, 68, 74, 83) -- 最大
                    touchClick(739, 463, 85, 97, 137) -- 购买
                end
                mSleep(2000)
                if isColor(704, 169, 188, 183, 178) then
                    tiaoShi("金币不足")
                    touchClick(31, 20)
                    touchClick(31, 20)
                    break
                end
                touchClick(31, 20) -- 空白
            end
            closeForever()
            muBiaoA3 = mb_Wu
            muBiao3Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    end
    -- if (nowDateTime.hour == 9 or nowDateTime.hour == 12 or nowDateTime.hour == 15 or nowDateTime.hour == 18 or nowDateTime.hour == 21) and nowDateTime.min >= 6 and nowDateTime.min <= 35 and numTieXue < 2 and muBiao2 == mb_Wu and (muBiao1 ~= mb_FuBen and muBiao1 ~= mb_JingYan and muBiao1 ~= mb_ShiLianZhiDi and muBiao1 ~= mb_WanMoTa and muBiao1 ~= mb_JinBi and muBiao1 ~= mb_ZhanMengRiChang) then
    --         tiaoShi("铁血9,12,15,18,21")
    --         muBiao2 = mb_TieXue
    --         muBiao2Con = mm_TieXue
    --         writeConfig(State["Bid"].."_Set.dat",mbCon2,muBiao2Con)
    --         muBiaoZhuanHuan()
    -- elseif (nowDateTime.min == 0 or nowDateTime.min == 30) and numXueSe < 3 and muBiao2 == mb_Wu and isBossTime == false and (muBiao1 ~= mb_FuBen and muBiao1 ~= mb_JingYan and muBiao1 ~= mb_ShiLianZhiDi and muBiao1 ~= mb_WanMoTa and muBiao1 ~= mb_JinBi and muBiao1 ~= mb_ZhanMengRiChang) then
    --         tiaoShi("00分30分血色")
    --         muBiao2 = mb_XueSe
    --         muBiao2Con = mm_XueSe
    --         writeConfig(State["Bid"].."_Set.dat",mbCon2,muBiao2Con)
    --         muBiaoZhuanHuan()
    -- elseif (nowDateTime.min == 15 or nowDateTime.min == 45) and numEMo < 3 and muBiao2 == mb_Wu and isBossTime == false and (muBiao1 ~= mb_FuBen and muBiao1 ~= mb_JingYan and muBiao1 ~= mb_ShiLianZhiDi and muBiao1 ~= mb_WanMoTa and muBiao1 ~= mb_JinBi and muBiao1 ~= mb_ZhanMengRiChang) then
    --         tiaoShi("15分45分恶魔")
    --         muBiao2 = mb_EMo
    --         muBiao2Con = mm_EMo
    --         writeConfig(State["Bid"].."_Set.dat",mbCon2,muBiao2Con)
    --         muBiaoZhuanHuan()
    -- end
end

-- 目标转换
function muBiaoZhuanHuan(...)
    if muBiaoA3 ~= mb_Wu then
        muBiaoA = muBiaoA3
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoA2 ~= mb_Wu then
        muBiaoA = muBiaoA2
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoA1 ~= mb_Wu then
        muBiaoA = muBiaoA1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    else
        muBiaoA1 = mb_GuaJi
        muBiao1Con = mm_GuaJi
        writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
        muBiaoA = muBiaoA1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    end
end

-- 买药
function maiYao(...)
    if muBiaoA3 ~= mb_HuanJiaoSe and muBiaoA3 ~= mb_JY_HuanJiaoSe and muBiaoA3 ~= mb_MaiLan and nowTime - timeMaiLan >= 10 *
        60 then
        if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and isColor(18, 446, 181, 179, 159, 5) and
            isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
            if isColor(78, 45, 22, 88, 183, 5) and isColor(95, 45, 48, 45, 55, 5) then
                tiaoShi("蓝不足--ios7")
                timeMaiLan = nowTime
                muBiaoA3 = mb_ZhengLiMaiLan
                muBiao3Con = mm_ZhengLiMaiLan
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            elseif isColor(77, 45, 30, 104, 200, 5) and isColor(95, 45, 45, 42, 50, 5) then
                tiaoShi("蓝不足--新")
                timeMaiLan = nowTime
                muBiaoA3 = mb_ZhengLiMaiLan
                muBiao3Con = mm_ZhengLiMaiLan
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            elseif isColor(77, 45, 33, 81, 170, 5) and isColor(95, 45, 45, 42, 50, 5) then
                tiaoShi("蓝不足")
                timeMaiLan = nowTime
                muBiaoA3 = mb_ZhengLiMaiLan
                muBiao3Con = mm_ZhengLiMaiLan
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            elseif isColor(77, 45, 8, 93, 203, 5) and isColor(95, 45, 44, 43, 53) then
                tiaoShi("蓝不足-旧")
                timeMaiLan = nowTime
                muBiaoA3 = mb_ZhengLiMaiLan
                muBiao3Con = mm_ZhengLiMaiLan
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
            elseif isColor(77, 45, 18, 95, 193, 5) and isColor(95, 45, 41, 44, 49, 5) then
                tiaoShi("蓝不足--0621")
                timeMaiLan = nowTime
                muBiaoA3 = mb_ZhengLiMaiLan
                muBiao3Con = mm_ZhengLiMaiLan
                writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
                muBiaoZhuanHuan()
                -- touchClick(685,503,255,255,254)--药不足图标
                -- mSleep(5000)
                -- for i=1,5 do
                --         touchClick(969,153,0,27,170)--蓝药
                --         touchClick(662,430,68,74,83)--最大
                --         touchClick(739,463,85,97,137)--购买
                --         mSleep(2000)
                --         touchClick(562,610,67,68,69)--空白
                -- end
                -- closeForever()
            end
        end
    end

end

-- 战力
function zhanLi(...)
    by.UseDict(dictZL)
    local tmpZhanLi = by.Ocr(132, 5, 203, 24, 0xfaf3b0, 0x555555, 0.83)
    tmpZhanLi = tonumber(tmpZhanLi)
    if type(tmpZhanLi) == "number" then
        dialog(tmpZhanLi, 0)
        lua_exit()
    else
        dialog("失败", 0)
    end

end

-- 组队
function zuDui(...)
    if isColor(6, 282, 79, 88, 106) then -- 队伍不亮
        touchClick(6, 282, 79, 88, 106) -- 队伍
        mSleep(3000)
        if isColor(861, 192, 94, 113, 154) then
            touchClick(861, 192, 94, 113, 154) -- 申请入队
        end
        if isColor(863, 272, 94, 116, 159) then
            touchClick(863, 272, 94, 116, 159) -- 申请入队
        end
        if isColor(863, 354, 94, 116, 159) then
            touchClick(863, 354, 94, 116, 159) -- 申请入队
        end
        if isColor(859, 434, 103, 124, 165) then
            touchClick(859, 434, 103, 124, 165) -- 申请入队
        end
        if isColor(989, 107, 255, 239, 205) then
            touchClick(989, 107, 255, 239, 205) -- 关闭
        end
    end
end

-- 离队
function liDui(...)
    if zhuJieMian() and isDuiWuing == true then
        touchClick(14, 304, 133, 42, 15) -- 队伍
        touchClick(14, 304, 133, 42, 15) -- 队伍
        if isColor(706, 518, 95, 124, 167) then
            touchClick(706, 518, 95, 124, 167) -- 离开队伍
        elseif isColor(562, 518, 97, 126, 168) then
            touchClick(562, 518, 97, 126, 168) -- 离开队伍
        elseif isColor(845, 517, 100, 127, 170) then
            touchClick(845, 517, 100, 127, 170) -- 离开队伍
        end
        if isColor(651, 395, 166, 122, 66) then
            touchClick(651, 395, 166, 122, 66) -- 确定离开
        end
        isDuiWuing = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "isDuiWuing", isDuiWuing)
        touchClick(1048, 115, 133, 126, 112)
        if muBiaoA2 == mb_CaiJi then
            numEMo = numEMo + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "恶魔次数", numEMo)
            isEMo = false
            writePlist(luaMuLu .. xiangMu .. ".plist", "isEMo", isEMo)
            muBiaoA2 = mb_Wu
            muBiao2Con = mm_Wu
            writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
            muBiaoZhuanHuan()
        end
    end
end

-- 微信维护
function weiXinWeiHu(...)
    local tmpXuanXiang = string.find(duoXuan1, "4")
    if tmpXuanXiang ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and nowDateTime.min >=
        minWeiXin then
        bid = frontAppBid()
        if bid ~= appWeiXin then
            runApp(appWeiXin)
            mSleep(2000)
        else
            if isColor(1063, 559, 26, 173, 25, 5) and isColor(1089, 562, 26, 173, 25, 5) and
                isColor(1066, 79, 249, 249, 249, 9) then
                tiaoShi("微信界面")
                touchClick(1068, 401, 248, 248, 248) -- 通讯录
            elseif isColor(1061, 403, 26, 173, 25, 5) and isColor(1091, 403, 26, 173, 25, 5) and
                isColor(1066, 79, 249, 249, 249, 9) then
                tiaoShi("通讯录界面")
                touchMoveXY(185, 307, 795, 324)
                mSleep(2000)
                touchClick(169, 300, 255, 255, 255) -- 搜索
                mSleep(1000)
                inputText("Hmily")
                mSleep(1000)
                touchClick(273, 445, 64, 160, 74) -- hmily
                mSleep(3000)
                touchClick(1086, 354, 252, 252, 252) -- 输入框
                inputText(randomString(16, 7))
                mSleep(1000)
                touchClick(1091, 283, 0, 0, 0) -- 空格
                touchClick(982, 36, 0, 0, 0) -- 删除
                touchClick(1091, 78, 167, 177, 189) -- 回车
                mSleep(3000)
                closeApp(appWeiXin)
                mSleep(1000)
                runApp(appXiangMu)
                mSleep(1000)
                isWeiXinWeiHu = true
                writePlist(luaMuLu .. xiangMu .. ".plist", "微信维护", isWeiXinWeiHu)
            elseif isColor(1061, 242, 26, 173, 25, 5) and isColor(1093, 236, 26, 173, 25, 5) and
                isColor(1066, 79, 249, 249, 249, 9) then
                tiaoShi("发现界面")
                touchClick(1068, 401, 248, 248, 248) -- 通讯录
            elseif isColor(1061, 80, 26, 173, 25, 5) and isColor(1094, 81, 26, 173, 25, 5) and
                isColor(1086, 232, 249, 249, 249, 9) then
                tiaoShi("我界面")
                touchClick(1068, 401, 248, 248, 248) -- 通讯录
            elseif isColor(71, 602, 255, 255, 255, 5) and isColor(84, 614, 255, 255, 255, 5) and
                isColor(98, 601, 255, 255, 255, 5) and isColor(84, 606, 55, 54, 59, 5) then
                tiaoShi("左上角返回")
                touchClick(84, 568, 159, 159, 161) -- 返回
            elseif isColor(75, 138, 142, 142, 147, 5) and isColor(92, 137, 142, 142, 147, 5) then
                tiaoShi("搜索界面")
                touchClick(84, 53, 239, 239, 244)
            else
                closeApp(appWeiXin)
                mSleep(2000)
                runApp(appWeiXin)
                mSleep(10000)
            end
        end
    end
end

-- 加好友
function jiaHaoYou(...)
    local tmpXuanXiang = string.find(duoXuan1, "6")
    if tmpXuanXiang ~= nil then -- 加好友
        if muBiaoA3 ~= mb_JiaHaoYou and muBiaoA3 ~= mb_HuanJiaoSe and muBiaoA3 ~= mb_JY_HuanJiaoSe then
            muBiaoA3 = mb_JiaHaoYou
            muBiao3Con = mm_JiaHaoYou
            writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
            muBiaoZhuanHuan()
        end
    end
end

-- -- 改目标--旧
-- function gaiMuBiao(cs_num, cs_muBiao, cs_muBiao_mm)
--     mbCon1, mbCon2, mbCon3 = 3, 4, 5
--     if cs_num == 1 then
--         muBiao1 = cs_muBiao
--         muBiao1Con = cs_muBiao_mm
--         writeConfig(State["Bid"] .. "_Set.dat", mbCon1, muBiao1Con)
--         muBiaoZhuanHuan()
--     elseif cs_num == 2 then
--         muBiao2 = cs_muBiao
--         muBiao2Con = cs_muBiao_mm
--         writeConfig(State["Bid"] .. "_Set.dat", mbCon2, muBiao2Con)
--         muBiaoZhuanHuan()
--     elseif cs_num == 3 then
--         muBiao3 = cs_muBiao
--         muBiao3Con = cs_muBiao_mm
--         writeConfig(State["Bid"] .. "_Set.dat", mbCon3, muBiao3Con)
--         muBiaoZhuanHuan()
--     end
-- end
-- 识别金币
function shiBieJinBi(...)
    if version == "2.2.4" then
        numJinBi = ocrText(973, 14, 1090, 34, 20);  -- OCR 英文识别，注意本函数仅对标准字体识别尚可，非标准字体请自行制作字库配合触动点阵识别函数效果更佳
    else
        whitelist = "0123456789"
        numJinBi = ocrText(973, 14, 1090, 34, 0, whitelist);
    end
    numJinBi = tonumber(numJinBi)
    if numJinBi ~= nil then
        writePlist(luaMuLu .. xiangMu .. ".plist", "金币", numJinBi)
    else
        numJinBi = loadPlist(luaMuLu .. xiangMu .. ".plist", "金币")
    end
end

-- 识别蓝钻
function shiBieLanZuan(...)
    local recognize = ""
    if version == "2.2.4" then
        recognize = ocrText(279, 170, 347, 198, 20);  -- OCR 英文识别，注意本函数仅对标准字体识别尚可，非标准字体请自行制作字库配合触动点阵识别函数效果更佳
    else
        recognize = ocrText(279, 170, 347, 198, 0);
    end
    mSleep(1000);
    return tonumber(recognize)
end

-- 识别粉钻
function shiBieFenZuan(...)
    -- local tmpIndex = 1
    -- if version == "2.2.4" then
    --         tmpIndex = addDmOcrDict("qiji_jinbi.txt")--生成的字库文件格式必须为 UTF-8 格式，字库首尾不能包含空行、空格等
    -- else
    --         tmpIndex = addDmOcrDictEx(jinBiDict)
    -- end
    -- numFenZuan = dmOcrText(tmpIndex,783,14,838,34,"ffffff,5b5b5b",80)--由于大漠工具的 11 行像素限制，对于较大文字识别效率不高，推荐使用触动字库工具配合触动文字识别函数使用效果更佳
    -- numFenZuan = tonumber(numFenZuan)
    -- if numFenZuan ~= nil then
    --         writePlist(luaMuLu..xiangMu..".plist","粉钻",numFenZuan)
    -- else
    --         numFenZuan = loadPlist(luaMuLu..xiangMu..".plist","粉钻")
    -- end

    if version == "2.2.4" then
        numFenZuan = ocrText(783, 14, 838, 34, 20);  -- OCR 英文识别，注意本函数仅对标准字体识别尚可，非标准字体请自行制作字库配合触动点阵识别函数效果更佳
    else
        whitelist = "0123456789"
        numFenZuan = ocrText(783, 14, 838, 34, 0, whitelist);
    end
    numFenZuan = tonumber(numFenZuan)
    if numFenZuan ~= nil then
        writePlist(luaMuLu .. xiangMu .. ".plist", "粉钻", numFenZuan)
    else
        numFenZuan = loadPlist(luaMuLu .. xiangMu .. ".plist", "粉钻")
    end
end

-- 小号换角色
function xiaoHaoHuanJiaoSe(...)
    numJiaoSe = numJiaoSe + 1
    if numJiaoSe >= 4 then
        numJiaoSe = 1
    end
    writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
    gaiMuBiao(3, mb_JY_HuanJiaoSe, mm_JY_HuanJiaoSe)
    numJiaoYi = numJiaoYi + 1
    if numJiaoYi >= 3 then
        numJiaoSe = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
        numJiaoYi = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
        gaiMuBiao(1, mb_YouHua, mm_YouHua)
        gaiMuBiao(3, mb_Wu, mm_Wu)
        closeApp(appXiangMu)
        mSleep(3000)
        numBossTime = 5
    end
    writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
    timeXiaoHao = nowTime
end

-- 小号
function xiaoHao(...)
    if (isColor(203, 531, 96, 117, 158, 5) and isColor(441, 529, 90, 90, 91, 5) and isColor(189, 377, 127, 230, 253, 5)) or
        (isColor(203, 531, 98, 117, 157, 5) and isColor(441, 529, 90, 90, 90, 5) and isColor(189, 377, 135, 244, 251, 5)) or
        (isColor(203, 531, 98, 117, 158, 5) and isColor(441, 529, 91, 91, 91, 5) and isColor(189, 377, 145, 247, 252, 5)) then
        if string.find(duoXuan1, "5") == nil then
            tiaoShi("交易框--未锁定--小号")
            gaiMuBiao(3, mb_QianWangJiaoYi, mm_QianWangJiaoYi)
        end
    end
    if (isColor(436, 527, 87, 124, 172, 5) and isColor(267, 525, 94, 94, 95, 5)) or
        (isColor(436, 527, 88, 124, 171, 5) and isColor(267, 525, 94, 94, 94, 5)) then
        if string.find(duoXuan1, "5") == nil then
            tiaoShi("交易框--未交易--小号")
            gaiMuBiao(3, mb_QianWangJiaoYi, mm_QianWangJiaoYi)
        end
    end
    if muBiaoA == mb_FaSongSiXin then -- 发送私信
        if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and isColor(18, 446, 181, 179, 159, 5) and
            isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
            tiaoShi("好友")
            touchClick(375, 596, 189, 174, 152) -- 好友
            mSleep(1000)
            timeFaSongSiXin = nowTime
        end
    end
    if muBiaoA == mb_DengDaiHuiFu then -- 等待回复

        if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and isColor(18, 446, 181, 179, 159, 5) and
            isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
            if isColor(717, 540, 255, 117, 88) or isColor(717, 540, 254, 125, 91) then -- 有私信
                tiaoShi("有私信")
                touchClick(717, 540, 255, 117, 88) -- 聊天框 
                mSleep(1000)
                if isColor(75, 324, 255, 100, 65, 50) then
                    timeXiaoHao = nowTime
                    gaiMuBiao(3, mb_QianWangJiaoYi, mm_QianWangJiaoYi)
                elseif isColor(76, 367, 255, 94, 60) then
                    timeXiaoHao = nowTime
                    gaiMuBiao(3, mb_QianWangJiaoYi, mm_QianWangJiaoYi)
                else
                    touchClick(15, 104, 160, 133, 108) -- 主动返回世界频道
                    touchClick(553, 309, 189, 177, 130) -- 关闭聊天
                end

                -- touchClick(717,548,255,54,19)--聊天框
                -- mSleep(1000)
            end
        elseif nowTime - timeFaSongSiXin >= 10 * 60 then
            gaiMuBiao(3, mb_FaSongSiXin, mm_FaSongSiXin)
            return
        end
    end
    if muBiaoA == mb_QianWangJiaoYi then -- 前往交易

        if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and isColor(18, 446, 181, 179, 159, 5) and
            isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
            tiaoShi("聊天框")
            touchClick(717, 540, 255, 117, 88) -- 聊天框 
            mSleep(1000)
        elseif (isColor(203, 531, 96, 117, 158, 5) and isColor(441, 529, 90, 90, 91, 5) and
            isColor(189, 377, 127, 230, 253, 5)) or
            (isColor(203, 531, 98, 117, 157, 5) and isColor(441, 529, 90, 90, 90, 5) and
                isColor(189, 377, 135, 244, 251, 5)) or
            (isColor(203, 531, 98, 117, 158, 5) and isColor(441, 529, 91, 91, 91, 5) and
                isColor(189, 377, 145, 247, 252, 5)) then
            tiaoShi("交易框--未锁定--小号")
            mSleep(1000)
            for i = 1, 10 do
                if not (isColor(508, 442, 21, 24, 31)) and isColor(267, 528, 92, 119, 162) then -- 交易栏已满
                    -- dialog("交易栏已满",5)
                    -- mSleep(5000)
                    break
                end
                if isColor(631, 196, 185, 31, 43, 5) then -- 第1个字
                    touchClick(631, 196, 185, 31, 43)
                elseif isColor(706, 194, 159, 25, 34) then -- 第2个字
                    touchClick(706, 194, 159, 25, 34)
                elseif isColor(607, 207, 237, 44, 104) then -- 灵魂1
                    touchClick(607, 207, 237, 44, 104)
                elseif isColor(683, 211, 175, 25, 58) then
                    touchClick(683, 211, 175, 25, 58)
                elseif isColor(762, 210, 193, 25, 70) then
                    touchClick(762, 210, 193, 25, 70)
                elseif isColor(837, 208, 198, 47, 94) then
                    touchClick(837, 208, 198, 47, 94)
                elseif isColor(914, 211, 185, 30, 62) then
                    touchClick(914, 211, 185, 30, 62)
                elseif isColor(607, 286, 191, 52, 79) then
                    touchClick(607, 286, 191, 52, 79)
                elseif isColor(684, 287, 194, 35, 71) then
                    touchClick(684, 287, 194, 35, 71)
                elseif isColor(759, 285, 212, 56, 107) then
                    touchClick(759, 285, 212, 56, 107)
                elseif isColor(836, 289, 170, 24, 58) then
                    touchClick(836, 289, 170, 24, 58)
                elseif isColor(914, 286, 187, 36, 69) then -- 灵魂10
                    touchClick(914, 286, 187, 36, 69)

                elseif isColor(609, 199, 192, 24, 69) then -- 灵魂1--新
                    touchClick(607, 207, 237, 44, 104)
                elseif isColor(684, 199, 197, 34, 74) then
                    touchClick(683, 211, 175, 25, 58)
                elseif isColor(761, 198, 191, 35, 82) then
                    touchClick(762, 210, 193, 25, 70)
                elseif isColor(836, 199, 185, 35, 77) then
                    touchClick(837, 208, 198, 47, 94)
                elseif isColor(915, 199, 192, 24, 69) then
                    touchClick(914, 211, 185, 30, 62)
                elseif isColor(607, 275, 191, 52, 77) then
                    touchClick(607, 286, 191, 52, 79)
                elseif isColor(685, 275, 195, 28, 69) then
                    touchClick(684, 287, 194, 35, 71)
                elseif isColor(761, 275, 185, 28, 64) then
                    touchClick(759, 285, 212, 56, 107)
                elseif isColor(839, 276, 185, 26, 62) then
                    touchClick(836, 289, 170, 24, 58)
                elseif isColor(914, 276, 189, 31, 66) then -- 灵魂10
                    touchClick(914, 286, 187, 36, 69)

                elseif isColor(607, 204, 246, 80, 125) then -- 灵魂1-ios7
                    touchClick(607, 204, 246, 80, 125)
                elseif isColor(685, 204, 246, 83, 121) then -- 灵魂2-ios7
                    touchClick(685, 204, 246, 83, 121)
                elseif isColor(759, 204, 243, 74, 125) then -- 灵魂3-ios7
                    touchClick(759, 204, 243, 74, 125)
                elseif isColor(837, 204, 248, 82, 134) then -- 灵魂4-ios7
                    touchClick(837, 204, 248, 82, 134)
                elseif isColor(611, 209, 231, 73, 125) then -- 创造1
                    touchClick(611, 209, 231, 73, 125)
                elseif isColor(684, 209, 220, 71, 102) then
                    touchClick(684, 209, 220, 71, 102)
                elseif isColor(759, 210, 224, 73, 104) then
                    touchClick(759, 210, 224, 73, 104)
                elseif isColor(836, 210, 223, 72, 103) then
                    touchClick(836, 210, 223, 72, 103)
                elseif isColor(911, 211, 218, 70, 101) then
                    touchClick(911, 211, 218, 70, 101)
                elseif isColor(611, 285, 220, 69, 121) then
                    touchClick(611, 285, 220, 69, 121)
                elseif isColor(683, 286, 221, 71, 103) then
                    touchClick(683, 286, 221, 71, 103)
                elseif isColor(759, 288, 223, 72, 103) then
                    touchClick(759, 288, 223, 72, 103)
                elseif isColor(835, 289, 219, 73, 104) then
                    touchClick(835, 289, 219, 73, 104)
                elseif isColor(911, 285, 226, 83, 104) then -- 创造10
                    touchClick(911, 285, 226, 83, 104)

                elseif isColor(612, 198, 221, 78, 130) then -- 创造1--新
                    touchClick(611, 209, 231, 73, 125)
                elseif isColor(689, 200, 233, 88, 134) then
                    touchClick(684, 209, 220, 71, 102)
                elseif isColor(764, 200, 218, 67, 115) then
                    touchClick(759, 210, 224, 73, 104)
                elseif isColor(838, 202, 207, 68, 102) then
                    touchClick(836, 210, 223, 72, 103)
                elseif isColor(915, 198, 234, 96, 122) then
                    touchClick(911, 211, 218, 70, 101)
                elseif isColor(609, 275, 212, 71, 103) then
                    touchClick(611, 285, 220, 69, 121)
                elseif isColor(685, 276, 203, 64, 101) then
                    touchClick(683, 286, 221, 71, 103)
                elseif isColor(761, 277, 219, 71, 103) then
                    touchClick(759, 288, 223, 72, 103)
                elseif isColor(842, 275, 217, 75, 126) then
                    touchClick(835, 289, 219, 73, 104)
                elseif isColor(917, 277, 210, 65, 117) then -- 创造10
                    touchClick(911, 285, 226, 83, 104)

                elseif isColor(617, 201, 220, 74, 41) then -- 深渊之火1
                    touchClick(607, 207, 237, 44, 104)
                elseif isColor(694, 200, 220, 59, 28) then
                    touchClick(683, 211, 175, 25, 58)
                elseif isColor(768, 200, 217, 63, 33) then
                    touchClick(762, 210, 193, 25, 70)
                elseif isColor(846, 200, 218, 55, 27) then
                    touchClick(837, 208, 198, 47, 94)
                elseif isColor(921, 203, 215, 52, 28) then
                    touchClick(914, 211, 185, 30, 62)
                elseif isColor(613, 277, 218, 69, 41) then
                    touchClick(607, 286, 191, 52, 79)
                elseif isColor(694, 281, 218, 71, 43) then
                    touchClick(684, 287, 194, 35, 71)
                elseif isColor(773, 278, 220, 72, 42) then
                    touchClick(759, 285, 212, 56, 107)
                elseif isColor(845, 279, 218, 53, 26) then
                    touchClick(836, 289, 170, 24, 58)
                elseif isColor(923, 279, 213, 50, 29) then -- 深渊之火10
                    touchClick(914, 286, 187, 36, 69)

                elseif isColor(622, 198, 243, 94, 185) then -- 元素之灵1
                    touchClick(607, 207, 237, 44, 104)
                elseif isColor(699, 198, 244, 94, 186) then
                    touchClick(683, 211, 175, 25, 58)
                elseif isColor(781, 198, 246, 121, 180) then
                    touchClick(762, 210, 193, 25, 70)
                elseif isColor(855, 198, 246, 106, 189) then
                    touchClick(837, 208, 198, 47, 94)
                elseif isColor(935, 198, 247, 133, 173) then
                    touchClick(914, 211, 185, 30, 62)
                elseif isColor(622, 275, 234, 89, 177) then
                    touchClick(607, 286, 191, 52, 79)
                elseif isColor(701, 275, 242, 97, 172) then
                    touchClick(684, 287, 194, 35, 71)
                elseif isColor(778, 275, 242, 98, 171) then
                    touchClick(759, 285, 212, 56, 107)
                elseif isColor(854, 275, 242, 96, 173) then
                    touchClick(836, 289, 170, 24, 58)
                elseif isColor(931, 275, 242, 97, 172) then -- 元素之灵10
                    touchClick(914, 286, 187, 36, 69)

                elseif isColor(634, 220, 160, 159, 154) then -- 断魂白-1
                    touchClick(634, 220, 160, 159, 154)
                elseif isColor(709, 221, 173, 174, 167) then
                    touchClick(709, 221, 173, 174, 167)
                elseif isColor(785, 221, 175, 176, 169) then
                    touchClick(785, 221, 175, 176, 169)
                elseif isColor(863, 220, 165, 165, 159) then
                    touchClick(863, 220, 165, 165, 159)
                elseif isColor(940, 221, 154, 154, 148) then
                    touchClick(940, 221, 154, 154, 148)
                elseif isColor(635, 295, 153, 152, 146) then
                    touchClick(635, 295, 153, 152, 146)
                elseif isColor(710, 297, 166, 166, 161) then
                    touchClick(710, 297, 166, 166, 161)
                elseif isColor(787, 296, 158, 159, 153) then
                    touchClick(787, 296, 158, 159, 153)
                elseif isColor(862, 299, 168, 168, 162) then
                    touchClick(862, 299, 168, 168, 162)
                elseif isColor(939, 298, 171, 172, 166) then -- 断魂白-10
                    touchClick(939, 298, 171, 172, 166)
                elseif isColor(637, 216, 181, 110, 115) then -- 断魂红-1
                    touchClick(637, 216, 181, 110, 115)
                elseif isColor(709, 221, 183, 122, 122) then
                    touchClick(709, 221, 183, 122, 122)
                elseif isColor(791, 216, 178, 107, 111) then
                    touchClick(791, 216, 178, 107, 111)
                elseif isColor(864, 220, 174, 111, 111) then
                    touchClick(864, 220, 174, 111, 111)
                elseif isColor(940, 220, 179, 115, 116) then
                    touchClick(940, 220, 179, 115, 116)
                elseif isColor(634, 295, 175, 110, 111) then
                    touchClick(634, 295, 175, 110, 111)
                elseif isColor(714, 293, 178, 108, 109) then
                    touchClick(714, 293, 178, 108, 109)
                elseif isColor(788, 297, 164, 100, 100) then
                    touchClick(788, 297, 164, 100, 100)
                elseif isColor(863, 298, 173, 112, 111) then
                    touchClick(863, 298, 173, 112, 111)
                elseif isColor(940, 296, 174, 111, 112) then -- 断魂红-10
                    touchClick(940, 296, 174, 111, 112)

                elseif isColor(630, 180, 216, 101, 107) then -- 断魂红-1--新
                    touchClick(637, 216, 181, 110, 115)
                elseif isColor(707, 180, 215, 101, 107) then
                    touchClick(709, 221, 183, 122, 122)
                elseif isColor(783, 180, 215, 101, 106) then
                    touchClick(791, 216, 178, 107, 111)
                elseif isColor(860, 180, 216, 101, 107) then
                    touchClick(864, 220, 174, 111, 111)
                elseif isColor(936, 181, 212, 98, 103) then
                    touchClick(940, 220, 179, 115, 116)
                elseif isColor(635, 285, 164, 99, 101) then
                    touchClick(634, 295, 175, 110, 111)
                elseif isColor(712, 284, 171, 104, 105) then
                    touchClick(714, 293, 178, 108, 109)
                elseif isColor(789, 283, 173, 105, 107) then
                    touchClick(788, 297, 164, 100, 100)
                elseif isColor(867, 282, 178, 108, 110) then
                    touchClick(863, 298, 173, 112, 111)
                elseif isColor(941, 285, 172, 108, 110) then -- 断魂红-10
                    touchClick(940, 296, 174, 111, 112)

                elseif isColor(614, 214, 119, 145, 245) then -- 先知白-1
                    touchClick(614, 214, 119, 145, 245)
                elseif isColor(691, 214, 120, 147, 246) then
                    touchClick(691, 214, 120, 147, 246)
                elseif isColor(767, 214, 122, 148, 245) then
                    touchClick(767, 214, 122, 148, 245)
                elseif isColor(844, 214, 119, 145, 245) then
                    touchClick(844, 214, 119, 145, 245)
                elseif isColor(920, 214, 125, 151, 245) then
                    touchClick(920, 214, 125, 151, 245)
                elseif isColor(614, 290, 127, 153, 245) then
                    touchClick(614, 290, 127, 153, 245)
                elseif isColor(691, 289, 134, 160, 243) then
                    touchClick(691, 289, 134, 160, 243)
                elseif isColor(768, 290, 127, 153, 245) then
                    touchClick(768, 290, 127, 153, 245)
                elseif isColor(845, 289, 137, 163, 243) then
                    touchClick(845, 289, 137, 163, 243)
                elseif isColor(920, 290, 129, 154, 244) then -- 先知白-10
                    touchClick(920, 290, 129, 154, 244)

                elseif isColor(613, 204, 118, 144, 246) then -- 先知白-1--新
                    touchClick(614, 214, 119, 145, 245)
                elseif isColor(689, 203, 115, 139, 244) then
                    touchClick(691, 214, 120, 147, 246)
                elseif isColor(766, 202, 118, 143, 244) then
                    touchClick(767, 214, 122, 148, 245)
                elseif isColor(844, 203, 119, 144, 245) then
                    touchClick(844, 214, 119, 145, 245)
                elseif isColor(922, 203, 127, 153, 245) then
                    touchClick(920, 214, 125, 151, 245)
                elseif isColor(614, 279, 126, 152, 245) then
                    touchClick(614, 290, 127, 153, 245)
                elseif isColor(690, 280, 119, 145, 245) then
                    touchClick(691, 289, 134, 160, 243)
                elseif isColor(768, 279, 126, 152, 245) then
                    touchClick(768, 290, 127, 153, 245)
                elseif isColor(845, 278, 137, 163, 243) then
                    touchClick(845, 289, 137, 163, 243)
                elseif isColor(921, 279, 126, 152, 245) then -- 先知白-10
                    touchClick(920, 290, 129, 154, 244)

                elseif isColor(588, 197, 248, 128, 9, 20) then -- 橙装--1
                    touchClick(614, 214, 119, 145, 245)
                elseif isColor(664, 197, 251, 131, 10, 20) then
                    touchClick(691, 214, 120, 147, 246)
                elseif isColor(741, 197, 248, 128, 9, 20) then
                    touchClick(767, 214, 122, 148, 245)
                elseif isColor(817, 197, 245, 127, 9, 20) then
                    touchClick(844, 214, 119, 145, 245)
                elseif isColor(894, 197, 247, 127, 9, 20) then
                    touchClick(920, 214, 125, 151, 245)
                elseif isColor(588, 279, 251, 127, 8, 20) then
                    touchClick(614, 290, 127, 153, 245)
                elseif isColor(664, 279, 243, 124, 8, 20) then
                    touchClick(691, 289, 134, 160, 243)
                elseif isColor(741, 279, 245, 125, 8, 20) then
                    touchClick(768, 290, 127, 153, 245)
                elseif isColor(817, 279, 242, 124, 8, 20) then
                    touchClick(845, 289, 137, 163, 243)
                elseif isColor(894, 279, 244, 124, 8, 20) then -- 橙装-10
                    touchClick(920, 290, 129, 154, 244)

                elseif isColor(614, 215, 150, 94, 163) then -- 先知红-1
                    touchClick(614, 215, 150, 94, 163)
                elseif isColor(691, 215, 152, 96, 162) then
                    touchClick(691, 215, 152, 96, 162)
                elseif isColor(765, 215, 144, 87, 160) then
                    touchClick(765, 215, 144, 87, 160)
                elseif isColor(843, 214, 154, 94, 157) then
                    touchClick(843, 214, 154, 94, 157)
                elseif isColor(918, 215, 144, 87, 160) then
                    touchClick(918, 215, 144, 87, 160)
                elseif isColor(615, 290, 160, 98, 156) then
                    touchClick(615, 290, 160, 98, 156)
                elseif isColor(692, 290, 160, 99, 156) then
                    touchClick(692, 290, 160, 99, 156)
                elseif isColor(766, 291, 153, 93, 158) then
                    touchClick(766, 291, 153, 93, 158)
                elseif isColor(844, 290, 160, 98, 156) then
                    touchClick(844, 290, 160, 98, 156)
                elseif isColor(919, 291, 153, 92, 158) then -- 先知红-10
                    touchClick(919, 291, 153, 92, 158)

                elseif isColor(608, 192, 184, 36, 52) then -- 女神之光1
                    touchClick(607, 207, 237, 44, 104)
                elseif isColor(688, 188, 193, 36, 40) then
                    touchClick(683, 211, 175, 25, 58)
                elseif isColor(762, 190, 188, 34, 41) then
                    touchClick(762, 210, 193, 25, 70)
                elseif isColor(841, 189, 192, 36, 40) then
                    touchClick(837, 208, 198, 47, 94)
                elseif isColor(916, 190, 188, 35, 43) then
                    touchClick(914, 211, 185, 30, 62)
                elseif isColor(609, 268, 188, 36, 47) then
                    touchClick(607, 286, 191, 52, 79)
                elseif isColor(684, 267, 186, 35, 46) then
                    touchClick(684, 287, 194, 35, 71)
                elseif isColor(762, 266, 189, 34, 40) then
                    touchClick(759, 285, 212, 56, 107)
                elseif isColor(838, 264, 189, 33, 40) then
                    touchClick(836, 289, 170, 24, 58)
                elseif isColor(917, 265, 193, 36, 40) then -- 女神之光10
                    touchClick(914, 286, 187, 36, 69)

                elseif isColor(620, 205, 146, 48, 245) then -- 祝福1
                    touchClick(620, 205, 146, 48, 245)
                elseif isColor(696, 204, 149, 50, 245) then
                    touchClick(696, 204, 149, 50, 245)
                elseif isColor(773, 205, 147, 48, 245) then
                    touchClick(773, 205, 147, 48, 245)
                elseif isColor(850, 205, 146, 48, 245) then
                    touchClick(850, 205, 146, 48, 245)
                elseif isColor(926, 204, 149, 50, 245) then
                    touchClick(926, 204, 149, 50, 245)
                elseif isColor(620, 281, 147, 48, 245) then
                    touchClick(620, 281, 147, 48, 245)
                elseif isColor(696, 281, 149, 50, 245) then
                    touchClick(696, 281, 149, 50, 245)
                elseif isColor(774, 282, 148, 49, 245) then
                    touchClick(774, 282, 148, 49, 245)
                elseif isColor(849, 281, 151, 53, 246) then
                    touchClick(849, 281, 151, 53, 246)
                elseif isColor(927, 280, 147, 48, 245) then -- 祝福10
                    touchClick(927, 280, 147, 48, 245)
                elseif isColor(610, 236, 84, 164, 160) then -- 精灵泪红-1
                    touchClick(610, 236, 84, 164, 160)
                elseif isColor(684, 234, 77, 153, 159) then
                    touchClick(684, 234, 77, 153, 159)
                elseif isColor(760, 235, 77, 155, 162) then
                    touchClick(760, 235, 77, 155, 162)
                elseif isColor(836, 234, 89, 164, 167) then
                    touchClick(836, 234, 89, 164, 167)
                elseif isColor(914, 233, 76, 146, 153) then
                    touchClick(914, 233, 76, 146, 153)
                elseif isColor(609, 309, 86, 163, 164) then
                    touchClick(609, 309, 86, 163, 164)
                elseif isColor(684, 311, 77, 155, 162) then
                    touchClick(684, 311, 77, 155, 162)
                elseif isColor(761, 310, 78, 153, 159) then
                    touchClick(761, 310, 78, 153, 159)
                elseif isColor(839, 309, 85, 163, 166) then
                    touchClick(839, 309, 85, 163, 166)
                elseif isColor(912, 312, 91, 179, 180) then -- 10
                    touchClick(912, 312, 91, 179, 180)
                elseif isColor(608, 235, 54, 206, 205) then -- 精灵泪白-1
                    touchClick(608, 235, 54, 206, 205)
                elseif isColor(685, 235, 58, 208, 206) then
                    touchClick(685, 235, 58, 208, 206)
                elseif isColor(759, 236, 42, 198, 202) then
                    touchClick(759, 236, 42, 198, 202)
                elseif isColor(837, 236, 37, 184, 194) then
                    touchClick(837, 236, 37, 184, 194)
                elseif isColor(913, 234, 43, 193, 197) then
                    touchClick(913, 234, 43, 193, 197)
                elseif isColor(607, 310, 39, 189, 195) then
                    touchClick(607, 310, 39, 189, 195)
                elseif isColor(683, 311, 45, 194, 197) then
                    touchClick(683, 311, 45, 194, 197)
                elseif isColor(760, 312, 40, 191, 196) then
                    touchClick(760, 312, 40, 191, 196)
                elseif isColor(837, 312, 40, 193, 198) then
                    touchClick(837, 312, 40, 193, 198)
                elseif isColor(912, 313, 41, 197, 202) then -- 精灵泪白-10
                    touchClick(912, 313, 41, 197, 202)
                elseif isColor(610, 215, 53, 48, 112) then -- 帝王书-1
                    touchClick(610, 215, 53, 48, 112)
                elseif isColor(686, 216, 53, 48, 112) then
                    touchClick(686, 216, 53, 48, 112)
                elseif isColor(763, 217, 50, 46, 104) then
                    touchClick(763, 217, 50, 46, 104)
                elseif isColor(839, 215, 53, 48, 112) then
                    touchClick(839, 215, 53, 48, 112)
                elseif isColor(916, 217, 51, 47, 105) then
                    touchClick(916, 217, 51, 47, 105)
                elseif isColor(610, 294, 48, 44, 101) then
                    touchClick(610, 294, 48, 44, 101)
                elseif isColor(686, 292, 53, 48, 112) then
                    touchClick(686, 292, 53, 48, 112)
                elseif isColor(761, 295, 46, 42, 97) then
                    touchClick(761, 295, 46, 42, 97)
                elseif isColor(839, 293, 53, 48, 112) then
                    touchClick(839, 293, 53, 48, 112)
                elseif isColor(915, 296, 43, 40, 93) then -- 帝王书-10
                    touchClick(915, 296, 43, 40, 93)
                else
                    break
                end
                if isColor(464, 428, 243, 214, 60) then -- 有放入
                    touchClick(738, 464, 77, 87, 127)
                elseif isColor(464, 465, 236, 207, 57) then -- 放入
                    touchClick(736, 499, 179, 180, 185)
                else
                    touchClick(116, 89, 76, 79, 84) -- 空白
                end
            end
            -- for j=0,3 do
            --         for i=0,4 do
            --                 touchClick(621+i*77,211+j*77)
            --                 mSleep(1000)
            --                 if isColor(464,428,243,214,60) then--有放入
            --                         if isColor(632,164,230,90,149,5) and isColor(646,199,163,3,63,5) then--灵魂
            --                                 touchClick(738,464,77,87,127)
            --                         elseif isColor(624,201,164,117,255,5) and isColor(655,168,103,43,208,5) then--祝福
            --                                 touchClick(738,464,77,87,127)
            --                         elseif isColor(642,182,199,179,103,5) and isColor(665,155,225,196,131,5) then--断魂之剑
            --                                 touchClick(738,464,77,87,127)
            --                         elseif isColor(625,192,40,38,89,5) and isColor(661,163,108,90,171,5) then--帝王之书
            --                                 touchClick(738,464,77,87,127)
            --                         elseif isColor(629,197,37,60,239,5) and isColor(667,175,25,37,255,5) then--先知之魂
            --                                 touchClick(738,464,77,87,127)
            --                         elseif isColor(626,212,65,215,202,5) and isColor(627,169,4,86,105,5) then--精灵之泪
            --                                 touchClick(738,464,77,87,127)
            --                         elseif isColor(623,176,226,79,104,5) and isColor(658,199,99,26,53,5) then--创造
            --                                 touchClick(738,464,77,87,127)
            --                         else
            --                                 touchClick(131,95,40,51,66)--不放入
            --                         end
            --                 else
            --                         touchClick(116,89,76,79,84)--空白
            --                         break
            --                 end
            --         end
            -- end
            -- keepScreen(true)
            -- x,y = findMultiColorInRegionFuzzy( 0xfefbfb, "0|37|0xc364bd,25|26|0x880622", 90, 585, 177, 962, 489)
            -- if x > 0 then--灵魂
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0xfefcfd, "0|38|0xc263bc,17|32|0x970738,30|18|0xcb4d70", 90, 585, 177, 962, 489)
            -- if x > 0 then--灵魂
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0xfefdfc, "14|30|0x6e158d,27|-8|0x9435ad,21|13|0xc0466c,41|16|0x7b3265", 90, 585, 177, 962, 489)
            -- if x > 0 then--创造
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0xe7d9ff, "-6|35|0x8350ff,22|-3|0xd7aeff,24|25|0x6120f2", 90, 585, 177, 962, 489)
            -- if x > 0 then--祝福
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0x7366bf, "23|1|0x7f65b2,-9|35|0x433426,25|18|0xa19b9c", 90, 585, 177, 962, 489)
            -- if x > 0 then--帝王之书
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0x7470ef, "16|32|0x130bb1,39|1|0xb4c9ff,28|-3|0x07017a", 90, 585, 177, 962, 489)
            -- if x > 0 then--先知之魂
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0x934b58, "-3|41|0x4ca2a5,26|33|0x478e90,6|41|0xc1cbcb", 90, 585, 177, 962, 489)
            -- if x > 0 then--精灵之泪
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- x,y = findMultiColorInRegionFuzzy( 0xd8676d, "1|31|0xb37879,-19|13|0xc0666d,-34|48|0x525009", 90, 585, 177, 962, 489)
            -- if x > 0 then--断魂之剑
            --         touchClick(x,y)
            --         mSleep(1000)
            --         touchClick(739,466,86,98,141)
            --         mSleep(1000)
            -- end
            -- keepScreen(false)
            touchClick(207, 526, 89, 124, 170) -- 锁定
            mSleep(1000)
            touchClick(651, 400, 164, 115, 61) -- 确定
            mSleep(1000)
        elseif (isColor(436, 527, 87, 124, 172, 5) and isColor(267, 525, 94, 94, 95, 5)) or
            (isColor(436, 527, 88, 124, 171, 5) and isColor(267, 525, 94, 94, 94, 5)) then
            tiaoShi("交易框--未交易--小号")
            touchClick(436, 527, 87, 124, 172) -- 交易
            mSleep(1000)
            touchClick(651, 400, 164, 115, 61) -- 确定
            mSleep(3000)
            for i = 1, 10 do
                if not (isColor(1007, 93, 248, 236, 198, 9)) then
                    break
                end
                mSleep(1000)
            end
            xiaoHaoHuanJiaoSe()
        elseif nowTime - timeXiaoHao >= 3 * 60 then
            xiaoHaoHuanJiaoSe()
            return
        end
    end
end

-- 仓库号
function cangKuHao(...)
    if (isColor(203, 531, 96, 117, 158, 5) and isColor(441, 529, 90, 90, 91, 5) and isColor(189, 377, 127, 230, 253, 5)) or
        (isColor(203, 531, 99, 117, 158, 5) and isColor(441, 529, 91, 91, 91, 5) and isColor(189, 377, 143, 245, 251, 5)) then
        if string.find(duoXuan1, "5") ~= nil then
            tiaoShi("交易框--未锁定--仓库号")
            gaiMuBiao(3, mb_DengDaiJiaoYi, mm_DengDaiJiaoYi)
        end
    end
    if isColor(436, 527, 87, 124, 172, 5) and isColor(267, 525, 94, 94, 95, 5) then
        if string.find(duoXuan1, "5") ~= nil then
            tiaoShi("交易框--未交易--仓库号")
            gaiMuBiao(3, mb_DengDaiJiaoYi, mm_DengDaiJiaoYi)
        end
    end
    if muBiaoA == mb_DengDaiSiXin then -- 等待私信
        if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and isColor(18, 446, 181, 179, 159, 5) and
            isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
            if isColor(396, 587, 255, 88, 54) then -- 好友红点
                touchClick(377, 598, 213, 197, 176)
            end
        end
        if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and isColor(18, 446, 181, 179, 159, 5) and
            isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
            if isColor(717, 540, 255, 117, 88) or isColor(717, 540, 254, 125, 91) then -- 有私信
                tiaoShi("有私信")
                timeCangKu = nowTime
                touchClick(717, 540, 255, 117, 88) -- 聊天框 
                toast("交易超时次数:" .. numJiaoYiChaoShi .. ",成功次数:" .. numJiaoYi)
                mSleep(1000)
            end
        end

    end
    if muBiaoA == mb_DengDaiJiaoYi then -- 等待交易
        -- go = go + 10
        -- tiaoShi(go)
        if (isColor(203, 531, 96, 117, 158, 5) and isColor(441, 529, 90, 90, 91, 5) and
            isColor(189, 377, 127, 230, 253, 5)) or
            (isColor(203, 531, 99, 117, 158, 5) and isColor(441, 529, 91, 91, 91, 5) and
                isColor(189, 377, 143, 245, 251, 5)) then
            tiaoShi("交易框--未锁定--仓库号")
            if isColor(152, 304, 232, 233, 233) or isColor(152, 304, 227, 225, 216) then
                touchClick(204, 526, 90, 121, 165) -- 锁定
                mSleep(1000)
                touchClick(651, 400, 164, 115, 61) -- 确定
                mSleep(1000)
            end
        elseif isColor(436, 527, 87, 124, 172, 5) and isColor(267, 525, 94, 94, 95, 5) then
            tiaoShi("交易框--未交易--仓库号")
            touchClick(436, 527, 87, 124, 172) -- 交易
            mSleep(1000)
            touchClick(651, 400, 164, 115, 61) -- 确定
            mSleep(1000)
            gaiMuBiao(3, mb_CangKuZhengLi, mm_CangKuZhengLi)
            numJiaoYi = numJiaoYi + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
        elseif nowTime - timeCangKu >= 5 * 60 then
            numJiaoYiChaoShi = numJiaoYiChaoShi + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "交易超时", numJiaoYiChaoShi)
            gaiMuBiao(3, mb_DengDaiSiXin, mm_DengDaiSiXin)
            timeCangKu = nowTime
        end
    end

end

-- 验证码
function yanZhengMa(...)
    local recognize = ""
    if version == "2.2.4" then
        recognize = ocrText(671, 306, 730, 327, 20);
    else
        recognize = ocrText(671, 306, 730, 327, 0);  -- OCR 英文识别，注意本函数仅对标准字体识别尚可，非标准字体请自行制作字库配合触动点阵识别函数效果更佳
    end
    mSleep(1000);
    return recognize
end

-- 封号
function fengHao(...)
    if isColor(525, 389, 169, 127, 70, 5) and isColor(606, 408, 169, 111, 56, 5) and
        isColor(848, 235, 165, 153, 128, 15) and isColor(925, 570, 173, 129, 67, 5) then
        if isColor(453, 286, 239, 239, 240, 9) and isColor(677, 287, 246, 246, 246, 9) then
            tiaoShi("封号了")
            touchClick(536, 397, 162, 116, 62) -- 确定
            mSleep(1000)
            shanJiaoSe()
            huanJiaoSeChongZhi()
            numDay = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "第几天", numDay)
            gaiMuBiao(1, mb_Wu, mm_Wu)
            gaiMuBiao(2, mb_Wu, mm_Wu)
            gaiMuBiao(3, mb_Wu, mm_Wu)
            numQuanShu = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "numQuanShu", numQuanShu)
            -- numJiaoSe = 1
            -- writePlist(luaMuLu..xiangMu..".plist","角色",numJiaoSe)
        else
            touchClick(606, 408, 169, 111, 57)
        end
    end
    if isColor(502, 564, 170, 126, 68, 5) and isColor(603, 585, 173, 108, 55, 5) and isColor(515, 568, 215, 198, 170, 5) and
        isColor(589, 576, 208, 195, 166, 5) then
        tiaoShi("恢复角色")
        mSleep(1000)
        -- if isColor(27,87,192,171,161,5) and isColor(71,191,188,177,165,5) then
        --         touchClick(169,211,54,17,26)--选二号角色
        --         touchClick(991,573,129,123,110)--开始游戏
        -- elseif isColor(61,186,145,131,125,5) and isColor(91,293,182,173,162,5) then
        --         touchClick(163,313,168,234,235)--选三号角色
        --         touchClick(991,573,129,123,110)--开始游戏
        -- elseif isColor(84,286,165,147,139,5) and isColor(30,93,181,175,164,5) then
        --         touchClick(114,112,42,72,132)--选一号角色
        --         touchClick(991,573,129,123,110)--开始游戏
        -- end
    end
end

-- 删角色
function shanJiaoSe(...)
    touchClick(1111, 26, 195, 192, 178) -- 删角色
    mSleep(3000)
    -- if version == "2.2.4" then
    --         if not(file_exists("/Applications/TouchSprite.app/tessdata")) then
    --                 httpDown("http://wanmao.myDS.me:81/kuoZhanKu/eng.traineddata","/Applications/TouchSprite.app/tessdata")
    --         end
    -- end
    local tmpYZM = yanZhengMa()
    -- dialog(tmpYZM,0)
    touchClick(564, 315, 32, 37, 44) -- 输入框
    mSleep(2000)
    inputText(tmpYZM)
    mSleep(1000)
    touchClick(1080, 596, 159, 165, 174) -- 关闭输入法
    mSleep(1000)
    touchClick(726, 409, 84, 125, 176) -- 狠心删除
    mSleep(2000)
    if isColor(679, 407, 95, 123, 166) then
        touchClick(1111, 59, 159, 201, 255) -- 空白
        shanJiaoSe()
    end
end

-- 卖书
function maiShu(...)
    if muBiaoA == mb_MaiShu then
        if danXuan4 == "1" or danXuan4 == "2" then
            if (isColor(203, 531, 96, 117, 158, 5) and isColor(441, 529, 90, 90, 91, 5) and
                isColor(189, 377, 127, 230, 253, 5)) or
                (isColor(203, 531, 99, 117, 158, 5) and isColor(441, 529, 91, 91, 91, 5) and
                    isColor(189, 377, 143, 245, 251, 5)) then
                tiaoShi("交易框--未锁定--仓库号")
                if isColor(198, 445, 24, 27, 34) then -- 未上货
                    tiaoShi("--未上货")
                    if danXuan4 == "1" then
                        if isColor(610, 215, 53, 48, 112) then -- 帝王书-1
                            touchClick(610, 215, 53, 48, 112)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(686, 216, 53, 48, 112) then
                            touchClick(686, 216, 53, 48, 112)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(763, 217, 50, 46, 104) then
                            touchClick(763, 217, 50, 46, 104)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(839, 215, 53, 48, 112) then
                            touchClick(839, 215, 53, 48, 112)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(916, 217, 51, 47, 105) then
                            touchClick(916, 217, 51, 47, 105)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(610, 294, 48, 44, 101) then
                            touchClick(610, 294, 48, 44, 101)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(686, 292, 53, 48, 112) then
                            touchClick(686, 292, 53, 48, 112)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(761, 295, 46, 42, 97) then
                            touchClick(761, 295, 46, 42, 97)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(839, 293, 53, 48, 112) then
                            touchClick(839, 293, 53, 48, 112)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(915, 296, 43, 40, 93) then -- 帝王书-10
                            touchClick(915, 296, 43, 40, 93)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        else
                            touchClick(1007, 93, 255, 239, 205) -- 取消交易
                        end
                        -- x,y = findMultiColorInRegionFuzzy( 0xebdfd7, "4|0|0xebdfd8,14|0|0xe9ddd7,25|0|0xe5dad2", 90, 578, 158, 975, 505)
                        -- if x > 0 then
                        --         touchClick(x,y)
                        --         mSleep(1000)
                        --         touchClick(736,502,27,30,44)--放入
                        --         mSleep(1000)
                        -- else
                        --         touchClick(1007,93,255,239,205)--取消交易
                        -- end
                    elseif danXuan4 == "2" then
                        if isColor(610, 236, 84, 164, 160) then -- 精灵泪红-1
                            touchClick(610, 236, 84, 164, 160)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(684, 234, 77, 153, 159) then
                            touchClick(684, 234, 77, 153, 159)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(760, 235, 77, 155, 162) then
                            touchClick(760, 235, 77, 155, 162)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(836, 234, 89, 164, 167) then
                            touchClick(836, 234, 89, 164, 167)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(914, 233, 76, 146, 153) then
                            touchClick(914, 233, 76, 146, 153)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(609, 309, 86, 163, 164) then
                            touchClick(609, 309, 86, 163, 164)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(684, 311, 77, 155, 162) then
                            touchClick(684, 311, 77, 155, 162)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(761, 310, 78, 153, 159) then
                            touchClick(761, 310, 78, 153, 159)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(839, 309, 85, 163, 166) then
                            touchClick(839, 309, 85, 163, 166)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(912, 312, 91, 179, 180) then -- 10
                            touchClick(912, 312, 91, 179, 180)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(608, 235, 54, 206, 205) then -- 精灵泪白-1
                            touchClick(608, 235, 54, 206, 205)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(685, 235, 58, 208, 206) then
                            touchClick(685, 235, 58, 208, 206)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(759, 236, 42, 198, 202) then
                            touchClick(759, 236, 42, 198, 202)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(837, 236, 37, 184, 194) then
                            touchClick(837, 236, 37, 184, 194)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(913, 234, 43, 193, 197) then
                            touchClick(913, 234, 43, 193, 197)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(607, 310, 39, 189, 195) then
                            touchClick(607, 310, 39, 189, 195)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(683, 311, 45, 194, 197) then
                            touchClick(683, 311, 45, 194, 197)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(760, 312, 40, 191, 196) then
                            touchClick(760, 312, 40, 191, 196)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(837, 312, 40, 193, 198) then
                            touchClick(837, 312, 40, 193, 198)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        elseif isColor(912, 313, 41, 197, 202) then -- 精灵泪白-10
                            touchClick(912, 313, 41, 197, 202)
                            mSleep(1000)
                            touchClick(736, 502, 27, 30, 44) -- 放入
                            mSleep(1000)
                        else
                            touchClick(1007, 93, 255, 239, 205) -- 取消交易
                        end
                    end
                elseif not (isColor(210, 444, 23, 27, 33)) then
                    tiaoShi("已上货")
                    touchClick(204, 526, 90, 121, 165) -- 锁定
                    mSleep(1000)
                    touchClick(651, 400, 164, 115, 61) -- 确定
                    mSleep(1000)
                else
                    touchClick(1007, 93, 255, 239, 205) -- 取消交易
                end
            end
            if isColor(436, 527, 87, 124, 172, 5) and isColor(267, 525, 94, 94, 95, 5) then
                tiaoShi("交易框--未交易--仓库号")
                if shiBieLanZuan() == jiaGeDiWang then
                    touchClick(436, 527, 87, 124, 172) -- 交易
                    mSleep(1000)
                    touchClick(651, 400, 164, 115, 61) -- 确定
                    mSleep(1000)
                else
                    touchClick(1007, 93, 255, 239, 205) -- 取消交易
                end
            end
        end
        if danXuan4 == "3" then
            if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and
                isColor(18, 446, 181, 179, 159, 5) and isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
                if isColor(717, 540, 255, 117, 88) or isColor(717, 540, 254, 125, 91) then -- 有私信
                    tiaoShi("有私信")
                    touchClick(717, 540, 255, 117, 88) -- 聊天框 
                    mSleep(1000)
                    if isColor(382, 587, 254, 98, 65) then -- +号有红点
                        touchClick(363, 600, 189, 193, 202) -- +
                        touchClick(46, 593, 167, 169, 179) -- 世界红包
                        touchClick(975, 94, 255, 239, 206) -- 关闭
                    else
                        -- if isColor(75,324,255,100,65,50) then
                        --         timeXiaoHao = nowTime
                        --         gaiMuBiao(3,mb_QianWangJiaoYi,mm_QianWangJiaoYi)
                        -- elseif isColor(76,367,255,94,60) then
                        --         timeXiaoHao = nowTime
                        --         gaiMuBiao(3,mb_QianWangJiaoYi,mm_QianWangJiaoYi)
                        -- else
                        --         touchClick(15,104,160,133,108)--主动返回世界频道
                        --         touchClick(553,309,189,177,130)--关闭聊天
                        -- end
                        faEmail("有私信")
                        lua_exit()
                    end
                end
            end
        end
        if nowTime - timeHanHua >= 60 then
            if isColor(84, 24, 115, 115, 130, 5) and isColor(14, 82, 124, 28, 9, 5) and
                isColor(18, 446, 181, 179, 159, 5) and isColor(770, 542, 189, 186, 170, 5) then -- 有血条蓝条
                tiaoShi("点击聊天框")
                touchClick(717, 548, 255, 54, 19) -- 聊天框 
                mSleep(1000)
                timeHanHua = nowTime
            end
        end
    end
end

-- 处理垃圾
function chuLiLaJi()
    if isColor(586, 531, 206, 211, 223, 5) and isColor(618, 544, 179, 189, 202, 5) then
        tiaoShi("出售--8-1")
        touchClick(587, 530, 204, 210, 221)
    end
    if isColor(587, 530, 204, 210, 221, 5) and isColor(619, 544, 162, 171, 184, 5) then
        tiaoShi("出售--新")
        touchClick(587, 530, 204, 210, 221)
    end
    if isColor(432, 504, 107, 121, 160, 5) and isColor(592, 504, 174, 133, 80, 5) then
        tiaoShi("出售和使用-ios7")
        touchClick(432, 504, 103, 117, 157)
    end
    if isColor(432, 504, 103, 117, 157, 5) and isColor(592, 504, 172, 131, 77, 5) then
        tiaoShi("出售和使用")
        touchClick(432, 504, 103, 117, 157)
    end
    if isColor(321, 456, 185, 154, 103, 5) and isColor(572, 495, 119, 121, 130, 5) then
        tiaoShi("出售和使用--复数")
        touchClick(321, 456, 185, 154, 103)
    end
    if isColor(512, 490, 106, 126, 172, 5) and isColor(593, 509, 94, 110, 148, 5) then
        tiaoShi("出售1")
        touchClick(557, 498, 100, 118, 158) -- 出售
    end
    if isColor(319, 458, 183, 150, 102, 5) and isColor(649, 498, 118, 121, 130, 5) then
        tiaoShi("出售2")
        touchClick(361, 459, 179, 143, 97) -- 出售
    end
    if isColor(368, 457, 186, 161, 106, 5) and isColor(695, 531, 120, 123, 132, 5) then
        tiaoShi("出售--复数--确认")
        touchClick(368, 457, 186, 161, 106)
    end
    if isColor(513, 453, 109, 128, 173, 5) and isColor(595, 471, 97, 113, 150, 5) then
        touchClick(513, 453, 109, 128, 173) -- 出售-旧
    end
    if isColor(325, 458, 179, 144, 99, 5) and isColor(646, 461, 118, 121, 131, 5) then
        touchClick(325, 458, 179, 144, 99) -- 出售-旧
    end
    if isColor(651, 396, 164, 120, 64) then
        touchClick(651, 396, 164, 120, 64) -- 确认出售
    end
end

-- 使用物品
function shiYongWuPin(...)
    if isColor(523, 462, 181, 144, 97) then
        tiaoShi("使用-旧")
        touchClick(523, 462, 181, 144, 97)
    elseif isColor(522, 497, 183, 148, 100) then
        tiaoShi("使用")
        touchClick(522, 497, 183, 148, 100)
    elseif isColor(565, 529, 188, 156, 106) then
        tiaoShi("使用--新")
        touchClick(565, 529, 188, 156, 106)
    end
    if isColor(646, 398, 166, 118, 59) then
        tiaoShi("覆盖")
        touchClick(646, 398, 166, 118, 59)
    end
    if isColor(519, 495, 183, 149, 100) then
        touchClick(519, 495, 183, 149, 100) -- 使用
    elseif isColor(522, 462, 180, 145, 98) then
        touchClick(522, 462, 180, 145, 98) -- 使用-旧
    end
    if isColor(324, 459, 181, 146, 100, 5) and isColor(650, 495, 149, 151, 156, 5) then
        touchClick(320, 462) -- 使用
    elseif isColor(320, 462, 179, 141, 95, 5) and isColor(652, 458, 150, 151, 157, 5) then
        touchClick(320, 462, 179, 141, 95) -- 使用-旧
    elseif isColor(401, 465, 239, 241, 244, 5) and isColor(418, 473, 208, 215, 224, 5) then
        touchClick(407, 467)
    end
    if isColor(646, 398, 166, 118, 59) then
        tiaoShi("覆盖")
        touchClick(646, 398, 166, 118, 59)
    end
    mSleep(1000)
end

-- 卖垃圾
function maiLaJi(...)
    for j = 0, 2 do
        for i = 0, 4 do
            touchClick(764 + i * 77, 155 + j * 77)
            for k = 1, 10 do
                if isColor(696, 122, 164, 159, 146, 20) then
                    break
                end
                if isColor(748, 132, 144, 144, 127, 20) then
                    break
                end
                mSleep(300)
            end
            if (isColor(636, 169, 90, 195, 88, 5) and isColor(628, 205, 139, 210, 140, 5)) or
                (isColor(617, 175, 189, 234, 44, 5) and isColor(635, 180, 168, 238, 81, 5)) or
                (isColor(634, 173, 60, 202, 17, 5) and isColor(648, 190, 168, 196, 148, 5)) or
                (isColor(666, 184, 162, 222, 32, 5) and isColor(680, 202, 23, 97, 22, 5)) or
                (isColor(675, 201, 19, 97, 8, 5) and isColor(716, 208, 5, 221, 2, 5)) -- 绿123
                or (isColor(653, 180, 110, 1, 0, 5) and isColor(641, 189, 119, 32, 34, 5)) or
                (isColor(621, 181, 132, 28, 19, 5) and isColor(653, 182, 97, 20, 19, 5)) or
                (isColor(652, 164, 196, 46, 2, 5) and isColor(645, 196, 172, 122, 124, 5)) -- 红123
                or (isColor(636, 169, 209, 176, 85, 5) and isColor(648, 195, 144, 90, 13, 5)) or
                (isColor(618, 181, 170, 114, 2, 5) and isColor(653, 192, 236, 169, 15, 5)) or
                (isColor(649, 164, 236, 220, 16, 5) and isColor(647, 192, 170, 152, 136, 5)) or
                (isColor(679, 203, 144, 105, 48, 5) and isColor(716, 208, 228, 157, 9, 5)) -- 黄123
                or (isColor(640, 177, 87, 172, 202, 5) and isColor(650, 193, 28, 68, 186, 5)) or
                (isColor(618, 180, 8, 132, 202, 5) and isColor(632, 182, 9, 80, 196, 5)) or
                (isColor(650, 165, 25, 126, 246, 5) and isColor(649, 190, 139, 171, 191, 5)) or
                (isColor(678, 203, 17, 41, 102, 5) and isColor(713, 209, 4, 45, 94, 5)) -- 蓝123
            then
                -- tiaoShi("绿宝石")
                chuLiLaJi()
            elseif isColor(627, 175, 107, 10, 16, 5) and isColor(649, 183, 156, 29, 28, 5) then -- 红豆
                chuLiLaJi()
            elseif isColor(631, 184, 65, 62, 74, 5) and isColor(665, 175, 220, 161, 111, 5) then -- 芝麻
                chuLiLaJi()
            elseif isColor(630, 184, 221, 220, 221, 5) and isColor(658, 184, 171, 166, 161, 5) then -- 砂糖
                chuLiLaJi()
            elseif isColor(621, 177, 240, 240, 229, 5) and isColor(649, 185, 229, 176, 47, 5) then -- 甜酒
                chuLiLaJi()
            elseif isColor(626, 180, 245, 240, 229, 5) and isColor(653, 179, 182, 109, 95, 5) then -- 糯米
                chuLiLaJi()
            elseif isColor(620, 194, 230, 128, 167, 5) and isColor(667, 179, 201, 97, 167, 5) then -- 荷花灯
                shiYongWuPin()
            elseif isColor(639, 202, 255, 253, 90, 5) and isColor(638, 159, 254, 234, 82, 5) then -- 龙凤灯
                shiYongWuPin()
            elseif isColor(639, 207, 228, 159, 114, 5) and isColor(629, 158, 207, 127, 88, 5) then -- 核桃
                chuLiLaJi()
            elseif (isColor(651, 164, 196, 49, 6, 5) and isColor(648, 192, 175, 141, 146, 5)) or
                (isColor(650, 164, 231, 211, 12, 5) and isColor(648, 192, 177, 161, 144, 5)) or
                (isColor(652, 165, 25, 125, 245, 5) and isColor(649, 190, 149, 179, 195, 5)) then
                chuLiLaJi()
            elseif (isColor(621, 188, 228, 31, 5, 5) and isColor(645, 174, 248, 144, 16, 5)) or
                (isColor(614, 206, 239, 200, 106, 5) and isColor(665, 153, 221, 120, 38, 5)) or
                (isColor(617, 208, 61, 230, 191, 5) and isColor(658, 157, 168, 111, 56, 5)) or
                (isColor(612, 207, 243, 134, 32, 5) and isColor(652, 165, 32, 212, 228, 5)) or
                (isColor(613, 207, 234, 120, 32, 5) and isColor(650, 165, 43, 199, 217, 5)) -- ios7
                or (isColor(617, 208, 48, 235, 207, 5) and isColor(658, 158, 165, 106, 53, 5)) or
                (isColor(615, 207, 240, 205, 115, 5) and isColor(654, 159, 250, 190, 69, 5)) then -- 钥匙材料
                chuLiLaJi()
            elseif (isColor(618, 179, 105, 204, 12, 5) and isColor(633, 193, 30, 101, 21, 5)) or
                (isColor(617, 175, 247, 198, 93, 5) and isColor(647, 193, 151, 86, 1, 5)) or
                (isColor(621, 179, 144, 36, 25, 5) and isColor(667, 196, 107, 19, 15, 5)) then -- ios7宝石红绿黄
                chuLiLaJi()
            elseif isColor(617, 203, 204, 205, 206, 5) and isColor(665, 190, 120, 126, 131, 5) then -- 复活石
                chuLiLaJi()
            elseif (isColor(625, 164, 102, 232, 240, 5) and isColor(658, 198, 5, 125, 122, 5)) or
                (isColor(626, 163, 87, 216, 224, 5) and isColor(640, 208, 9, 117, 107, 5)) or
                (isColor(625, 164, 110, 239, 248, 5) and isColor(658, 198, 4, 131, 129, 5)) or
                (isColor(664, 210, 4, 113, 109, 5) and isColor(705, 208, 5, 125, 122, 5)) then -- 2/3倍经验
                shiYongWuPin()
            elseif isColor(627, 175, 149, 91, 44, 5) and isColor(651, 155, 159, 83, 86, 5) then -- 2500声望
                tiaoShi("声望")
                shiYongWuPin()
            elseif isColor(668, 203, 219, 198, 159, 5) and isColor(682, 184, 154, 97, 47, 5) then -- 4800声望
                tiaoShi("声望")
                shiYongWuPin()
            elseif isColor(648, 160, 190, 32, 44, 5) and isColor(640, 167, 250, 231, 144, 5) and
                isColor(652, 141, 19, 42, 96, 5) then -- 新
                chuLiLaJi()
            elseif isColor(648, 160, 193, 33, 45, 5) and isColor(640, 167, 249, 227, 140, 5) and
                isColor(652, 141, 24, 42, 95, 5) then -- 年
                chuLiLaJi()
            elseif (isColor(648, 160, 188, 32, 43, 5) and isColor(638, 167, 251, 228, 142, 5) and
                isColor(652, 141, 23, 42, 95, 5)) or
                (isColor(638, 167, 250, 228, 148, 5) and isColor(650, 170, 250, 227, 145, 5) and
                    isColor(652, 159, 176, 30, 41, 5) and isColor(658, 141, 20, 41, 90, 5)) then -- 快和快iOS7
                chuLiLaJi()
            elseif isColor(637, 167, 250, 230, 151, 5) and isColor(659, 171, 244, 220, 156, 5) and
                isColor(652, 161, 192, 35, 47, 5) and isColor(658, 139, 0, 44, 93, 5) then -- 乐ios7
                chuLiLaJi()
                -- elseif isColor(651,159,171,28,38,5) and isColor(650,170,248,223,131,5) and isColor(655,146,96,0,100,5) then--意
                -- chuLiLaJi()
                -- elseif isColor(651,159,172,28,38,5) and isColor(651,169,243,212,120,5) and isColor(655,146,101,0,100,5) then--祥
                --         chuLiLaJi()
            elseif isColor(658, 214, 237, 128, 32, 5) and isColor(702, 204, 38, 185, 209, 5) then
                chuLiLaJi()
            elseif isColor(673, 206, 200, 168, 111, 5) and isColor(665, 217, 44, 238, 206, 5) then
                chuLiLaJi()
            elseif isColor(666, 220, 222, 159, 74, 5) and isColor(705, 199, 252, 198, 93, 5) then
                chuLiLaJi()
            elseif isColor(669, 200, 216, 21, 4, 5) and isColor(687, 201, 217, 54, 7, 5) then
                chuLiLaJi()
            elseif isColor(670, 199, 218, 21, 4, 5) and isColor(682, 203, 208, 39, 5, 5) then
                chuLiLaJi()
            elseif isColor(660, 216, 234, 191, 99, 5) and isColor(669, 220, 253, 229, 135, 5) then
                chuLiLaJi()
            elseif isColor(663, 215, 11, 253, 242, 5) and isColor(670, 216, 11, 250, 244, 5) then
                chuLiLaJi()
            elseif isColor(687, 207, 29, 174, 208, 5) and isColor(717, 208, 50, 208, 236, 5) then
                chuLiLaJi()
            elseif isColor(659, 216, 227, 112, 32, 5) and isColor(673, 219, 193, 65, 33, 5) then
                chuLiLaJi()
            elseif isColor(672, 201, 123, 74, 1, 5) and isColor(695, 202, 164, 96, 0, 5) then
                chuLiLaJi()
            elseif isColor(666, 209, 7, 115, 112, 5) and isColor(703, 209, 4, 132, 132, 5) then
                shiYongWuPin()
            elseif isColor(631, 38, 19, 29, 68, 5) and isColor(631, 92, 83, 212, 246, 5) then -- 铭文
                touchClick(746, 156, 76, 197, 7)
                mSleep(3000)
                touchClick(533, 593, 182, 145, 99) -- 佩戴
                mSleep(1000)
                return
            elseif isColor(621, 213, 248, 228, 162, 5) and isColor(663, 160, 218, 110, 33, 5) then -- 恶魔通行证--ios7
                touchClick(31, 20)
                return
            elseif isColor(639, 161, 251, 200, 69, 5) and isColor(636, 210, 203, 82, 13, 5) then -- 恶魔通行证
                touchClick(31, 20)
                return
            elseif isColor(668, 223, 253, 238, 172, 5) and isColor(670, 223, 161, 107, 48, 5) then -- 恶魔通行证
                tiaoShi("恶魔通行证")
                touchClick(31, 20)
                return
            elseif isColor(665, 209, 255, 248, 202, 5) and isColor(698, 214, 229, 98, 12, 5) then -- 恶魔通行证
                tiaoShi("恶魔通行证")
                touchClick(31, 20)
                return
            else
                tiaoShi("啥也不是")
                touchClick(116, 89, 76, 79, 84) -- 空白
            end
        end
    end
    -- if isColor(746,156,76,197,7) or isColor(746,156,9,120,192) or isColor(746,156,172,116,2) or isColor(748,156,140,31,22) or isColor(748,156,146,33,26) --1级宝石
    -- or isColor(764,154,183,113,115) or isColor(754,166,71,2,4) or isColor(751,166,167,20,22)--红色2,3,4
    -- or isColor(767,150,90,215,47) or isColor(770,151,3,95,1) or isColor(759,149,59,196,18)--绿色2,3,4
    -- or isColor(760,148,200,167,91) or isColor(771,141,239,225,34) or isColor(776,140,231,193,19)--黄色2,3,4
    -- or isColor(764,154,100,185,220) or isColor(759,149,66,189,234) or isColor(765,144,80,219,245)--蓝色2,3,4
    -- then--第一格是宝石
    --         tiaoShi("第一格是宝石")
    --         -- touchClick(767,568,161,118,71)--打开仓库
    --         -- touchClick(746,156,76,197,7)--第一个
    --         -- touchClick(767,568,161,118,71)--关闭仓库
    --         touchClick(746,156,76,197,7)--第一个
    --         mSleep(3000)
    --         chuLiLaJi()
    --         touchClick(1073,568,151,112,59)--整理
    --         mSleep(1000)
    --         maiLaJi()
    -- -- elseif (isColor(753,175,154,30,36,5) and isColor(775,139,175,30,40,5)) or (isColor(753,175,151,26,35,5) and isColor(775,139,181,31,42,5))
    -- -- or (isColor(753,175,155,24,33,5) and isColor(775,139,175,31,41,5)) or (isColor(755,170,191,34,45,5) and isColor(773,139,183,31,43,5))
    -- -- then
    -- --         tiaoShi("福字")
    -- --         -- touchClick(767,568,161,118,71)--打开仓库
    -- --         -- touchClick(746,156,76,197,7)--第一个
    -- --         -- touchClick(767,568,161,118,71)--关闭仓库
    -- --         touchClick(746,156,76,197,7)--第一个
    -- --         mSleep(3000)
    -- --         chuLiLaJi()
    -- --         touchClick(1073,568,151,112,59)--整理
    -- --         mSleep(1000)
    -- --         maiLaJi()
    -- elseif isColor(759,148,165,112,57) then
    --         tiaoShi("声望物品")
    --         touchClick(746,156,76,197,7)
    --         mSleep(3000)
    --         if isColor(519,495,183,149,100) then
    --                 touchClick(519,495,183,149,100)--使用
    --         elseif isColor(522,462,180,145,98) then
    --                 touchClick(522,462,180,145,98)--使用-旧
    --         end
    --         if isColor(324,459,181,146,100,5) and isColor(650,495,149,151,156,5) then
    --                 touchClick(320,462)--使用
    --         elseif isColor(320,462,179,141,95,5) and isColor(652,458,150,151,157,5) then
    --                 touchClick(320,462,179,141,95)--使用-旧
    --         end
    --         mSleep(1000)
    --         touchClick(1073,568,151,112,59)--整理
    --         mSleep(1000)
    --         maiLaJi()
    -- elseif isColor(748,156,51,99,141) then
    --         tiaoShi("第一格是铭文")
    --         touchClick(746,156,76,197,7)
    --         mSleep(3000)
    --         touchClick(533,593,182,145,99)--佩戴
    --         mSleep(1000)
    -- elseif isColor(750,147,76,207,215,5) or isColor(750,147,71,199,207,5) then
    --         tiaoShi("多倍经验")
    --         touchClick(746,156,76,197,7)
    --         mSleep(3000)
    --         if isColor(523,462,181,144,97) then
    --                 tiaoShi("使用-旧")
    --                 touchClick(523,462,181,144,97)
    --         elseif isColor(522,497,183,148,100) then
    --                 tiaoShi("使用")
    --                 touchClick(522,497,183,148,100)
    --         end
    --         if isColor(646,398,166,118,59) then
    --                 tiaoShi("覆盖")
    --                 touchClick(646,398,166,118,59)
    --         end
    --         touchClick(1073,568,151,112,59)--整理
    --         mSleep(1000)
    --         maiLaJi()
    -- elseif isColor(772,144,39,199,223,5) or isColor(761,155,191,144,82) then
    --         tiaoShi("第一格是垃圾")
    --         touchClick(746,156,76,197,7)
    --         mSleep(3000)
    --         chuLiLaJi()
    --         touchClick(1073,568,151,112,59)--整理
    --         mSleep(1000)
    --         maiLaJi()
    -- elseif isColor(849,144,38,198,223,5) or isColor(839,155,190,140,80) or isColor(835,163,231,188,96) or isColor(843,155,246,131,14) then
    --         tiaoShi("第二格是垃圾")
    --         touchClick(849,144,38,198,223)
    --         mSleep(3000)
    --         chuLiLaJi()
    --         touchClick(1073,568,151,112,59)--整理
    --         mSleep(1000)
    --         maiLaJi()
    -- elseif isColor(912,163,230,187,96) or isColor(919,155,246,134,15) then
    --         tiaoShi("第三格是垃圾")
    --         touchClick(912,163,230,187,96)
    --         mSleep(3000)
    --         chuLiLaJi()
    --         touchClick(1073,568,151,112,59)--整理
    --         mSleep(1000)
    --         maiLaJi()
    -- end
end

-- 时间间隔
function timeJianGe(cs)
    s2 = os.time()
    tiaoShi(s2 - s1 .. "_" .. cs)
    s1 = s2
end

--[[
-- httpDown("http://www.xinqinew.win:8888/kuoZhanKu/ts.so", luaPath.."/plugin/ts.so")
-- ts = require("ts")
-- dialog(ts.version(), time)
-- lua_exit()
-- ts = require("ts")
-- code,msg = ts.tsDownload("test.txt","http://www.xinqinew.win:8888/test.txt")  
-- lua_exit()
-- ts = require("ts")
-- header_send = {typeget = "ios"}
-- body_send = {msg = "hello"}
-- ts.setHttpsTimeOut(60) --安卓不支持设置超时时间
-- status_resp, header_resp,body_resp = ts.httpGet("http://192.168.0.251", header_send, body_send)
-- dialog("状态:"..status_resp,0)
-- dialog("头:"..header_resp,0)
-- dialog("身体:".."状态:"..body_resp,0)

-- dialog("POST开始",0)
-- -- ts = require("ts")
-- header_send = {typeget = "ios"}
-- body_send = {msg = "hello"}
-- ts.setHttpsTimeOut(60) --安卓不支持设置超时时间
-- status_resp,header_resp,body_resp = ts.httpPost("http://192.168.0.251",header_send, body_send)
-- dialog("状态:"..status_resp,0)
-- dialog("头:"..header_resp,0)
-- dialog("身体:"..body_resp,0)

-- lua_exit()
-- dialog(muBiao1,0)
-- index = addDmOcrDict("qiji_shanhao.txt")--生成的字库文件格式必须为 UTF-8 格式，字库首尾不能包含空行、空格等
-- ret = dmOcrText(index,671,306,730,327,"B9D0E6,6F767B",90)--由于大漠工具的 11 行像素限制，对于较大文字识别效率不高，推荐使用触动字库工具配合触动文字识别函数使用效果更佳
-- dialog(ret,0)

-- dialog(muBiao1,0)
-- lua_exit()
-- touchQuickly(125,197,76,93,121)
--  s = os.clock()

-- for i=1,100 do
--         if isColor(359,174,71,76,84,5) then
--                 e = os.clock()
--                 nowTime1 = e - s
--                 dialog(nowTime1,0)
--                 return
--         end
--         mSleep(100)
-- end
-- kuoZhanKuDown()  
-- jieTuToIP()
-- current_time = os.date("%m-%d_%H.%M", os.time());
-- snapshot(iphoneId.."-"..current_time..".png", 0, 0, 1135,639); --以时间戳命名进行截图
-- ftpUpPNG(iphoneId.."-"..current_time..".png","zhenmo/PNG/")
-- lua_exit()
-- zhanLi()
-- snapshot(iphoneId.."."..current_time..".png", 0, 0,x,y); --以时间戳命名进行截图
-- ftpUp()
-- ts = require("ts")--使用官方库前一定要在开头插入这一句
-- ts.ftp.setFTPTimeOut(10)
-- status = ts.ftp.connect("35.187.149.126:2121","xinqinew","Qwer1234") 
-- if status then
--     dialog("连接成功", 0)
-- else
--     dialog("连接失败", 0)
-- end
-- ts.ftp.rename("/web/Screenshots/game.plist","/web/Screenshots/game1.plist")
-- -- xstatus = ts.ftp.delete("/web/Screenshots/game.plist")
-- -- if xstatus == true then
-- --         dialog("删除成功", 0)
-- -- else
-- --         dialog("删除失败", 0)
-- -- end

-- -- allFile = ts.ftp.list("/web/Screenshots")   --列出文件夹里所有文件
-- -- if allFile then
-- --     allFilestr=""
-- --     for i,v in pairs(allFile) do
-- --         allFilestr=v.."\n"..allFilestr;
-- --     end
-- --     dialog(allFilestr, 0)--打印文件夹内所有文件列表
-- -- else
-- --     dialog("error",0)
-- -- end
-- -- path = userPath()
-- -- upStatus = ts.ftp.upload(path.."/lua/game.plist","/web/Screenshots/game.plist") 
-- -- --上传本地lua文件夹下的main.lua文件到服务器的haha文件夹里
-- -- if upStatus then
-- --     dialog("上传完成", 0)
-- -- else
-- --     dialog("上传失败", 0)
-- -- end
-- ts.ftp.close()  --操作完成后，断开FTP服务器连接

-- ftpUp("game.plist", "Screenshots")
-- lua_exit()

-- if version == "2.2.4" then
--         index = addDmOcrDict("qiji_jinbi.txt")--生成的字库文件格式必须为 UTF-8 格式，字库首尾不能包含空行、空格等
-- else
--         local tab = {
--         "0040380F07218460B83FFFFFE018$4$0.0.51$13",
--         "100E0180618C318619E3FF18E$3$0.0.56$14",
--         "0E3FC7184608C11823843F03E$5$0.0.54$13",
--         "1E7FC7104608C11823843F03E$5$0.0.55$13",
--         "1F0FF186606C0D811863FF1FE$9$0.0.64$14",
--         "3FEFFF00400801003007FF3FE$0$0.0.55$13",
--         "1FE7FD8C610C618C19C39F21E$6$0.0.66$14",
--         "8010020040783D1C3E0780C00$7$0.0.31$13",
--         "1C67DD9E618C318618E3FF1CE$8$0.0.69$14",
--         "0040380F072184E1B83FFF80E008$4$0.0.44$13",
--         "180601807FFFFE$1$0.0.32$13",
--         "300E0581E03C0D8318C3F01C0$2$0.0.48$14",
--         "100E0181E03C0D8318C3F81C0$2$0.0.48$14",
--         "100E0581E03C0D8318C3F01C0$2$0.0.48$14",
--         }
--         index = addDmOcrDictEx(tab)
-- end
-- x,y = findMultiColorInRegionFuzzy( 0x7d95a1, "16|0|0x78929c,-2|39|0xc9342d,18|38|0xda3d36", 90, 727, 103, 1108, 529)
-- x,y = findMultiColorInRegionFuzzy( 0x718995, "13|0|0x3b515d,-2|37|0xc42415,16|35|0xdc4c44", 90, 727, 103, 1108, 529)
-- httpDown("http://wanmao.myDS.me:81/lua/hong.png", "/User/Media/TouchSprite/res/hong.png") 
-- mSleep(3000)
-- point = findMultiColorInRegionFuzzyExt( 0x718995, "13|0|0x3b515d,-2|37|0xc42415,16|35|0xdc4c44",  80, 727, 103, 1108, 529)
-- if #point ~= 0 then  --如返回的table不为空（至少找到一个符合条件的点）
--     for var = 1,#point do
--         touchClick(point[var].x,point[var].y)
--         mSleep(2000)
--         touchClick(31,20)
--         mSleep(1000)
--         toast(var)
--         -- toast(point[var].x..":"..point[var].y)
--         -- mSleep(3000)
--     end
-- end
-- touchMoveXY(1033,508,1033,125+32)
-- mSleep(2000)
-- x,y = findMultiColorInRegionFuzzy( 0x869eaa, "-6|33|0xba0604,5|30|0xd50d07", 90, 727, 103, 1108, 529)
-- if x > 0 then
--         touchClick(x,y)
-- end
-- 寻找符合条件的图片（假设图片的背景颜色为白色）
-- x, y = findImageInRegionFuzzy("/User/Media/TouchSprite/res/hong.png", 80, 727, 103, 1108, 529, 0x0f1116);
-- if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
--     touchDown(x, y);            --那么单击该图片
--     mSleep(30)
--     touchUp(x, y);
-- else                               --如果找不到符合条件的图片
--     dialog("未找到符合条件的坐标！",0);
-- end
-- lua_exit()
-- dialog(getData(),0)
-- F_SavesW("/User/Media/TouchSprite/res/weixin62.txt",getData())
-- lua_exit()
-- path = appDataPath(appWeiXin); 
-- dialog(path,0)
-- lua_exit()
-- weiXinPath = appDataPath(appWeiXin); 
-- weiXinDocuments = string.find(weiXinPath, "/Documents");
-- if weiXinDocuments ~= nil then
--      weiXinPath=string.sub(weiXinPath, 1, weiXinDocuments-1)
-- end
-- dialog(weiXinPath,0)

-- go = 1
-- faEmail("有私信")
-- lua_exit()
-- closeApp(appXiangMu)
-- lua_exit()
-- ]]
function dmOCR()
    dm_OCR_red = { "60CC0F10E214E6F78$3$0.0.30$11", "E00$,$0.0.3$3", "3FCFFF10E21446CF8060$6$0.0.39$11",
        "0703E0E4708C31FF80C008$4$0.0.33$10", "7CCCCF08E11466FF8$9$0.0.35$11",
        "F89F1A4148298D1F01C0$5$0.0.33$10", "3BCFFD10E214C2FF8060$8$0.0.39$11", "401003FF7FE$1$0.0.22$10",
        "8010020343EBE1E02000$7$0.0.22$10", "606C1F06E196E2F04$2$0.0.30$11",
        "3FCFFF00E01406FF87E0$0$0.0.42$11" }
    dm_OCR_white = { "401003FF7FE$1$0.0.22$10", "606C1F06E196E2F04$2$0.0.30$11", "60CC0F10E214E6F78$3$0.0.30$11",
        "0703E0E4708C31FF80C008$4$0.0.33$10", "F89F1A4148298D1F01C0$5$0.0.33$10",
        "3FCFFF10E21446CF8060$6$0.0.39$11", "8010020343EBE1E02000$7$0.0.22$10",
        "7CCCCF08E11466FF8$9$0.0.35$11" }

    dm_red = addDmOcrDictEx(dm_OCR_red)
    dm_white = addDmOcrDictEx(dm_OCR_white)
end

function bossGame()
    bossTime()
    -- tiaoShi("numBossTime:"..numBossTime)
    if numBossTime == 5 then
        flag1 = appIsRunning(appXiangMu);  -- 检测 项目 是否在运行
        flag2 = appIsRunning(appWeiXin);  -- 检测 微信 是否在运行
        if flag1 == 1 then -- 如果在运行
            closeApp(appXiangMu)
            mSleep(2000)
            if version ~= "2.2.4" then
                setBacklightLevel(0);
                -- if string.find(duoXuan1,"7") ~= nil then
                --         if nowDateTime.yday%2 == 1 then
                --                 connectToWifi("6900-5G","19830806",3)
                --         else
                --                 connectToWifi("2013-20150604GK_NetWork_1","15103551007",3)
                --         end
                -- elseif string.find(duoXuan1,"8") ~= nil then
                --         if nowDateTime.yday%2 == 1 then
                --                 connectToWifi("2013-20150604GK_NetWork_1","15103551007",3)
                --         else
                --                 connectToWifi("6900-5G","19830806",3)
                --         end
                -- end
                -- nowDateTime.yday%2
                -- connectToWifi("6900-5G","19830806",3)
                -- connectToWifi("2013-20150604GK_NetWork_1","15103551007",3)
            end
        end
        if flag2 == 1 then
            closeApp(appXiangMu)
            mSleep(2000)
        end
        mSleep(1000 * 60)
    else
        if version ~= "2.2.4" then
            if getBacklightLevel() ~= 0.5 then
                setBacklightLevel(0.5);
            end
        end
        local tmpWeiXinWeiHu = string.find(duoXuan1, "4")
        bid = frontAppBid()
        -- tiaoShi(bid)
        if bid == apps1 then
            -- tiaoShi("apps1")
            APP = APP1
        elseif bid == apps2 then
            -- tiaoShi("apps2")
            APP = APP2
        elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
            nowDateTime.min >= minWeiXin then

        else
            -- tiaoShi("哪个都没开")
            APP.isYiDengLu = 0
            runApp(apps1)
            APP = APP1
            mSleep(5000)
        end
        zongHe()
        zongHe_Mult()
        -- jiaZaiDouYu()
        -- -- contrastGame3()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- maiShu()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- fengHao()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- xiaoHao()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- cangKuHao()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- fuBenNei()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- jiaHaoYou()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- weiXinWeiHu()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- huanJiaoSeTime()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- qieHuanMuBiao()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- muBiaoZhuanHuan()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- liDui()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- maiYao()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- zhengLi()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- youHuaChiBang()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- zongHe()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- -- zhuanZhi()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- hongDian()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- dingShiDianRenWu()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- zhengLi()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- ziDongZhanDou()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- chongZhi()
        -- -- timeJianGe(debug.getinfo(1).currentline)
        -- jianCeXueTiao()
        -- -- timeJianGe(debug.getinfo(1).currentline)
    end
end

-- 云打码演示
function yunDaMaDemo()
    -----识别演示----
    -- 帐号信息配置
    local user = "user"
    local passwd = "pass"
    local softid = "3696" -- 必须改成作者自己的软件id，用来适配图片类型，分配作者提成

    local filepath = "/sdcard/Pictures/1.jpg"

    local left_point = CR_GetUserInfo(user, passwd)
    dialog("剩余验证码点数：" .. left_point, time)

    local re = CR_RecvBytes(user, passwd, softid, filepath)
    -- dialog(re, time)
    local json_table = json.decode(re)
    local info = json_table["info"]
    if info == 1 then
        -- 识别成功
        dialog("识别结果：" .. json_table["result"])
    elseif info == 0 then
        dialog("识别超时")
    elseif info == -1 then
        dialog("网络问题")
    elseif info == -2 then
        dialog("余额不足")
    elseif info == -5 then
        dialog("用户校验失败，用户或密码错误")
    elseif info == -6 then
        dialog("图片格式错误或图片过大了")
    elseif info == -20 then
        dialog("图片打开失败，路径或权限错误")
    else
        dialog("其他错误")
    end
end

-- 云打码
function yunDaMa(str)
    -- ocrInfo("qqchaoren", "username", "password") -- 初始化打码平台
    -- bool, bal = ocrBalance() -- 查询用户余额
    -- tiaoShi("云打码余额:" .. bal)
    -- YDMtext, YDMtid = ocrScreen(222, 12, 596, 157, 103, 60, 1)
    -- return YDMtext

    local ret1 = ocr.cloudOcrText(str);
    -- toast(YDM_username,2) -- 打码平台账号
    -- toast(YDM_password,2)
    toast(ret1.text, 2)
    mSleep(2000)
    toast(ret1.message, 2)
    mSleep(2000)
    toast("O了", 2)
    mSleep(2000)


    if ret1.success then
        toast(ret1.text)
        return ret1.text
    else
        toast(ret1.message)
        return false
    end
    -- 自动纠错
    -- local ocr = require "cloudOcr"; -- 载入扩展库
    -- local ret = ocr.cloudOcrText(op); -- 进行远程识别
    -- if ret.success then
    --     ret_1 = ocr.cloudOcrReportError(ret.id); -- 自动纠错，ret.id 从 ocr.cloudOcrText 返回值中获取
    -- end
    -- local ocr = require "cloudOcr";
    -- local ver = ocr.version(); -- 获取扩展库版本号
end

-- 在线脚本
function onlineLua()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/riseOfStars.lua")
    -- local bool = delFile(userPath() .. "/lua/riseOfStars.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        toast("删除失败，失败原因：" .. msg, 1)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
    local temRet = ftpDownTSnet("/Lua/riseOfStars.lua", userPath() .. "/lua/riseOfStars.lua")
    -- local temRet = ftpDownTS("/Lua/riseOfStars.lua", userPath() .. "/lua/riseOfStars.lua")
    -- local temRet = ftpDownOnce(ftpMuLu .. "Lua/riseOfStars.lua", userPath() .. "/lua/riseOfStars.lua")
    if temRet then
        toast("FTP下载成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/riseOfStars.lua", luaFile, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            -- httpDown("https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars@main/riseOfStars.lua", "/var/mobile/Media/TouchSprite/lua/riseOfStars.lua")
            if code == 200 then
                toast("Github下载成功", 1)
                mSleep(1000)
                break
            else
                tiaoShi("下载失败：" .. msg)
                mSleep(1000)
            end
        end
    end
end

---------------------------------------riseOfStars起--------------------------------
numLua = 21.0
toast("在线版本:" .. numLua)
local image_tsing = require("tsimg")
appXiangMu1 = "com.wemademax.riseofstars"
appXiangMu3 = "com.wemadeconnect.etgnft.everytown"
appCalculator = "com.apple.calculator"

-- 对比颜色加强
do
    oldIsColor = isColor
    isColor = function(intX, intY, color, sim)
        windowsDecide()
        return oldIsColor(intX, intY, color, sim)
    end
end
-----------------------TT图鉴--------------------------

http = require "szocket.http"
ltn12 = require "ltn12"
-- local json = require("ttjson");

local username, password, yzmId;

ZZBase64 = {}
local string = string

ZZBase64.__code = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/',
};
ZZBase64.__decode = {}
for k, v in pairs(ZZBase64.__code) do
    ZZBase64.__decode[string.byte(v, 1)] = k - 1
end

function ZZBase64.encode(text)
    local len   = string.len(text)
    local left  = len % 3
    len         = len - left
    local res   = {}
    local index = 1
    for i = 1, len, 3 do
        local a = string.byte(text, i)
        local b = string.byte(text, i + 1)
        local c = string.byte(text, i + 2)
        -- num = a<<16 + b<<8 + c
        local num = a * 65536 + b * 256 + c
        for j = 1, 4 do
            --tmp = num >> ((4 -j) * 6)
            local tmp = math.floor(num / (2 ^ ((4 - j) * 6)))
            --curPos = tmp&0x3f
            local curPos = tmp % 64 + 1
            res[index] = ZZBase64.__code[curPos]
            index = index + 1
        end
    end

    if left == 1 then
        ZZBase64.__left1(res, index, text, len)
    elseif left == 2 then
        ZZBase64.__left2(res, index, text, len)
    end
    return table.concat(res)
end

function ZZBase64.__left2(res, index, text, len)
    local num1 = string.byte(text, len + 1)
    num1 = num1 * 1024 --lshift 10
    local num2 = string.byte(text, len + 2)
    num2 = num2 * 4 --lshift 2
    local num = num1 + num2

    local tmp1 = math.floor(num / 4096) --rShift 12
    local curPos = tmp1 % 64 + 1
    res[index] = ZZBase64.__code[curPos]

    local tmp2 = math.floor(num / 64)
    curPos = tmp2 % 64 + 1
    res[index + 1] = ZZBase64.__code[curPos]

    curPos = num % 64 + 1
    res[index + 2] = ZZBase64.__code[curPos]

    res[index + 3] = "="
end

function ZZBase64.__left1(res, index, text, len)
    local num = string.byte(text, len + 1)
    num = num * 16

    tmp = math.floor(num / 64)
    local curPos = tmp % 64 + 1
    res[index] = ZZBase64.__code[curPos]

    curPos = num % 64 + 1
    res[index + 1] = ZZBase64.__code[curPos]

    res[index + 2] = "="
    res[index + 3] = "="
end

function ZZBase64.decode(text)
    local len = string.len(text)
    local left = 0
    if string.sub(text, len - 1) == "==" then
        left = 2
        len = len - 4
    elseif string.sub(text, len) == "=" then
        left = 1
        len = len - 4
    end

    local res = {}
    local index = 1
    local decode = ZZBase64.__decode
    for i = 1, len, 4 do
        local a = decode[string.byte(text, i)]
        local b = decode[string.byte(text, i + 1)]
        local c = decode[string.byte(text, i + 2)]
        local d = decode[string.byte(text, i + 3)]

        --num = a<<18 + b<<12 + c<<6 + d
        local num = a * 262144 + b * 4096 + c * 64 + d

        local e = string.char(num % 256)
        num = math.floor(num / 256)
        local f = string.char(num % 256)
        num = math.floor(num / 256)
        res[index] = string.char(num % 256)
        res[index + 1] = f
        res[index + 2] = e
        index = index + 3
    end

    if left == 1 then
        ZZBase64.__decodeLeft1(res, index, text, len)
    elseif left == 2 then
        ZZBase64.__decodeLeft2(res, index, text, len)
    end
    return table.concat(res)
end

function ZZBase64.__decodeLeft1(res, index, text, len)
    local decode = ZZBase64.__decode
    local a = decode[string.byte(text, len + 1)]
    local b = decode[string.byte(text, len + 2)]
    local c = decode[string.byte(text, len + 3)]
    local num = a * 4096 + b * 64 + c

    local num1 = math.floor(num / 1024) % 256
    local num2 = math.floor(num / 4) % 256
    res[index] = string.char(num1)
    res[index + 1] = string.char(num2)
end

function ZZBase64.__decodeLeft2(res, index, text, len)
    local decode = ZZBase64.__decode
    local a = decode[string.byte(text, len + 1)]
    local b = decode[string.byte(text, len + 2)]
    local num = a * 64 + b
    num = math.floor(num / 16)
    res[index] = string.char(num)
end

local function ttImagebase64(file)
    local f = io.open(file, "rb")
    if f then
        local retbyte = f:read("*all")
        f:close()
        return ZZBase64.encode(retbyte)
    else
        print "image not found please check"
    end
end

local function ttRecoginze(user, pwd, imagefile, typeid)
    local request_body = {
        username = user, --填写账户名
        password = pwd, --填写密码
        typeid = typeid, --验证码类型(默认 3 数英混合)：16:汉字 14:图片旋转 11:计算题 7:无感学习，4:闪动GIF，3:数英混合， 2:纯英文，1:纯数字
        --返回坐标类型(默认 19 一个坐标)。 19: 1个坐标， 20: 1 ~ 4个坐标， 21: 3 ~ 5个坐标， 22: 5 ~ 8个坐标。
        image = ttImagebase64(imagefile)
    }
    request_body = json_ts.encode(request_body)
    local url = "http://api.ttshitu.com/predict";

    local response_body = {}
    local res, code, response_headers = http.request {
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json";
            ["Content-Length"] = #request_body;
        },
        source = ltn12.source.string(request_body),
        sink = ltn12.sink.table(response_body),
    }
    if type(response_body) == "table" then
        --解析返回结果
        local strBody = table.concat(response_body);
        local bl, tbody = pcall(json_ts.decode, strBody)
        if bl then
            if tbody.success == true then
                local id, vcode = tbody.data.id, tbody.data.result
                print("id:", id); --识别结果的id
                print("suceess:", vcode); --识别的结果
                return true, id, vcode
            else
                print("error:", tbody.message);
                return false, nil, nil, tbody.message

            end
        else
            print(strBody)
            print("json error:");
            return bl, nil, nil, "json error"

        end

    else
        print("Not a table:", type(response_body))
    end
end

--识别报错
local function ttReportError(yzmid)
    local response_body = {}
    local post_data = "id=" .. yzmid;
    local res, code = http.request {
        url = "http://api.ttshitu.com/reporterror.json",
        method = "POST",
        headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Content-Length"] = #post_data,
        },
        source = ltn12.source.string(post_data),
        sink = ltn12.sink.table(response_body)
    }
    --解析返回结果
    local strExp = "success\":true";
    local strBody = table.concat(response_body);
    local strResult = string.match(strBody, strExp);
    if (strResult ~= nil) then
        return "report success";
    else
        return "report failed";
    end
end

local function ocrImage(path, typeid)
    http.TIMEOUT = 120
    local lzRe, yzmid, jieguo, err = ttRecoginze(username, password, path, typeid)
    if lzRe then yzmId = yzmid return jieguo, yzmid else return nil, err end
end

local function info(user, pwd)
    username = user;
    password = pwd;
end

local function ttReportError2(yzmid)
    yzmid = yzmid or yzmId
    return ttReportError(yzmid)
end

tt = {}
tt.Info = info
tt.Image = ocrImage
tt.ReportError2 = ttReportError2
-- do return tt end



-----------------------公共部分--------------------------
function tap1(x, y, ...)
    touchClick(x, y)
    -- debug(x..","..y)
end

-- 点击后,如果还是对应的颜色,则重新点击
function tapBefore(x, y, color, dim, x1, y1)
    -- tiaoShi(x..","..y)
    local cs = math.random(1, 9);
    for i = 1, 10, 1 do
        touchDown(cs, x, y);
        mSleep(300);
        touchUp(cs, x, y);
        mSleep(1000);
        dim = dim or 95
        x1 = x1 or x
        y1 = y1 or y
        if not (isColor(x1, y1, color, dim)) then
            break
        end
    end
end

-- 点击后,如果还是对应的颜色,则重新点击
function tapAfter(x, y, color, dim, x1, y1)
    -- tiaoShi(x..","..y)
    local cs = math.random(1, 9);
    for i = 1, 10, 1 do
        touchDown(cs, x, y);
        mSleep(300);
        touchUp(cs, x, y);
        mSleep(1000);
        dim = dim or 95
        x1 = x1 or x
        y1 = y1 or y
        if not (isColor(x1, y1, color, dim)) then
            break
        end
    end
end

--全屏乱点
function screenClickNew(intX, intY, color)
    for x = 1, 113, 1 do
        for y = 1, 63, 1 do
            if isColor(intX, intY, color, 90) == false then
                return
            end
            if math.abs(intX - x * 10) <= 40 and math.abs(intY - y * 10) <= 40 then

            else
                touchSuper(x * 10, y * 10)
            end
        end
    end
end

function ttScreen(x1, y1, x2, y2, scale) --此处为触动截图方法 开发者请根据实际脚本工具自己编写
    scale = scale or 1
    local path = userPath() .. "/res/ttshu.png"
    snapshot("ttshu.png", x1, y1, x2, y2, scale)
    return path
end

-- 云打码
function yunDaMaNew(str, x1, y1, x2, y2)
    -- ocrInfo("qqchaoren", "username", "password") -- 初始化打码平台
    -- bool, bal = ocrBalance() -- 查询用户余额
    -- tiaoShi("云打码余额:" .. bal)
    -- YDMtext, YDMtid = ocrScreen(222, 12, 596, 157, 103, 60, 1)
    -- return YDMtext
    if TTtuJian == "TT图鉴" then
        tt.Info(TT_username, TT_password)
        local picPath = ttScreen(x1, y1, x2, y2) --图片的路径完整路径此处为截图获取的路径
        local res, id = tt.Image(picPath, 7) --开始识别
        -- debug(res)
        if res then
            return res
        else
            debugA("识别失败")
            return false
        end
        -- print("result", res, id) --识别结果,识别id
    else
        local ret1 = ocr.cloudOcrText(str);
        if ret1.success then
            tiaoShi(ret1.text)
            return ret1.text
        else
            tiaoShi(ret1.message)
            return false
        end
    end
    -- 自动纠错
    -- local ocr = require "cloudOcr"; -- 载入扩展库
    -- local ret = ocr.cloudOcrText(op); -- 进行远程识别
    -- if ret.success then
    --     ret_1 = ocr.cloudOcrReportError(ret.id); -- 自动纠错，ret.id 从 ocr.cloudOcrText 返回值中获取
    -- end
    -- local ocr = require "cloudOcr";
    -- local ver = ocr.version(); -- 获取扩展库版本号
end

-- 变量及常量
function bianLiang()
    -----------------------公共部分--------------------------

    hScreen, wScreen = getScreenSize()
    uiconfig = "uiconfig.dat"
    json_ts = ts.json
    plist_ts = ts.plist
    isLuaStart = true -- 脚本启动
    isPause = false
    numInit = 1
    appShadowrocket = "com.liguangming.Shadowrocket"
    appWallet = "com.wemadetree.wemixwallet"
    tableFromJson = json_ts.decode(readFileString(userPath() .. "/res/" .. iphoneId .. ".json")) --将 json 格式数据转成 table 格式数据

    -- debug0( type(tableFromJson["增产粒子"]))
    -- if tableFromJson["增产粒子"] ~= nil  then
    -- debug0(tableFromJson["增产粒子"][2])
    -- end

    -- 项目ID
    -- appXiangMu = loadJson("项目ID")
    -- if appXiangMu == nil then
    --     appXiangMu = dialogInput("请输入项目ID", "在这里输入项目ID", "确认");
    --     writeJson("项目ID", appXiangMu)
    -- end

    -- 火眼云打码
    HuoYan_username = loadJson("YDM_username")
    if HuoYan_username == nil then
        HuoYan_username, HuoYan_password = dialogInput("请输入云打码帐号和密钥",
            "在这里输入YDM_username #在这里输入YDM_password", "确认");
        writeJson("YDM_username", HuoYan_username)
        writeJson("YDM_password", HuoYan_password)
    end
    HuoYan_password = loadJson("YDM_password")

    -- TT云打码
    TT_username = loadJson("TT_username")
    if TT_username == nil then
        TT_username = dialogInput("请输入TT云打码帐号",
            "在这里输入TT_username", "确认");
        writeJson("TT_username", TT_username)
    end
    TT_password = loadJson("TT_password")
    if TT_password == nil then
        TT_password = dialogInput("请输入TT云打码密钥",
            "在这里输入TT_password", "确认");
        writeJson("TT_password", TT_password)
    end

    op = {
        -- 必填参数
        ["platform"] = "hyocr", -- 平台类型，具体参数参照参数表
        ["x1"] = 222, -- 需要识别区域左上角坐标
        ["y1"] = 12,
        ["x2"] = 596, -- 需要识别区域右下角坐标
        ["y2"] = 157,
        ["type"] = "4016", -- 打码类型，可在对应平台官网查询
        ["username"] = HuoYan_username, -- 打码平台账号
        ["password"] = HuoYan_password, -- 打码平台密码
        -- 选填参数
        ["length"] = 8, -- 打码长度
        ["timeout"] = 30, -- 超时时间
        ["scale"] = 100 -- 缩放比例，范围 10 - 200，在某些待识别区域过大的时候可设置此参数
    };

    numXiangMu = 0

    -----------------------私有部分--------------------------
    RGB_NoticeBJ = "306090" -- "FFFF00"
    RGB_NoticeFont = "FFFFFF" -- "FF0000"
    strNotice = "..."

    isJiKu = false --机库
    isPirateSub = true --海盗减号
    isKaSearch = false -- 卡搜索
    isBuyLiZi = true -- 买粒子
    isLiZied = false -- 粒子
    isShengChan = true -- 生产标志
    isKillPirate = false -- 杀海盗
    isJiaSuProduce = false -- 加速生产
    isAutoNext = true -- 主动下一个建筑
    isJiDiXianKuangIntoProduce = false -- 从基地现况进入生产界面
    isJustBack = false -- 刚回基地
    isBug_LiZi = false -- bug 粒子
    isChongDianKaZiYuan = false -- 充电卡资源
    isShipBad = false -- 航母 坏
    isKaZhuXianJianZhang = false -- 卡主线--舰长
    isKaJianZhangJingYan = 3 -- 卡主线--舰长经验
    isKaShengChan = false -- 卡主线--生产
    isFalseLiZi2 = false --2级粒子挖掘失败
    isOverHelp = false --协助已完成
    isCheckLiZiNum = false --检查粒子数量
    isAttacked = false --被攻击
    bRedOut1 = false
    bRedOut2 = false
    bRedOut3 = false
    bRedOut4 = false
    bRedOut5 = false
    bRedOut6 = false
    bRedOut7 = false
    bRedOut8 = false
    bRedOut9 = false
    bRedOut10 = false
    bRedOut11 = false
    bRedOut12 = false

    numSeach = 0
    numRed = 0
    strVpnModel = ""
    numShengJiCengShu = 0 --建筑升级条件层数
    numZiYuan = 1
    numKaiFa = 1
    numFangYu = 1
    numShengChan = 1
    numJingRui = 1
    numZhanJian = 1
    numLiZiTeam = 0 -- 在挖粒子的队伍
    numSearchLiZiSecond = 20
    -- numSearchLiZi = 0
    num5DaoJu = 0
    numDiaoXian = 0
    numChuHang = 1 -- 出航编号
    numSearch = 0 -- 搜索
    numYunDaMa = 0 -- 云打码

    nowTime = os.time();
    timeJiKu = nowTime - 60 * 60 * 1  --库存间隔时间
    timeXiangMu1 = nowTime + 60 * 60 * 24 --项目1已闲置时间
    timeCheckLiZiNum = nowTime - 60 * 60 * 1 --定时检查粒子数量
    timeShengJiTongXingZheng = nowTime --升级通行证
    timeUpJson = nowTime - 10 * 60 --上传间隔
    timeZhengLi = nowTime - 5 * 60 --检测背包
    timeWalletWatch = nowTime - 10 * 60 -- 钱包检测
    timeAttacked = nowTime -- 被攻击
    timeBeAttack2 = 0 -- 被攻击2
    timeOpen = nowTime -- 开服
    timeRed = nowTime - 15 * 60 -- 红点
    timeRound = nowTime - 4 * 60 * 60 -- 成品号循环 优化--主线--挖矿
    timeChongDian = nowTime - 4 * 60 * 60 -- 充电卡资源
    timeLiZi = nowTime - 3 * 60 -- 粒子在不在采集,3分钟检测一次
    timeYanJiu = nowTime - 60 -- 研究
    timeJiDi = nowTime - 10 * 60 -- 基地红点
    timeLianMengRenWu = nowTime - 60 * 60 -- 联盟任务
    timeKillPirate = nowTime - 60 * 10 -- 杀海盗
    timeXXX = nowTime -- 掉线检测
    timeInside = nowTime - 5 * 60
    timeLianMeng = nowTime - 60 * 60 * 2 -- 联盟
    timeShengChan = nowTime - 60 * 60 * 2 -- 生产

    ---------------项目2---------------
    numDead = 0
    numUpLeft = 0
    numUpRight = 0
    numDownLeft = 0
    numDownRight = 0

    isDead = false
    isCollectBug = false

    timeOcrLevel = nowTime - 60 --定时认别等级
    timeXuanDanRed = nowTime - 60 * 10 --选单红点
    timeCollectBug = nowTime
    timeTask_ZhuXian = nowTime - 10

    ---------------项目3---------------
    table_tree = {}
    lastFruitX = 0
    isZhiDingFruit = false --指定种植水果
    isScaned = false --扫描所有地块

    strZhiDingFruit = ""

    timeTap = nowTime
    timeXiangMu3 = nowTime + 60 * 60 * 24 --项目1已闲置时间
    timeTree = nowTime --果树收割间隔
    timeDesk = nowTime --返回桌面
    timeDecideIsFarm = nowTime --决定是否判定是农场
    timeLastShop = nowTime + 60 * 60 * 24 --上次商店打开时间
    timeMinFruit = 0 --最小的剩余时间

    numRowFruit = 0 --最小值的行
    numColumnFruit = 0 --最小值的列
    numMinID = 0 --最小值的下标
    numLastTreeRow = 0 --最后一颗树的所在行
    numLastTreeColumn = 0 --最后一颗树的所在列

end

-- 新UI
function newUi()
    w, h = getScreenSize()
    UINew(4, "公共设置,项目1,项目2,项目3", "开始", "取消", uiconfig, 0, 5, w, h, "245,245,245",
        "175,238,238", "", "dot"
        , 1, 15,
        "left")

    -- UILabel("--------------------公共设置--------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck("check1,check2,check3,check4,check5,check6,checkXiangMu1,checkXiangMu2,TTtuJian,checkXiangMu3",
        "网络调试,本地调试,集中文件,测试,注销,删除配置,项目1,项目2,TT图鉴,项目3"
        , "4@6", -1,
        0, "", 1, 3) -- 多选1
    -- UILabel(2, "---------------------项目1---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck(2,
        "check7,check8,check9,check10,check11,check12,check13,check14,check15,check16,check17,check18,check19,check20,check21,check22,check23,check24,check25,check26,check27"
        ,
        "联盟任务,大号,成品号,小号,不生产,不挖粒子,抢粒子,研究,生产加速,vip8,强制金属,强制矿物,强制氯气,2级粒子,自动切换梯子,活动,60海盗,买钛,库存,3级粒子,1级粒子"
        ,
        "3@5", -1, 0, "", 1, 3) -- 多选1
    UILabel(2, "航母数量", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(2, "numShip", "0,1,2,3,4", "0", -1, 1, true) -- 下拉框
    UILabel(2, "兑换批次", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(2, "numDuiHuan", "0,1,2,3,4,5,6,7,8", "0", -1, 0, true) -- 下拉框
    UILabel(2, "目标1 无,优化,主线,挖矿,日常,挂机,开区检测,章节,采集,去采集点", 10, "left",
        "72,61,139", -1, 0, "center") -- 标签
    UIEdit(2, "muBiaoA1", "目标1", "", 15, "left", "95,158,160", "default", 0, 0) -- 编辑框
    UILabel(2, "目标2 无,5道具,采集,收获,技能,兑换,道具合成", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(2, "muBiaoA2", "目标2", "", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(2, "目标3 无,整理,出航,修船,研究,钱包检测,登录钱包,兑换粒子", 10, "left", "72,61,139"
        , -1, 0, "center")
    UIEdit(2, "muBiaoA3", "目标3", "", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(2, "目标4 无,战备,战备跑路,战备开盾", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(2, "muBiaoA4", "目标4", "", 15, "left", "95,158,160", "default", 0, 0)

    -- UILabel(3, "---------------------项目2---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck(3, "Bcheck1,Bcheck2", "占位1,占位2", "0", -1, 0, "", 1, 3) -- 多选1
    UICombo(3, "numCollect", "采集点1,采集点2,采集点3,采集点4", "0", -1, 1, true) -- 下拉框
    UICombo(3, "numMap", "锐角路,虚空摇篮,干涸之湖,最前线,幻象之路,月影废墟", "0", -1, 1, true) -- 下拉框
    UICombo(3, "numGuaJiDian", "挂机点1,挂机点2,挂机点3,挂机点4,挂机点5,挂机点6,挂机点7,挂机点8"
        , "0", -1, 1, true) -- 下拉框

    -- UILabel(4, "---------------------项目3---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICombo(4, "numHaoLV", "小号,成品号,大号", "0", -1, 0, true) -- 下拉框
    UICheck(4, "Ccheck1,Ccheck2,Ccheck3", "4排为树,5排为树,占位", "0", -1, 0, "", 1, 3) -- 多选1
    UICheck(4, "Ccheck0", "重置table", "", -1, 0, "", 1, 3) -- 多选1
    UICheck(4,
        "checkGuoShi,checkTomato,checkCaoMei,checkSunflower,checkGrape,checkCane,checkSouthMelon,checkShuiDao,checkPotato,checkDingxiang,checkRenshen,checkHongdou,checkXiangCao"
        , "检查果实,番茄,草莓,向日葵,葡萄,甘蔗,南瓜,水稻,土豆,丁香,人参,红豆,香草"
        , "0", -1, 0,
        "", 0, 3) -- 多选1
    UICheck(4,
        "checkCook,checkEgg,checkRice"
        , "烹饪,参鸡汤,蛋包饭"
        , "0", -1, 0,
        "", 0, 3) -- 多选1
    -- UIEdit(4, "rangeX1", "X1", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeY1", "Y1", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeX2", "X2", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeY2", "Y2", "", 15, "left", "95,158,160", "number", 120, 0) -- 编辑框
    UIEdit(4, "farmLong", "边", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    UIEdit(4, "numTree", "树", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    UIEdit(4, "numFarm", "田", "", 15, "left", "95,158,160", "number", 120, 0) -- 编辑框
    UILabel(4, "目标1 无,挂机", 10, "left",
        "72,61,139", -1, 0, "center") -- 标签
    UIEdit(4, "muBiaoC1", "目标1", "", 15, "left", "95,158,160", "default", 0, 0) -- 编辑框
    UILabel(4, "目标2 无,种植,等待收割", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(4, "muBiaoC2", "目标2", "", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(4, "目标3 无,烹饪", 10, "left", "72,61,139"
        , -1, 0, "center")
    UIEdit(4, "muBiaoC3", "目标3", "", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(4, "目标4 无", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(4, "muBiaoC4", "目标4", "", 15, "left", "95,158,160", "default", 0, 0)
    UIShow()

    if check26 == "3级粒子"  then
        numSeachLiZi = 3 
    elseif check20 == "2级粒子"  then
        numSeachLiZi = 2  
    elseif check27 == "1级粒子"  then
        numSeachLiZi = 1
    end  
    if check12 == "不挖粒子" then
        notWaLiZi = true
    else
        notWaLiZi = false
    end

    if check10 == "小号" then
        haoLV = 1
    end
    if check9 == "成品号" then
        haoLV = 2
    end
    if check8 == "大号" then
        haoLV = 3
    end
    if checkXiangMu1 == "项目1" then
        numInit = 1
    end
    if checkXiangMu2 == "项目2" then
        numInit = 1
    end
    if checkXiangMu3 == "项目3" then
        numInit = 1
        -- rangeX1 = tonumber(rangeX1)
        -- rangeY1 = tonumber(rangeY1)
        -- rangeX2 = tonumber(rangeX2)
        -- rangeY2 = tonumber(rangeY2)
        farmLong = tonumber(farmLong)
        numTree = tonumber(numTree)
        numFarm = tonumber(numFarm)
    end

    init(numInit)
    floatingWindow()
end

-- 目标转换--新A
function muBiaoZhuanHuanNewA(...)
    if muBiaoA4 ~= "" and muBiaoA4 ~= "无" then
        muBiaoA = muBiaoA4
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoA3 ~= "" and muBiaoA3 ~= "无" then
        muBiaoA = muBiaoA3
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoA2 ~= "" and muBiaoA2 ~= "无" then
        muBiaoA = muBiaoA2
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoA1 ~= "" and muBiaoA1 ~= "无" then
        muBiaoA = muBiaoA1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    else
        muBiaoA1 = ""
        muBiaoA = muBiaoA1
        writeConfigNew("muBiaoA1", muBiaoA1)
        timeDingShiDianRenWu = nowTime - 60 * 60
    end

end

-- 改目标--新A
function gaiMuBiaoNewA(cs_num, cs_muBiao, ...)
    if cs_num == 1 then
        muBiaoA1 = cs_muBiao
        writeConfigNew("muBiaoA1", cs_muBiao)
        muBiaoZhuanHuanNewA()
        writeJson("目标A1", cs_muBiao)
    elseif cs_num == 2 then
        muBiaoA2 = cs_muBiao
        writeConfigNew("muBiaoA2", cs_muBiao)
        muBiaoZhuanHuanNewA()
        writeJson("目标A2", cs_muBiao)
    elseif cs_num == 3 then
        muBiaoA3 = cs_muBiao
        writeConfigNew("muBiaoA3", cs_muBiao)
        muBiaoZhuanHuanNewA()
        writeJson("目标A3", cs_muBiao)
    elseif cs_num == 4 then
        muBiaoA4 = cs_muBiao
        writeConfigNew("muBiaoA4", cs_muBiao)
        muBiaoZhuanHuanNewA()
        writeJson("目标A4", cs_muBiao)
    end
end

-- 更改配置文件
function writeConfigNew(id, neirong)
    local f = io.open(luaPath .. "/config/" .. uiconfig, 'r')
    local tmpString = f:read("*all")
    local tmpWeiZhi1 = string.find(tmpString, id);
    -- debug("tmpWeiZhi1:"..tmpWeiZhi1)
    local tmpWeiZhi2 = string.find(tmpString, "Edit", tmpWeiZhi1 + 10)
    local tmpQianDuan = string.sub(tmpString, 1, tmpWeiZhi1 + 10)
    local tmpHouDuan = string.sub(tmpString, tmpWeiZhi2, -1)
    f:close()
    f = io.open(luaPath .. "/config/" .. uiconfig, 'w')
    f:write(tmpQianDuan .. neirong .. "$$$" .. tmpHouDuan)
    -- str, num = string.gsub(tmpString, id .. "$$$" .. old .. "$$$", id .. "$$$" .. new .. "$$$")
    -- f:write(str)
    f:close()
end

-- 更改配置文件自定义
function writeConfigNew2(id, neirong)
    local f = io.open(luaPath .. "/config/" .. uiconfig, 'r')
    local tmpString = f:read("*all")
    local tmpWeiZhi1 = string.find(tmpString, id);
    -- debug("tmpWeiZhi1:"..tmpWeiZhi1)
    local tmpWeiZhi2 = string.find(tmpString, "Edit", tmpWeiZhi1 + #id + 2)
    local tmpQianDuan = string.sub(tmpString, 1, tmpWeiZhi1 + #id + 2)
    local tmpHouDuan = string.sub(tmpString, tmpWeiZhi2, -1)
    f:close()
    f = io.open(luaPath .. "/config/" .. uiconfig, 'w')
    f:write(tmpQianDuan .. neirong .. "$$$" .. tmpHouDuan)
    -- str, num = string.gsub(tmpString, id .. "$$$" .. old .. "$$$", id .. "$$$" .. new .. "$$$")
    -- f:write(str)
    f:close()
end

-- loadJson
function loadJson(key)
    local valueJson = tableFromJson[key]
    if type(valueJson) == "table" then
        if valueJson[2] == 1 then
            return true
        else
            return false
        end
    elseif valueJson ~= nil then
        return valueJson
    else
        return nil
    end
end

-- writeJson
function writeJson(key, value)
    if type(value) == "boolean" then
        if value == true then
            tableFromJson[key] = { "luabool", 1 }
        else
            tableFromJson[key] = { "luabool", 0 }
        end
    else
        tableFromJson[key] = value
    end
    local jsonstring = json_ts.encode(tableFromJson);  --将 table 格式数据转成 json 格式数据
    if jsonstring ~= "" and jsonstring ~= nil then
        bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json", jsonstring) --写入文件
    end
    ftpUpJson2()
end

-- loadPlistNew
function loadPlistNew(key)
    ts.config.open(userPath() .. "/lua/" .. xiangMu .. ".plist")
    -- 打开一个 plist 文件,如果文件不存在，将自动创建该文件，同时只允许打开一个
    -- 此函数为初始化函数，所有 config 操作第一步必须以 open 开始并且以 close 结尾
    -- ts.config.save("金币数",999)
    -- 存储 lua 中的 number string  nil boolean table类型（不允许嵌套 table）
    -- ps:键值对（key - value）是一种存储格式，一个 key 对应一 个 value
    -- 此处代表"金币数"是 key,999 是 value，将存入此键值对
    local temStr = ts.config.get(key)
    -- 获取键对应的值, 此处代表获取"金币数"所对应的值 coin = 999
    -- 但是此处暂时获取不到 coin 值，因为操作还没结束，请继续往下阅读
    ts.config.close(true)
    return temStr
end

-- writePlistNew(key,value)
function writePlistNew(key, value)
    ts.config.open(userPath() .. "/lua/" .. xiangMu .. ".plist")
    -- 打开一个 plist 文件,如果文件不存在，将自动创建该文件，同时只允许打开一个
    -- 此函数为初始化函数，所有 config 操作第一步必须以 open 开始并且以 close 结尾
    ts.config.save(key, value)
    -- 存储 lua 中的 number string  nil boolean table类型（不允许嵌套 table）
    -- ps:键值对（key - value）是一种存储格式，一个 key 对应一 个 value
    -- 此处代表"金币数"是 key,999 是 value，将存入此键值对
    -- local temStr = ts.config.get(key)
    -- 获取键对应的值, 此处代表获取"金币数"所对应的值 coin = 999
    -- 但是此处暂时获取不到 coin 值，因为操作还没结束，请继续往下阅读
    ts.config.close(true)
    ftpUpJson()

end

function threadClinet()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/clientiPhone.lua")
    -- local bool = os.remove(userPath() .. "/lua/clientiPhone.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        dialog("删除失败，失败原因：" .. msg, 5)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
    local temRet = ftpDownOnce(ftpMuLu .. "Lua/clientiPhone.lua", userPath() .. "/lua/clientiPhone.lua")
    if temRet then
        toast("FTP下载clientiPhone成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/clientiPhone.lua", luaFile, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            -- httpDown("https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars@main/clientiPhone.lua", "/var/mobile/Media/TouchSprite/lua/clientiPhone.lua")
            if code == 200 then
                toast("Github下载clientiPhone成功", 1)
                mSleep(1000)
                break
            else
                tiaoShi("下载clientiPhone失败：" .. msg)
                mSleep(1000)
            end
        end
    end
end

function expand(s)
    return string.gsub(s, "$(%w+)", _G)
end

-- => Lua is great, isn't it?  2
-- 主脚本
function main()
    if m_iRunCount == 1 then
        newUi()
        if check4 == "测试" then
            debugA("日志测试")
            -- writeConfigNew("muBiaoA1", "天下")
            -- lua_exit()
            -- vibratorNotice()

            -- threadClinet()
            -- package.loaded["clientiPhone"] = nil
            -- runThread("clientiPhone")
            -- mSleep(1000)

            -- plistToJson()
            -- local file = userPath() .. "/res/" .. iphoneId .. ".json"
            -- local txt = readFileString(file) --读取文件内容，返回全部内容的 string
            -- if txt then
            --     tableFromJson = json_ts.decode(txt) --将 json 格式数据转成 table 格式数据
            -- end
            -- debug(tableFromJson["粒子总次数"])
            -- toast(tableFromJson["粒子总次数"])

            -- baidu_APItest = tableFromJson["baidu_API"]
            -- debug(baidu_APItest)

        end
    end
    if checkXiangMu1 == "项目1" and checkXiangMu3 == "项目3" then
        if numXiangMu == 0 then
            numXiangMu = 1
        end
    end
    if checkXiangMu1 == "项目1" and (numXiangMu == 0 or numXiangMu == 1) then
        if m_iRunCount == 1 then
            appXiangMu = "com.wemademax.riseofstars"
        end
        main1()
    elseif checkXiangMu2 == "项目2" and (numXiangMu == 0 or numXiangMu == 2) then
        if m_iRunCount == 1 then
            appXiangMu = "com.stormgames.fourgodsonwemix.ios"
            if whoAmI() ~= 3 then
                zhaojunlua()
                package.loaded["zhaojun"] = nil
                require("zhaojun")
            end
        end
        main2()
    elseif checkXiangMu3 == "项目3" and (numXiangMu == 0 or numXiangMu == 3) then
        if m_iRunCount == 1 then
            appXiangMu = "com.wemadeconnect.etgnft.everytown"
        end
        main3()
    end
end

-- 项目1主函数
function main1()
    -- nowTime1 = os.time();
    nowTime = os.time();

    windowsDecide()
    if isLuaStart == false then
        timeXXX = nowTime
        return
    end
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))
    muBiaoZhuanHuanNewA() -- 公用 必须最优先
    -- if version ~= "2.2.4" then
    --     if getBacklightLevel() ~= 0.5 then
    --         setBacklightLevel(0.5);
    --     end
    -- end
    bid = frontAppBid()
    -- debug(bid)
    if bid == appXiangMu then
        -- debug("apps1")
        APP = APP1
    elseif bid == apps2 then
        -- debug("apps2")
        APP = APP2
        -- elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
        --     nowDateTime.min >= minWeiXin then
    elseif bid == "com.apple.DocumentsApp" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "com.readdle.ReaddleDocsIPad" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "com.apple.mobileslideshow" then
        setRotationLockEnable(false);
        init(1)
    else
        -- debug("哪个都没开")
        APP.isYiDengLu = 0
        autoChangeVPN("配置")
        runApp(appXiangMu)
        APP = APP1
        mSleep(5000)
    end
    m_iRunCount = m_iRunCount + 1

    autoVpn()
    autoUnlockDevice()

    zongHe1()
    if bid == appXiangMu then
        zongHe_Mult()
        zongHe_Screen()
        timeJianCe()
        BeAttack()
    end
    doTarget()
    if bid == appXiangMu then
        checkXXX()
        everyDayInit()
    end
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()
end

-- 项目2主函数
function main2()
    -- nowTime1 = os.time();
    nowTime = os.time();

    windowsDecide()
    if isLuaStart == false then
        timeXXX = nowTime
        return
    end
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))
    muBiaoZhuanHuanNewA() -- 公用 必须最优先
    -- if version ~= "2.2.4" then
    --     if getBacklightLevel() ~= 0.5 then
    --         setBacklightLevel(0.5);
    --     end
    -- end
    bid = frontAppBid()
    -- debug("bid"..bid)
    if bid == appXiangMu then
        -- debug("apps1"..apps1)
        APP = APP1
    elseif bid == apps2 then
        -- debug("apps2"..apps2)
        APP = APP2
        -- elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
        --     nowDateTime.min >= minWeiXin then
    elseif bid == "com.apple.DocumentsApp" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "com.readdle.ReaddleDocsIPad" then
        setRotationLockEnable(false);
        init(1)
    else
        -- elseif bid == "" then
        debugA("哪个都没开")
        APP.isYiDengLu = 0
        runApp(appXiangMu)
        APP = APP1
        mSleep(5000)
        isTapTask = false
        writeJson("点任务", isTapTask)
    end
    m_iRunCount = m_iRunCount + 1

    -- autoVpn()
    autoUnlockDevice()
    zongHe2()
    zongHe_zj()
    checkRed2()
    checkDropline()
    zhiYin()
    timeJianCe2()

    -- zongHe_Mult()
    -- zongHe_Screen()
    doTarget2()
    -- timeChongZhi()
    -- checkXXX()
    -- everyDayInit()
    checkXXX2()
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()
end

-- oncePlist
function oncePlist()
    -----------------------公共部分--------------------------

    -- 百度识字
    -- if check4 == "测试" then
    --     baidu_API = tableFromJson["baidu_API"]
    --     debug(baidu_API)
    -- else
    baidu_API = loadJson("baidu_API")
    -- end
    if baidu_API == nil then
        -- baidu_API, baidu_Secret = dialogInput("请输入百度API和密钥",
        --     "在这里输入百度API #在这里输入百度密钥", "确认");
        baidu_API = "SywchAAQBy5TFu9X4r4xUy0S"
        baidu_Secret = "WcZ92Nm4Wmst30Wl4t7bjCoNlOZh4z42"
        writeJson("baidu_API", baidu_API)
        writeJson("baidu_Secret", baidu_Secret)
    end
    baidu_Secret = loadJson("baidu_Secret")

    -- 服务器IP
    -- serverIP = loadJson("服务器IP")
    -- if serverIP == nil then
    --     -- serverIP = dialogInput("请输入服务器IP", "在这里输入服务器IP", "确认");
    --     serverIP = "192.168.1.34"
    --     writeJson("服务器IP", serverIP)
    -- end

    -- FTP
    ftpMuLu = loadJson("FTP目录")
    if ftpMuLu == nil then
        -- ftpMuLu = dialogInput("请输入FTP目录", "在这里输入FTP目录", "确认");
        ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
        writeJson("FTP目录", ftpMuLu)
    end

    -- -- 项目1等待时间
    -- timeXiangMu1 = loadJson("项目1等待时间")
    -- if timeXiangMu1 == nil then
    --     timeXiangMu1 = 0
    --     writeJson("项目1等待时间", timeXiangMu1)
    -- end

    -- -- 项目2等待时间
    -- timeXiangMu2 = loadJson("项目2等待时间")
    -- if timeXiangMu2 == nil then
    --     timeXiangMu2 = 0
    --     writeJson("项目2等待时间", timeXiangMu2)
    -- end

    -- -- 目标1暂存
    -- strMuBiao1 = loadJson("目标1暂存")
    -- if strMuBiao1 == nil then
    --     strMuBiao1 = ""
    --     writeJson("目标1暂存", strMuBiao1)
    -- end

    -- -- 目标2暂存
    -- strMuBiao2 = loadJson("目标2暂存")
    -- if strMuBiao2 == nil then
    --     strMuBiao2 = ""
    --     writeJson("目标2暂存", strMuBiao2)
    -- end

    -- -- 目标3暂存
    -- strMuBiao3 = loadJson("目标3暂存")
    -- if strMuBiao3 == nil then
    --     strMuBiao3 = ""
    --     writeJson("目标3暂存", strMuBiao3)
    -- end

    -- strMuBiao1 = ""
    -- writeJson("目标1暂存", strMuBiao1)
    -- strMuBiao2 = ""
    -- writeJson("目标2暂存", strMuBiao2)
    -- strMuBiao3 = ""
    -- writeJson("目标3暂存", strMuBiao3)


    -----------------------私有部分--------------------------

    writeJson("脚本版本", numLua)
    writeJson("系统版本", getOSVer())

    -- 队列总数
    numQueue = loadJson("队列总数")
    if numQueue == nil then
        numQueue = dialogInput("请输入队列总数",
            "在这里输入队列总数", "确认");
        numQueue = tonumber(numQueue)
        writeJson("队列总数", numQueue)
    end

    -- 今日跑路次数
    numTodayRunAway = loadJson("今日跑路次数")
    if numTodayRunAway == nil then
        numTodayRunAway = 0
        writeJson("今日跑路次数", numTodayRunAway)
    end

    -- 跑路总次数
    numRunAway = loadJson("跑路总次数")
    if numRunAway == nil then
        numRunAway = 0
        writeJson("跑路总次数", numRunAway)
    end

    -- 今日开盾次数
    numTodayDefense = loadJson("今日开盾次数")
    if numTodayDefense == nil then
        numTodayDefense = 0
        writeJson("今日开盾次数", numTodayDefense)
    end

    -- 开盾总次数
    numDefense = loadJson("开盾总次数")
    if numDefense == nil then
        numDefense = 0
        writeJson("开盾总次数", numDefense)
    end

    -- over章节
    isOverLesson = loadJson("over章节")
    if isOverLesson == nil then
        isOverLesson = false
        writeJson("over章节", isOverLesson)
    end

    -- 60海盗
    num60Pirate = loadJson("60海盗")
    if num60Pirate == nil then
        num60Pirate = 0
        writeJson("60海盗", num60Pirate)
    end

    -- 机器名
    strIphoneName = loadJson("机器名")
    if strIphoneName == nil then
        strIphoneName = iphoneId
        writeJson("机器名", strIphoneName)
    end

    -- 机器IP
    if whoAmI() == 3 then
        strIphoneIP = getNetIP()
        writeJson("机器IP", strIphoneIP)
    else
        local strIp = getNetInterfaces()
        if strIp.en0 then
            strIphoneIP = strIp.en0.ip
        else
            strIphoneIP = getNetIP()
        end
        writeJson("机器IP", strIphoneIP)
    end

    -- 今日闪退次数
    numTodayExit = loadJson("今日闪退次数")
    if numTodayExit == nil then
        numTodayExit = 0
        writeJson("今日闪退次数", numTodayExit)
    end

    -- 闪退总次数
    numExit = loadJson("闪退总次数")
    if numExit == nil then
        numExit = 0
        writeJson("闪退总次数", numExit)
    end

    -- 今日矿物次数
    numTodayDigKuang = loadJson("今日矿物次数")
    if numTodayDigKuang == nil then
        numTodayDigKuang = 0
        writeJson("今日矿物次数", numTodayDigKuang)
    end

    -- 矿物总次数
    numDigKuang = loadJson("矿物总次数")
    if numDigKuang == nil then
        numDigKuang = 0
        writeJson("矿物总次数", numDigKuang)
    end

    -- 今日金属次数
    numTodayDigJinShu = loadJson("今日金属次数")
    if numTodayDigJinShu == nil then
        numTodayDigJinShu = 0
        writeJson("今日金属次数", numTodayDigJinShu)
    end

    -- 金属总次数
    numDigJinShu = loadJson("金属总次数")
    if numDigJinShu == nil then
        numDigJinShu = 0
        writeJson("金属总次数", numDigJinShu)
    end

    -- 今日氯气次数
    numTodayDigLvQi = loadJson("今日氯气次数")
    if numTodayDigLvQi == nil then
        numTodayDigLvQi = 0
        writeJson("今日氯气次数", numTodayDigLvQi)
    end

    -- 氯气次数
    numDigLvQi = loadJson("氯气总次数")
    if numDigLvQi == nil then
        numDigLvQi = 0
        writeJson("氯气总次数", numDigLvQi)
    end

    -- 今日粒子次数
    numTodayDigLiZi = loadJson("今日粒子次数")
    if numTodayDigLiZi == nil then
        numTodayDigLiZi = 0
        writeJson("今日粒子次数", numTodayDigLiZi)
    end

    -- 粒子总次数
    numDigLiZi = loadJson("粒子总次数")
    if numDigLiZi == nil then
        numDigLiZi = 0
        writeJson("粒子总次数", numDigLiZi)
    end

    -- 资源传输装置兑换次数
    numZiYuanDuiHuan = loadJson("资源传输装置兑换次数")
    if numZiYuanDuiHuan == nil then
        numZiYuanDuiHuan = 0
        writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
    end

    -- 金币买钛
    numBuyTaiByCoin = loadJson("金币买钛")
    if numBuyTaiByCoin == nil then
        numBuyTaiByCoin = 0
        writeJson("金币买钛", numBuyTaiByCoin)
    end

    -- 指挥中心等级
    numLv = loadJson("指挥中心等级")
    if numLv == nil then
        numLv = 1
        writeJson("指挥中心等级", numLv)
    end

    -- 矿物
    numKuang = loadJson("矿物")
    if numKuang == nil then
        numKuang = 0
        writeJson("矿物", numKuang)
    end

    -- 金属
    numJinShu = loadJson("金属")
    if numJinShu == nil then
        numJinShu = 0
        writeJson("金属", numJinShu)
    end

    -- 氯气
    numLvQi = loadJson("氯气")
    if numLvQi == nil then
        numLvQi = 0
        writeJson("氯气", numLvQi)
    end
    -- 粒子
    numLiZi = loadJson("粒子")
    if numLiZi == nil then
        numLiZi = 0
        writeJson("粒子", numLiZi)
    end

    -- 金币
    numCoin = loadJson("金币")
    if numCoin == nil then
        numCoin = 0
        writeJson("金币", numCoin)
    end

    -- 钛
    numTai = loadJson("钛")
    if numTai == nil then
        numTai = 0
        writeJson("钛", numTai)
    end

    -- 加速生产船型
    numSpeedUp = loadJson("加速生产船型")
    if numSpeedUp == nil then
        numSpeedUp = 1
        writeJson("加速生产船型", numSpeedUp)
    end

    -- 已兑换
    isDuiHuan = loadJson("已兑换")
    if isDuiHuan == nil then
        isDuiHuan = false
        writeJson("已兑换", isDuiHuan)
    end

    -- 粒子方向
    numSearchLiZi = loadJson("粒子方向")
    if numSearchLiZi == nil then
        numSearchLiZi = 0
        writeJson("粒子方向", numSearchLiZi)
    end

    -- 广告次数
    numGuangGao = loadJson("广告次数")
    if numGuangGao == nil then
        numGuangGao = 0
        writeJson("广告次数", numGuangGao)
    end

    -- 传输次数
    numChuanShu = loadJson("传输次数")
    if numChuanShu == nil then
        numChuanShu = 0
        writeJson("传输次数", numChuanShu)
    end

    -- 交易行
    isTrade = loadJson("交易行")
    if isTrade == nil then
        isTrade = false
        writeJson("交易行", isTrade)
    end

    -- 每日5道具
    num5DaoJu = loadJson("每日5道具")
    if num5DaoJu == nil then
        num5DaoJu = 0
        writeJson("每日5道具", num5DaoJu)
    end

    -- 每日道具合成
    isMixedThing = loadJson("每日道具合成")
    if isMixedThing == nil then
        isMixedThing = false
        writeJson("每日道具合成", isMixedThing)
    end

    -- 每日3海盗
    num3Pirate = loadJson("每日3海盗")
    if num3Pirate == nil then
        num3Pirate = 0
        writeJson("每日3海盗", num3Pirate)
    end

    -- 增产
    numAddChanLiang = loadJson("增产")
    if numAddChanLiang == nil then
        numAddChanLiang = 0
        writeJson("增产", numAddChanLiang)
    end

    -- 增产粒子
    isAddChanLiangLiZi = loadJson("增产粒子")
    if isAddChanLiangLiZi == nil then
        isAddChanLiangLiZi = false
        writeJson("增产粒子", isAddChanLiangLiZi)
    end

    -- 整理背包
    isZhengLi = loadJson("整理")
    if isZhengLi == nil then
        isZhengLi = false
        writeJson("整理", isZhengLi)
    end

    -- 吃经验
    isEatEXP = loadJson("吃经验")
    if isEatEXP == nil then
        isEatEXP = false
        writeJson("吃经验", isEatEXP)
    end

    -- 再次收获22
    isAgainReward22 = loadJson("再次收获22")
    if isAgainReward22 == nil then
        isAgainReward22 = false
        writeJson("再次收获22", isAgainReward22)
    end

    -- 再次收获6
    isAgainReward6 = loadJson("再次收获6")
    if isAgainReward6 == nil then
        isAgainReward6 = false
        writeJson("再次收获6", isAgainReward6)
    end

    -- 卡优化
    isKaYouHua = loadJson("卡优化")
    if isKaYouHua == nil then
        isKaYouHua = false
        writeJson("卡优化", isKaYouHua)
    end

    -- 材料编号
    numCaiLiao = loadJson("材料编号")
    if numCaiLiao == nil then
        numCaiLiao = 1
        writeJson("材料编号", numCaiLiao)
    end

    -- 研究资源
    isYanJiuZiYuan = loadJson("研究资源")
    if isYanJiuZiYuan == nil then
        isYanJiuZiYuan = true
        writeJson("研究资源", isYanJiuZiYuan)
    end

    -- 研究开发
    isYanJiuKaiFa = loadJson("研究开发")
    if isYanJiuKaiFa == nil then
        isYanJiuKaiFa = true
        writeJson("研究开发", isYanJiuKaiFa)
    end

    -- 研究防御
    isYanJiuFangYu = loadJson("研究防御")
    if isYanJiuFangYu == nil then
        isYanJiuFangYu = true
        writeJson("研究防御", isYanJiuFangYu)
    end

    -- 研究生产
    isYanJiuShengChan = loadJson("研究生产")
    if isYanJiuShengChan == nil then
        isYanJiuShengChan = true
        writeJson("研究生产", isYanJiuShengChan)
    end

    -- 研究精锐
    isYanJiuJingRui = loadJson("研究精锐")
    if isYanJiuJingRui == nil then
        isYanJiuJingRui = true
        writeJson("研究精锐", isYanJiuJingRui)
    end

    -- 研究战舰
    isYanJiuZhanJian = loadJson("研究战舰")
    if isYanJiuZhanJian == nil then
        isYanJiuZhanJian = true
        writeJson("研究战舰", isYanJiuZhanJian)
    end

    -- 研究
    isYanJiu = loadJson("研究")
    if isYanJiu == nil then
        isYanJiu = true
        writeJson("研究", isYanJiu)
    end


    -----------------------------项目2---------------------
    -- 点任务
    isTapTask = loadJson("点任务")
    if isTapTask == nil then
        isTapTask = false
        writeJson("点任务", isTapTask)
    end

    -- 等级
    numLevel = loadJson("等级")
    if numLevel == nil then
        numLevel = 0
        writeJson("等级", numLevel)
    end
    -----------------------------项目3---------------------
    -- 原点
    numOriginX = loadJson("原点X")
    numOriginY = loadJson("原点Y")
    if numOriginX == nil then
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    end

    --收割时间
    timeCollect = loadJson("收割时间")
    if timeCollect == nil then
        timeCollect = 0
        writeJson("收割时间", timeCollect)
    end

    --出货
    isSell = loadJson("出货")
    if isSell == nil then
        isSell = false
        writeJson("出货", isSell)
    end
end

-- onceOther
function onceOther()
    -- zhuXiaoNew()
    -- path_dm_num = "https://gitee.com/xinqinew_admin/rise-of-stars/raw/master/dm_num.txt"
    -- ts.tsDownload(userPath() .. "/res/dm_num.txt", path_dm_num, {
    --     ["tstab"] = 1,
    --     ["mode"] = false
    -- })
    -- mSleep(4000)
    -- dm_num = addDmOcrDict("dm_num.txt")
    -- mSleep(2000)

    -- by新版不支持
    -- path_by_so = "https://gitee.com/xinqinew_admin/rise-of-stars/raw/master/by.so"
    -- ts.tsDownload("/usr/bin/tsplugin/by.so", path_by_so, {
    --     ["tstab"] = 1,
    --     ["mode"] = true
    -- })
    -- by = require("by")
    -- by.SetDict(dictNum, "/User/Media/TouchSprite/res/boardNumberDM.txt")

    -- tab_lizi1 = {"600c00fffffffff$1$40$12$5", "600e00fffffffff$1$41$12$5", "6003003fffffffff@1$1$43$13$5",
    --              "3001c006003ffffffdffe$1$47$14$6", "6007003fffffffff@1$1$44$13$5", "3001c006003ffffffdfff$1$48$14$6",
    --              "7003800e003ffffffffff$1$51$14$6", "7000e0038007ffefffffff@10$1$52$15$6",
    --              "3000e001c007ffffffffffdfff@1$1$67$15$7", "7000e0038007ffffffffffdfff@1$1$68$15$7",
    --              "70007000e000fffefffffffffffe$1$71$16$7"}
    -- index_lizi1 = addTSOcrDictEx(tab_lizi1)
    tab_lizi1 = { "ffffffffffffffffffffffffffffff3fffc7fff0fffe000fc001f8003fffffffffffffffffffffffffffffffff@1$1$313$19$19",
        "ffffffffffffffffffffffffffffffffffff87fff8ffff0007f0007f0007fffffffffffffffffffffffffffffffffff$1$334$20$19",
        "ffffffffffffffffffffffffffffffffffff8ffff0ffff0ffff0007f0007f0007ffffffffffffffffffffffffffffffffffffffff$1$370$20$21",
        "fffffffffffffffffffffffffffffffffffffffffff87fffc7fffc000fe0007f0003f8001fffffffffffffffffffffffffffffffffffff@1$1$378$21$21",
        "ffffffffffffffffffffffffffffffffffffff8ffff87fffc7fffe000ff0007f8003ffffffffffffffffffffffffffffffffffffffffff@1$1$392$21$21",
        "fffffffffffffffffffffffffffffffffffffffffff87fffc7fffc000fe0007f0003f8001fffffffffffffffffffffffffffffffffffff@1$1$378$21$21",
        "fffffffffffffffffffffffffffffffffffffffffffff87fffe1ffff0001fc0007f0001fc0007fffffffffffffffffffffffffffffffffffffffffffffffff@11$1$438$22$23",
        "fffffffffffffffffffffffffffffffffffffffffffffffc3ffff0ffffe1ffffc0007f8000ff0001fe0003ffffffffffffffffffffffffffffffffffffffffffffffffffff$1$480$23$24",
        "fffffffffffffffffffffffffffffffffffffffffffffffffc3ffffc3ffff87ffff8000ff8000ff8000ff8000fffffffffffffffffffffffffffffffffffffffffffffffffffffff$1$504$24$24",
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0fffff0fffff87ffff80007fc0003fe0001ff0000fffffffffffffffffffffffffffffffffffffffffffffffffffffffff@1$1$549$25$25",
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0fffff0fffff87ffff80003fc0001fe0000ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffff@1$1$545$25$25",
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff87ffffc1fffff0fffffc0001ff00007fc0001ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff@11$1$569$26$25" }
    index_lizi1 = addTSOcrDictEx(tab_lizi1)

    --内容已复制到剪贴板!
    tab_lizi2 = {
        "fffffffffffffffffffffffff1f9fc3e3f8787f1c0fe781fc013f8067f01cff0f9fffffffffffffffffffffffffffff$2$307$19$20",
        "fffffffffffffffffffffffffffffff87c7f0707f0707f1e07f1827f0027f80e7f81e7ffff7fffffffffffffffffffffffff$2$324$20$20",
        "fffffffffffffffffffffffffffffffff0fcff07c7f8383fc1c1fe780ff1807f8033fc019fe03cffc3e7fffffffffffffffffffffffffffffff@11$2$371$21$22",
        "fffffffffffffffffffffffffffffffff0fcff07c7f8383fc1c1fe780ff1807f8033fc019fe03cffc3e7fffffffffffffffffffffffffffffff@11$2$371$21$22",
        "fffffffffffffffffffffffffffffffffffffffffe1f87f83e0fe0781fc0e03f8f807f1e00fe0011fc0063fc01c7f80f8fffffbfffffffffffffffffffffffffffffffffff$2$434$23$24",
        "fffffffffffffffffffffffffffffffffffffffffffffffffffc1f87fc0f83fe0781ff0f80ff8f807fc3803fe0011ff0018ffc01c7ff03e3fffff9ffffffffffffffffffffffffffffffffffffff@1$2$506$25$25",
        "fffffffffffffffffffffffffffffffffffffffffffffc3f8ffc1f87fc0f83fe0701ff0f80ff8f807fc2023fe0011ff0018ffc03c7ff03e3fffff9ffffffffffffffffffffffffffffffffffffffffffff@11$2$523$25$26",
        "fffffffffffffffffffffffffffffffffffffffffffffffffffffe0fe1ff03e07fc0f01ff03807fc3e01ff1f047fc2011ff000c7fc0071ff003c7ff03f1fffffcffffffffffffffffffffffffffffffffffffffffffffff@11$2$563$26$27",
        "fffffffffffffffffffffffffffffff87c7f0787f0707f1e07f3807f0027f0067f01e7fc3e7ffffffffffffffffffffffffffffff$2$337$20$21",
        "ffffffffffffffffffffffffffffffffe1f8ff0f87f0783f8381fc780fe3807f0023f8031fe078ff87c7fffffffffffffffffffffffffffffff@11$2$364$21$22",
        "ffffffffffffffffffffffffffffffffffff0fe7fc1f0ff03c1fe0703fc3c07f8f00ff0009fe0033fe00e7fc07cfffff9fffffffffffffffffffffffffffffffffff@1$2$420$23$23"
    }
    index_lizi2 = addTSOcrDictEx(tab_lizi2)


    -- tab_cd_num = {"0380781c8708c08ffffff008008$4$44$12$9", "31cfbec63841841fe37be$8$45$12$7",
    --               "603e0781f83bc73fc3383$2$42$12$7", "31cfbec63841841fe37be$8$45$12$7",
    --               "ffffff0400f03b870cc07803001$K$49$12$9", "603e0f81f83bc637c3383$2$41$12$7",
    --               "0180780e8388e08c08fff008008$4$35$12$9", "400c00ffffff$1$27$12$4", "600400c00fff$1$17$12$4",
    --               "ffffff0400f03b870cc06803$K$47$12$8", "3fcffec43841841c6363e$6$43$12$7",
    --               "607c0f81f833c637c3303$2$39$12$7", "ffffff0400f03b870cc06803$K$47$12$8",
    --               "603e0780f81b833fe3783$2$40$12$7", "004fc68438818818c38fe$5$32$12$7",
    --               "fff0400e03b871ce06803$K$36$12$7", "204606c03841841ce37be$3$32$12$7",
    --               "7fcffe843841843c6363e$6$44$12$7", "7befe6843841843ffe7be$8$49$12$7", "600400c00ffffff$1$29$12$5",
    --               "fc6fc68838818838fe87e$5$42$12$7", "fffefff801e003c00600e0783c0e00ffffff$M$76$12$12",
    --               "603e0780f81b873fe3783$2$41$12$7", "603e0780f81b873fe3783$2$41$12$7",
    --               "fffffff001e003c00600e0783c0e00ffffff$M$76$12$12", "400c00ffffff$1$27$12$4",
    --               "7befe2843841843ffe73e$8$47$12$7", "7fec62843841c43e7e$6$36$12$6", "607c0f81f833c637c3303$2$39$12$7",
    --               "fff0400e03b871ce06803$K$36$12$7", "400c00ffffff$1$27$12$4", "0080380e81c8708c08ffffff008$4$44$12$9",
    --               "400c00ffffff$1$27$12$4", "fff0400e01b871ce06803$K$35$12$7", "606e06803841843ffe7be$3$39$12$7",
    --               "607c0f81f833c637c3303$2$39$12$7", "606e06803841843ff67be$3$38$12$7",
    --               "7beff6843841843ff67be$8$49$12$7", "7c4fe6c63821821c437fe3fc$9$50$12$8",
    --               "0180380e8388608c08ffffff008$4$44$12$9", "fffe3f7801f003c00700f0783c0e00ffffff$M$76$12$12",
    --               "400c00ffffff$1$27$12$4", "600400c00ffffff$1$29$12$5", "fc6fc68838818838fe87e$5$42$12$7",
    --               "fffefff801e003c00700f0783c0e00ffffff$M$78$12$12", "400400c00ffffff$1$28$12$5",
    --               "fc6fc68c38818838fe87e$5$43$12$7", "fffffff801e003c00700f0783c0e00ffffff$M$79$12$12",
    --               "0180781c8708e08ffffff008008$4$44$12$9", "607c0f81f833c637c3303$2$39$12$7",
    --               "ffffff0400e03b871ce06803$K$48$12$8", "80080180f87ebf0f80c00$7$29$12$7",
    --               "fc6fc68838818838fe87c$5$41$12$7", "80080180f83e9f0f80c00$7$27$12$7",
    --               "fc6fc68838818838fe87e$5$42$12$7", "400c00ffffff$1$27$12$4", "603e0780f81b873fe3783$2$41$12$7",
    --               "fffe3f7801f003c00700f0783c0e00ffffff$M$76$12$12", "600400c00fff$1$17$12$4", "400400c00fff$1$16$12$4",
    --               "7beff6843841843ffe7be$8$50$12$7", "fffefff801e003c00700f0783c0e00ffffff$M$78$12$12",
    --               "400400c00ffffff$1$28$12$5", "fc6fc68c38818838fe87e$5$43$12$7",
    --               "fffffff001e003c00700f0783c0e00ffffff$M$78$12$12", "400c00ffffff$1$27$12$4",
    --               "0180781c8308e08ffffff008008$4$43$12$9", "ffffff0400f03b871ce06803$K$49$12$8",
    --               "80080180f87ebf0f80c00$7$29$12$7", "fc6fc68838818838fe87c$5$41$12$7",
    --               "80080180f87e9f0f80c00$7$28$12$7", "fc6fc68838818838fe87e$5$42$12$7", "7fee06803801803ffe$0$34$12$6",
    --               "400c00ffffff$1$27$12$4", "400c00ffffff$1$27$12$4", "7c6fe6823821823ee67fe$9$45$12$7",
    --               "fffe3f7801f003c00700f0783c0e00ffffff$M$76$12$12", "400c00ffffff$1$27$12$4",
    --               "606e06803841843ce37be$3$35$12$7", "0080380e8388708c08ffffff008$4$44$12$9",
    --               "fffefff801e003c00700f0783c0e00ffffff$M$78$12$12", "400c00ffffff$1$27$12$4",
    --               "80080180f87ebf0f80c00$7$29$12$7", "fffffff001e003c00700f0783c0e00ffffff$M$78$12$12",
    --               "203607c0f81b833ce37c3$2$38$12$7", "fc6fc68c38818838fe87e$5$43$12$7",
    --               "004fc68438818818c38fe$5$32$12$7", "ffffff0400e03b871ce06803$K$48$12$8",
    --               "80080180f87ebf0f80c00$7$29$12$7", "0080380e81c8708c08ffffff008$4$44$12$9",
    --               "80080080783f9f8fc0e00$7$29$12$7", "7fcffe843841843e6663e$6$45$12$7"}
    -- index_cd_num = addTSOcrDictEx(tab_cd_num)
    -- tab_dm_num = {"C00$.$0.0.2$2", "C01800$.$0.0.4$2", "7FFC0E00C00803FFDFF0$0$0.0.43$12", "401803FFFFF$1$0.0.27$12",
    --               "400803007FFFFE$1$0.0.28$12", "600803007FFFFE$1$0.0.29$12", "600803007FF$1$0.0.17$12",
    --               "400803007FF$1$0.0.16$12", "603C0E03C0D873FC5E08$2$0.0.41$12", "60781E07C19C62F84C08$2$0.0.39$12",
    --               "60381E07C19C62F84C08$2$0.0.38$12", "202C0F03C0D8339C5F0801$2$0.0.40$12",
    --               "603C0E07C1DC73F84E08$2$0.0.42$12", "603C1E07C1DC62F84E08$2$0.0.41$12",
    --               "603C0E03C1D873F85E08$2$0.0.41$12", "004C0F00C208419C5EF98E$3$0.0.36$12",
    --               "60780600C20863FFDEF8$3$0.0.39$12", "607C0E00C208439C5EF8$3$0.0.35$12",
    --               "60780610C20C63FFDEF0$3$0.0.40$12", "0180F07A1C4E09E1BFF804008$4$0.0.39$12",
    --               "0180F072384E09FFFFF804008$4$0.0.44$12", "0080703A1C4709813FFFFF008$4$0.0.44$12",
    --               "0180F03A1C4E09813FF804008$4$0.0.35$12", "0080703E0E4709813FFFFF008010$4$0.0.46$12",
    --               "0180F07A1C4E09FFFFF804008$4$0.0.44$12", "0080703A0E4709813FFFFF008010$4$0.0.45$12",
    --               "0180703A1C4609813FFFFF008$4$0.0.44$12", "0080701E0E4709813FFFFF008010$4$0.0.45$12",
    --               "0080703A1C4709813FFFFF008010$4$0.0.45$12", "FC7F8E30C408831FE1F8$5$0.0.43$12",
    --               "FC5F8E10C408831861F80C$5$0.0.40$12", "FC7F8E20C408831FE1F8$5$0.0.42$12",
    --               "FC5F8E10C4088318E1F8$5$0.0.38$12", "3FDFFF10C208418C58F8$6$0.0.43$12",
    --               "7FF8C610C20C43CFC8F0$6$0.0.41$12", "7FFFFE10C20843CFD8F8$6$0.0.48$12",
    --               "80100203C3FBF1F03000$7$0.0.29$12", "80100201C1F9F9F83800$7$0.0.29$12",
    --               "80100201C1F8F9F83800$7$0.0.28$12", "7BFFEE10C20843FFDEF8$8$0.0.50$12",
    --               "7BFFCE10C20863FFDEF8$8$0.0.50$12", "7BFFC610C20843FFDCF8$8$0.0.47$12",
    --               "31DF7F18C20841FC5EF804$8$0.0.46$12", "7BFFFE10C20843FCDEF8$8$0.0.49$12",
    --               "01CF7F38C208419C5EF98E$8$0.0.46$12", "7C7FCE08C10823DCDFF8$9$0.0.45$12",
    --               "7C5FCF18C10821885FF9FE$9$0.0.50$12", "7C5FCE18C10821885FF8FC$9$0.0.47$12",
    --               "FFE080381DC71DC0E008$K$0.1.37$12", "FFFFFC100783B8E1B01C01$K$0.1.49$12",
    --               "FFFFFC100783B8E1B01C01$K$0.1.48$12", "FFFC7DE00F803C00C0383C3C1C03FFFFF$M$0.0.76$12",
    --               "FFFDFFE00F003C00C0383C3C1C03FFFFF$M$0.0.78$12", "FFFFFFC00F003C00C0383C3C1C03FFFFF$M$0.0.78$12",
    --               "FFFCFDE00F803E00C0383C3C1C03FFFFF$M$0.0.78$12", "FFFFFFE00F003C00C0383C3C1C03FFFFF$M$0.0.79$12",
    --               "FFFDFFE00F003C00C0383C3C1C03FFFFF$M$0.0.76$12", "FFFFFFC00F003C00C0383C3C1C03FFFFF$M$0.0.76$12",
    --               "FFFDFFE00F803C00C0383C3C1C03FFFFF$M$0.0.79$12"}
    -- index_dm_num = addDmOcrDictEx(tab_dm_num)
    -- tab_num = {"600c00fffffffff$1$40$12$5", "3fcffefffc03803c03fff7fe$0$64$12$8", "703f0fc1f83bc73fe37c3$2$49$12$7",
    --            "01c7befffce3863ce3fff7be008$8$65$12$9", "fe6fe7cc3c83cc3cffcfe038$5$58$12$8", "ff@1$.$9$3$3",
    --            "c00c00c03c1fcffff8fc0e00$7$43$12$8", "60ee0fe07c63c63ce3fff7be$3$58$12$8",
    --            "7fefffc63c43ce3e7fe7e23c$6$64$12$8", "01c07c0fc3ccf8ce0cffffff00c$4$58$12$9",
    --            "fffffffff1f03f871ee0fc07801$K$69$12$9", "fffffffc03f007e00f01f0fc7f0f80ffffff$M$93$12$12",
    --            "f@1$,$5$5$1", "3807eefefc63863c63fffffe3fc$9$71$12$9"}
    -- tab_num = {"600c00fffffffff$1$40$12$5", "3fcffefffc03803c03fff7fe$0$64$12$8", "703f0fc1f83bc73fe37c3$2$49$12$7",
    --            "01c7befffce3863ce3fff7be008$8$65$12$9", "fe6fe7cc3c83cc3cffcfe038$5$58$12$8",
    --            "c00c00c03c1fcffff8fc0e00$7$43$12$8", "60ee0fe07c63c63ce3fff7be$3$58$12$8",
    --            "7fefffc63c43ce3e7fe7e23c$6$64$12$8", "01c07c0fc3ccf8ce0cffffff00c$4$58$12$9",
    --            "3807eefefc63863c63fffffe3fc$9$71$12$9"}
    -- index_num = addTSOcrDictEx(tab_num)

    tab_dm_numTime = { "03E3FCFFBFD701C03803807E07FC7F83F$0$0.0.127$19",
        "700E03C07FFFFFFFC$1$1.4.89$18",
        "100701E0380601C03C1BEF7FE7FC7E0$2$0.1.119$19",
        "300E01C3707E0FE3DFFBFF7F23E0$3$1.1.114$19",
        "00603C0F87F3F2F87C0FFFFFFFFC01801$4$1.1.114$18",
        "FF9FF3FE79CE39C738F71FE1FC1C008$5$1.0.121$18",
        "01E1FCFF9FF78EE1BC770E71EE1DC3801$6$0.0.128$19",
        "E01C0380700E03C3F9FFFFFF1F83C0700$7$0.0.87$18",
        "1F0FF5FFB8FE1FC1DC3BFF7FE3E0$8$1.1.134$19",
        "0F87FDFFBC7F07C0DC1B877FE7FC7F81F$9$0.0.130$19",
        "00601C0783F1FE3EC71B03E07C0F81F03E07E0DF1BFB1FE0FC0F80F00E00C$分$0.0.214$23",
        "00E07C0F81E000000003FFFFFFFDFF8000000200F01F01E00C$小$2.2.171$23",
        "1FE7FCFF9C738670CFF9FF3FE0003C87B0F61E03C0780F1FFFFFBFF0F00C0$时$0.0.254$22",
        "31C738C73FF7FEFFDCFB0E21E01C1F87F070003FFFFFFFE0003807F07E03C$秒$0.0.261$23",
        "008738C718F7FEFFDFFF0E61C01C0F87F0FC080007FFFFE0001007C0FE07C018$秒$0.0.244$23"
    }
    index_dm_numTime = addDmOcrDictEx(tab_dm_numTime)

    tab_dm_numNumber = {
        "C07C1FEF9FC1F03F1FFF8FE07000$x$1.0.68$12",
        "03C3FDFFF8CE318630C61CE3FC3C038$6$0.0.94$16",
        "C0180300600C0F87F3FFF8F81E03000$7$0.0.63$16",
        "400C0380600C0381F87FFE7F87C0$2$0.1.84$16",
        "002F8FFBFFCC398730773EFEEF8C008$8$0.0.100$16",
        "600C01807FFFFFFFC$1$0.4.74$16",
        "400C038060CC398739E7FF7EE78C$3$0.1.83$16",
        "3E0FF3FE70EC1D81B0679C7FE7FC1F0$9$0.0.96$16",
        "00E07C1F8FB3C7E0F9FFFFFFE00C018$4$0.0.91$16",
        "FF1FE3FC618C318630F61FC1E004$5$1.0.87$16",
        "0FE7FDFFF80C01803007807FE7FC3F8$0$0.0.97$16"
    }
    index_dm_numNumber = addDmOcrDictEx(tab_dm_numNumber)

    tab_dm_lastTime = {
        "07E3FDFFBF0F01C03807007C0FFCFF83F$0$0.0.123$18",
        "300E01C03FFFFFFFFFF8$1$1.3.99$18",
        "700E01C07FFFFFFFC$1$1.4.87$18",
        "200E01C0700E01C0781FDF7FEFF87C0$2$0.1.106$18",
        "300E0380700E01C07C3FFF7FE7F0100$2$0.0.103$18",
        "200E01C0706E0DC3B87F9F7FEFE4F88$3$0.1.107$18",
        "700E038370EE1DC3FCFBFF7F27C4$3$1.1.107$18",
        "200E0380706E1DC3B87FFF7F67C4700$3$1.0.105$18",
        "00200C0783F0F87C1F0781FFFFFFFF8$4$0.2.108$18",
        "00601C0F83E1F0FC3E07FFFFFFFC008$4$0.1.105$18",
        "FF9FFBFE70CE19C3387F0FE0EC0C$5$2.0.110$18",
        "01E1FCFFBFF70DC3B8670EE1FE3D83803$6$0.0.122$18",
        "E01C0380700E07C3F9FFFEFE1F03C0200$7$0.0.86$18",
        "E01C0380700E01C1F8FF7FFF1F83E0700$7$0.0.84$18",
        "3E2FE5FFF1EE1DC3F87FFF7F67C4$8$1.1.130$18",
        "1F87F9FFF8FE0FC0F81F867DC7FC7F83F$9$0.0.122$18",
        "00601C0783F1FE3EC71E03E07C0F81F03E07C0FE1FF31F61FC0F00F00E018$分$0.0.200$22",
        "00400C0781F0FE3EC79883E07C0F81F03E07C0FC1FE37E63FC1F81F01E01C010$分$0.0.201$22",
        "00E07C0F81C00000000000FFFFFFFF8000000400E03F03E01C008$小$2.1.146$22",
        "00207C0F81F03000000000FFFFFFFF8000000000C01E07E03C018$小$2.2.149$22",
        "3FE7FCFF98730E61CFF9FF0001C0398730E61C038070FFFFFFFF8700E01C0$时$0.0.232$22",
        "3FE7FCC398730E7FCFF9FF0001C8398730E21C038070FFFFFFFF8700E0$时$0.0.228$22",
        "338E71CEBFF7FEFFF8EF1C43A01C3F87E0E0003FFFFFFFE0003807E07E03C$秒$0.0.251$22",
        "338671CEBFF7FEFFF8EF1C43A01C3F87E0E0003FFFFFFFE0003807E07E03C$秒$0.0.250$22",
        "3F8FF9FFF07E07C0F81F867FE7FC3F8$9$0.0.119$18",
        "7F9FFBFE78CE19C338770FE1FC1C008$5$1.0.115$18",
        "0FE7FDFFFC0E01C03807807FE7FC3F806$0$0.0.118$18",
        "0807E5FFFFFE1DC3B83F8F7FEFE4700$8$0.0.126$18",
        "07E3FCFFBC7F1DC338770EE1EE1D818$6$0.1.120$18"

    }
    index_dm_lastTime = addDmOcrDictEx(tab_dm_lastTime)


    haoLV = 0

    -- current_time = os.date("%m-%d_%H.%M", os.time());
    -- snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
    -- ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "PNG/")

end

-- 注销
function zhuXiaoNew(...)
    numTodayExit = numTodayExit + 1
    writeJson("今日闪退次数", numTodayExit)
    numExit = numExit + 1
    writeJson("闪退总次数", numExit)
    if check5 == "注销" then
        flag = deviceIsLock();
        if flag == 0 then
            respring()
            mSleep(1000 * 30)
            -- faEmail()
            autoUnlockDevice()
            nowTime = os.time()
            timeXXX = nowTime
        end
    end
end

-- 自动解锁
function autoUnlockDevice()
    flag = deviceIsLock()
    if flag ~= 0 then
        doublePressHomeKey()
        unlockDevice();
        -- 按一次 Home 键
        mSleep(20)
        pressHomeKey(0);
        pressHomeKey(1)
    end
end

function debugA(tiaoShiNeiRong)
    -- wLog("192.168.1.34","#    [LINE]")
    if check1 == "网络调试" then
        wLog("192.168.1.34",
            iphoneId ..
            " 目标1: " ..
            muBiaoA1 .. " 目标2: " .. muBiaoA2 .. " 目标3: " .. muBiaoA3 .. " 目标4: " ..
            muBiaoA4 .. "    操作:" ..
            tiaoShiNeiRong .. "   #" .. xiangMu .. "#   [DATE]" .. "#    [LINE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast(
            "目标1: " ..
            muBiaoA1 .. " 目标2: " ..
            muBiaoA2 .. " 目标3: " .. muBiaoA3 .. " 目标4: " .. muBiaoA4 .. "                操作:" ..
            tiaoShiNeiRong)
        mSleep(3000)
    end
end

function debug0(tiaoShiNeiRong)
    local temIP = "192.168.1.34"
    initLog(temIP, 2);
    wLog(temIP, "    内容:" .. tiaoShiNeiRong)
    closeLog(temIP);
end

-- 浮动窗口
function floatingWindow()
    init(numInit)
    fwShowWnd("window1", 500, 0, 500 + 50 * 2, 30, 1);
    -- 子窗口视图是以父窗口载体的（100,100）点坐标为（0,0）点坐标显示的
    -- fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
    if haoLV == 3 then
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
    else
        fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
    end
    -- fwShowButton("window1", "more", "...", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
    mSleep(500)
end

-- 多功能窗口
function moreWindow()
    isLuaStart = false
    fwShowWnd("moreWin", 50, 50, wScreen - 50, hScreen - 50, 0);
    -- 子窗口视图是以父窗口载体的（100,100）点坐标为（0,0）点坐标显示的
    fwShowButton("moreWin", "btn_update", "更新", "FFFFFF", "025062", "", 12, 0, 0, 150, 50);
    if check1 == "网络调试" then
        fwShowButton("moreWin", "btn_tiaoShi", "调试ON", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
    else
        fwShowButton("moreWin", "btn_tiaoShi", "调试OFF", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
    end
    fwShowButton("moreWin", "btn_snapshot", "截图", "FFFFFF", "025062", "", 12, 1 + 150 * 2, 0, 150 * 3, 50);
    fwShowButton("moreWin", "btn_restart", "重载", "FFFFFF", "306090", "", 12, 1 + 150 * 3, 0, 150 * 4, 50);
    fwShowButton("moreWin", "btn_hide", "X", "FFFFFF", "9e393d", "", 12, 1 + 150 * 4, 0, 150 * 5, 50);
    if appXiangMu == appXiangMu1 then
        fwShowTextView("moreWin", "text_MuBiao",
            "目标1 : " .. muBiaoA1 .. "  目标2 : " .. muBiaoA2 .. "  目标3 : " .. muBiaoA3 .. " 目标4: " ..
            muBiaoA4
            ,
            "left", "FFFFFF", "0C2037",
            12, 0, 0, 51, wScreen - 100, 100, 1);
    elseif appXiangMu == appXiangMu3 then
        fwShowTextView("moreWin", "text_MuBiao",
            "目标1 : " .. muBiaoC1 .. "  目标2 : " .. muBiaoC2 .. "  目标3 : " .. muBiaoC3 .. " 目标4: " ..
            muBiaoC4
            ,
            "left", "FFFFFF", "0C2037",
            12, 0, 0, 51, wScreen - 100, 100, 1);
    end
    fwShowTextView("moreWin", "text_info",
        "机器名 : " .. iphoneId .. "  IP : " .. strIphoneIP, "left", "FFFFFF", "025062", 12,
        0, 0, 101, wScreen - 100, 150, 1);

    mSleep(500)
end

-- 窗口判断
function windowsDecide()
    vid, kind = fwGetPressedButton();
    if vid == "btn1" then
        fwCloseView("window1", "btn1"); -- 关闭文字视图
        fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
        mSleep(500)
        isPause = true
        -- isLuaStart = false
        repeat
            nowTime = os.time()
            timeXXX = nowTime
            mSleep(1000)
            vid, kind = fwGetPressedButton();
            if vid == "btn2" then
                fwCloseView("window1", "btn2"); -- 关闭文字视图
                fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
                mSleep(500)
            elseif vid == "more" then
                isLuaStart = false
                fwCloseView("window1", "btn1"); -- 关闭文字视图
                fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "moreX", "X", "FFFFFF", "9e393d", "", 12, 0, 0, 50, 30);
                mSleep(500)
                moreWindow()
            end
        until vid == "btn2" or vid == "more"
        -- elseif vid == "btn2" then
        --     fwCloseView("window1", "btn2"); -- 关闭文字视图
        --     fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
        --     mSleep(500)
        --     isLuaStart = true
        --     isPause = false
    elseif vid == "more" then
        isPause = true
        isLuaStart = false
        -- fwCloseView("window1", "btn1"); -- 关闭文字视图
        -- fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "moreX", "X", "FFFFFF", "9e393d", "", 12, 0, 0, 50, 30);
        mSleep(500)
        moreWindow()
    elseif vid == "moreX" then
        isPause = false
        isLuaStart = true
        -- fwCloseView("window1", "btn2"); -- 关闭文字视图
        -- fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
        fwCloseView("window1", "moreX"); -- 关闭文字视图
        if haoLV == 3 then
            fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
        else
            fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
        end
        mSleep(500)
        fwCloseWnd("moreWin"); -- 关闭父窗口
    elseif vid == "btn_update" then
        onlineLua()
        isXunHuanLua = false
        closeFw()
    elseif vid == "btn_tiaoShi" then
        if check1 == "网络调试" then
            check1 = "网络调试"
            fwShowButton("moreWin", "btn_tiaoShi", "调试OFF", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
        else
            check1 = ""
            fwShowButton("moreWin", "btn_tiaoShi", "调试ON", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
        end
    elseif vid == "btn_snapshot" then
        fwCloseWnd("moreWin"); -- 关闭父窗口
        mSleep(1000)
        current_time = os.date("%m-%d_%H.%M", os.time());
        -- snapshot(
        --     "/private/var/mobile/Library/Mobile%20Documents/com~apple~CloudDocs/" .. iphoneId ..
        --         ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
        snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
        ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "PNG/")
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/PNG/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/PNG/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        mSleep(2000)
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
        moreWindow()
    elseif vid == "btn_restart" then
        lua_restart()
    elseif vid == "btn_hide" then
        fwCloseWnd("moreWin"); -- 关闭父窗口
    end
end

-- 检测并打开vpn
function autoVpn()
    local flag = getVPNStatus()
    if flag.active == false then
        setVPNEnable(true)
    end
end

--上传json
function ftpUpJson()
    if nowTime - timeUpJson >= 10 * 60 then
        timeUpJson = nowTime
        local tb = plist_ts.read(userPath() .. "/lua/" .. xiangMu .. ".plist") --读取plist至table格式
        if tb ~= "" and tb ~= nil then
            local jsonstring = json_ts.encode(tb);  --将 table 格式数据转成 json 格式数据
            if jsonstring ~= "" and jsonstring ~= nil then
                bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json", jsonstring) --写入文件
                if bool then
                    ftpUpPNG(iphoneId .. ".json", "JSON/") --上传
                end
            end
        end
    end
end

--上传json 2
function ftpUpJson2()
    if nowTime - timeUpJson >= 10 * 60 then
        timeUpJson = nowTime
        ftpUpPNG(iphoneId .. ".json", "JSON/") --上传
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. ".json", "/JSON/" .. iphoneId .. ".json") --上传
        -- ftpUpTsTxt(userPath() .. "/res/" .. iphoneId .. ".json", "/JSON/" .. iphoneId .. ".json") --上传
    end
end

-- FTP从本地上传图片到服务器
function ftpUpTSnet2(localFile, ftpFile)
    ftp.setTimeout(5)
    ftp.init(serverIP, ftpName, ftpPassword)
    mSleep(200)
    ret, msg = ftp.upload(localFile, ftpFile)
    if ret == 1 then
        toast("FTP上传完成", 1)
        ftp.clean()
        return true
    else
        toast("FTP上传失败", 1)
        ftp.clean()
        return false
    end
    ftp.clean()
    return false
end

-- FTP上传文本
function ftpUpTsTxt(localFile, ftpFile)
    --脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 1)
        --下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() --操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() --操作完成后，断开 FTP 服务器连接
    return false
end

function ftpUpTsPNG(localFile, ftpFile)
    --脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 0)
        --下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() --操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() --操作完成后，断开 FTP 服务器连接
    return false
end

-----------------------私有部分--------------------------

-- 综合
function zongHe1(...)
    nowTime = os.time();
    -- debugA(nowTime)
    if inside1() then
        if isColor(33, 493, 0xffffff, 95) and isColor(21, 474, 0x5ea7e8, 95) then
            debugA("free")
            tap1(33, 493)
        end
    end
    if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) and muBiaoA ~= mb_ChuHang and muBiaoA ~= "章节"
        and muBiaoA ~= mb_ZhuXian then
        debugA("搜索界面--误开--有粒子")
        tap1(1, 1)
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) and muBiaoA ~= mb_ChuHang and muBiaoA ~= "章节"
        and muBiaoA ~= mb_ZhuXian then
        debugA("搜索界面--误开--无粒子")
        tap1(1, 1)
    end
    if isColor(310, 107, 0xf8a501, 95) and isColor(306, 137, 0xe0e0e0, 95) and isColor(831, 248, 0x436c9e, 95) and
        isColor(333, 243, 0x46627e, 95) then
        debugA("误开满期提示")
        tap1(511, 537, 0x0c0c0e)
    end
    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) and muBiaoA ~= mb_ChuHang and muBiaoA ~= mb_ZhuXian then
        debugA("误开出航界面")
        tap1(20, 20)
    end
    if isColor(454, 585, 0x284b73, 95) and isColor(477, 607, 0x284b73, 95) and isColor(911, 589, 0x3e5c7f, 95) then
        debugA("今天不再观看")
        tap1(474, 589, 0x3e5c7f)
        tap1(911, 589, 0x3e5c7f)
    end
    if isColor(229,73,0xff6600,95) and isColor(655,127,0x4a9ce9,95) and isColor(205,214,0x9ca0a4,95) and isColor(1071,577,0x215da6,95) then
        debugA("误开NFT")
        tap1(511,603)
    end
    if isColor(94, 87, 0xa5b6ca, 95) and isColor(118, 81, 0x4e78aa, 95) and isColor(108, 542, 0xd78b01, 95) then
        debugA("库存战舰")
        if isColor(897, 539, 0x2a394c, 95) then --未库存
            tap1(112, 543, 0xd68b01) --快速
            tap1(749, 538, 0x616a76) --12小时
            tap1(897, 539, 0x2a394c) --库存
            tap1(484, 429, 0x1c6db9) --确定
        else
            tap1(506, 603, 0x3b577b)
        end
    end
    if isColor(471, 527, 0x114c8a, 95) and isColor(659, 561, 0x145da9, 95) and isColor(271, 65, 0x0096ff, 95) and
        isColor(269, 49, 0xf8a901, 95) then
        debugA("合成")
        tap1(511, 612, 0x0c0c0e)
    end
    if isColor(842, 101, 0x80171a, 95) and isColor(80, 66, 0xff6600, 95) and isColor(91, 59, 0xf8a901, 95) then
        debugA("点数商店--精锐怪物旗帜")
        if isColor(389, 389, 0xffe087, 95) then --2
            tap1(389, 389)
        elseif isColor(197, 388, 0xf4c463, 95) then --1
            tap1(197, 388)
        else
            tap1(511, 603, 0x0c0c0e)
        end
    end
    if isColor(480, 471, 0x6b4500, 95) and isColor(489, 470, 0xa31c1e, 95) and isColor(527, 483, 0xd77e00, 95) and
        isColor(681, 385, 0x0e3d74, 95) then
        debugA("购买道具--精锐怪物旗帜")
        tap1(681, 385, 0x0e3d74) --最多
        tap1(527, 483, 0xd77e00) --购买
    end
    if (isColor(338, 45, 0xe0e0e0, 95) and isColor(575, 219, 0xbaab81, 95) and isColor(482, 485, 0x1c6db9, 95) and
        isColor(688, 397, 0x0d3a70, 95)) or
        (isColor(337, 46, 0xe0e0e0, 95) and isColor(575, 219, 0xc1b78e, 95) and isColor(482, 485, 0x1c6eba, 95) and
            isColor(688, 397, 0x0c376b, 95)) then
        debugA("使用道具--遗物")
        tap1(690, 397, 0x0d3a70) --最多
        tap1(507, 482, 0x1c6eba) --使用
    end
    if isColor(17, 23, 0xffffff, 95) and isColor(7, 23, 0xff9c00, 95) and isColor(1073, 598, 0x233a62, 95) and
        isColor(1063, 596, 0xd1ffff, 95) then
        debugA("区域档案")
        if isColor(1089, 572, 0x9e1111, 95) then --红点
            tap1(1073, 598)
        else
            tap1(20, 20)
        end
    end
    if isColor(18, 24, 0xffffff, 95) and isColor(9, 24, 0xff9c00, 95) and isColor(185, 100, 0x4a9ce9, 95) and
        isColor(186, 622, 0x728a9d, 95) then
        debugA("未确认记录")
        if isColor(263, 582, 0x116eb9, 95) then
            tap1(263, 582)
        end
        x, y = findColorInRegionFuzzy(0x931012, 90, 131, 85, 131, 495)
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            tap1(x, y + 10)
        else
            tap1(20, 20)
        end
    end
    if isColor(17, 24, 0xafafaf, 95) and isColor(381, 588, 0x00769c, 95) and isColor(561, 425, 0x9f6800, 95) and
        isColor(881, 585, 0x1d6dba, 95) then
        debugA("卡指引--编队--整编")
        tap1(881, 585, 0x1d6dba)
    end
    if isColor(20, 440, 0x8ab9f2, 95) and isColor(1103, 93, 0x444545, 95) and isColor(1057, 30, 0x808080, 95) and
        isColor(1071, 31, 0xffffff, 95) then
        debugA("提示1")
        tap1(1071, 31)
    end
    if isColor(1071, 31, 0xffffff, 95) and isColor(1057, 31, 0x808080, 95) and isColor(28, 130, 0x444545, 95) and
        isColor(24, 504, 0x8ab9f2, 95) then
        debugA("提示2")
        tap1(1071, 31)
    end
    if isColor(1073, 32, 0xffffff, 95) and isColor(1058, 32, 0x808080, 95) and isColor(14, 625, 0x000000, 95) then
        debugA("提示3")
        tap1(1073, 32)
    end
    if isColor(279, 286, 0x02ff00, 95) and isColor(319, 350, 0x02ff00, 95) and isColor(23, 249, 0xff8a00, 95) then
        debugA("新号--任务3绿")
        tap1(279, 286)
    end
    if isColor(16, 23, 0xffffff, 95) and isColor(858, 593, 0xd78b02, 95) and isColor(685, 589, 0x0474d7, 95) and
        isColor(558, 108, 0x517fad, 95) == false then
        debugA("错误的出航界面")
        tap1(20, 20)
    end
    if isColor(76, 68, 0xff6600, 95) and isColor(387, 68, 0xff2a00, 95) and isColor(629, 607, 0x306090, 95) then
        debugA("旗舰--升级")
        if isColor(1019, 254, 0x116eb9, 95) then
            tap1(1019, 254)
            tap1(20, 20)
        else
            tap1(20, 20)
        end
    end
    if isColor(337, 11, 0xe0e0e0, 95) and isColor(499, 515, 0x6a3920, 95) and isColor(498, 497, 0x6b4600, 95) and
        isColor(795, 56, 0x718c9c, 95) then
        debugA("高级VIP点数--金币购买--误开")
        tap1(511, 596, 0x0c0c0e)
    end
    if isColor(291, 72, 0xf8a901, 95) and isColor(459, 502, 0x8f4d14, 95) and isColor(664, 542, 0xd87501, 95) then
        debugA("布置")
        tap1(664, 542, 0xd87501)
    end
    if isColor(472, 485, 0x114c8a, 95) and isColor(659, 505, 0x1c6fbb, 95) and isColor(772, 228, 0x5a5f65, 95) then
        debugA("集结时间")
        tap1(510, 570, 0x0c0c0e)
    end
    if isColor(834, 163, 0xff6600, 95) and isColor(667, 433, 0xd78b00, 95) and isColor(489, 421, 0x6b4600, 95) then
        debugA("误开加工缩短时间")
        tap1(510, 526, 0x0c0c0e)
    end
    if isColor(377, 211, 0xa353c5, 95) and isColor(495, 203, 0xf8ec61, 95) and isColor(632, 210, 0x4080cb, 95) then
        debugA("中级装备材料选择箱子--误开")
        tap1(515, 569, 0x3d5879)
    end
    if isColor(297, 107, 0x215da6, 95) and isColor(835, 585, 0x215da6, 95) and isColor(556, 551, 0x145da9, 95) then
        debugA("未知信号")
        tap1(511, 605, 0x0c0c0e)
    end
    if isColor(1049, 607, 0x1c68af, 95) and isColor(1045, 554, 0x1c68af, 95) and isColor(1, 1, 0xff9000, 95) then
        debugA("宇宙地图")
        tap1(511, 611, 0x0c0c0e)
    end
    if isColor(507, 519, 0x135eaa, 95) and isColor(646, 523, 0x121a22, 95) and isColor(782, 523, 0x121a22, 95) then
        debugA("司令官信息")
        tap1(511, 600, 0x0c0c0e)
    end
    if isColor(460, 430, 0x8f4d14, 95) and isColor(487, 448, 0xd3a363, 95) and isColor(291, 146, 0xf9aa01, 95) and
        isColor(781, 210, 0x85baf9, 95) then
        debugA("消耗积分币完成工作")
        tap1(511, 516, 0x0c0c0e)
    end
    if isColor(310, 314, 0xffffff, 95) and isColor(712, 309, 0x116eb9, 95) and isColor(310, 466, 0xffffff, 95) and
        isColor(719, 462, 0x116eb9, 95) then
        if isColor(714, 311, 0x116eb9, 95) then
            debugA("移动至高级商店")
            if numSeachLiZi==3  then
                if  check20 == "2级粒子" then
                    numSeachLiZi=2
                    isLiZied = false -- 粒子
                elseif  check27 == "1级粒子"  then
                    numSeachLiZi=1
                    isLiZied = false -- 粒子
                else
                    isLiZied = true -- 粒子
                end
            elseif numSeachLiZi==2 then
                --if  check26 == "3级粒子" then
                   -- numSeachLiZi=3
                if  check27 == "1级粒子"  then
                    numSeachLiZi=1
                    isLiZied = false -- 粒子
                else
                    isLiZied = true -- 粒子
                end
                
            elseif numSeachLiZi==1 then
                --if  check26 == "3级粒子" then
                    --numSeachLiZi=3
                --elseif  check20 == "2级粒子"  then
                    --numSeachLiZi=2
                --end
                isLiZied = true -- 粒子     
            else
                isLiZied = true -- 粒子
            end
            tap1(510, 592, 0x0c0c0e) --关闭
            -- isLiZied = true -- 粒子
            tap1(172, 525) -- 搜索
        else
            debugA("通过以下途径获得以下道具")
            tap1(512, 594, 0x0c0c0e)
        end
    end
    if isColor(696, 250, 0x116eb9, 95) and isColor(823, 255, 0x126fba, 95) and isColor(460, 509, 0x8f4d14, 95) and
        isColor(465, 548, 0xd78c00, 95) then
        debugA("司令官经验值")
        tap1(465, 548, 0xd78c00)
        if isColor(487, 431, 0x1c6eb9, 95) then -- 确定
            tap1(487, 431)
        end
    end
    if isColor(308, 424, 0x167dfb, 95) and isColor(816, 554, 0x167dfb, 95) and isColor(518, 592, 0xa5a5a5, 95) then
        debugA("确认年龄")
        tap1(308, 424, 0x167dfb)
    end
    if isColor(242, 533, 0x167dfb, 95) and isColor(717, 586, 0x167dfb, 95) and isColor(145, 42, 0x333333, 95) and
        isColor(772, 579, 0xffffff, 95) then
        debugA("全部同意")
        tap1(242, 533)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(6, 24, 0xff9c00, 95) and isColor(56, 108, 0x75ff2d, 95) and
        isColor(243, 574, 0x114c8a, 95) and isColor(447, 618, 0x115dad, 95) then
        debugA("只有个建设按钮")
        tap1(447, 618, 0x115dad)
    end
    if isColor(515, 499, 0xd77500, 95) and isColor(291, 108, 0xf8ad01, 95) and isColor(469, 479, 0x6b4500, 95) and
        isColor(329, 180, 0x787b81, 95) then
        debugA("变更口号")
        tap1(511, 554, 0x0c0c0e)
    end
    if isColor(16, 25, 0xffffff, 95) and isColor(4, 25, 0xff9c00, 95) and isColor(48, 83, 0xffffff, 95) and
        isColor(61, 103, 0x4b4a54, 95) and isColor(346, 578, 0x227bc8, 95) then
        debugA("金属1/2")
        tap1(346, 578, 0x227bc8)
    end
    if isColor(282, 66, 0xff6600, 95) and isColor(458, 513, 0x114c8a, 95) and isColor(318, 205, 0xff6600, 95) then
        debugA("联盟推荐")
        -- tap1(458, 513, 0x114c8a)
        tap1(511, 603, 0x0c0c0e)
    end
    if isColor(773, 278, 0x5b7f98, 95) and isColor(772, 352, 0x5b7f98, 95) and isColor(1112, 314, 0x4a9ce9, 95) then
        debugA("合成人物--关闭")
        tap1(563, 595, 0x0a1829)
    end
    if isColor(504, 489, 0x1c6eba, 95) and isColor(305, 111, 0xff6600, 95) and isColor(827, 529, 0xff6600, 95) then
        debugA("人物--获得")
        tap1(504, 489, 0x1c6eba)
    end
    if isColor(849, 548, 0x8f4d14, 95) and isColor(1066, 596, 0xde7500, 95) and isColor(165, 599, 0x0c0c0e, 95) and
        isColor(157, 599, 0x3c587d, 95) then
        debugA("抽奖人物")
        tap1(885, 569, 0xd68b02)
    end
    -- if isColor(0, 0, 0xa80404, 95) and isColor(1135, 0, 0xa60101, 95) and isColor(0, 639, 0xa90304, 95) and
    --     isColor(1135, 639, 0xa60001, 95) then
    --         debug("被攻击")
    --     nowTime = os.time()
    --     timeXXX = nowTime
    -- end
    if isColor(725, 435, 0x117955, 95) and isColor(845, 460, 0x14a977, 95) and isColor(505, 614, 0x3a5475, 95) and
        isColor(272, 467, 0xffa900, 95) then
        debugA("升阶--关闭")
        tap1(510, 615, 0x0c0c0e)
    end

    if isColor(282, 186, 0xff6600, 95) and isColor(377, 462, 0xff6600, 95) and isColor(851, 177, 0x718d9f, 95) then
        debugA("排队")
        nowTime = os.time()
        timeXXX = nowTime
        if isColor(503, 423, 0x1c6eba, 95) then
            debugA("有蓝色的确认按钮")
            tap1(503, 423)
        elseif isColor(511, 500, 0x597181, 95) then
            debugA("有灰色关闭按钮")
            tap1(511, 500)
        end
    end
    if isColor(271, 196, 0xf7a901, 95) and isColor(690, 355, 0x114c8a, 95) and isColor(860, 412, 0xb8b7b8, 95) then
        -- if isColor(273, 149, 0xf7a901, 95) and isColor(260, 490, 0x658090, 95) and isColor(694, 318, 0x4693cf, 95) and
        -- isColor(844, 462, 0x052b57, 95) then
        debugA("认证和观看视频")
        -- tap1(726, 433, 0x1c6dba) -- 观看视频
        tap1(769, 381, 0xffffff) -- 认证
    end
    if isColor(310, 103, 0xf5a801, 95) and isColor(311, 159, 0x264569, 95) and isColor(691, 202, 0x116eb9, 95) and
        isColor(813, 201, 0x116eb9, 95) then
        debugA("expire notice")
        tap1(511, 540, 0x0c0c0e)
    end
    if isColor(605, 474, 0xc9a571, 95) and isColor(645, 492, 0xd77500, 95) and isColor(682, 387, 0x0b3365, 95) and
        isColor(616, 392, 0x4a5e9b, 95) then
        debugA("购买道具--金币")
        tap1(511, 551, 0x0c0c0e)
        if muBiaoA == mb_YouHua then
            isKaYouHua = true
            writeJson("卡优化", isKaYouHua)
            gaiMuBiaoNewA(1, mb_ZhuXian, mm_ZhuXian)
            mSleep(1000)
            tap1(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiaoA == mb_ZhuXian then
            if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                gaiMuBiaoNewA(1, "章节")
            else
                gaiMuBiaoNewA(1, mb_WaKuang, mm_WaKuang)
            end
            timeRound = nowTime
            mSleep(1000)
            tap1(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiaoA == mb_WaKuang then
            timeRound = nowTime
            mSleep(1000)
            tap1(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        end
    end
    if isColor(639, 468, 0xd68b01, 95) and isColor(624, 473, 0x6b4500, 95) and isColor(685, 397, 0x0b305f, 95) and
        isColor(629, 392, 0xffffff, 95) then
        debugA("购买道具--金币2")
        tap1(511, 551, 0x0c0c0e)
        if muBiaoA == mb_YouHua then
            isKaYouHua = true
            writeJson("卡优化", isKaYouHua)
            gaiMuBiaoNewA(1, mb_ZhuXian, mm_ZhuXian)
            mSleep(1000)
            tap1(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiaoA == mb_ZhuXian then
            if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                gaiMuBiaoNewA(1, "章节")
            else
                gaiMuBiaoNewA(1, mb_WaKuang, mm_WaKuang)
            end
            timeRound = nowTime
            mSleep(1000)
            tap1(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiaoA == mb_WaKuang then
            timeRound = nowTime
            mSleep(1000)
            tap1(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        end
    end
    if isColor(123, 125, 0xff6600, 95) and isColor(776, 515, 0xce890e, 95) and isColor(123, 268, 0x5798dc, 95) and
        isColor(999, 431, 0x413013, 95) then
        -- if isColor(123, 125, 0xff6600, 95) and isColor(147, 254, 0x5fb1ff, 95) and isColor(785, 505, 0xd78c01, 95) then
        debugA("骗你充一次钱")
        tap1(510, 607, 0x375070)
        if isColor(339, 429, 0x1c6fbb, 95) and isColor(592, 438, 0x1c6eba, 95) and isColor(282, 217, 0xff6600, 95) then
            debugA("关闭礼包")
            tap1(339, 429, 0x1c6fbb)
        end
    end

    if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and isColor(503, 515, 0x233341, 95) and
        isColor(741, 516, 0x2f2a33, 95) then
        debugA("外太空玩家2")
        tap1(511, 600, 0x0c0c0e)
        tap1(571, 467, 0x05305c)
    end
    if isColor(158, 328, 0xf57508, 95) and isColor(771, 599, 0xf57508, 95) and isColor(225, 328, 0x426f99, 95) then
        debugA("基地加成")
        if muBiaoA == mb_CaiJi then
            if isColor(557, 439, 0x8fff65, 95) then
                tap1(561, 439)
            else
                tap1(20, 20)
            end
        elseif muBiaoA == "战备开盾" then
            tap1(768, 159, 0x384848)

        else
            tap1(20, 20)
        end
    end
    if isColor(222, 123, 0x4c4334, 95) and isColor(229, 123, 0x102846, 95) and isColor(265, 258, 0x81d2fc, 95) then
        debugA("加成信息")
        if muBiaoA == "战备开盾" then
            if isColor(840, 181, 0x116eb9, 95) then --蓝色使用
                tap1(840, 181, 0x116eb9) --使用
                gaiMuBiaoNewA(4, "")
                numTodayDefense = numTodayDefense + 1
                writeJson("今日开盾次数", numTodayDefense)
                numDefense = numDefense + 1
                writeJson("开盾总次数", numDefense)
            elseif isColor(817, 162, 0xf18e06, 95) then --黄色--购买及使用
                tap1(840, 181, 0x116eb9) --购买
                mSleep(1000)
                tap1(656, 426, 0xd78b01) --确定
                gaiMuBiaoNewA(4, "")
                numTodayDefense = numTodayDefense + 1
                writeJson("今日开盾次数", numTodayDefense)
                numDefense = numDefense + 1
                writeJson("开盾总次数", numDefense)
            else
                tap1(511, 586, 0x0c0c0e)
            end
        else
            tap1(511, 586, 0x0c0c0e)
        end
    end
    if isColor(143, 57, 0xe0e0e0, 95) and isColor(500, 164, 0xd4dc39, 95) and isColor(833, 184, 0x116eb9, 95) then
        debugA("加成信息--采集道具--使用")
        if muBiaoA == mb_CaiJi then
            tap1(833, 184, 0x116eb9)
            if isColor(502, 437, 0x1c6dba, 95) then
                tap1(511, 496, 0x566e7d)
            end
            gaiMuBiaoNewA(2, mb_JiNeng, mm_JiNeng)
        else
            tap1(511, 585, 0x0c0c0e)
        end
    end
    if isColor(474, 421, 0x1d6fbb, 95) and isColor(391, 306, 0x556c82, 95) and isColor(569, 304, 0x556c82, 95) then
        debugA("移动坐标")
        tap1(508, 464, 0x0c0c0e)
    end
    if isColor(24, 594, 0xe8e8e8, 95) and isColor(1078, 591, 0xc7ccd1, 95) then
        debugA("广告")
        if isColor(568, 321, 0xffffff, 95) then
            tap1(568, 321)
            mSleep(50 * 5000)
        end
    end
    if isColor(50, 598, 0x071011, 95) and isColor(50, 601, 0x666666, 95) and isColor(571, 308, 0xffffff, 95) then
        debugA("广告,白色小手--点击")
        tap1(571, 308)
    end
    if isColor(850, 434, 0x05c237, 95) and isColor(913, 207, 0x05c237, 95) and isColor(990, 336, 0xb0b5b5, 95) then
        debugA("广告,绿色--继续")
        tap1(850, 434, 0x05c237)
        mSleep(45 * 1000)
    end
    if isColor(60, 55, 0xffffff, 95) and isColor(71, 44, 0xffffff, 95) and isColor(1069, 593, 0x9f95b5, 95) then
        debugA("关广告--X,白--左上")
        tap1(60, 55)
    end
    if isColor(48, 51, 0xe8e8e8, 95) and isColor(37, 40, 0xe8e8e8, 95) and isColor(1076, 591, 0xbabec1, 95) then
        debugA("关广告--X,白--左上2")
        tap1(48, 51)
    end
    if isColor(59, 56, 0xffffff, 95) and isColor(50, 597, 0x13282b, 95) and isColor(1069, 593, 0x586c9a, 95) then
        debugA("关广告--X,白--左上3")
        tap1(59, 56)
    end
    if isColor(563, 314, 0xffffff, 95) and isColor(1103, 39, 0x666666, 95) and isColor(1059, 584, 0xb3b3b3, 95) then
        debugA("关广告--X,白--小手")
        tap1(562, 308)
        mSleep(60 * 1000)
    end
    if isColor(59, 56, 0xffffff, 95) and isColor(48, 44, 0xffffff, 95) and isColor(1104, 40, 0xffffff, 95) then
        debugA("关广告--X,白--左上4")
        tap1(59, 55, 0xffffff)
    end
    if isColor(49, 52, 0xe8e8e8, 95) and isColor(36, 39, 0xe8e8e8, 95) and isColor(31, 53, 0x567274, 95) then
        debugA("关广告--X,白")
        tap1(49, 52)
    end
    if isColor(1099, 35, 0x7c7c7c, 95) and isColor(1100, 41, 0xfafafa, 95) then
        debugA("关广告--X,灰白色")
        tap1(1099, 35, 0x7c7c7c)
    end
    if isColor(1088, 47, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and isColor(929, 50, 0x868686, 95) then
        debugA("关广告--X,黑色")
        tap1(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and isColor(930, 50, 0x000000, 95) then
        debugA("关广告--X,黑色2")
        tap1(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0xffffff, 95) and isColor(1088, 62, 0x3c4043, 95) and isColor(30, 599, 0xffffff, 95) == false then
        debugA("关广告--X,白色")
        tap1(1088, 47, 0x202124)
    end
    if isColor(1078, 57, 0xffffff, 95) and isColor(1087, 57, 0x101010, 95) and isColor(28, 604, 0xe6e6e6, 95) then
        debugA("关广告--X,白色2")
        tap1(1078, 57, 0x202124)
    end
    if isColor(1088, 52, 0xffffff, 95) and isColor(1095, 52, 0xc4c4c4, 95) then
        debugA("关广告--X,白色3")
        tap1(1088, 52)
    end
    if isColor(1078, 57, 0xffffff, 95) and isColor(30, 603, 0xe6e6e6, 95) then
        debugA("关广告--X,白色4")
        tap1(1078, 57)
    end
    if isColor(1088, 52, 0xffffff, 95) and isColor(1098, 41, 0xffffff, 95) and isColor(33, 17, 0xe6e6e6, 95) then
        debugA("关广告--X,白色1--左上角")
        tap1(1088, 52)
    end
    if isColor(1088, 47, 0xfafafa, 95) and isColor(1088, 58, 0x505050, 95) and isColor(981, 57, 0xadafb2, 95) then
        debugA("广告--奖励已发放--灰底白字")
        tap1(1088, 47, 0xfafafa)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(792, 121, 0xe0b8ab, 95) and
        isColor(836, 102, 0xfab1cb, 95) then
        debugA("奖励积分币")
        mSleep(1000)
        isJustBack = false
        x, y = findColorInRegionFuzzy(0xd78b01, 95, 71, 87, 1121, 587);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            tap1(x, y)
            -- 广告次数
            numGuangGao = numGuangGao + 1
            writeJson("广告次数", numGuangGao)
            mSleep(5 * 1000)
            if isColor(98, 272, 0x2d5996, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xeccfc0, 95) then
                debugA("已观看视频2")
                tap1(512, 606, 0x0d0d10)
                return
            end
            if isColor(98, 272, 0x2c5995, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xedcfc1, 95) then
                debugA("已观看视频")
                tap1(512, 606, 0x0d0d10)
                return
            end
            mSleep(55 * 1000)
            nowTime = os.time()
            timeXXX = nowTime
            if isColor(1078, 58, 0xffffff, 95) and isColor(1087, 48, 0xffffff, 95) and isColor(1087, 67, 0xffffff, 95) then
                tap1(1078, 58)
            elseif isColor(1088, 48, 0xffffff, 95) and isColor(1096, 39, 0xffffff, 95) and
                isColor(1096, 56, 0xffffff, 95) then
                tap1(1088, 48)
            elseif isColor(1088, 48, 0x202124, 95) and isColor(1096, 39, 0x202124, 95) and
                isColor(1096, 56, 0x202124, 95) then
                tap1(1088, 48)
            elseif isColor(1088, 51, 0xffffff, 95) and isColor(1100, 39, 0xffffff, 95) and
                isColor(1100, 64, 0xffffff, 95) then
                tap1(1088, 51)
            elseif isColor(1099, 35, 0x7c7c7c, 95) and isColor(1106, 29, 0x7c7c7c, 95) and
                isColor(1106, 42, 0x7c7c7c, 95) then
                tap1(1099, 35)
            elseif isColor(1087, 51, 0xffffff, 95) and isColor(1100, 40, 0xffffff, 95) and
                isColor(1099, 62, 0xffffff, 95) then
                tap1(1087, 51)
            end
            for i = 1, 30, 1 do
                if isPause == true then
                    return
                end
                if isColor(1078, 58, 0xffffff, 95) and isColor(1087, 48, 0xffffff, 95) and
                    isColor(1087, 67, 0xffffff, 95) then
                    tap1(1078, 58)
                elseif isColor(1088, 48, 0xffffff, 95) and isColor(1096, 39, 0xffffff, 95) and
                    isColor(1096, 56, 0xffffff, 95) then
                    tap1(1088, 48)
                elseif isColor(1088, 48, 0x202124, 95) and isColor(1096, 39, 0x202124, 95) and
                    isColor(1096, 56, 0x202124, 95) then
                    tap1(1088, 48)
                elseif isColor(1088, 51, 0xffffff, 95) and isColor(1100, 39, 0xffffff, 95) and
                    isColor(1100, 64, 0xffffff, 95) then
                    tap1(1088, 51)
                elseif isColor(1099, 35, 0x7c7c7c, 95) and isColor(1106, 29, 0x7c7c7c, 95) and
                    isColor(1106, 42, 0x7c7c7c, 95) then
                    tap1(1099, 35)
                elseif isColor(1087, 51, 0xffffff, 95) and isColor(1100, 40, 0xffffff, 95) and
                    isColor(1099, 62, 0xffffff, 95) then
                    tap1(1087, 51)
                else
                    break
                end
                mSleep(1000)
            end
        else
            tap1(20, 20)
        end
    end
    if isColor(98, 272, 0x2d5996, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xeccfc0, 95) then
        debugA("已观看视频2")
        tap1(512, 606, 0x0d0d10)
    end
    if isColor(98, 272, 0x2c5995, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xedcfc1, 95) then
        debugA("已观看视频")
        tap1(512, 606, 0x0d0d10)
    end
    if isColor(155, 144, 0xff6600, 95) and isColor(171, 137, 0xf8a901, 95) and isColor(345, 467, 0x1d6eba, 95) and
        isColor(600, 470, 0xd78b00, 95) then
        debugA("掌握--达成满级")
        tap1(514, 530, 0x0e0f12)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(1094, 39, 0xe8d9a3, 95) and
        isColor(1077, 19, 0xc07f20, 95) then
        debugA("司令官技能--误开")
        tap1(20, 20)
    end
    if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and isColor(900, 120, 0xffffff, 95) then
        debugA("云打码")
        nowTime = os.time()
        timeXXX = nowTime
        -- snapshot("yudama.png", 222, 12, 596, 157)
        current_time = os.date("%m-%d_%H.%M", os.time());
        snapshot(iphoneId .. "-" .. current_time .. ".png", 222, 12, 596, 157); -- 以时间戳命名进行截图
        -- ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "YDM/")
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/YDM/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        mSleep(2000)
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
        if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and isColor(900, 120, 0xffffff, 95) then
            closeFw() -- 关闭所有视图
            mSleep(500)
            local strDaMa = yunDaMaNew(op, 222, 12, 596, 157)
            if strDaMa ~= false then
                for i = 1, 10, 1 do
                    if isPause == true then
                        return
                    end
                    if isColor(475, 599, 0xffffff, 95) == false then -- 没有键盘,点击文本框
                        tap1(659, 45)
                        mSleep(1000)
                    else
                        break
                    end
                    if i == 10 then
                        closeApp(appXiangMu)
                        zhuXiaoNew()
                        return
                    end
                end
                inputText(strDaMa)
                mSleep(2000)
                tap1(717, 104, 0x1270bb)
                mSleep(1000)
                tap1(717, 104, 0x1270bb)
                mSleep(5000)
                numYunDaMa = numYunDaMa + 1
                if numYunDaMa >= 5 then
                    -- fwCloseView("window1", "btn1"); -- 关闭文字视图
                    -- fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
                    -- mSleep(500)
                    -- isLuaStart = false
                    -- dialog("云打码超过5次", 0);
                    numYunDaMa = 0
                    zhuXiaoNew()
                    return

                    -- lua_exit();
                    -- mSleep(10)
                    -- mSleep(10)
                    -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
                    -- mSleep(10)
                end
                x, y = findImage(iphoneId .. "-" .. current_time .. ".png", 221, 11, 597, 158)
                if x ~= -1 and y ~= -1 then
                    closeApp(appXiangMu)
                    zhuXiaoNew()
                    return
                end
            end
            floatingWindow()
            mSleep(500)
        end
        -- lua_exit();
        -- mSleep(10)
        -- mSleep(10)
        -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
        -- mSleep(10)
    end
    if isColor(269, 510, 0xc3841e, 95) and isColor(281, 128, 0xffffff, 95) and isColor(300, 121, 0x0c345b, 95) then
        debugA("vip界面")
        if isColor(271, 394, 0x116eb9, 95) then
            debugA("领取奖励--可领")
            tap1(271, 394)
        elseif isColor(942, 120, 0x9e1111, 95) then
            debugA("使用VIP点数--红点")
            tap1(821, 135, 0x268465)
        elseif isColor(807, 264, 0x1c6dba, 95) then
            debugA("可使用")
            tap1(807, 264)
        else
            tap1(510, 591, 0x0c0c0e)
        end
    end
    if isColor(457, 454, 0xf27c00, 95) and isColor(677, 453, 0xf2d600, 95) and isColor(513, 508, 0x1c6eba, 95) and
        isColor(308, 80, 0x0b4991, 95) then
        debugA("100 vip点数")
        tap1(556, 509, 0x1c6eba)
    end
    if isColor(498, 469, 0x1c6eba, 95) and isColor(646, 470, 0x1c6fbb, 95) and isColor(567, 242, 0x9d9962, 95) then
        -- if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        debugA("100 vip点数 单数")
        tap1(539, 475, 0x1c6ebb)
    end
    if isColor(498, 469, 0x1c6eba, 95) and isColor(646, 470, 0x1c6fbb, 95) and isColor(568, 243, 0xffff74, 95) then
        -- if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        debugA("10 vip点数 单数")
        tap1(539, 475, 0x1c6ebb)
    end

    if isColor(273, 72, 0xf5a801, 95) and isColor(270, 85, 0xe0e0e0, 95) and isColor(506, 590, 0x3f5d81, 95) and
        isColor(275, 146, 0x436c9e, 95) then
        debugA("奖励目录")
        if isColor(469, 517, 0x1eb585, 95) then
            tap1(477, 507)
        else
            tap1(511, 589, 0x0c0c0e)
        end
    end
    if isColor(170, 165, 0xa99280, 95) and isColor(214, 315, 0x56596a, 95) and isColor(354, 228, 0x246594, 95) then
        debugA("每日联盟任务")
        if isColor(146, 511, 0x1d6eb9, 95) then
            tap1(146, 511)
        else
            tap1(512, 612, 0x0c0c0e)
        end
    end
    if isColor(921, 44, 0x116eb9, 95) and isColor(330, 533, 0x49d9ec, 95) and isColor(83, 36, 0x30e4ff, 95) then
        debugA("联盟星球")
        tap1(877, 542)
        tap1(511, 609, 0x3a597d)
    end
    if isColor(111, 106, 0x215da6, 95) and isColor(137, 70, 0x757677, 95) and isColor(345, 65, 0xd4d4d5, 95) then
        -- if isColor(111, 106, 0x215da6, 95) and isColor(140, 71, 0xa9a9aa, 95) and isColor(345, 67, 0xd4d4d5, 95) then
        debugA("援助联盟成员工作")
        if isColor(916, 82, 0x0d9098, 95) then
            tap1(916, 82)
        else
            tap1(511, 609, 0x3a597d)
        end
    end
    if isColor(126, 118, 0x00ace4, 95) and isColor(150, 109, 0xc0c0c0, 95) and isColor(313, 130, 0xe1e2e2, 95) then
        debugA("联盟成员礼物")
        if isColor(902, 128, 0x0d9098, 95) then
            tap1(902, 128)
        else
            tap1(511, 590, 0x0c0c0e)
        end
    end
    if isColor(126, 59, 0x00ace4, 95) and isColor(116, 85, 0x215da6, 95) and isColor(519, 617, 0x3a597d, 95) then
        debugA("联盟成员礼物--新")
        if isColor(900, 125, 0x0d9098, 95) then
            tap1(900, 125)
        elseif isColor(205, 460, 0x1c6eba, 95) then
            tap1(205, 460)
        elseif isColor(455, 458, 0x1c6dba, 95) then
            tap1(455, 458)
        elseif isColor(430, 98, 0x9d1111, 95) then
            debugA("高级红点")
            tap1(317, 116, 0x5a3f1e)
        else
            tap1(511, 589, 0x0c0c0e)
        end
    end
    if isColor(89, 35, 0x00ace4, 95) and isColor(91, 71, 0x215da6, 95) and isColor(125, 28, 0xc4bfbe, 95) and
        isColor(231, 42, 0xdbdcdc, 95) then
        debugA("联盟任务")
        if isColor(228, 105, 0x931012, 95) and isColor(113, 143, 0x956b1a, 95) then
            debugA("任务--红点--已选中")
            mSleep(100)
            if isColor(842, 524, 0x116eb9, 95) then
                debugA("可更新")
                -- 红 0xb61d2c
                -- 橙 0xc56600
                -- 紫 0x7d079b
                -- 蓝 0x1050ac
                -- 绿 0x34b200
                if isColor(340, 171, 0xb61d2c, 95) then -- 左--红
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xb61d2c, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xb61d2c, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0xc56600, 95) then -- 左--橙
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xc56600, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xc56600, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x7d079b, 95) then -- 左--紫
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x7d079b, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x7d079b, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                    -- elseif isColorPlus(340, 171, 0x1050ac, 95) then -- 左--蓝
                    --     tap1(381, 452, 0x145ca8)
                    -- elseif isColorPlus(594, 171, 0x1050ac, 95) then -- 中
                    --     tap1(644, 450, 0xa3bfdd)
                    -- elseif isColorPlus(848, 170, 0x1050ac, 95) then -- 右
                    --     tap1(890, 450, 0xb4cbe4)
                    -- elseif isColorPlus(340, 171, 0x34b200, 95) then -- 左--绿
                    --     tap1(381, 452, 0x145ca8)
                    -- elseif isColorPlus(594, 171, 0x34b200, 95) then -- 中
                    --     tap1(644, 450, 0xa3bfdd)
                    -- elseif isColorPlus(848, 170, 0x34b200, 95) then -- 右
                    --     tap1(890, 450, 0xb4cbe4)
                else
                    tap1(825, 532, 0x116eb9) -- 更新
                end
            else
                debugA("不可更新")
                -- 红 0xb61d2c
                -- 橙 0xc56600
                -- 紫 0x7d079b
                -- 蓝 0x1050ac
                -- 绿 0x34b200
                if isColor(340, 171, 0xb61d2c, 95) then -- 左--红
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xb61d2c, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xb61d2c, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0xc56600, 95) then -- 左--橙
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xc56600, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xc56600, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x7d079b, 95) then -- 左--紫
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x7d079b, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x7d079b, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x1050ac, 95) then -- 左--蓝
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x1050ac, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x1050ac, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x34b200, 95) then -- 左--绿
                    tap1(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x34b200, 95) then -- 中
                    tap1(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x34b200, 95) then -- 右
                    tap1(890, 450, 0xb4cbe4)
                else
                    tap1(512, 607, 0x0c0c0e) -- 关闭
                end
            end
        elseif isColor(218, 169, 0x9d1111, 95) and isColor(199, 182, 0xa17316, 95) then
            debugA("进行--红点--已选中")
            if isColor(311, 445, 0x1db687, 95) then
                tap1(311, 445)
            elseif isColor(558, 443, 0x1db586, 95) then
                tap1(558, 443)
            end
        elseif isColor(227, 233, 0x931012, 95) and isColor(199, 250, 0xa07316, 95) then
            debugA("协助--红点--已选中")
            if isColor(303, 449, 0x1c6dba, 95) then
                tap1(303, 449, 0x1c6dba)
            else
                tap1(513, 606, 0x395679)
            end
        elseif isColor(228, 105, 0x931012, 95) and isColor(213, 114, 0x1b2b3e, 95) then
            debugA("任务--红点--未选中")
            tap1(171, 140, 0x283544)
        elseif isColor(218, 169, 0x9d1111, 95) and isColor(212, 178, 0x1b2b3e, 95) then
            debugA("进行--红点--未选中")
            tap1(171, 211, 0x283544)
        elseif isColor(227, 233, 0x931012, 95) and isColor(210, 244, 0x1b2a3d, 95) then
            debugA("协助--红点--未选中")
            tap1(166, 263, 0x855f15)

        elseif isColor(315, 448, 0x1db587, 95) then
            debugA("分享")
            tap1(315, 448)
        elseif isColor(186, 262, 0x876115, 95) and isColor(323, 448, 0x1d6ebb, 95) then
            debugA("协助")
            tap1(323, 448, 0x1d6ebb)
            isOverHelp = true
            mSleep(2000)
            tap1(510, 606, 0x0c0c0e)
        else
            tap1(176, 198, 0x886115)
            if isColor(313, 445, 0x1db687, 95) then
                debugA("分享")
                tap1(313, 445)
            else
                tap1(510, 608)
            end
        end
    end
    if isColor(48, 44, 0x00ace4, 95) and isColor(72, 119, 0xa17316, 95) and isColor(94, 136, 0xffffff, 95) then
        debugA("联盟技术研究界面")
        if isColor(336, 264, 0x767676, 95) then -- 1-1
            tap1(280, 193, 0xbc936a)
        elseif isColor(517, 264, 0x767676, 95) then -- 1-2
            tap1(462, 187, 0x131410)
        elseif isColor(669, 264, 0x767676, 95) then -- 1-3
            tap1(631, 177, 0x080a0d)
        elseif isColor(821, 263, 0x767676, 95) then -- 1-4
            tap1(818, 184, 0x426674)
        elseif isColor(1031, 264, 0x767676, 95) then -- 1-5
            tap1(1004, 196, 0x17160c)
        elseif isColor(336, 482, 0x767676, 95) then -- 2-1
            tap1(276, 402, 0x30657a)
        elseif isColor(459, 482, 0x767676, 95) then -- 2-2
            tap1(464, 408, 0x242c33)
        elseif isColor(640, 482, 0x767676, 95) then -- 2-3
            tap1(637, 412, 0x525451)
        else
            tap1(513, 603, 0x0c0c0e)
        end
    end
    if isColor(129, 66, 0xf5a801, 95) and isColor(146, 170, 0x30e5ff, 95) and isColor(159, 366, 0xac6c27, 95) then
        debugA("研究")
        if isColor(858, 498, 0x1c6eba, 95) then -- 可研究
            -- if nowTime - timeYanJiu >= 60 then
            tap1(858, 498, 0x1c6eba) -- 研究
            --     timeYanJiu = nowTime
            -- else
            --     debug("时间不到")
            --     tap1(514, 597, 0x405b7c) -- 关闭
            -- end
        elseif isColor(806, 529, 0x1cb587, 95) then -- 可加速
            debugA("可加速")
            tap1(806, 529, 0x1cb587) -- 加速
            timeYanJiu = nowTime - 60 -- 研究
        elseif isColor(963, 428, 0xff8f00, 95) then
            debugA("研究--需要粒子--放弃")
            tap1(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(543, 207, 0x3e8fee, 95) or isColor(995, 181, 0x1d426f, 95) then -- 缺少条件1
            -- tap1(543, 207)
            debugA("缺少条件1")
            tap1(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(543, 242, 0x3e8fee, 95) then -- 缺少条件2
            -- tap1(543, 242)
            debugA("缺少条件2")
            tap1(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(543, 251, 0x3e8fee, 95) then -- 缺少条件3
            -- tap1(543, 251)
            debugA("缺少条件3")
            tap1(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(691, 351, 0xff9900, 95) then -- 已完成
            debugA("已完成")
            tap1(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        else
            debugA("研究--啥也不是--关闭")
            tap1(512, 598, 0x0c0c0e)
        end
    end
    if isColor(679, 457, 0xd78b00, 95) and isColor(912, 177, 0x1c6eba, 95) and isColor(562, 198, 0x68defb, 95) then
        debugA("招募公告")
        tap1(679, 457, 0xd78b00)

    end
    if isColor(370, 469, 0x1c6db9, 95) and isColor(660, 477, 0xd78b00, 95) and isColor(368, 213, 0xabf4f7, 95) then
        debugA("立即捐款")
        tap1(370, 469, 0x1c6db9)
    end
    if isColor(380, 420, 0x1c6dba, 95) and isColor(651, 420, 0xd78b00, 95) and isColor(282, 175, 0xff6600, 95) and
        isColor(613, 409, 0x6b4500, 95) then
        debugA("捐完了")
        tap1(380, 420, 0x1c6dba) -- 取消
        tap1(512, 541, 0x0c0c0e) -- 关闭
        tap1(511, 528, 0x0c0c0e) -- 关闭
        tap1(510, 602, 0x0c0c0e) -- 关闭
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(92, 36, 0xb4c0ce, 95) and isColor(173, 43, 0x9eabbb, 95) then
        -- debug("基地现况界面--综合函数")
        if isColor(814, 458, 0x9e1111, 95) then
            debugA("资源--免费兑换--红点")
            numBuyTaiByCoin = 0
            writeJson("金币买钛", numBuyTaiByCoin)
            tap1(752, 488, 0x82a0c1)
        elseif isColor(557, 459, 0x9e1111, 95) then
            debugA("签到奖励--红点")
            tap1(519, 496, 0x306090)
        elseif isColor(686, 458, 0x9e1111, 95) then
            debugA("补给太空船--红点")
            tap1(624, 495, 0x306090)
        elseif isColor(1008, 179, 0x0f161f, 95) and haoLV <= 2 then
            debugA("研究所可建")
            tap1(1008, 179)
            gaiMuBiaoNewA(1, mb_YouHua, mm_YouHua)
            gaiMuBiaoNewA(2, "", mm_Wu)
            gaiMuBiaoNewA(3, "", mm_Wu)
        elseif isColor(1049, 364, 0x9e1111, 95) then
            debugA("维修站--红点")
            tap1(954, 398, 0x306090)
        elseif isColor(466, 175, 0x8a4c17, 95) then
            debugA("攻击舰-完毕")
            tap1(466, 175)
        elseif isColor(685, 174, 0x8a4c17, 95) then
            debugA("高速舰-完毕")
            tap1(685, 175)
        elseif isColor(471, 253, 0x8a4c17, 95) then
            debugA("运输舰-完毕")
            tap1(471, 253)
        elseif isColor(681, 257, 0x8a4c17, 95) then
            debugA("防御舰-完毕")
            tap1(685, 257)
        elseif isColor(466, 175, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debugA("攻击舰-休息")
            tap1(466, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(685, 174, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debugA("高速舰-休息")
            tap1(685, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(471, 253, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debugA("运输舰-休息")
            tap1(471, 253)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(681, 257, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debugA("防御舰-休息")
            tap1(685, 257)
            isJiDiXianKuangIntoProduce = true
            -- 474,257,0x8a4c17 完毕
            -- 518,175,0x306090 休息中
        elseif isColor(460, 175, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 1 then
            debugA("攻击舰-加速")
            tap1(466, 175)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(655, 174, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 2 then
            debugA("高速舰-加速")
            tap1(685, 175)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(469, 258, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 3 then
            debugA("运输舰-加速")
            tap1(471, 253)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(659, 255, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 4 then
            debugA("防御舰-加速")
            tap1(685, 257)
            numSpeedUp = 1
            writeJson("加速生产船型", numSpeedUp)
        elseif muBiaoA == mb_ChuHang then
            debugA("出航")
            tap1(513, 611)
        elseif isColor(410, 490, 0x9d1111, 95) then
            debugA("防卫工程--红点")
            tap1(331, 537, 0x306090)
        elseif isColor(808, 314, 0x9d1111, 95) and isOverHelp == false then
            debugA("联盟协助--红点")
            tap1(758, 362, 0x0c2037)
        elseif isColor(558, 321, 0x9e1111, 95) then
            debugA("联盟研究--红点")
            tap1(510, 357, 0x0c2037)
        elseif isColor(686, 321, 0x9e1111, 95) and nowTime - timeLianMengRenWu >= 60 * 60 then
            debugA("联盟任务--红点")
            tap1(638, 366, 0x0c2037)
            if isColor(1020, 546, 0x744218, 95) then
                debugA("联盟任务不能做")
                timeLianMengRenWu = nowTime
                timeJiDi = nowTime
            end
        elseif isColor(224, 511, 0x183453, 95) and isChongDianKaZiYuan == false then
            debugA("防卫工程,电不满")
            tap1(347, 538, 0x306090)
        elseif isColor(993, 542, 0x306090, 95) then
            debugA("加工站")
            tap1(993, 542)
        elseif isColor(996, 177, 0x306090, 95) and isYanJiu == true and check14 == "研究" then
            debugA("技术研究--休息中")
            tap1(996, 177)
            gaiMuBiaoNewA(3, "研究")
        --elseif check25 == "库存" and isColor(953, 303, 0x306090, 95) then
            --debugA("机库--休息中")
            --tap1(982, 276, 0x306090)
        elseif muBiaoA1 == mb_WaKuang then

        else
            tap1(510, 608, 0x0c0c0e)
        end
    end
    if isColor(553, 205, 0x345214, 90) and isColor(581, 188, 0x2a72ba, 90) then
        debugA("个人活动--点数奖励")
        tap1(512, 577, 0x0c0c0e)
    end
    if isColor(274, 160, 0xcda099, 95) and isColor(292, 81, 0x9badde, 95) and isColor(366, 330, 0x78551a, 95) then
        debugA("签到奖励")
        x, y = findColorInRegionFuzzy(0x145e99, 95, 857, 133, 857, 539);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            tap1(x, y)
        else
            tap1(508, 609)
        end
    end
    if isColor(141, 75, 0x406898, 95) and isColor(170, 67, 0xff6600, 95) and isColor(738, 504, 0xd78b01, 95) then
        debugA("推荐礼包--广告")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(366, 363, 0x423113, 95) and isColor(672, 365, 0x453313, 95) and isColor(472, 527, 0xd88b00, 95) then
        debugA("推荐礼包--广告2")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(110, 63, 0xff6600, 95) and isColor(449, 500, 0x8f4d14, 95) and isColor(1055, 557, 0x406898, 95) then
        debugA("推荐礼包--广告3")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(98, 288, 0xffffff, 95) and isColor(1036, 286, 0xffffff, 95) and isColor(493, 522, 0xd78b00, 95) and
        isColor(897, 587, 0x425f82, 95) then
        debugA("广告画廊")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(16, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(75, 13, 0xb1c2d5, 95) and
        isColor(160, 32, 0x9aacc0, 95) then
        debugA("探险关门")
        tap1(20, 20)
        redJudge()
    end
    if isColor(7, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and isColor(73, 14, 0xe2e8ef, 95) and
        isColor(161, 29, 0xa8b8c9, 95) then
        debugA("活动中心")
        x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0xf29203", 90, 133, 120, 134, 603)
        if x ~= -1 then
            huoDongDetail()
        else
            x, y = findColorInRegionFuzzy(0x931012, 95, 134, 75, 134, 612)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                tap1(78, y + 19)
            else
                touchMoveXY(79, 573, 79, 190)
                mSleep(1000)
                x1, y1 = findColorInRegionFuzzy(0x931012, 95, 134, 75, 134, 612)
                if x1 ~= -1 and y1 ~= -1 then -- 如果在指定区域找到某点符合条件
                    tap1(78, y1 + 19)
                else
                    tap1(20, 20)
                    redJudge()
                end
            end
        end
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x34618e, 95) and isColor(612, 24, 0xff6600, 95) then
        debugA("每日报告1")
        tap1(510, 609)
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x356290, 95) and isColor(618, 24, 0xff6600, 95) then
        debugA("每日报告2")
        tap1(510, 609)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(73, 16, 0xe2e8ef, 95) and
        isColor(159, 23, 0x97a9be, 95) then
        debugA("奖励中心")
        if isColor(253, 219, 0xf90703, 95) and isColor(281, 314, 0xd6a691, 95) then
            debugA("司令官界面")
            if isColor(1001, 197, 0xf18e07, 95) then
                debugA("领取")
                tap1(1001, 197)
            elseif isColor(321, 549, 0x4157b0, 90) then
                debugA("40")
                tap1(463 - 141, 549, 0x465bb2)
            elseif isColor(464, 548, 0xf0ffff, 90) then
                debugA("80")
                tap1(463, 549, 0x465bb2)
            elseif isColor(605, 548, 0xcfffff, 90) then
                debugA("120")
                tap1(605, 550)
            elseif isColor(745, 550, 0xe2ffff, 90) then
                debugA("160")
                tap1(745, 550)
                -- elseif isColorPlus(455 + 141 * 3, 564, 0xffd973, 95) then
                --     debug("200")
                --     tap1(463 + 141 * 3, 549, 0x465bb2)
            elseif isColor(714, 95, 0x9e1111, 95) then
                debugA("新任司令官--红点")
                tap1(714, 95)
            elseif isColor(905, 94, 0x9e1111, 95) then
                debugA("成长基地--红点")
                tap1(905, 94)
            elseif isColor(1095, 94, 0x9e1111, 95) then
                debugA("内政强化")
                tap1(1095, 94)
            elseif isColor(396, 154, 0x9e1111, 95) then
                debugA("第1天")
                tap1(428, 177)
            elseif isColor(437, 221, 0x9e1111, 95) then
                debugA("第2天")
                tap1(476, 248)
            elseif isColor(437, 358, 0x9e1111, 95) then
                debugA("第4天")
                tap1(471, 381)
            elseif isColor(396, 427, 0x9e1111, 95) then
                debugA("第5天")
                tap1(429, 454, 0xf0dfd3)
            else
                redJudge()
                tap1(20, 20)
            end
        elseif isColor(137, 103, 0x9e1111, 95) and isColor(117, 103, 0xa17316, 95) then
            debugA("签到奖励--红点--已选")
            x, y = findColorInRegionFuzzy(0x145e99, 95, 972, 145, 972, 587);
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                tap1(x, y)
            else
                tap1(20, 20)
            end
        elseif isColor(136, 173, 0x9e1111, 95) and isColor(116, 173, 0xa17316, 95) then
            debugA("欢迎礼物--红点--已选")
            if isColor(934, 561, 0x116eb9, 95) then
                debugA("第7天")
                tap1(934, 561, 0x116eb9)
            end
            x, y = findColorInRegionFuzzy(0x116eb9, 95, 196, 338, 664, 602)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                tap1(x, y)
            else
                tap1(20, 20)
            end

            -- elseif isColorPlus(138, 380, 0x9e1111, 95) and isColorPlus(114, 380, 0xa17316, 95) then
            --     debug("司令官任务--红点--已选")
            --     if isColorPlus(1001, 197, 0xf18e07, 95) then
            --         debug("领取")
            --         tap1(1001, 197)
            --     elseif isColorPlus(714, 95, 0x9e1111, 95) then
            --         debug("新任司令官--红点")
            --         tap1(714, 95)
            --     elseif isColorPlus(905, 94, 0x9e1111, 95) then
            --         debug("成长基地--红点")
            --         tap1(905, 94)
            --     elseif isColorPlus(1095, 94, 0x9e1111, 95) then
            --         debug("内政强化")
            --         tap1(1095, 94)
            --     elseif isColorPlus(396, 154, 0x9e1111, 95) then
            --         debug("第1天")
            --         tap1(428, 177)
            --     elseif isColorPlus(437, 221, 0x9e1111, 95) then
            --         debug("第2天")
            --         tap1(476, 248)
            --     elseif isColorPlus(437, 358, 0x9e1111, 95) then
            --         debug("第4天")
            --         tap1(471, 381)
            --     else
            --         tap1(20, 20)
            --     end
        elseif isColor(137, 103, 0x9e1111, 95) and isColor(122, 107, 0x1b2a3d, 95) then
            debugA("签到奖励--红点--未选")
            tap1(137, 104)
        elseif isColor(137, 172, 0x9e1111, 95) and isColor(127, 189, 0x192738, 95) then
            debugA("欢迎礼物--红点--未选")
            tap1(137, 172)
        elseif isColor(137, 311, 0x9e1111, 95) and isColor(122, 311, 0x1b2b3f, 95) then
            debugA("航母活动--红点--未选")
            tap1(137, 311)
        elseif isColor(137, 380, 0x9e1111, 95) and isColor(124, 380, 0x1b2b3f, 95) then
            debugA("司令官任务--红点--未选")
            tap1(137, 380)
        elseif isColor(137, 311, 0x9e1111, 95) and isColor(114, 311, 0xa17316, 95) then
            debugA("航母活动--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 95, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     tap1(x, y)
            -- else
            --     tap1(20, 20)
            -- end
            tap1(20, 20)
            -- timeRed = nowTime
        elseif isColor(396, 339, 0x1b7b55, 95) and isColor(247, 400, 0x7d8a96, 95) then
            debugA("航母活动--向上移位置了--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 95, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     tap1(x, y)
            -- else
            --     tap1(20, 20)
            -- end
            tap1(20, 20)
            -- timeRed = nowTime
        elseif isColor(1082, 287, 0xa6a4a9, 95) and isColor(1082, 276, 0x473271, 95) then
            debugA("30days check in event")
            mSleep(2000)
            for j = 0, 2, 1 do
                for i = 0, 6, 1 do
                    if isColor(222 + i * 111, 172 + j * 106, 0xefb309, 80) then
                        tap1(222 + i * 111 + 27, 172 + j * 106 + 27)
                    end
                end
            end
            for j = 0, 2, 1 do
                for i = 0, 6, 1 do
                    if isColor(222 + i * 111, 187 + j * 106, 0xefb309, 80) then
                        tap1(222 + i * 111 + 27, 187 + j * 106 + 27)
                    end
                end
            end
            for i = 0, 4, 1 do
                if isColor(179 + 133 * i, 549, 0xeeb30b, 80) then --连续签到次数
                    tap1(210 + 133 * i, 549)
                end
            end
            if isColor(17, 25, 0xffffff, 95) then
                tap1(20, 20)
            end
        else
            x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0x1a293c", 90, 128, 95, 131, 590)
            if x ~= -1 then
                tap1(x, y)
            else
                tap1(20, 20)
            end
        end
    end
    if isColor(312, 75, 0xf9ab01, 95) and isColor(307, 103, 0xe0e0e0, 95) and isColor(457, 438, 0xf27c00, 95) and
        isColor(511, 504, 0x1d6db9, 95) then
        -- if isColor(312, 77, 0xf5a801, 95) and isColor(308, 98, 0x0b4992, 95) and isColor(457, 438, 0xf27d00, 95) and
        -- isColor(511, 504, 0x1d6dba, 95) then
        debugA("道具信息--复数--使用")
        if muBiaoA == mb_5DaoJu then
            tap1(458, 438, 0xf27c00) -- 1个 
            tap1(511, 504)
            if num5DaoJu >= 5 then
                gaiMuBiaoNewA(2, "道具合成")
            end
        else
            if isColor(574, 190, 0xa0a1a0, 95) then -- 灰色全用
                tap1(511, 504)
            else -- 其它用一半
                tap1(570, 435)
                tap1(511, 504)
                mSleep(2000)
            end
        end
    end
    if isColor(312, 115, 0xf9ab01, 95) and isColor(307, 126, 0xe0e0e0, 95) and isColor(486, 436, 0x114c8a, 95) and
        isColor(490, 455, 0x1d6eba, 95) then
        -- if isColor(312, 116, 0xf5a801, 95) and isColor(307, 127, 0xe0e0e0, 95) and isColor(486, 436, 0x114c8a, 95) and
        -- isColor(490, 455, 0x1c6ebb, 95) then
        debugA("道具信息--单数--使用")
        tap1(490, 455, 0x1c6ebb)
        if muBiaoA == mb_5DaoJu then
            if num5DaoJu >= 5 then
                gaiMuBiaoNewA(2, "道具合成")
            end
        end
    end
    if isColor(89, 59, 0xf5a801, 95) and isColor(208, 252, 0x2c4968, 95) and isColor(300, 430, 0x8f4d14, 95) then
        debugA("补充资源")
        if isColor(1028, 113, 0xffffff, 95) then
            debugA("资源充足")
            tap1(20, 20)
            -- elseif isColor(1028, 113, 0x081b33, 95) then
        else
            debugA("资源不足")
            -- ret = dmOcrText(dm_white, 836, 81, 1029, 93, "D8DADC,272523", 80)
            -- debug(ret)
            -- lua_exit();
            -- mSleep(10)
            -- mSleep(10)
            -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
            -- mSleep(10)
            if isColor(313, 437, 0xd78b02, 95) then
                tap1(313, 437)
            elseif isColor(512, 437, 0xd78b02, 95) then
                tap1(512, 437)
            elseif isColor(702, 437, 0xd68b02, 95) then
                tap1(702, 437)
            elseif isColor(890, 437, 0xd78b02, 95) then
                tap1(890, 437)
            else
                tap1(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
                if muBiaoA == mb_YouHua then
                    isKaYouHua = true
                    writeJson("卡优化", isKaYouHua)
                    gaiMuBiaoNewA(1, mb_ZhuXian, mm_ZhuXian)
                elseif muBiaoA == mb_ZhuXian then
                    if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                        gaiMuBiaoNewA(1, "章节")
                    else
                        gaiMuBiaoNewA(1, mb_WaKuang, mm_WaKuang)
                    end
                    timeRound = nowTime
                elseif muBiaoA == mb_WaKuang then
                    isShengChan = false
                    timeShengChan = nowTime
                end
            end
            -- tap1(313, 420)
            -- if isColor(484, 432, 0x1c6eba, 95) then
            --     debug("金币不足")
            --     tap1(513, 493, 0x566d7c)
            --     tap1(20, 20)
            --     getOut()
            --     if muBiao == mb_YouHua then
            --         isKaYouHua = true
            --         writeJson("卡优化", isKaYouHua)
            --         gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
            --     elseif muBiao == mb_ZhuXian then
            --         if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
            --             gaiMuBiaoNew(1, "章节")
            --         else
            --             gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
            --         end
            --         timeRound = nowTime
            --     elseif muBiao == mb_WaKuang then
            --         isShengChan = false
            --         timeShengChan = nowTime
            --     end
            -- end

        end
    end

    if isColor(5, 25, 0xff6600, 95) and isColor(17, 25, 0xffffff, 95) and isColor(467, 518, 0x448db2, 95) then
        debugA("舰长")
        if isColor(137, 102, 0x9e1111, 95) then
            debugA("舰长--升级--左上角--红点--内")
            if isColor(1022, 547, 0x9e1111, 95) then
                debugA("舰长--升级--右下角--红点--内")
                tap1(1022, 547)
            elseif isColor(1023, 254, 0x116eb9, 95) then
                debugA("舰长--使用")
                local maxKaJianZhangJingYan = 0
                if isColor(1019, 464, 0x116eb9, 95) then
                    maxKaJianZhangJingYan = 3
                elseif isColor(1022, 357, 0x116eb9, 95) then
                    maxKaJianZhangJingYan = 2
                elseif isColor(1021, 256, 0x116eb9, 95) then
                    maxKaJianZhangJingYan = 1
                end
                if isKaJianZhangJingYan > maxKaJianZhangJingYan then
                    isKaJianZhangJingYan = maxKaJianZhangJingYan
                end
                if isColor(819, 459, 0x00ace4, 95) and isKaJianZhangJingYan == 3 then
                    debugA("3满")
                    tap1(860, 465)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 2
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(1020, 461, 0x116eb9, 95) and isKaJianZhangJingYan == 3 then
                    tap1(1020, 461)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 2
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(819, 357, 0x00ace4, 95) and isKaJianZhangJingYan == 2 then
                    debugA("2满")
                    tap1(860, 357)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 1
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(1020, 359, 0x116eb9, 95) and isKaJianZhangJingYan == 2 then
                    tap1(1020, 359)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 1
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(819, 239, 0x00ace4, 95) and isKaJianZhangJingYan == 1 then
                    debugA("1满")
                    tap1(860, 261)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        tap1(514, 419, 0x1c6dba)
                    end
                else
                    tap1(1022, 254)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        tap1(514, 419, 0x1c6dba)
                    end
                end
            else
                isKaJianZhangJingYan = 3
                tap1(20, 20)
            end
        elseif isColor(135, 167, 0x9e1111, 95) then
            debugA("舰长--提升星级--红点")
            tap1(99, 179, 0x9b6f15)
            if isColor(823, 572, 0xd88b00, 95) then
                tap1(823, 572)
            else

                tap1(20, 20)
            end

        else
            tap1(20, 20)
        end
    end
    if isColor(7, 24, 0xff9c00, 95) and isColor(626, 62, 0x005c8b, 95) and isColor(712, 387, 0x5798dc, 95) then
        debugA("舰长列表")
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if bMultiColor == false then
            if isColor(1123, 95, 0x9e1111, 95) then
                debugA("舰长--升级--红点--外") -- 暂时不升
                if isKaZhuXianJianZhang == true then
                    tap1(1077, 116)
                    isKaZhuXianJianZhang = false
                else
                    getOut()
                end
            elseif isColor(1123, 95, 0xf18e07, 95) then
                debugA("舰长--获得")
                tap1(1123, 95, 0xf18e071123, 95, 0xf18e07)
            else
                if isKaZhuXianJianZhang == true then
                    tap1(634, 554, 0x131215) -- 旗舰
                    isKaZhuXianJianZhang = false
                else
                    getOut()
                end
            end
        end
    end
    if isColor(250, 135, 0xf5a801, 95) and isColor(247, 148, 0xe0e0e0, 95) and isColor(896, 504, 0x647e8f, 95) then
        debugA("主专长")
        tap1(512, 572)
    end
    if isColor(307, 126, 0xe0e0e0, 95) and isColor(312, 116, 0xf5a801, 95) and isColor(514, 457, 0x1c6db9, 95) and
        isColor(583, 291, 0x22d5c9, 95) then
        debugA("租用无人机8小时")
        tap1(514, 457)
    end
    if isColor(8, 24, 0xff9c00, 95) and isColor(63, 333, 0xffffff, 95) and isColor(323, 447, 0x0078fe, 95) then
        debugA("联盟界面")
        if check7 == "联盟任务" then
            debugA("选中联盟任务")
            if isColor(781, 94, 0x931012, 95) then -- 1
                tap1(735, 154)
            elseif isColor(937, 94, 0x931012, 95) then -- 2
                tap1(893, 156)
            elseif isColor(1094, 94, 0x931012, 95) then -- 3
                tap1(1052, 156)
                -- elseif isColorPlus(781, 265, 0x931012, 95) then -- 4
                --     tap1(727, 323)
            elseif isColor(937, 265, 0x931012, 95) then -- 5
                tap1(883, 327)
            elseif isColor(1094, 265, 0x931012, 95) then -- 6
                tap1(1057, 327)
            elseif isColor(781, 438, 0x931012, 95) then -- 7
                tap1(714, 496)
            elseif isColor(937, 438, 0x931012, 95) then -- 8
                tap1(900, 498)
            elseif isColor(1094, 438, 0x931012, 95) then -- 9
                tap1(1057, 499)
            else
                tap1(20, 20)

            end
        else
            tap1(20, 20)
        end
    end

    if isColor(450, 467, 0xd68b01, 95) and isColor(687, 477, 0x1d6ebb, 95) and isColor(339, 117, 0xff6600, 95) then
        debugA("请手动加入联盟")
        --     -- fwCloseView("window1", "btn1"); -- 关闭文字视图
        --     -- fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
        --     -- mSleep(500)
        --     isLuaStart = false
        --     dialog("请手动加入联盟", 0);
        --     -- lua_exit();
        --     -- mSleep(10)
        --     -- mSleep(10)
        --     -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
        --     -- mSleep(10)
        tap1(512, 567, 0x0c0c0e)
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and isColor(48, 208, 0x9d96a8, 95) then
        debugA("平台界面")
        if haoLV == 3 then
            tap1(20, 20)
            return
        end
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if bMultiColor == false then
            if isColor(29, 252, 0xffffff, 95) and isColor(36, 252, 0x8a8a8f, 95) then
                debugA("金属平台为0")
                tap1(36, 252)
                mSleep(1000)
                tap1(317, 596)
            elseif muBiaoA == mb_ZhuXian and isColor(53, 337, 0x47702b, 95) then
                debugA("三氯气--有了")
                tap1(20, 20)
                mSleep(1000)
                tap1(346, 422, 0x47c4dd) -- 第三个平台--点击建造
                RGB_NoticeBJ = "FFFF00"
                RGB_NoticeFont = "FF0000"
                strNotice = "平台"
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                mSleep(500)
            else
                tap1(20, 20)
            end
        else
            if muBiaoA == mb_ZhuXian and isColor(53, 337, 0x47702b, 95) then
                debugA("三氯气--有了")
                tap1(20, 20)
                mSleep(1000)
                tap1(346, 422, 0x47c4dd) -- 第三个平台--点击建造
                RGB_NoticeBJ = "FFFF00"
                RGB_NoticeFont = "FF0000"
                strNotice = "平台"
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                mSleep(500)
            else
                tap1(20, 20)
            end
        end
    end
    if isColor(288, 173, 0x0b4992, 95) and isColor(291, 161, 0xf5a801, 95) and isColor(491, 414, 0x45586c, 95) then
        debugA("变更名称")
        tap1(565, 272)
        mSleep(2000)
        inputText(randomString(8, 3))
        mSleep(2000)
        tap1(960, 209)
        mSleep(2000)
        tap1(571, 435)
        mSleep(1000)
    end
    if isColor(5, 25, 0xff9c00, 95) and isColor(104, 85, 0x30e3fe, 95) and isColor(618, 537, 0xbf7702, 95) then
        debugA("传输室")
        if isColor(930, 141, 0xff6600, 95) then -- ad 0/1
            tap1(903, 138, 0xff9900)
        elseif isColor(922, 570, 0xff0101, 95) == false then -- 有特殊传输
            tap1(922, 570)
        elseif isColor(254, 571, 0xff9901, 95) then -- 有普通传输
            tap1(452, 559)
        elseif isColor(205, 563, 0x07706c, 95) then -- 有免费传输
            tap1(205, 563)
        else
            tap1(20, 20)
            isJustBack = false
            numChuanShu = numChuanShu + 1
            writeJson("传输次数", numChuanShu)
        end

    end

    if isColor(1100, 35, 0x7c7c7c, 95) and isColor(611, 599, 0xcecece, 95) then
        debugA("广告--关闭")
        tap1(1100, 35)
    end
    if isColor(1088, 51, 0xffffff, 95) and isColor(1135, 639, 0xd8366a, 95) then
        debugA("广告--关闭")
        tap1(1088, 51)
    end
    if isColor(435, 30, 0x1b68c8, 95) and isColor(515, 54, 0x0f1c2b, 95) and isColor(626, 75, 0xffffff, 95) and
        isColor(510, 617, 0x0c0c0e, 95) then
        debugA("传输结果")
        tap1(510, 623)
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(993, 595, 0xd77400, 95) and isColor(962, 579, 0x0780fe, 95) then
        debugA("海盗界面")
        tap1(993, 595)
        isKillPirate = false -- 杀海盗
        timeKillPirate = nowTime
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(936, 558, 0x114c8a, 95) and isColor(942, 591, 0x1c6eba, 95) then
        debugA("海盗--移动")
        tap1(942, 591, 0x1c6eba)
    end
    if isColor(6, 24, 0xff9c00, 95) and isColor(76, 113, 0xaa3d3d, 95) and isColor(866, 594, 0xd68b02, 95) then
        debugA("海盗--出航")
        if isColor(813, 65, 0xfbfbfb, 95) or isColor(810, 66, 0xff9999, 95) or isColor(793, 63, 0xc80305, 95) then -- 不利
            tap1(20, 20)
            if haoLV <= 2 and muBiaoA == "主线" and numLv >= 6 then
                gaiMuBiaoNewA(1, "章节")
            end
        elseif isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debugA("无人物")
            tap1(20, 20)
        else
            tap1(866, 594)
            isKillPirate = false -- 杀海盗
            timeKillPirate = nowTime
        end
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(476, 383, 0x116eb9, 95) and isColor(475, 539, 0xf18e07, 95) then
        debugA("领取奖励")
        tap1(476, 383)
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(503, 386, 0x124067, 95) and isColor(475, 539, 0xf18e07, 95) then
        debugA("领取奖励--未到时")
        tap1(20, 20)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and isColor(56, 217, 0x5dfe09, 95) then
        debugA("建设界面")
        if isColor(46, 57, 0xffb500, 95) == false then -- 无黄色条
            tap1(20, 20)
            return
        end
        local bMultiColor = false;
        for i = 0, 3, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if isColor(57, 216, 0x64ff15, 95) and isColor(53, 190, 0xffffff, 95) then
            debugA("升级界面")
            if haoLV <= 2 and ((isColor(63, 548, 0x31bcd8, 95) and isColor(42, 440, 0xa82400, 95)) or
                (isColor(64, 545 - 107, 0x40d1e8, 95) and isColor(53, 571 - 107, 0x5daa9f, 95))) then
                debugA("指挥中心")
                -- x, y = findMultiColorInRegionFuzzy(0x32bed9, "-21|-108|0xb72700", 90, 749, 126, 772, 145)
                local numStr = ocrText(749, 126, 772, 145, 0, "012346789")
                if tonumber(numStr) >= 0 then
                    numLv = tonumber(numStr) - 1
                    writeJson("指挥中心等级", numLv)
                    toast(numLv)
                end
            end
            if haoLV >= 3 and isTrade == false and isColor(42, 331, 0xbe78b9, 95) then
                debugA("点击交易所")
                tap1(42, 331)
                return
            elseif haoLV >= 3 and isJiKu == true and isColor(62,338,0x245459, 95) then  
                debugA("机库升级界面")
                tap1(62,338)
                isJiKu = false
                return  
            elseif haoLV >= 3 and isCheckLiZiNum == false and isColor(42, 331, 0xbe78b9, 95) then
                debugA("交易所--点击兑换")
                tap1(51, 434)
                isCheckLiZiNum = true
                return
            elseif haoLV >= 3 and numAddChanLiang <= 2 and isColor(32, 336, 0x00fc21, 95) then
                debugA("点击增产")
                tap1(42, 331)
                return
            elseif haoLV >= 3 and isAddChanLiangLiZi == false and isColor(32, 336, 0x00fc21, 95) and check16 == "vip8" then
                debugA("点击粒子增产")
                tap1(42, 331)
                return
            end
            if isKaShengChan == true then
                tap1(45, 338, 0x28242b) -- 生产战舰
                return
            end
            if bMultiColor == false then
                -- if (m_pOp->isColorPlus(365, 504, 0x1c6dbb, 0.95))//可升级
                if isShipBad == true and isColor(41, 343, 0x938d99, 95) and isColor(38, 190, 0xffffff, 95) then
                    debugA("航母开发室--升级")
                    tap1(45, 336, 0x6f6979)
                elseif isColor(91, 625, 0xf27d12, 95) then
                    debugA("正在生产战舰")
                    isShengChan = false
                    timeShengChan = nowTime
                    tap1(48, 339, 0x060c27) -- 生产
                    isJiaSuProduce = true
                elseif isColor(431, 589, 0x1c6eba, 95) then
                    debugA("可升级")
                    numShengJiCengShu = 0
                    if haoLV <= 2 then
                        if isColor(246, 604, 0xfddb81, 95) and isColor(269, 612, 0xfad275, 95) then
                            debugA("免费")
                            tap1(246, 604)
                        else
                            debugA("花钱升级")
                            tap1(442, 592)
                        end
                    else
                        getOut()
                    end
                elseif isColor(246, 604, 0xfddb81, 95) and isColor(270, 612, 0xf5c566, 95) then
                    numShengJiCengShu = 0
                    if haoLV <= 2 then
                        debugA("免费")
                        tap1(246, 604)
                    else
                        getOut()
                    end
                elseif isColor(421, 598, 0x1eb686, 95) then
                    numShengJiCengShu = 0
                    debugA("建设--加速")
                    tap1(421, 598)
                    if muBiaoA ~= mb_YouHua then
                        isAutoNext = false
                    end
                elseif isColor(652, 403, 0x3e8fee, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debugA("2蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(843, 390)
                    else
                        getOut()
                    end
                elseif isColor(1104, 390, 0x1a406b, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debugA("2蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(843, 390)
                    else
                        getOut()
                    end
                elseif isColor(652, 368, 0x3e8fee, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debugA("1蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(1089, 356)
                    else
                        getOut()
                    end
                elseif isColor(1104, 356, 0x1a406b, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debugA("1蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(1089, 356)
                    else
                        getOut()
                    end
                else
                    getOut()
                end
            end
        elseif isColor(62, 341, 0x0ec0d2, 95) and isColor(60, 296, 0xffffff, 95) then
            debugA("生产界面")
            if bMultiColor == false then
                -- if isColor(579, 617, 0x9f7249, 95) then
                --     debug("T5 => T4")
                --     tap1(483, 603, 0x1e3248)
                --     mSleep(1000)
                if isColor(181, 575, 0xffd89e, 95) then
                    debugA("TX => T1")
                    tap1(181, 597, 0x1b2e44)
                    mSleep(1000)
                elseif isColor(281, 575, 0xffd89e, 95) then
                    debugA("TX => T2")
                    tap1(281, 597, 0x1b2e44)
                    mSleep(1000)
                elseif isColor(380, 575, 0xffd89e, 95) then
                    debugA("TX => T3")
                    tap1(380, 597, 0x1b2e44)
                    mSleep(1000)
                elseif isColor(480, 575, 0xffd89e, 95) then
                    debugA("TX => T4")
                    tap1(480, 597, 0x1b2e44)
                    mSleep(1000)
                elseif isColor(579, 575, 0xffd89e, 95) then
                    debugA("TX => T5")
                    tap1(580, 597, 0x1b2e44)
                    mSleep(1000)
                end
                if isColor(600, 518, 0xaa5f00, 95) then
                    debugA("tx => tx")
                    tap1(600, 518, 0xaa5f00)
                    mSleep(1000)
                end
                if isKaShengChan == true then
                    debugA("T2")
                    tap1(283, 596, 0x455b72)
                    mSleep(1000)
                    isKaShengChan = false
                end
                if isColor(1090, 527, 0x1d6eba, 95) then -- 可生产
                    if isColor(851, 357, 0x15273f, 95) and isColor(851, 411, 0x15273f, 95) and
                        isColor(1087, 357, 0x15273f, 95) and isColor(1087, 411, 0x15273f, 95) then
                        -- 不缺材料
                        debugA("不缺材料")
                        tap1(1090, 527)
                    else
                        -- 缺材料
                        debugA("缺少材料")
                        if haoLV == 3 then -- 大号
                            isShengChan = false
                            timeShengChan = nowTime
                            getOut()
                        elseif haoLV == 2 then
                            tap1(1090, 527)
                        elseif haoLV == 1 then -- 小号
                            tap1(1090, 527)
                        end
                    end
                elseif isColor(913, 532, 0x15a567, 95) then
                    debugA("可加速")
                    if haoLV == 1 then -- 小号加速
                        debugA("小号加速")
                        tap1(913, 532)
                    elseif isJiaSuProduce == true then -- 临时加速
                        debugA("临时加速")
                        tap1(913, 532)
                        isJiaSuProduce = false
                    elseif isJiDiXianKuangIntoProduce == true then
                        debugA("正常进入,退出")
                        getOut()
                        isJiDiXianKuangIntoProduce = false
                    elseif isJiDiXianKuangIntoProduce == false then
                        debugA("任务进入,加速")
                        tap1(913, 532)
                    end
                elseif isColor(647, 548, 0xf27d12, 95) then
                    debugA("升级中")
                    if haoLV == 3 then -- 大号
                        isShengChan = false
                        timeShengChan = nowTime
                        getOut()
                    elseif haoLV == 2 then -- 成品号
                        if muBiaoA ~= mb_YouHua then
                            isAutoNext = false
                            tap1(47, 230, 0x7b4c2e) -- 升级
                        end
                    end

                else
                    getOut()

                end
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(34, 321, 0xbf9721, 95) and isColor(111, 108, 0x4c87ba, 95) then
            debugA("维修界面")
            if isColor(1077, 527, 0x1eb686, 95) and isColor(993, 574, 0x237bc8, 95) then -- 重置
                debugA("可修理--不缺少资源")
                tap1(984, 589, 0x1d6ebb)
            elseif isColor(988, 525, 0x15a976, 95) and isColor(989, 588, 0x1f2830, 95) then
                debugA("可修理--缺少资源")
                isReceiveEmail = true
                tap1(20, 20)
                tap1(698, 586, 0xb4cdf3) -- 打开邮件
            elseif isColor(946, 586, 0x1db587, 95) and isColor(984, 586, 0xffffff, 95) then
                debugA("援助请求")
                tap1(946, 586)
            else
                tap1(20, 20)
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(38, 320, 0xdeb748, 95) and isColor(341, 601, 0xd77500, 95) then
            debugA("指挥中心--维修界面")
            if isColor(793, 584, 0x155daa, 95) then
                tap1(793, 584)
            else
                tap1(48, 233, 0x325240)
            end
        elseif isColor(57, 296, 0xffffff, 95) and isColor(44, 357, 0xffe75f, 95) and isColor(45, 322, 0x0e5dd7, 95) then
            debugA("资源传输装置--兑换")
            timeXXX = nowTime
            if haoLV == 3 then
                local temStr = ocrText(477, 334, 601, 360, 0, "0123456789.KM")
                local temNum = 0
                local num1 = string.find(temStr, "K")
                local num2 = string.find(temStr, "M")
                if num1 ~= nil then
                    temStr = string.gsub(temStr, "K", "")
                    temNum = tonumber(temStr)
                    if temNum ~= nil then
                        temNum = temNum * 1000
                    end
                elseif num2 ~= nil then
                    temStr = string.gsub(temStr, "M", "")
                    temNum = tonumber(temStr)
                    if temNum ~= nil then
                        temNum = temNum * 1000 * 1000
                    end
                else
                    temNum = 1
                end
                if temNum ~= nil then
                    numTai = temNum
                    writeJson("钛", numTai)
                end
            end
            if isColor(971, 427, 0x116eb9, 95) then -- 资源4
                tap1(971, 427)
                numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
            elseif isColor(971, 322, 0x116eb9, 95) then -- 资源3
                tap1(971, 322)
                numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
            elseif check16 == "vip8" and numBuyTaiByCoin <= 15 and isColor(1002, 426, 0xf18e07, 95) and check24 == "买钛" then --金币购买
                tap1(971, 427)
                if isColor(359, 431, 0x1c6dba, 95) and isColor(429, 427, 0xeff5fa, 95) then
                    debugA("可免费兑换")
                    tap1(452, 428, 0x2266ae) --使用
                    mSleep(1000)
                    if isColor(643, 515, 0x165da9, 95) then
                        tap1(678, 437, 0x000000) --全部
                        tap1(521, 490, 0x1c6dba) --使用
                    else
                        tap1(642, 470, 0x145ca9)
                    end
                else
                    tap1(687, 444, 0xd77501) -- 金币购买
                    numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                    writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
                end
                numBuyTaiByCoin = numBuyTaiByCoin + 1
                writeJson("金币买钛", numBuyTaiByCoin)
            elseif numZiYuanDuiHuan <= 5 and haoLV <= 2 then
                tap1(1000, 321, 0xf18e07)
                if isColor(359, 431, 0x1c6dba, 95) and isColor(429, 427, 0xeff5fa, 95) then
                    debugA("可免费兑换")
                    tap1(452, 428, 0x2266ae) --使用
                    mSleep(1000)
                    tap1(678, 437, 0x000000) --全部
                    tap1(521, 490, 0x1c6dba) --使用
                else
                    tap1(687, 444, 0xd77501) -- 金币购买
                    numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                    writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
                end
            else
                tap1(20, 20)
            end
        elseif isColor(59, 331, 0x25f1ea, 95) and isColor(49, 296, 0xffffff, 95) then
            nowTime = os.time()
            timeXXX = nowTime
            if isColor(249, 162, 0xa9a9a9, 95) then
                debugA("研究界面")
                if check14 == "研究" then
                    if isYanJiuZiYuan == true then
                        tap1(249, 162, 0xa9a9a9)
                    elseif isYanJiuKaiFa == true then
                        tap1(750, 162, 0xa9a9a9)
                    elseif isYanJiuFangYu == true then
                        tap1(291, 302, 0x151722)
                    elseif isYanJiuShengChan == true then
                        tap1(366, 444, 0x08121c)
                    elseif isYanJiuJingRui == true then
                        tap1(784, 448, 0x1d9aaa)
                    elseif isYanJiuZhanJian == true then
                        tap1(865, 288, 0x2d2f35)
                    else
                        isYanJiu = false
                        writeJson("研究", isYanJiu)
                    end
                else
                    if isYanJiuZiYuan == true then
                        tap1(249, 162, 0xa9a9a9)
                        -- elseif isYanJiuKaiFa == true then
                        --     tap1(750, 162, 0xa9a9a9)
                        -- elseif isYanJiuFangYu == true then
                        --     tap1(291, 302, 0x151722)
                        -- elseif isYanJiuShengChan == true then
                        --     tap1(366, 444, 0x08121c)
                        -- elseif isYanJiuJingRui == true then
                        --     tap1(784, 448, 0x1d9aaa)
                        -- elseif isYanJiuZhanJian == true then
                        --     tap1(865, 288, 0x2d2f35)
                    else
                        tap1(20, 20)
                        -- isYanJiu = false
                        -- writeJson("研究", isYanJiu)
                    end
                end
            elseif isColor(129, 230, 0xb3b4b5, 95) then
                debugA("研究界面--资源")
                if isYanJiuZiYuan == false then
                    tap1(76, 607, 0x1eb685)
                    return
                end
                if isColor(187, 145, 0xffffff, 95) then -- 1
                    if numZiYuan <= 2 then
                        numZiYuan = 2
                    end
                end
                if isColor(187, 323, 0xffffff, 95) then -- 2
                    if numZiYuan <= 3 then
                        numZiYuan = 3
                    end
                end
                if isColor(411, 234, 0xffffff, 95) then -- 3
                    if numZiYuan <= 4 then
                        numZiYuan = 4
                    end
                end
                if isColor(634, 145, 0xffffff, 95) then -- 4
                    if numZiYuan <= 5 then
                        numZiYuan = 5
                    end
                end
                if isColor(634, 323, 0xffffff, 95) then -- 5
                    if numZiYuan <= 6 then
                        numZiYuan = 6
                    end
                end
                if isColor(858, 234, 0xffffff, 95) then -- 6
                    if numZiYuan <= 7 then
                        numZiYuan = 7
                    end
                end
                if isColor(1082, 234, 0xffffff, 95) then -- 7
                    isYanJiuZiYuan = false
                    writeJson("研究资源", isYanJiuZiYuan)
                    tap1(75, 608, 0x1db687)
                    return
                end
                if numZiYuan == 1 then -- 1
                    tap1(150, 176)
                elseif numZiYuan == 2 then -- 2
                    tap1(187, 323)
                elseif numZiYuan == 3 then -- 3
                    tap1(411, 234)
                elseif numZiYuan == 4 then -- 4
                    tap1(634, 144)
                elseif numZiYuan == 5 then -- 5
                    tap1(634, 323)
                elseif numZiYuan == 6 then -- 6
                    tap1(858, 234)
                elseif numZiYuan == 7 then -- 7
                    tap1(1082, 234)
                end
            elseif isColor(137, 328, 0xc2c3c4, 95) then
                debugA("研究界面--开发")
                if isYanJiuKaiFa == false then
                    tap1(76, 607, 0x1eb685)
                    return
                end
                if isColor(187, 234, 0xffffff, 95) then -- 1
                    if numKaiFa <= 2 then
                        numKaiFa = 2
                    end
                end
                if isColor(411, 145, 0xffffff, 95) then -- 2
                    if numKaiFa <= 3 then
                        numKaiFa = 3
                    end
                end
                if isColor(411, 323, 0xffffff, 95) then -- 3
                    if numKaiFa <= 4 then
                        numKaiFa = 4
                    end
                end
                if isColor(634, 234, 0xffffff, 95) then -- 4
                    if numKaiFa <= 5 then
                        numKaiFa = 5
                    end
                end
                if isColor(858, 145, 0xffffff, 95) then -- 5
                    if numKaiFa <= 6 then
                        numKaiFa = 6
                    end
                end
                if isColor(858, 323, 0xffffff, 95) then -- 6
                    if numKaiFa <= 7 then
                        numKaiFa = 7
                    end
                end
                if isColor(1082, 234, 0xffffff, 95) then -- 7
                    isYanJiuKaiFa = false
                    writeJson("研究开发", isYanJiuKaiFa)
                    tap1(75, 608, 0x1db687)
                    return
                end
                if numKaiFa == 1 then -- 1
                    tap1(187, 234)
                elseif numKaiFa == 2 then -- 2
                    tap1(411, 145)
                elseif numKaiFa == 3 then -- 3
                    tap1(411, 323)
                elseif numKaiFa == 4 then -- 4
                    tap1(634, 234)
                elseif numKaiFa == 5 then -- 5
                    tap1(858, 145)
                elseif numKaiFa == 6 then -- 6
                    tap1(858, 323)
                elseif numKaiFa == 7 then -- 7
                    tap1(1082, 234)
                end
            elseif isColor(129, 317, 0xdadbdb, 95) then
                debugA("研究界面--战舰")
                if isYanJiuZhanJian == false then
                    tap1(76, 607, 0x1eb685)
                    return
                end
                if numZhanJian == 1 then -- 1
                    tap1(187, 278)
                elseif numZhanJian == 2 then -- 2
                    tap1(388, 97)
                elseif numZhanJian == 3 then -- 3
                    tap1(393, 448)
                elseif numZhanJian == 4 then -- 4
                    tap1(611, 179)
                elseif numZhanJian == 5 then -- 5
                    tap1(615, 361)
                elseif numZhanJian == 6 then -- 6
                    tap1(837, 275)
                elseif numZhanJian == 7 then -- 7
                    tap1(1058, 96)
                elseif numZhanJian == 8 then -- 8
                    tap1(1056, 451)
                end
            elseif isColor(138, 328, 0x9a9b9d, 95) then
                debugA("研究界面--精锐怪物")
                if isYanJiuJingRui == false then
                    tap1(76, 607, 0x1eb685)
                    return
                end
                if numJingRui == 1 then -- 1
                    tap1(187, 278)
                elseif numJingRui == 2 then -- 2
                    tap1(388, 177)
                elseif numJingRui == 3 then -- 3
                    tap1(393, 353)
                elseif numJingRui == 4 then -- 4
                    tap1(611, 269)
                elseif numJingRui == 5 then -- 5
                    tap1(834, 192)
                elseif numJingRui == 6 then -- 6
                    tap1(839, 366)
                elseif numJingRui == 7 then -- 7
                    tap1(1058, 278)
                end
            elseif isColor(128, 323, 0x9c9d9d, 95) then
                debugA("研究界面--生产")
                if isYanJiuShengChan == false then
                    tap1(76, 607, 0x1eb685)
                    return
                end
                if numShengChan == 1 then -- 1
                    tap1(187, 278)
                elseif numShengChan == 2 then -- 2
                    tap1(388, 97)
                elseif numShengChan == 3 then -- 3
                    tap1(393, 448)
                elseif numShengChan == 4 then -- 4
                    tap1(611, 179)
                elseif numShengChan == 5 then -- 5
                    tap1(615, 361)
                elseif numShengChan == 6 then -- 6
                    tap1(837, 275)
                elseif numShengChan == 7 then -- 7
                    tap1(1058, 96)
                elseif numShengChan == 8 then -- 8
                    tap1(1056, 451)
                end
            elseif isColor(123, 324, 0xc6c6c7, 95) then
                debugA("研究界面--防御")
                if isYanJiuFangYu == false then
                    tap1(76, 607, 0x1eb685)
                    return
                end
                if isColor(187, 234, 0xffffff, 95) then -- 1
                    if numFangYu <= 2 then
                        numFangYu = 2
                    end
                end
                if isColor(411, 145, 0xffffff, 95) then -- 2
                    if numFangYu <= 3 then
                        numFangYu = 3
                    end
                end
                if isColor(411, 323, 0xffffff, 95) then -- 3
                    if numFangYu <= 4 then
                        numFangYu = 4
                    end
                end
                if isColor(634, 145, 0xffffff, 95) then -- 4
                    if numFangYu <= 5 then
                        numFangYu = 5
                    end
                end
                if isColor(634, 323, 0xffffff, 95) then -- 5
                    if numFangYu <= 6 then
                        numFangYu = 6
                    end
                end
                if isColor(858, 56, 0xffffff, 95) then -- 6
                    if numFangYu <= 7 then
                        numFangYu = 7
                    end
                end
                if isColor(858, 234, 0xffffff, 95) then -- 7
                    if numFangYu <= 8 then
                        numFangYu = 8
                    end
                end
                if isColor(858, 411, 0xffffff, 95) then -- 8
                    if numFangYu <= 9 then
                        numFangYu = 9
                    end
                end
                if numFangYu == 1 then -- 1
                    tap1(187, 234)
                elseif numFangYu == 2 then -- 2
                    tap1(411, 145)
                elseif numFangYu == 3 then -- 3
                    tap1(411, 323)
                elseif numFangYu == 4 then -- 4
                    tap1(634, 145)
                elseif numFangYu == 5 then -- 5
                    tap1(634, 323)
                elseif numFangYu == 6 then -- 6
                    tap1(858, 56)
                elseif numFangYu == 7 then -- 7
                    tap1(858, 234)
                elseif numFangYu == 8 then -- 8
                    tap1(858, 411)
                elseif numFangYu == 9 then -- 9
                    tap1(1051, 281)
                end
            elseif isColor(600, 157, 0x13669a, 95) and isColor(726, 286, 0x13669a, 95) and
                isColor(600, 403, 0x13669a, 95) then
                debugA("研究--强制")
                tap1(600, 262, 0xb8b9d4)
                if isColor(543, 207, 0x3e8fee, 95) or isColor(995, 181, 0x1d426f, 95) then -- 缺少条件1
                    debugA("缺少条件1--继续")
                    tap1(761, 192)
                    mSleep(1000)
                elseif isColor(543, 242, 0x3e8fee, 95) then -- 缺少条件2
                    debugA("缺少条件2--继续")
                    tap1(760, 227)
                    mSleep(1000)
                elseif isColor(543, 251, 0x3e8fee, 95) then -- 缺少条件3
                    debugA("缺少条件3--继续")
                    tap1(762, 260)
                    mSleep(1000)
                end
            else
                debugA("啥都不是，关闭")
                tap1(20, 20)
            end
        elseif isColor(49, 329, 0x767676, 95) and isColor(41, 296, 0xffffff, 95) then
            debugA("充电界面")
            if isColor(287, 514, 0x1f2d46, 95) then
                tap1(543, 597)
            else
                tap1(20, 20)
            end
        elseif isColor(42, 331, 0xbe78b9, 95) and isColor(48, 296, 0xffffff, 95) then
            debugA("交易界面")
            if isColor(656, 483, 0x111111, 95) and isColor(785, 510, 0x0c0c0c, 95) then
                debugA("LOCK")
                tap1(38, 224, 0x81ff29)
                return
            end
            for i = 0, 1, 1 do
                for j = 0, 3, 1 do
                    if isColor(515 + j * 167, 342 + i * 238, 0x051788, 95) or
                        isColor(504 + j * 167, 353 + i * 238, 0x33323b, 95) then
                        tap1(515 + j * 167, 342 + i * 238)

                        if isColor(549, 491, 0xd97700, 95) then
                            tap1(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            tap1(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            tap1(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            tap1(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            tap1(534, 455)
                            mSleep(1000)
                        end
                    elseif isColor(548 + j * 167, 251 + i * 238, 0x6c28d6, 95) and isBuyLiZi == true then -- 粒子
                        tap1(515 + j * 167, 342 + i * 238)
                        mSleep(5000)
                        if isColor(549, 491, 0xd97700, 95) then
                            tap1(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            tap1(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            tap1(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            tap1(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            tap1(534, 455)
                            mSleep(1000)
                        end
                        if isColor(197, 300, 0xb87609, 95) then -- 金币不足
                            tap1(20, 20)
                            mSleep(1000)
                            isBuyLiZi = false
                            return
                        end
                    elseif isColor(521 + j * 167, 243 + i * 238, 0x444f4d, 95) and
                        isColor(515 + j * 167, 182 + i * 238, 0x359e1f, 95) and check16 == "vip8" and isBuyLiZi == true
                        and check24 == "买钛" then --钛
                        tap1(515 + j * 167, 342 + i * 238)
                        mSleep(5000)
                        if isColor(549, 491, 0xd97700, 95) then
                            tap1(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            tap1(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            tap1(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            tap1(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            tap1(534, 455)
                            mSleep(1000)
                        end
                        if isColor(197, 300, 0xb87609, 95) then -- 金币不足
                            tap1(20, 20)
                            mSleep(1000)
                            isBuyLiZi = false
                            return
                        end
                    elseif isColor(527 + j * 167, 202 + i * 238, 0xeaebff, 95) and
                        isColor(552 + j * 167, 228 + i * 238, 0x0f1d22, 95) then --护盾
                        tap1(515 + j * 167, 342 + i * 238)

                        if isColor(549, 491, 0xd97700, 95) then
                            tap1(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            tap1(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            tap1(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            tap1(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            tap1(534, 455)
                            mSleep(1000)
                        end
                    end

                end
            end
            if isColor(484, 101, 0x00ace4, 95) then -- 免费
                tap1(484, 101, 0x00ace4)
            elseif isColor(16, 24, 0xffffff, 95) then
                tap1(20, 20)
                isTrade = true
                writeJson("交易行", isTrade)
            end
        elseif isColor(30, 336, 0x043f05, 95) and isColor(41, 296, 0xffffff, 95) then
            debugA("金属资源地界面--增产")
            if numAddChanLiang <= 2 then
                if isColor(811, 589, 0x89898c, 95) and isColor(826, 589, 0x89898c, 95) and
                    isColor(833, 589, 0x89898c, 95) and isColor(848, 589, 0x89898c, 95) and
                    isColor(1057, 353, 0xff0000, 95) == false then
                    tap1(1057, 353, 0xff0000)
                    tap1(20, 20)
                    numAddChanLiang = numAddChanLiang + 1
                    writeJson("增产", numAddChanLiang)
                    isJustBack = false
                else
                    tap1(20, 20)
                    numAddChanLiang = numAddChanLiang + 1
                    writeJson("增产", numAddChanLiang)
                    isJustBack = false
                end
            elseif isAddChanLiangLiZi == false and check16 == "vip8" then
                if isColor(811, 589, 0x89898c, 95) and isColor(826, 589, 0x89898c, 95) and
                    isColor(833, 589, 0x89898c, 95) and isColor(848, 589, 0x89898c, 95) and
                    isColor(1057, 353, 0xff0000, 95) == false then
                    tap1(1057, 353, 0xff0000)
                    tap1(20, 20)
                    isAddChanLiangLiZi = true
                    writeJson("增产粒子", isAddChanLiangLiZi)
                    isJustBack = false
                else
                    tap1(20, 20)
                    isAddChanLiangLiZi = true
                    writeJson("增产粒子", isAddChanLiangLiZi)
                    isJustBack = false
                end
            else
                tap1(20, 20)
                isJustBack = false
            end
        elseif isColor(43, 343, 0x847b84, 95) and isColor(43, 296, 0xffffff, 95) then
            debugA("航母开发室--航母")
            -- if isShipBad == true then
            if isColor(505, 110, 0x3e6b96, 95) == false and isColor(505, 110, 0x191c27, 95) == false then
                debugA("无航母")
                tap1(20, 20)
                if muBiaoA == mb_FixShip then
                    gaiMuBiaoNewA(3, "", mm_Wu)
                end
                return
            end
            if (isColor(505, 110, 0x3e6b96, 95) or isColor(505, 110, 0x191c27, 95)) -- 1号航母存在
                and isColor(440, 263, 0xffffff, 95) == false -- 没在充电
                and isColor(410, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(491, 119, 0xffffff, 95) == false --不是0级
                and isColor(440, 281, 0xffffff, 95) == false  -- 没在使用
                and isColor(596-199,290,0xe4e4e5,95) == false then  --没在满期
                debugA("1号来充电吧")
                tap1(440, 263)
                --elseif isColor(704, 110, 0x3e6b96, 95) -- 2号航母存在
            elseif (isColor(704, 110, 0x3e6b96, 95) or isColor(704, 110, 0x191c27, 95)) -- 2号航母存在
                and isColor(639, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(609, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(690, 119, 0xffffff, 95) == false --不是0级
                and isColor(639, 281, 0xffffff, 95) == false  -- 没在使用
                and isColor(596,290,0xe4e4e5,95) == false then  --没在满期
                debugA("2号来充电吧")
                tap1(639, 263)
                --elseif isColor(902, 110, 0x3e6b96, 95) -- 3号航母存在
            elseif (isColor(902, 110, 0x3e6b96, 95) or isColor(902, 110, 0x191c27, 95)) -- 3号航母存在
                and isColor(838, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(808, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(888, 119, 0xffffff, 95) == false --不是0级
                and isColor(838, 281, 0xffffff, 95) == false  -- 没在使用
                and isColor(795,290,0xe4e4e5,95) == false then  --没在满期
                debugA("3号来充电吧")
                tap1(838, 263)
                --elseif isColor(1079, 110, 0x3e6b96, 95) -- 4号航母存在
            elseif (isColor(1079, 110, 0x3e6b96, 95) or isColor(1079, 110, 0x191c27, 95)) -- 4号航母存在
                and isColor(1036, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(1006, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(1087, 119, 0xffffff, 95) == false --不是0级
                and isColor(1036, 281, 0xffffff, 95) == false  -- 没在使用
                and isColor(993,290,0xe4e4e5,95) == false then  --没在满期
                debugA("4号来充电吧")
                tap1(1036, 263)
            else
                tap1(20, 20)
                isShipBad = false
                if muBiaoA == mb_FixShip then
                    gaiMuBiaoNewA(3, "", mm_Wu)
                end
            end
        elseif isColor(45, 418, 0xe9b042, 95) and isColor(44, 403, 0xffffff, 95) then
            debugA("加工站界面")
            if isColor(327, 181, 0x4e6374, 95) or isColor(328, 337, 0x4e6374, 95) or isColor(327, 495, 0x4e6374, 95) then
                debugA("有位置空着")
                if numCaiLiao == 1 then
                    tap1(633, 183, 0x8a70ad)
                elseif numCaiLiao == 2 then
                    tap1(769, 183, 0x4c4144)
                elseif numCaiLiao == 3 then
                    tap1(900, 179, 0x2554bb)
                elseif numCaiLiao == 4 then
                    tap1(1035, 184, 0x524f2b)
                elseif numCaiLiao == 5 then
                    tap1(629, 316, 0x4c4f82)
                elseif numCaiLiao == 6 then
                    tap1(763, 321, 0xfaf3fa)
                elseif numCaiLiao == 7 then
                    tap1(897, 312, 0x598dd5)
                elseif numCaiLiao == 8 then
                    tap1(1039, 319, 0x11130b)
                elseif numCaiLiao == 9 then
                    tap1(633, 449, 0x171a1a)
                elseif numCaiLiao == 10 then
                    tap1(767, 445, 0xb9f2f9)
                elseif numCaiLiao == 11 then
                    tap1(900, 447, 0x3a4255)
                elseif numCaiLiao == 12 then
                    tap1(1037, 450, 0x76748c)
                else
                    tap1(20, 20)
                end
                numCaiLiao = numCaiLiao + 1
                if numCaiLiao >= 13 then
                    numCaiLiao = 1
                end
                writeJson("材料编号", numCaiLiao)

            else
                tap1(20, 20)
            end
        elseif isColor(49, 296, 0xffffff, 95) and isColor(45, 320, 0x91b5be, 95) then
            debugA("机库--库存界面")
            if isColor(184, 328, 0x122642, 95) then
                debugA("有船在库存")
                tap1(20, 20)
            else
                tap1(934, 609, 0x1c6eba) --库存
            end
        elseif isColor(42, 422, 0x9a0de0, 95) and isColor(38, 403, 0xffffff, 95) then
            debugA("兑换界面")
            do
                local temStr = ocrText(323, 297, 385, 312, 0, "0123465789,")
                if temStr ~= nil then
                    temStr = string.gsub(temStr, ",", "")
                    temStr = string.gsub(temStr, " ", "")
                    numLiZi = tonumber(temStr)
                    if type(numLiZi) == "number" then
                        if numLiZi > 1000000 then
                            numLiZi = numLiZi / 10
                        end
                        toast(numLiZi)
                        writeJson("粒子", numLiZi)
                        if numLiZi >= 350000 then
                            vibratorNotice()
                        end
                    end
                end
            end

            snapshot("lizi1.jpg", 323, 298, 385, 310, 0.5); -- 使用 jpg 格式截图，并设置图片质量为 0.5
            snapshot("lizi2.jpg", 323, 368, 385, 381, 0.5); -- 使用 jpg 格式截图，并设置图片质量为 0.5
            local tab = { userPath() .. "/res/lizi1.jpg", userPath() .. "/res/lizi2.jpg" }
            local path = userPath() .. "/res/lizi.jpg"
            local dir = 1
            local quality = 1
            local bool, msg = image_tsing.operMerge(tab, path, dir, quality) --合并图片

            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
            mSleep(500)
            tap1(16, 24, 0xffffff)
        else
            tap1(20, 20)

        end
    end
    if isColor(215, 189, 0xb283ca, 95) and isColor(344, 191, 0xf7eb5e, 95) and isColor(494, 210, 0x113199, 95) then
        debugA("制作材料")
        if isColor(500, 518, 0x604411, 95) or isColor(529, 524, 0x081525, 95) or isColor(529, 524, 0x151e2b, 95) then
            debugA("没选材料")
            if numCaiLiao == 1 then
                tap1(210, 205, 0x5669ba)
            elseif numCaiLiao == 2 then
                tap1(347, 195, 0xaa8e2a)
            elseif numCaiLiao == 3 then
                tap1(497, 207, 0x236dbd)
            elseif numCaiLiao == 4 then
                tap1(639, 199, 0x9c7f57)
            elseif numCaiLiao == 5 then
                tap1(778, 207, 0x3f456e)
            elseif numCaiLiao == 6 then
                tap1(924, 203, 0x6a5c5a)
            elseif numCaiLiao == 7 then
                tap1(208, 376, 0xabcdec)
            elseif numCaiLiao == 8 then
                tap1(356, 384, 0x2d385f)
            elseif numCaiLiao == 9 then
                tap1(488, 375, 0x5a5752)
            elseif numCaiLiao == 10 then
                tap1(623, 376, 0x94aab5)
            elseif numCaiLiao == 11 then
                tap1(785, 375, 0x73737a)
            elseif numCaiLiao == 12 then
                tap1(918, 375, 0xc1c0d3)
            else
                tap1(210, 205, 0x5669ba)
            end
            numCaiLiao = numCaiLiao + 1
            if numCaiLiao >= 13 then
                numCaiLiao = 1
            end
            writeJson("材料编号", numCaiLiao)
        else
            tap1(516, 523, 0x604411)
        end
    end
    if isColor(34, 111, 0xff6600, 95) and isColor(59, 106, 0xff8400, 95) and isColor(526, 84, 0x01ace4, 95) and
        isColor(905, 134, 0x116eb9, 95) then
        debugA("航母充电")
        if isColor(996, 182, 0x116eb9, 95) and isColor(1022, 181, 0xced6dd, 95) then
            debugA("充电--未满")
            tap1(996, 182)
            mSleep(1000)
            if isColor(991, 181, 0x116eb9, 95) and muBiaoA == mb_FixShip then -- 船没坏
                isShipBad = false
                gaiMuBiaoNewA(3, "", mm_Wu)
            end
            tap1(495, 451, 0x1c6db9)

        else
            tap1(511, 593, 0x0c0c0e)
            debugA("muBiaoA  :  " .. muBiaoA)
            if muBiaoA == mb_FixShip then
                isShipBad = false
                gaiMuBiaoNewA(3, "", mm_Wu)
            end
        end
    end

    if isColor(476, 459, 0xd68b00, 95) and isColor(496, 470, 0x279fd5, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--矿物")
        tap1(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 474, 0x9a95a3, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--金属")
        tap1(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(499, 476, 0x8644ed, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--粒子")
        tap1(513, 552, 0x0c0c0e)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 464, 0xf8eea7, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--金币")
        tap1(513, 552, 0x0c0c0e)
    end
    if isColor(217, 437, 0x67e5f5, 95) and isColor(399, 444, 0x837e8b, 95) and isColor(597, 444, 0xb1d272, 95) then
        debugA("充电--第二步")
        tap1(884, 187, 0x0b3466)
        tap1(884, 271, 0x0b3466)
        tap1(882, 349, 0x8b9fb7)
        tap1(647, 504, 0x1a69b6)
    end
    if isColor(586, 189, 0x6375a7, 95) and isColor(776, 270, 0xffffff, 95) and isColor(587, 354, 0x5b6ea3, 95) and
        isColor(719, 507, 0x1c6eba, 95) then
        debugA("充电缺少资源")
        tap1(511, 586, 0x0c0c0e)
        isChongDianKaZiYuan = true
        getOut()
    end
    if isColor(275, 58, 0xf5a801, 95) and isColor(737, 130, 0x0d9098, 95) and isColor(290, 225, 0xffffff, 95) and
        isColor(538, 488, 0xba7b00, 95) then
        debugA("使用道具界面")
        if isColor(322, 196, 0xffb30a, 95) and isColor(386, 198, 0xcdcdcd, 95) then
            debugA("观看视频,缩短20分钟--灰色不可选")
            tap1(510, 580, 0x0c0c0e)
            mSleep(1000)
            if isColor(510, 590, 0x3a587b, 95) then
                tap1(511, 596, 0x0c0c0e)
                mSleep(1000)
            end
            getOut()
            if muBiaoA == "研究" then
                gaiMuBiaoNewA(3, "")
                isYanJiu = false
                writeJson("研究", isYanJiu)
            elseif muBiaoA == "主线" then
                if haoLV == 3 then
                    gaiMuBiaoNewA(1, mb_WaKuang)
                else
                    gaiMuBiaoNewA(1, "优化")
                end
            elseif muBiaoA == "优化" then
                gaiMuBiaoNewA(1, "主线")
            end
        elseif isColor(620, 500, 0x1a61a3, 95) then
            debugA("可使用")
            tap1(599, 501)
        else
            if muBiaoA == mb_YouHua then
                isKaYouHua = true
                writeJson("卡优化", isKaYouHua)
                gaiMuBiaoNewA(1, mb_ZhuXian, mm_ZhuXian)
                mSleep(1000)
                tap1(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
            elseif muBiaoA == mb_ZhuXian then
                if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                    gaiMuBiaoNewA(1, "章节")
                else
                    gaiMuBiaoNewA(1, mb_WaKuang, mm_WaKuang)
                end
                timeRound = nowTime
                mSleep(1000)
                tap1(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
            elseif muBiaoA == mb_WaKuang then
                timeRound = nowTime
                mSleep(1000)
                tap1(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
            end
        end
    end
    if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and isColor(355, 86, 0x5195db, 95) then
        debugA("司令官界面")
        if isColor(1113, 84, 0x9e1111, 95) then -- 战绩红点
            tap1(1113, 84)
        else
            tap1(20, 20)
        end
    end
    if isColor(33, 45, 0xff6600, 95) and isColor(77, 149, 0x55aeff, 95) and isColor(1094, 559, 0x7088a9, 95) then
        debugA("战绩")
        if isColor(141, 490, 0xf49a16, 95) then
            tap1(141, 490)
        else
            tap1(511, 594, 0x0c0c0e)
        end
    end
    if isColor(291, 168, 0xf5a801, 95) and isColor(282, 175, 0xff6600, 95) and isColor(783, 235, 0x85baf9, 95) then
        debugA("谷歌APP重置失败")
        if isColor(494, 420, 0x3efac6, 95) or isColor(481, 420, 0x4a9981, 95) then
            debugA("加速时间比剩余的长")
            if muBiaoA == mb_YouHua then
                gaiMuBiaoNewA(1, mb_ZhuXian, mm_ZhuXian)
                tap1(511, 497)
                tap1(511, 579, 0x0c0c0e)
                getOut()
            else
                tap1(511, 497)
                tap1(511, 579, 0x0c0c0e)
                getOut()
            end
        elseif isColor(474, 300, 0xdfe0e2, 95) and isColor(476, 430, 0x1c6eb9, 95) then
            debugA("清除残迹")
            tap1(474, 430)
        elseif isColor(587, 344, 0xff0099, 95) and isColor(486, 433, 0x1c6eba, 95) then
            debugA("升级,解除护盾")
            tap1(486, 433, 0x1c6eba)
        else
            tap1(511, 497)
        end
    end
    if isColor(567, 80, 0x99b5cb, 95) and isColor(567, 558, 0x99b5cb, 95) and isColor(567, 572, 0x536270, 95) then
        debugA("剧情图片")
        tap1(567, 308, 0x7b726d)
    end
    if isColor(430, 206, 0xf87808, 95) and isColor(439, 206, 0x583818, 95) and isColor(567, 269, 0x59271b, 95) then
        debugA("完成章节")
        tap1(556, 614, 0x262b33)
        tap1(556, 614, 0x262b33)
    end
    if isColor(69, 95, 0xf5a801, 95) and isColor(60, 119, 0xff6600, 95) and isColor(66, 157, 0xff6600, 95) then
        debugA("第N章第N节")
        if isColor(103, 403, 0x0d9098, 95) then
            tap1(97, 402)
        elseif isColor(256, 403, 0x0d9098, 95) then
            tap1(256, 402)
        elseif isColor(413, 403, 0x0d9098, 95) then
            tap1(413, 402)
        elseif isColor(566, 403, 0x0d9098, 95) then
            tap1(566, 402)
        elseif isColor(716, 403, 0x0d9098, 95) then
            tap1(716, 402)
        elseif isColor(891, 494, 0x1db586, 95) then
            tap1(891, 494)
        else
            if muBiaoA == "章节" then
                if isColor(81, 106, 0xf26202, 95) and isColor(84, 104, 0xff6600, 95) and isColor(83, 110, 0xf36202, 95) then -- 1-6
                    if haoLV <= 2 then
                        gaiMuBiaoNewA(1, "优化")
                    else
                        gaiMuBiaoNewA(1, mb_WaKuang)
                    end
                    tap1(510, 567, 0x0c0c0e)
                else
                    x, y = findMultiColorInRegionFuzzy(0x126fbb, "112|22|0x075ea8", 90, 73, 385, 836, 428)
                    if x ~= -1 then
                        tap1(x, y)
                    end
                end
            else
                tap1(511, 567, 0x0c0c0e)
                redJudge()
            end
        end
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and isColor(111, 15, 0xdde4eb, 95) and
        isColor(149, 33, 0xa2b3c6, 95) then
        debugA("议会界面")
        tap1(20, 20)
        redJudge()
    end
    if isColor(7, 25, 0xff9c00, 95) and isColor(18, 25, 0xffffff, 95) and isColor(103, 166, 0xffb500, 95) and
        isColor(119, 166, 0x718d9f, 95) then
        debugA("高级商店")
        if isColor(102, 77, 0x9e1111, 95) then -- 免费补给箱子
            tap1(102, 77)
            mSleep(1000)
            tap1(20, 20)
        else
            redJudge()
            tap1(20, 20)
            -- timeRed = nowTime
        end
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and isColor(103, 75, 0xffb500, 95) then
        debugA("背包界面")
        if muBiaoA == mb_5DaoJu and num5DaoJu <= 7 then
            if isColor(111, 127, 0x182536, 95) then
                tap1(111, 127) -- 资源
                mSleep(1000)
            end
            for i = 0, 8, 1 do
                if isPause == true then
                    return
                end
                if isColor(215 + i * 100, 78, 0xa0a0a0, 95) or isColor(215 + i * 100, 78, 0x33a904, 95) then
                    tap1(215 + i * 100, 117)
                    num5DaoJu = num5DaoJu + 1
                    writeJson("每日5道具", num5DaoJu)

                    break
                end
            end
        elseif muBiaoA == mb_5DaoJu and num5DaoJu > 7 then
            gaiMuBiaoNewA(2, "道具合成")
            tap1(20, 20, 0x5c6571)
        elseif muBiaoA == "道具合成" then
            if isColor(111, 317, 0x182637, 95) then
                tap1(111, 317) -- 材料
                mSleep(1000)
            end
            --分解
            for i = 0, 8, 1 do
                if isPause == true then
                    return
                end
                if isColor(172 + i * 100, 78, 0x34b200, 95) then
                    tap1(172 + i * 100, 78) --物品
                    tap1(396, 471, 0x1d6ebb) --分解
                    tap1(689, 543, 0x1c6eba) --分解
                    tap1(488, 429, 0x1c6db9) --确定
                    mSleep(2000)
                    break
                end
            end
            for i = 1, 10, 1 do
                if isPause == true then
                    return
                end
                if isColor(17, 24, 0xffffff, 95) then --没转圈
                    break
                end
                mSleep(1000)
            end
            --合成
            for i = 0, 8, 1 do
                if isPause == true then
                    return
                end
                tap1(215 + i * 100, 78) --点击物品
                if isColor(604, 471, 0xd78b01, 95) then --有合成按钮
                    tap1(611, 466, 0xd78b01) --合成
                    if isColor(681, 545, 0x1c6dba, 95) then --有合成按钮
                        tap1(331, 546, 0xf27c00) --1个
                        tap1(681, 545, 0x1c6eba) --合成
                        tap1(497, 433, 0x1c6eba) --确定
                        isMixedThing = true
                        writeJson("每日道具合成", isMixedThing)
                        gaiMuBiaoNewA(2, mb_CaiJi)
                        break
                    else
                        tap1(511, 611, 0x0c0c0e) --关闭
                    end
                else
                    tap1(511, 551, 0x0c0c0e)
                end
                if i == 8 then
                    isMixedThing = true
                    writeJson("每日道具合成", isMixedThing)
                    gaiMuBiaoNewA(2, mb_CaiJi)
                end
            end
        elseif isZhengLi == false then
            if isColor(122, 128, 0x182536, 95) then
                tap1(122, 128) -- 资源
                mSleep(1000)
            end
            for i = 1, 10, 1 do
                if isPause == true then
                    return
                end
                x, y = findMultiColorInRegionFuzzy(0xd5c29f, "-9|51|0x9c683e", 90, 169, 75, 1048, 612) --金币
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x87807d, "-3|41|0x7a7d79,-26|-12|0x54ac1c", 90, 169, 75, 1048, 612) --钛
                useBagThings()
            end
            if isColor(111, 448, 0x182536, 95) then
                tap1(111, 449) -- 其他
                mSleep(1000)
            end
            for i = 1, 20, 1 do
                if isPause == true then
                    return
                end
                x, y = findMultiColorInRegionFuzzy(0x1d232f, "-18|-20|0xcbd1d3,23|-21|0xf1f5f6", 90, 169, 75, 249, 162) -- 补给箱
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xa9a9a9, "12|0|0xa9a9a9", 90, 169, 75, 1052, 76) -- 战舰--灰
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x34b300, "12|0|0x34b300", 90, 169, 75, 1052, 76) -- 战舰--绿
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x13c8d4, "12|10|0x1a99b9,89|9|0x2cb6d2", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x425e6a, "35|32|0x0c2748,9|35|0x333b4c", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x4984a3, "32|32|0xf4eeff,7|36|0x3c314a", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x725050, "30|30|0xfff6f6,4|28|0x5e2827", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x673300, "32|31|0xfbf0ce,5|36|0x692c01", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x00b3ff, "17|20|0x0076d2,6|41|0x526256", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x93a6ca, "0|31|0x94a1c3,15|16|0x8cbeea", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x9b597a, "0|31|0xa96a87,14|14|0xad7ed1", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xab8f0a, "0|31|0xb3990a,14|14|0xb5b453", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xfc2000, "5|28|0x86210c,26|19|0xf9f6f1", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x13f3f7, "32|-7|0x0ae0e8,18|17|0x90b5b9", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x94a3c7, "-5|23|0x92acd5,12|19|0x91b3eb", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xa8527f, "-2|18|0xaa5888,17|15|0xae72b0", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xbdad0b, "0|26|0xb79b07", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x69c4d3, "49|-5|0x356167", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x6bc7d2, "45|-2|0x33696f", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x73c5d4, "49|-2|0x356369", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xb16290, "2|22|0xa4628b", 90, 169, 75, 1052, 162)
                useBagThings()
            end
            isZhengLi = true
            writeJson("整理", isZhengLi)
        else

            -- if isColorPlus(137, 105, 0x9e1111, 95) then -- 资源
            --     tap1(83, 129, 0x5c6571)
            -- end
            -- if isColorPlus(137, 169, 0x9e1111, 95) then -- 加速
            --     tap1(83, 191, 0x5c6571)
            -- end
            -- if isColorPlus(137, 233, 0x9e1111, 95) then -- 战争
            --     tap1(83, 258, 0x5c6571)
            -- end
            -- if isColorPlus(137, 297, 0x9e1111, 95) then -- 材料
            --     tap1(83, 325, 0x5c6571)
            -- end
            -- if isColorPlus(137, 361, 0x9e1111, 95) then -- 装备
            --     tap1(83, 383, 0x5c6571)
            -- end
            -- if isColorPlus(137, 425, 0x9e1111, 95) then -- 其它
            --     tap1(83, 449, 0x5c6571)
            -- end
            tap1(20, 20, 449, 0x5c6571)
        end
    end
    if isColor(4, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and isColor(1001, 25, 0x0d9098, 95) then
        debugA("邮件界面")
        x, y = findMultiColorInRegionFuzzy(0x931012, "-1|0|0x1c2c40", 90, 112, 98, 115, 491)
        if x ~= -1 then
            tap1(x, y)
            mSleep(1000)
            tap1(1054, 23, 0x0d9198)
        else
            tap1(1017, 25)
            mSleep(1000)
            tap1(6, 23)
        end
        -- end
    end

    if isColor(91, 156, 0xff6600, 95) and isColor(272, 156, 0x863f13, 95) then
        debugA("任务界面")
        if muBiaoA == mb_Reward then
            tap1(354, 135, 0xb0b0b0) -- 每日任务
        else
            if haoLV <= 2 and muBiaoA == mb_ZhuXian then
                if isColor(957, 226, 0xfaba00, 95) then -- 宝箱
                    tap1(985, 213)
                elseif isColor(288, 502, 0xf18e07, 95) then -- 支线已完
                    tap1(282, 502)
                elseif isColor(115, 513, 0xf18e07, 95) then -- 主线已完
                    tap1(115, 513)
                elseif isColor(138, 347, 0x65ee01, 95) and isColor(156, 340, 0x61f001, 95) and
                    isColor(183, 329, 0x52f001, 95) and isColor(115, 507, 0x116eb9, 95) then
                    debugA("升级任务")
                    timeShengJiTongXingZheng = nowTime
                    tap1(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        tap1(38, 492) -- 工具
                    end
                elseif isColor(163, 353, 0x2c507f, 95) and isColor(152, 324, 0xb9ced4, 95) and
                    isColor(129, 511, 0x116eb9, 95) then
                    debugA("使用100艘战舰")
                    if nowTime - timeZhengLi >= 5 * 60 then
                        tap1(511, 572, 0x0c0c0e) -- 关闭
                        mSleep(1000)
                        tap1(968, 580, 0xa95a2a) --背包
                        mSleep(1000)
                        isZhengLi = false
                        writeJson("整理", isZhengLi)
                        timeZhengLi = nowTime
                    else
                        tap1(170, 510, 0x4784b8) -- 移动
                        if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                            tap1(38, 492) -- 工具
                        end
                    end
                elseif isColor(198, 336, 0xbfffd8, 95) and isColor(197, 364, 0x9dffc3, 95) and
                    isColor(114, 511, 0x116eb9, 95) then
                    debugA("拥有一名舰长")
                    tap1(511, 572, 0x0c0c0e) -- 关闭
                    tap1(782, 583, 0xf8efd1) -- 舰长
                    isKaZhuXianJianZhang = true
                elseif isColor(191, 366, 0x08507e, 95) and isColor(191, 345, 0x16c3d2, 95) and
                    isColor(114, 511, 0x116eb9, 95) then
                    debugA("生产20战舰")
                    isKaShengChan = true
                    tap1(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        tap1(38, 492) -- 工具
                    end
                elseif isColor(197, 336, 0xffe3bf, 95) and isColor(197, 367, 0xffd39b, 95) and
                    isColor(182, 366, 0xffe59f, 95) and
                    isColor(223, 501, 0x116eb9, 95) then
                    debugA("提升1次舰长星级")
                    gaiMuBiaoNewA(1, mb_WaKuang)
                    tap1(511, 572, 0x0c0c0e) -- 关闭
                    RGB_NoticeBJ = "FFFF00"
                    RGB_NoticeFont = "FF0000"
                    strNotice = "升星"
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                    mSleep(500)
                elseif isColor(185, 333, 0x33ece3, 95) and isColor(119, 506, 0x116eb9, 95) then
                    debugA("研究任务")
                    tap1(170, 510, 0x4784b8) -- 移动
                    isYanJiuZiYuan = true
                    writeJson("研究资源", isYanJiuZiYuan)
                    isYanJiuKaiFa = true
                    writeJson("研究开发", isYanJiuKaiFa)
                    isYanJiuFangYu = true
                    writeJson("研究防御", isYanJiuFangYu)
                    isYanJiuShengChan = true
                    writeJson("研究生产", isYanJiuShengChan)
                    isYanJiuJingRui = true
                    writeJson("研究精锐", isYanJiuJingRui)
                    isYanJiuZhanJian = true
                    writeJson("研究战舰", isYanJiuZhanJian)
                    isYanJiu = true
                    writeJson("研究", isYanJiu)
                elseif isColor(178, 340, 0x5da9db, 95) and isColor(121, 509, 0x116eb9, 95) then
                    debugA("海盗任务")
                    if nowTime - timeZhengLi >= 5 * 60 then
                        tap1(511, 572, 0x0c0c0e) -- 关闭
                        mSleep(1000)
                        tap1(968, 580, 0xa95a2a) --背包
                        mSleep(1000)
                        isZhengLi = false
                        writeJson("整理", isZhengLi)
                        timeZhengLi = nowTime
                    else
                        tap1(170, 510, 0x4784b8) -- 移动
                        if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                            tap1(38, 492) -- 工具
                        end
                    end
                elseif isColor(148, 340, 0x1b87df, 95) and isColor(189, 341, 0x0c67b0, 95) and
                    isColor(124, 507, 0x116eb9, 95) then
                    debugA("卡主线--建资源")
                    gaiMuBiaoNewA(1, mb_WaKuang)
                    tap1(511, 572, 0x0c0c0e) -- 关闭
                    RGB_NoticeBJ = "FFFF00"
                    RGB_NoticeFont = "FF0000"
                    strNotice = "资源"
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                    mSleep(500)
                else
                    tap1(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        tap1(38, 492) -- 工具
                    end
                end
            elseif isColor(433, 111, 0x9d1111, 95) then -- 每日任务--红点
                tap1(354, 135, 0xb0b0b0)
            elseif isColor(957, 226, 0xfaba00, 95) then -- 宝箱
                tap1(985, 213)
            else
                tap1(23, 29)
            end
        end
    end
    if isColor(272, 156, 0xff6600, 95) and isColor(267, 156, 0x843c10, 95) then
        debugA("每日任务界面")
        if muBiaoA == mb_Reward then
            if isColor(124, 507, 0xf18e07, 95) then
                tap1(124, 507)
            elseif isColor(299, 197, 0xc5f3f9, 95) then
                tap1(299, 197)
            elseif isColor(482, 197, 0x8cfbfc, 95) then
                tap1(482, 197, 0x8cfbfc)
            elseif isColor(672, 197, 0xc4f3f9, 95) then
                tap1(672, 197, 0xc4f3f9)
            elseif isColor(859, 197, 0xb8f9f7, 95) then
                tap1(859, 197, 0xb8f9f7)
            elseif isColor(1045, 197, 0xb8f9f7, 95) then
                tap1(1045, 197)
                mSleep(2000)
            else
                tap1(513, 574)
                gaiMuBiaoNewA(1, mb_WaKuang, mm_WaKuang)
                gaiMuBiaoNewA(2, "", mm_Wu)
            end
        else

            -- if isColor(433, 111, 0x9d1111, 95) then -- 每日任务--红点
            --     tap1(354, 135, 0xb0b0b0)
            -- else
            tap1(23, 29)
            -- end
        end
    end
    if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and isColor(311, 142, 0x0b4992, 95) then
        debugA("获得道具")
        tap1(510, 549, 0x0c0c0e)
    end
    if multiColor({ { 287, 611, 0x4eabf0 }, { 844, 451, 0xff8a00 } }) then
        debugA("对话框1")
        tap1(567, 540)
    end
    if multiColor({ { 286, 611, 0x4aa9f1 }, { 846, 449, 0xde8116 } }) then
        tap1(567, 540)
        debugA("对话框2")
    end

    if haoLV == 1 then
        -- if isColor(278, 283, 0x03f003, 95) and isColor(337, 287, 0x02ff00, 95) then
        --     debug("任务1已完成")
        --     tap1(278, 283)
        -- end
        -- if isColor(278, 352, 0x02ff00, 95) and isColor(337, 354, 0x02ff00, 95) then
        --     debug("任务2已完成")
        --     tap1(278, 352)
        -- end
        if isColor(109, 501, 0xf09006, 95) and isColor(228, 523, 0xf87808, 95) and isColor(984, 495, 0x106fb9, 95) and
            isColor(967, 494, 0x153557, 85) then
            debugA("指引--任务--领取")
            tap1(109, 501)
        end
    end
end

-- 综合--多点
function zongHe_Mult(...)
    if haoLV == 3 then
        return false
    end
    x, y = findMultiColorInRegionFuzzy(0xffde8c, "-43|-3|0xbd834d,-1|-44|0xc68852", 90, 0, 0, 1136, 640, {
        orient = 5
    })
    if x ~= -1 then
        -- 右下
        debugA("右下")
        tap1(x + 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdd85, "-1|-33|0xcfad66,-33|1|0xcc9856", 90, 0, 0, 1136, 640, {
        orient = 5
    })
    if x ~= -1 then
        debugA("右下2")
        tap1(x + 20, y + 20)
        return true

    end
    x, y = findMultiColorInRegionFuzzy(0xffdc83, "2|-41|0xe8b07c,40|-3|0xbe8e63", 90, 0, 0, 1136, 640, {
        orient = 8
    })
    if x ~= -1 then
        -- 左下
        debugA("左下")
        tap1(x - 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc87, "1|-36|0xc18349,41|0|0xc68551", 90, 0, 0, 1136, 640, {
        orient = 8
    })
    if x ~= -1 then
        -- 左下
        debugA("左下2")
        tap1(x - 20, y + 20)
        return true
    end
    -- x, y = findMultiColorInRegionFuzzy(0xffdc87, "-24|0|0xecb46c,0|22|0xe8b671", 90, 0, 0, 1136, 640, {
    --     orient = 2
    -- })
    -- if x ~= -1 then
    --     -- 右上
    --     debug("右上")
    --     tap1(x + 20, y - 20)
    --     return true
    -- end
    x, y = findMultiColorInRegionFuzzy(0xffde8b, "3|41|0xc38f60,36|2|0xc4a174", 90, 0, 0, 1136, 640, {
        orient = 1
    })
    if x ~= -1 then
        -- 左上
        debugA("左上")
        tap1(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc86, "1|44|0xb6855c,43|1|0xb27c4d", 90, 0, 0, 1135, 639, {
        orient = 1
    })
    if x ~= -1 then
        -- 左上
        debugA("左上2")
        tap1(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffde88, "-44|3|0xb98454,-4|44|0xb88456", 90, 0, 0, 1135, 639, {
        orient = 4
    })
    if x ~= -1 then
        debugA("右上")
        tap1(x + 20, y - 20)
        return true
    end
    return false
end

-- 综合--屏幕乱点
function zongHe_Screen()
    if isColor(18, 24, 0xafafaf, 95) and isColor(7, 24, 0xaf4600, 95) then
        screenClick(18, 24, 0xafafaf)
    end
end

-- 研究队列
function numYanJiu()
    if isYanJiuZiYuan == true then
        numZiYuan = numZiYuan + 1
        if numZiYuan == 8 then
            isYanJiuZiYuan = false
            writeJson("研究资源", isYanJiuZiYuan)
        end
    elseif isYanJiuKaiFa == true then
        numKaiFa = numKaiFa + 1
        if numKaiFa == 8 then
            isYanJiuKaiFa = false
            writeJson("研究开发", isYanJiuKaiFa)
        end
    elseif isYanJiuFangYu == true then
        numFangYu = numFangYu + 1
        if numFangYu == 10 then
            isYanJiuFangYu = false
            writeJson("研究防御", isYanJiuFangYu)
        end
    elseif isYanJiuShengChan == true then
        numShengChan = numShengChan + 1
        if numShengChan == 9 then
            isYanJiuShengChan = false
            writeJson("研究生产", isYanJiuShengChan)
        end
    elseif isYanJiuJingRui == true then
        numJingRui = numJingRui + 1
        if numJingRui == 8 then
            isYanJiuJingRui = false
            writeJson("研究精锐", isYanJiuJingRui)
        end
    elseif isYanJiuZhanJian == true then
        numZhanJian = numZhanJian + 1
        if numZhanJian == 9 then
            isYanJiuZhanJian = false
            writeJson("研究战舰", isYanJiuZhanJian)
            isYanJiu = false
            writeJson("研究", isYanJiu)
        end
    end
end

-- 使用背包道具
function useBagThings()
    if x ~= -1 then
        tap1(x, y)
        mSleep(1000)
        if isColor(518, 498, 0x1c6eba, 95) then
            tap1(518, 498)
            mSleep(1000)
        elseif isColor(513, 458, 0x1c6eb9, 95) then
            tap1(513, 458)
            mSleep(1000)
        end
        mSleep(1000)
        if isColor(511, 542, 0x40658d, 95) then
            tap1(511, 542)
        end
        if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and isColor(311, 142, 0x0b4992, 95) then
            debugA("获得道具")
            tap1(510, 549, 0x0c0c0e)
        end
    end
end

-- 检查红点
function checkRed1()
    -- ocrNumbers()
    if haoLV == 3 then
        -- snapshot("lizi.jpg", 956, 16, 1016, 29, 0.5); -- 使用 jpg 格式截图，并设置图片质量为 0.5
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
        mSleep(500)
    end
    OCR_num()
    if isColor(1104, 130, 0x369469, 95) == false and isColor(1129, 102, 0x9e1111, 95) then
        debugA("验证码--红点")
        tap1(1096, 137, 0x191d1b)
        return true
    elseif isColor(1050, 106, 0x9e1111, 95) and isColor(1033, 115, 0x3f9fd8, 95) then
        debugA("验证码--红点")
        tap1(1033, 137)
        return true
    elseif isColor(448, 78, 0x33d6ff, 95) or isColor(448, 78, 0x814d27, 95) then
        debugA("收资源1")
        tap1(448, 78)
        return true
    elseif isColor(385, 129, 0x2ed4fc, 95) or isColor(386, 129, 0xffeb64, 95) then
        debugA("收资源2")
        tap1(385, 129)
        return true
    elseif isColor(266, 171, 0x28cdf2, 95) then
        debugA("收资源3")
        tap1(266, 171)
        return true
    elseif isColor(175, 238, 0x25c9eb, 95) then
        debugA("收资源4")
        tap1(175, 238)
        return true
    elseif isColor(20, 297, 0x24c8e9, 95) or isColor(20, 295, 0x703a0d, 95) or isColor(21, 297, 0xffdf51, 95) then
        debugA("收资源5")
        tap1(20, 297)
        return true
    elseif isEatEXP == false and haoLV >= 2 then
        debugA("吃经验")
        tap1(20, 20)
        mSleep(1000)
        tap1(615, 198, 0x497aac) -- 加号
        mSleep(1000)
        if isColor(473, 529, 0xd68b01, 95) then -- 全部使用
            tap1(473, 529)
        end
        if isColor(487, 431, 0x1c6eb9, 95) then -- 确定
            tap1(487, 431)
        end
        -- tap1(20, 20)
        isEatEXP = true
        writeJson("吃经验", isEatEXP)  
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and nowTime - timeJiKu >=60 * 60 * 1  and haoLV >= 2 then
        debugA("机库")
        tap1(783,137,0xff2a58  )
        timeJiKu = nowTime
        isJiKu = true
        return true
    elseif isColor(844, 379, 0xffffff, 95) and isColor(857, 380, 0xffffff, 95) then
        debugA("档案")
        tap1(844, 379, 0xffffff)
        return true
    elseif isZhengLi == false and haoLV >= 2 then
        debugA("整理")
        tap1(967, 586, 0x2d2f2b)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numAddChanLiang == 0 and haoLV >= 2 then
        debugA("准备增产1")
        tap1(449, 105, 0x28171d)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numAddChanLiang == 1 and haoLV >= 2 then
        debugA("准备增产2")
        tap1(387, 153, 0x203d5a)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numAddChanLiang == 2 and haoLV >= 2 then
        debugA("准备增产3")
        tap1(37, 321, 0x257700)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isAddChanLiangLiZi == false and haoLV >= 2 and
        check16 == "vip8" then
        debugA("准备粒子增产")
        tap1(183, 259, 0x40414d)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isTrade == false and haoLV >= 2 then
        debugA("准备交易行")
        tap1(320, 468, 0x6e1313)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isCheckLiZiNum == false and haoLV >= 3 then
        debugA("准备交易行--检查粒子数量")
        tap1(320, 468, 0x6e1313)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numGuangGao <= 9 and haoLV >= 2 then
        debugA("看广告")
        tap1(809, 221, 0x7aa0d8)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numChuanShu <= 4 and haoLV >= 2 then
        debugA("点传输")
        tap1(623, 497, 0xffd4a1)
        return true
    elseif isColor(233, 100, 0x9e1111, 95) and isColor(210, 108, 0x6de4e9, 95) and nowTime - timeJiDi >= 10 * 60 then
        debugA("基地现况--红点")
        tap1(209, 111, 0x61d5e9)
        return true

    elseif isColor(295, 9, 0x9d1111, 95) and isColor(310, 24, 0x9d1111, 95) then
        debugA("VIP--红点")
        tap1(285, 42, 0x68401a)
        return true
    elseif isColor(75, 213, 0x961112, 95) and isColor(90, 228, 0x9d1111, 95) and haoLV == 1 then
        debugA("任务红点")
        if isColor(278, 286, 0x02ff00, 95) then -- 任务1完成
            tap1(278, 286)
            return true
        elseif isColor(278, 351, 0x02ff00, 95) then -- 任务2完成
            tap1(278, 351)
            return true
        elseif isColor(278, 414, 0x03f003, 95) then -- 任务3完成
            tap1(278, 414)
            return true
        else
            tap1(49, 187)
            return true
        end
    elseif isColor(728, 548, 0x9e1111, 95) then -- 邮件红点
        -- elseif isColor(728, 548, 0x9e1111, 95) and haoLV == 1 then -- 邮件红点
        tap1(693, 587)
        return true
        -- elseif isColorPlus(999, 548, 0x9e1111, 95) then -- 背包红点
        --     tap1(966, 589, 0x434641)
        -- return true
    elseif isColor(902, 541, 0x9d1111, 95) and nowTime - timeLianMeng >= 60 * 60 * 2 then -- 联盟红点
        timeLianMeng = nowTime
        tap1(869, 582)
        return true
    elseif isColor(712, 43, 0x9d1111, 95) and isColor(643, 74, 0x7b5aa3, 95) then
        debugA("联盟帮忙红点")
        tap1(662, 68)
        -- elseif isColorPlus(902,541,0x9d1111,95) then
        --     debug("联盟红点")
        --     tap1(881,594    )
        return true
    elseif isColor(1124, 51, 0x9e1111, 95) and nowTime - timeRed >= 15 * 60 then -- 右上角红点
        debugA("右上角红点")
        tap1(1106, 71, 0x111e2e)
        -- if isColor(730, 106, 0x9d1111, 95) and bRedOut1 == false then -- 1-1红点
        --     tap1(684, 182, 0x445569)
        -- elseif isColor(993, 115, 0x9e1111, 95) and haoLV < 3 then -- 1-3 红点
        --     tap1(937, 187, 0x263649)
        -- elseif isColor(858, 247, 0x9d1111, 95) then -- 2-2红点
        --     tap1(816, 321, 0x1e2635)
        --     -- elseif isColor(993, 254, 0x9d1111, 95) then -- 2-3红点
        --     --     tap1(946, 299, 0x182738)
        -- elseif isColor(730, 396, 0x931012, 95) then --3-1红点
        --     tap1(676, 473, 0x202f3e)
        -- elseif isColor(1114, 262, 0x9d1111, 95) then --2-4红点
        --     tap1(1070, 321, 0x546272)
        -- elseif isColor(858, 106, 0x9d1111, 95) and check22 == "活动" then -- 1-2红点
        --     tap1(810, 169, 0x1c2b3d)
        -- elseif isColor(1120, 115, 0x9e1111, 95) then -- 1-4红点
        --     tap1(1068, 182)
        -- elseif isColor(730, 247, 0x9d1111, 95) then -- 2-1红点
        --     tap1(737, 254)
        -- elseif isColor(858, 106, 0x9d1111, 95) and check22 ~= "活动" then -- 1-2红点
        --     -- tap1(810, 169, 0x1c2b3d)
        --     timeRed = nowTime
        -- end
        if isColor(730, 106, 0x9d1111, 95) and bRedOut1 == false then -- 1-1红点
            tap1(684, 182, 0x445569)
            numRed = 1
        elseif isColor(858, 106, 0x9d1111, 95) and bRedOut2 == false then -- 1-2红点
            tap1(810, 169, 0x1c2b3d)
            numRed = 2
        elseif isColor(993, 115, 0x9e1111, 95) and bRedOut3 == false then -- 1-3 红点
            tap1(937, 187, 0x263649)
            numRed = 3
        elseif isColor(1120, 115, 0x9e1111, 95) and bRedOut4 == false then -- 1-4红点
            tap1(1068, 182)
            numRed = 4
        elseif isColor(730, 247, 0x9d1111, 95) and bRedOut5 == false then -- 2-1红点
            tap1(737, 254)
            numRed = 5
        elseif isColor(858, 247, 0x9d1111, 95) and bRedOut6 == false then -- 2-2红点
            numRed = 6
            tap1(816, 321, 0x1e2635)
        elseif isColor(993, 254, 0x9d1111, 95) and bRedOut7 == false then -- 2-3红点
            numRed = 7
            tap1(946, 299, 0x182738)
        elseif isColor(1114, 262, 0x9d1111, 95) and bRedOut8 == false then --2-4红点
            numRed = 8
            tap1(1070, 321, 0x546272)
        elseif isColor(730, 396, 0x931012, 95) and bRedOut9 == false then --3-1红点
            numRed = 9
            tap1(676, 473, 0x202f3e)
        else
            tap1(1106, 71, 0x111e2e)
            timeRed = nowTime
            numRed = 0
            bRedOut1 = false
            bRedOut2 = false
            bRedOut3 = false
            bRedOut4 = false
            bRedOut5 = false
            bRedOut6 = false
            bRedOut7 = false
            bRedOut8 = false
            bRedOut9 = false
        end
        return true
    elseif check22 == "活动" and isColor(825, 43, 0x9d1111, 95) then
        tap1(785, 73)
        return true
    else
        return false
    end

end

--红点判断
function redJudge()
    if numRed == 1 then
        bRedOut1 = true
    elseif numRed == 2 then
        bRedOut2 = true
    elseif numRed == 3 then
        bRedOut3 = true
    elseif numRed == 4 then
        bRedOut4 = true
    elseif numRed == 5 then
        bRedOut5 = true
    elseif numRed == 6 then
        bRedOut6 = true
    elseif numRed == 7 then
        bRedOut7 = true
    elseif numRed == 8 then
        bRedOut8 = true
    elseif numRed == 9 then
        bRedOut9 = true
    end
end

-- 执行目标
function doTarget()
    if numXiangMu ~= 1 and numXiangMu ~= 0 then
        return
    end
    -- if muBiao == mb_GuaJi then
    if muBiaoA == "" then
        if haoLV <= 2 then
            gaiMuBiaoNewA(1, mb_YouHua, mm_YouHua)
        elseif haoLV == 3 then
            gaiMuBiaoNewA(1, mb_EveryDay, mm_EveryDay)
        end
    elseif string.find(muBiaoA, "战备") then
        warReady()
    elseif muBiaoA == mb_YouHua then
        task_JiDi()
    elseif muBiaoA == mb_ZhuXian then
        task()
        zhuXian()
    elseif muBiaoA == mb_WaKuang then
        waKuang()
    elseif muBiaoA == mb_ChuHang then
        chuHang()
    elseif muBiaoA == mb_FixShip then
        fixShip()
    elseif muBiaoA == "开区检测" then
        openCheck()
    elseif muBiaoA == "钱包检测" then
        walletWatch()
    elseif muBiaoA == "登录钱包" then
        loginWallte()
    elseif muBiaoA == "章节" then
        task_Lesson()
    elseif muBiaoA1 == mb_EveryDay then
        everyDayTask()
    elseif muBiaoA1 == mb_ShengChan then
        gaiMuBiaoNewA(1, "", mm_Wu)
    end
end

-- 章节任务
function task_Lesson()
    if inside1() == true then
        mSleep(1000)
        tap1(1074, 582) -- 出基地
    end
    if outside() then
        mSleep(1000)
        if isZhengLi == true then
            tap1(1103, 68, 0x0d1828) -- 展开右上角
            if isColor(790, 276, 0xc7d4e1, 95) then
                tap1(811, 317, 0x192838) -- 章节
            else
                tap1(672, 310, 0x223141)
            end
            isZhengLi = false
        else
            tap1(965, 586, 0x373c37) -- 背包
        end
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) then
        debugA("搜索界面--章节")
        if isColor(519, 437, 0x116eb9, 95) then -- 矿
            tap1(519, 437)
        elseif isColor(661, 435, 0x116eb9, 95) then -- 金属
            tap1(661, 435)
        elseif isColor(803, 432, 0x116eb9, 95) then -- 三氯气
            tap1(803, 432)
        elseif isColor(236, 430, 0x116eb9, 95) then -- 海盗
            tap1(236, 430)
        elseif isColor(375, 435, 0x116eb9, 95) then -- 精英
            tap1(375, 435)
        end
    end
end

-- 钱包检测
function walletWatch()
    if nowTime - timeWalletWatch >= 10 * 60 then
        debugA("钱包检测10分钟一次")
        runApp(appWallet)
        mSleep(1000)
        while true do
            if isColor(1066, 78, 0xb2b2b2, 95) then -- 钱包齿轮
                gaiMuBiaoNewA(3, "兑换粒子")
                return true
            elseif isColor(999, 139, 0x00bc0d, 95) then -- 微信图标
                gaiMuBiaoNewA(3, "登录钱包")
                return false
            end
            mSleep(1000)
        end
    end
end

-- 登录钱包
function loginWallte()
    if isColor(828, 529, 0x3b5998, 95) and isColor(940, 530, 0x00bc0d, 95) then
        debugA("钱包登录界面")
        ShadowrocketToConfigure() -- 切换至配置
        runApp(appWallet)
        mSleep(1000)
        tap1(741, 346, 0xffffff) -- google
        mSleep(1000)
        tap1(671, 193, 0x1182fe) -- 继续
        repeat
            mSleep(1000)
        until isColor(219, 595, 0xea4335, 95) and isColor(229, 591, 0x4285f4, 95) and isColor(239, 593, 0x34a853, 95) and
            isColor(187, 639, 0x007aff, 95) == false -- 选择账号
        tap1(563, 432, 0xffffff)
        for i = 1, 30, 1 do
            if isColor(1066, 78, 0xb2b2b2, 95) then -- 钱包齿轮
                gaiMuBiaoNewA(3, "兑换粒子")
                runApp(appXiangMu)
                mSleep(1000)
                break
            end
            if isColor(477, 447, 0xa6a6a6, 95) and isColor(697, 293, 0x949494, 95) and isColor(477, 442, 0x000000, 95) then
                debugA("Error")
                closeApp(appWallet)
                gaiMuBiaoNewA(3, "钱包检测")
                runApp(appWallet)
                mSleep(1000)
                timeWalletWatch = nowTime - 10 * 60 -- 钱包检测
                break
            end
            if isColor(122, 605, 0x007aff, 95) and isColor(1092, 589, 0xcccccc, 95) and
                isColor(142, 490, 0x000000, 95) ==
                false then
                debugA("登录失败-取消")
                tap1(122, 605)
                break
            end
            mSleep(1000)
        end
    end
end

-- Shadowrocket 切换至配置
function ShadowrocketToConfigure()
    runApp(appShadowrocket)
    repeat
        mSleep(1000)
    until isColor(1096, 569, 0x2473bd, 95) and isColor(1096, 581, 0xf5f5f5, 95) -- 首页
    tap1(293, 116, 0x8a8a8a) -- 全局路由
    mSleep(1000)
    tap1(465, 378, 0xffffff) -- 配置
    mSleep(1000)
    for i = 1, 30, 1 do
        if isColor(206, 131, 0xffffff, 95) then --未连接
            tap1(206, 131)
        end
        webdata = httpGet("https://www.google.com.hk/") -- 获取百度首页网页数据
        if webdata and webdata ~= "" then
            break
        end
        if i == 30 then
            toast("翻墙失败")
        end
        mSleep(1000)
    end
end

-- Shadowrocket 切换至场景
function ShadowrocketToScenes()
    runApp(appShadowrocket)
    repeat
        mSleep(1000)
    until isColor(1096, 569, 0x2473bd, 95) and isColor(1096, 581, 0xf5f5f5, 95) -- 首页
    tap1(293, 116, 0x8a8a8a) -- 全局路由
    mSleep(1000)
    tap1(721, 474, 0xffffff) -- 场景
    mSleep(1000)
    for i = 1, 30, 1 do
        if isColor(206, 131, 0xffffff, 95) then --未连接
            tap1(206, 131)
        end
        webdata = httpGet("https://www.baidu.com/") -- 获取百度首页网页数据
        if webdata and webdata ~= "" then
            break
        end
        if i == 30 then
            toast("境内失败")
        end
        mSleep(1000)
    end
end

-- 播放音频
function playMusic()
    setVolumeLevel(1)
    local file = userPath() .. "/res/Lapislazuli.mp3"
    local bool = isFileExist(file)
    if bool == false then
        local http_mp3 = "https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars/Lapislazuli.mp3"
        for i = 1, 10, 1 do
            if isPause == true then
                return
            end
            local code, msg = ts.tsDownload(file, http_mp3, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            if code == 200 then
                debugA("下载成功：" .. msg)
                break
            else
                debugA("下载失败：" .. msg)
            end
        end
    end
    for i = 1, 10, 1 do
        for j = 1, 5, 1 do
            vibrator(); -- 振动
            mSleep(1000);
        end
        -- mp3 文件已存放在 res 文件夹下直接写文件名称即可
        playAudio("Lapislazuli.mp3")
        mSleep(1000 * 60 * 5)
        -- iOS 停止播放
        playAudio("")
    end
end

--震动提醒
function vibratorNotice()
    if nowDateTime.hour >= 8 then
        for j = 1, 5, 1 do
            vibrator(); -- 振动
            mSleep(1000);
        end
    end
end

-- 开区检测
function openCheck()

    if isColor(62, 42, 0x215da6, 95) and isColor(62, 47, 0x0b58b2, 95) and nowDateTime.hour >= 8 then
        timeXXX = nowTime
        debugA("选择宇宙")
        for i = 1, 7, 1 do
            if isPause == true then
                return
            end
            tap1(205, 147 + 60 * (i - 1), 0x8a6315)
            mSleep(1000)
            if isColor(595, 189, 0x780b12, 95) == false and isColor(595, 182, 0x3a65ab, 95) then
                tap1(595, 189)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 283, 0x780b12, 95) == false and isColor(595, 276, 0x3965ac, 95) then
                tap1(595, 283)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 377, 0x780b12, 95) == false and isColor(595, 370, 0x3965ac, 95) then
                tap1(595, 377)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 472, 0x780b12, 95) == false and isColor(595, 464, 0x3965ac, 95) then
                tap1(595, 472)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 189, 0x780b12, 95) == false and isColor(966, 182, 0x3965ac, 95) then
                tap1(966, 189)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 283, 0x780b12, 95) == false and isColor(966, 276, 0x3965ac, 95) then
                tap1(966, 283)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 377, 0x780b12, 95) == false and isColor(966, 370, 0x3965ac, 95) then
                tap1(966, 377)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 472, 0x780b12, 95) == false and isColor(966, 464, 0x3965ac, 95) then
                tap1(966, 472)
                playMusic()
                dialog("开区了")
            end
        end
        if nowTime - timeOpen >= 60 * 60 * 3 then
            closeApp(appXiangMu)
            mSleep(3000)
            runApp(appXiangMu)
            timeOpen = nowTime
            return
        end
    end
end

-- 修船
function fixShip()
    if inside1() then
        if isColor(528, 253, 0x37664f, 95) then
            debugA("进航母")
            tap1(1057, 215, 0x86929d)
        else
            tap1(1074, 582) -- 出基地
        end
    end
    if outside() then
        debugA("回基地--修船")
        tap1(1074, 582) -- 回基地
        isShipBad = true
    end
end

-- 日常
function everyDayTask()
    if muBiaoA2 == "" then
        gaiMuBiaoNewA(2, mb_5DaoJu, mm_5DaoJu)
    end
    if muBiaoA == mb_5DaoJu then
        openBag()
    elseif muBiaoA == "道具合成" then
        openBag()
    elseif muBiaoA == mb_CaiJi then
        task_CaiJi()
    elseif muBiaoA == mb_Reward then
        task_Reward()
    elseif muBiaoA == mb_JiNeng then
        task_JiNeng()
    end
    if outside() then
        debugA("回基地--日常")
        tap1(1074, 582) -- 回基地
        chongZhiJiDiXianKuang()
    end
end

-- 任务--主动技能
function task_JiNeng()
    if inside1() then
        debugA("主动技能")
        tap1(905, 73, 0x091423) --主动技能
        if isColor(960, 185, 0x835523, 95) and isColor(1119, 186, 0x835523, 95) then
            debugA("技能目录")
            x, y = findMultiColorInRegionFuzzy(0x375297, "14|-4|0x7c5758,14|10|0xa48e9d", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0xc7af1f, "-7|32|0x111515,5|14|0x72303f", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0x5d9cb7, "6|25|0x15497f,25|0|0x151b20", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0x09baff, "13|-33|0x6796a7,26|-18|0xffff52", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end
            tap1(1105, 72, 0x0b1625)
            gaiMuBiaoNewA(2, mb_Reward, mm_Reward)
        end
    end

end

-- 只做基地
function task_JiDi()
    if inside1() then
        if isColor(528, 253, 0x37664f, 95) then -- 基地归位
            tap1(583, 277, 0xffffff) -- 打开基地
        elseif isColor(17, 505, 0x3b6890, 95) then -- 1号建设中
            tap1(44, 493, 0x3e342f)
        elseif isColor(108, 505, 0x3b6890, 95) then -- 2号建设中
            tap1(133, 491, 0x52433d)
        else
            tap1(1074, 582) -- 出基地
        end
    end
    if outside() then
        debugA("回基地--只做基地")
        tap1(1074, 582) -- 回基地
        chongZhiJiDiXianKuang()
    end
end

-- 收获
function task_Reward()
    if inside1() then
        debugA("收获")
        tap1(45, 188, 0x060f0f)
    end
end

-- 采集任务
function task_CaiJi()
    if inside1() then
        debugA("采集任务")
        tap1(1015, 71, 0x0d1a2c) -- 基地加成
    end
end

-- 打开背包
function openBag()
    if inside1() then
        debugA("打开背包")
        tap1(963, 591, 0x373b37)
    end
end

-- 定时检测
function timeJianCe()
    duiHuanJianCe()
    if isShengChan == false then
        if nowTime - timeShengChan >= 60 * 60 * 2 then
            isShengChan = true
            timeShengChan = nowTime
        end
        if check15 == "生产加速" then
            isShengChan = true
        end
    end
    if isChongDianKaZiYuan == true then
        if nowTime - timeChongDian >= 4 * 60 * 60 then
            timeChongDian = nowTime
            isChongDianKaZiYuan = false
        end
    end
    if isCheckLiZiNum == true then
        if nowTime - timeCheckLiZiNum >= 1 * 60 * 60 then
            timeCheckLiZiNum = nowTime
            isCheckLiZiNum = false
        end
    end
end

-- 5分钟不见某界面
function checkXXX(...)
    nowTime = os.time()
    if isColor(1020, 545, 0x744218, 95) and isColor(1123, 619, 0x744218, 95) then -- 有右下角的灰色块
        timeXXX = nowTime
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(59, 579, 0x00428c, 95) then -- 左上角有基地现况
        timeXXX = nowTime
    end
    if haoLV == 3 then
        if nowTime - timeXXX >= 5 * 60 then
            if getOut() then
                current_time = os.date("%m-%d_%H.%M", os.time());
                snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
                ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
                -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
                closeApp(appXiangMu)
                nowTime = os.time()
                timeXXX = nowTime
                zhuXiaoNew()
                return
            end

            -- numDiaoXian = numDiaoXian + 1
            -- writeJson( "numDiaoXian", numDiaoXian)
            -- if numDiaoXian >= 6 then
            --     numDiaoXian = 0
            --     writeJson( "numDiaoXian", numDiaoXian)
            --     numDiaoXianDengDai = numDiaoXianDengDai + 1
            --     writeJson( "numDiaoXianDengDai", numDiaoXianDengDai)
            --     -- dialog("掉线6次,等一小时",60*60)
            -- end

        end
    else
        if nowTime - timeXXX >= 10 * 60 then
            if getOut() then
                current_time = os.date("%m-%d_%H.%M", os.time());
                snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
                ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
                -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
                closeApp(appXiangMu)
                nowTime = os.time()
                timeXXX = nowTime
                zhuXiaoNew()
                return
            end
        end
    end
end

-- 任务
function task()
    if inside1() == true then
        -- mSleep(1000)
        if checkRed1() == false then
            if haoLV == 1 then
                -- 主任务
                debugA("主任务")
                -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and haoLV <= 2 then
                --     debug("展开任务栏")
                --     tap1(107, 213)
                -- end
                tap1(47, 187, 0x042121) -- 打开任务栏
                mSleep(1000)
                for i = 1, 10, 1 do
                    if isColor(91, 155, 0xff6600, 95) then
                        break
                    end
                    mSleep(1000)
                end
                return
            end
            if haoLV == 3 then
                gaiMuBiaoNewA(1, mb_WaKuang, mm_WaKuang)
                return
            end
            if haoLV == 2 then
                if isKaYouHua == false then
                    gaiMuBiaoNewA(1, mb_YouHua, mm_YouHua)
                else
                    debugA("卡优化,做主任务")
                    -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and haoLV <= 2 then
                    --     debug("展开任务栏")
                    --     tap1(107, 213)
                    -- end
                    tap1(47, 187, 0x042121) -- 打开任务栏
                    mSleep(1000)
                    for i = 1, 10, 1 do
                        if isColor(91, 155, 0xff6600, 95) then
                            break
                        end
                        mSleep(1000)
                    end
                    return
                end
                return
            end
        end
    end
end

-- 重置基地现况
function chongZhiJiDiXianKuang()
    gaiMuBiaoNewA(3, "", mm_Wu)
    timeInside = nowTime

    numSearch = 0
    isLiZied = false -- 粒子
    isJustBack = true
    if check26 == "3级粒子"  then
        numSeachLiZi = 3 
    elseif check20 == "2级粒子"  then
        numSeachLiZi = 2  
    elseif check27 == "1级粒子"  then
        numSeachLiZi = 1
    end  
    -- numSearchLiZi = 0
    numSearchLiZiSecond = 20

    if isAgainReward22 == false then
        if nowDateTime.hour >= 22 and nowDateTime.min >= 0 then
            if muBiaoA == mb_WaKuang then
                gaiMuBiaoNewA(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiaoNewA(2, mb_Reward, mm_Reward)
                isAgainReward22 = true
                writeJson("再次收获22", isAgainReward22)

                numAddChanLiang = 0
                writeJson("增产", numAddChanLiang)

                isAddChanLiangLiZi = false
                writeJson("增产粒子", isAddChanLiangLiZi)
            end
        end
    end
    if isAgainReward6 == false then
        if nowDateTime.hour >= 6 and nowDateTime.min >= 0 then
            if muBiaoA == mb_WaKuang then
                gaiMuBiaoNewA(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiaoNewA(2, mb_Reward, mm_Reward)
                isAgainReward6 = true
                writeJson("再次收获6", isAgainReward6)
            end
        end
    end
    if haoLV == 2 then
        if muBiaoA == mb_WaKuang and nowTime - timeRound >= 1 * 60 * 60 then
            gaiMuBiaoNewA(1, mb_YouHua, mm_YouHua)
            timeRound = nowTime
        end
    end

end

-- 主线
function zhuXian()
    if outside() then
        mSleep(1000)
        -- if isColorPlus(121, 78, 0x3bc6e8, 95) then
        --     debug("有体力")
        --     if nowTime - timeKillPirate >= 10 * 60 then
        --         isKillPirate = true -- 杀海盗
        --         timeKillPirate = nowTime
        --     end
        -- else
        --     debug("无体力")
        --     isKillPirate = false -- 不杀海盗

        -- end
        if isColor(387, 372, 0xa43b40, 95) and isColor(501, 389, 0xa43b40, 95) and isColor(109, 371, 0x00ace4, 95) then
            debugA("粒子--左")
            numSearch = numSearch + 1
            tap1(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                isLiZied = true
                tap1(172, 525) -- 搜索
            end
        elseif isColor(919, 373, 0xa43b40, 95) and isColor(1028, 386, 0xa43b40, 95) and isColor(643, 371, 0x00ace4, 95) then
            debugA("粒子--右")
            numSearch = numSearch + 1
            tap1(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                isLiZied = true
                tap1(172, 525) -- 搜索
            end
        elseif isColor(497, 383, 0x00798c, 95) and isColor(116, 377, 0x00ace4, 95) then
            debugA("采集--左")
            numSearch = numSearch + 1
            tap1(407, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif isColor(639, 378, 0x00ace4, 95) and isColor(1027, 380, 0x00798c, 95) then
            debugA("采集--右")
            numSearch = numSearch + 1
            tap1(1027, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif numSearch >= 10 then
            debugA("回基地")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(1022, 457, 0xffa100, 95) then -- 4队出完
            debugA("4队出完")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        else
            tap1(1074, 582) -- 回基地
        end
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) then
        -- if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        debugA("搜索界面--主线")
        numSeach = numSeach + 1
        if isColor(519, 437, 0x116eb9, 95) then -- 矿
            tap1(519, 437)
        elseif isColor(661, 435, 0x116eb9, 95) then -- 金属
            tap1(661, 435)
        elseif isColor(803, 432, 0x116eb9, 95) then -- 三氯气
            tap1(803, 432)
            -- elseif isColor(878, 432, 0x116eb9, 95) then -- 新金属粒子
            -- tap1(878, 432)
        elseif isColor(236, 430, 0x116eb9, 95) then -- 海盗
            tap1(236, 430)
        elseif isColor(375, 435, 0x116eb9, 95) then -- 精英
            tap1(375, 435)
        elseif isColor(466, 437, 0x0d67b2, 95) then -- 矿--6
            tap1(466, 437)
        elseif isColor(593, 435, 0x116eb9, 95) then -- 金属
            tap1(593, 435)
        elseif isColor(733, 428, 0x116eb9, 95) then -- 三氯气
            tap1(733, 428)
        elseif isColor(878, 432, 0x116eb9, 95) then -- 新金属粒子
            tap1(878, 432)
        elseif isColor(170, 430, 0x116eb9, 95) then -- 海盗
            tap1(170, 430)
        elseif isColor(314, 429, 0x116eb9, 95) then -- 精英
            tap1(314, 429)
        end
    end
    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) then
        debugA("出航界面--主线")
        if isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debugA("无人物")
            tap1(20, 20)
        end
        if isColor(559, 122, 0x3e6b96, 95) and isColor(550, 127, 0xffffff, 95) == false then -- 航母
            tap1(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续
                if check13 == "抢粒子" then -- 抢
                    tap1(504, 432, 0x1c6eba) --确定
                else
                    tap1(510, 494, 0x0c0c0e) --关闭
                    tap1(20, 20)
                end
            end
            isLiZied = true -- 粒子
            -- timeLiZi = nowTime
        elseif (isColor(634, 157, 0x38b3c8, 95) and isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95)) then
            debugA("挖粒子,没航母,航母坏了")
            isShipBad = true
            isLiZied = true -- 粒子
            tap1(20, 20)
            mSleep(1000)
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
            gaiMuBiaoNewA(3, mb_FixShip, mm_FixShip)
        elseif isColor(634, 157, 0x102a43, 95) then -- 普通采集 无船可出
            tap1(20, 20)
            mSleep(1000)
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(634, 157, 0x38b3ca, 95) then -- 普通采集 有船可出
            tap1(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--否
                tap1(512, 496, 0x0c0c0e)
                tap1(20, 20)
            elseif isColor(848, 594, 0xd68b02, 95) then -- 出航失败
                tap1(20, 20)
            else
                numChuHang = numChuHang + 1 -- 出航编号
                if numChuHang >= 4 then
                    numChuHang = 1
                end
            end
        end
    end
end

--- 出航
function chuHang()
    if inside1() then
        tap1(1074, 582) -- 出基地
    end

    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) then
        debugA("出航界面--出航")
        if isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debugA("无人物")
            tap1(20, 20)
        end
        if isColor(559, 122, 0x3e6b96, 95) and isColor(550, 127, 0xffffff, 95) == false then -- 航母
            debugA("有航母")
            isFalseLiZi2 = false
            tap1(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            isLiZied = true -- 粒子


            numTodayDigLiZi = numTodayDigLiZi + 1
            numDigLiZi = numDigLiZi + 1
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续
                if check13 == "抢粒子" then -- 抢
                    tap1(504, 432, 0x1c6eba) --确定
                else
                    tap1(510, 494, 0x0c0c0e) --关闭
                    tap1(20, 20)
                end
            elseif isColor(848, 594, 0xd68b02, 95) then -- 出航失败
                tap1(20, 20)
                isLiZied = false -- 粒子
                numTodayDigLiZi = numTodayDigLiZi - 1
                numDigLiZi = numDigLiZi - 1
            end
            writeJson("今日粒子次数", numTodayDigLiZi)
            writeJson("粒子总次数", numDigLiZi)

        elseif (isColor(634, 157, 0x38b3c8, 95) and isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95)) 
            or (isColor(634, 157, 0x36b2c7, 95) and isColor(550, 127, 0xffffff, 95) and isColor(596, 53, 0x5f9ede, 95)) then
            debugA("挖粒子,没航母,航母坏了")
            isFalseLiZi2 = false
            isShipBad = true
            isLiZied = true -- 粒子
            tap1(20, 20)
            mSleep(1000)
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
            gaiMuBiaoNewA(3, mb_FixShip, mm_FixShip)

        elseif isColor(634, 157, 0x102a43, 95) then -- 普通采集 无船可出
            debugA("普通采集 无船可出")
            tap1(20, 20)
            mSleep(1000)
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(634, 157, 0x38b3ca, 95) then -- 普通采集 有船可出
            debugA("普通采集 有船可出")
            local temNum = 0
            if isColor(461, 595, 0x396999, 95) then -- 矿
                temNum = 1
            elseif isColor(459, 593, 0x4e4b53, 95) then -- 金属
                temNum = 2
            elseif isColor(463, 596, 0xaebd82, 95) then -- 氯气
                temNum = 3
            end
            if isColor(366, 152, 0xffffff, 95) == false then --两名舰长
                tap1(518, 161, 0xa0bfee) -- +号
                tap1(946, 270, 0xd1b4b4) -- 右侧角色
                tap1(114, 596, 0xb21d2c) --卸除
                tap1(976, 582, 0xdde9f4) --整编
            end
            tap1(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--否
                tap1(512, 496, 0x0c0c0e)
                tap1(20, 20)
            elseif isColor(848, 594, 0xd68b02, 95) then -- 出航失败
                tap1(20, 20)
            else
                numChuHang = numChuHang + 1 -- 出航编号
                if numChuHang >= 4 then
                    numChuHang = 1
                end
                if temNum == 1 then
                    numTodayDigKuang = numTodayDigKuang + 1
                    writeJson("今日矿物次数", numTodayDigKuang)

                    numDigKuang = numDigKuang + 1
                    writeJson("矿物总次数", numDigKuang)
                elseif temNum == 2 then

                    numTodayDigJinShu = numTodayDigJinShu + 1
                    writeJson("今日金属次数", numTodayDigJinShu)

                    numDigJinShu = numDigJinShu + 1
                    writeJson("金属总次数", numDigJinShu)

                elseif temNum == 3 then

                    numTodayDigLvQi = numTodayDigLvQi + 1
                    writeJson("今日氯气次数", numTodayDigLvQi)

                    numDigLvQi = numDigLvQi + 1
                    writeJson("氯气总次数", numDigLvQi)

                end
            end
        end
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) then
        -- if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        debugA("搜索界面--出航--无粒子")
        numSeach = numSeach + 1
        if isKillPirate == true then
            debugA("有体力,杀海盗")
            if check23 == "60海盗" and num60Pirate <= 80 then
                num60Pirate = num60Pirate + 1
                writeJson("60海盗", num60Pirate)
                tap1(284, 539, 0x6d5c5d) -- 海盗
                mSleep(1000)
                if isPirateSub == true then
                    tap1(147, 366, 0xffffff) -- 减号
                    isPirateSub = false
                else
                    tap1(420, 366, 0xffffff) --加号
                    isPirateSub = true
                end
                for i = 1, 3, 1 do
                    if isColor(235, 427, 0x116eb9, 95) then
                        tap1(235, 427, 0x116eb9) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(235, 427, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            elseif num3Pirate <= 4 or haoLV <= 2 then
                num3Pirate = num3Pirate + 1
                writeJson("每日3海盗", num3Pirate)
                tap1(284, 539, 0x6d5c5d) -- 海盗
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(235, 427, 0x116eb9, 95) then
                        tap1(235, 427, 0x116eb9) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(235, 427, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            else
                tap1(442, 536, 0x71e7ff) -- 精英
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(380, 429, 0x116eb9, 95) then
                        tap1(380, 429, 0x116eb9) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(380, 429, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            end
        else
            if haoLV == 3 and isKaSearch == false then
                local numMin = iif(numKuang <= numJinShu, numKuang, numJinShu)
                numMin = iif(numMin <= numLvQi * 6, numMin, numLvQi)
                if check17 == "强制金属" then
                    numMin = numJinShu
                elseif check18 == "强制矿物" then
                    numMin = numKuang
                elseif check19 == "强制氯气" then
                    numMin = numLvQi
                end
                if numMin == numKuang then
                    tap1(568, 538, 0xef5870) -- 矿物
                    mSleep(1000)
                    tap1(704, 367, 0xffffff) -- 加
                    tap1(526, 430, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            tap1(431, 366, 0xffffff) -- 减
                            tap1(526, 430, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                            isKaSearch = true
                        end
                    end
                elseif numMin == numJinShu then
                    tap1(711, 548, 0x75493a) -- 金属
                    mSleep(1000)
                    tap1(846, 367, 0xffffff) -- 加
                    tap1(661, 433, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            tap1(571, 366, 0xffffff) -- 减
                            tap1(661, 433, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 2
                            isKaSearch = true
                        end
                    end
                else
                    tap1(855, 547, 0x282114) -- 三氯气
                    mSleep(1000)
                    tap1(988, 366, 0xffffff) -- 加
                    tap1(807, 431, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            tap1(716, 366, 0xffffff) -- 减
                            tap1(807, 431, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 3
                            isKaSearch = true
                        end
                    end
                end
            else
                if numChuHang == 1 then
                    tap1(711, 548, 0x75493a) -- 金属
                    mSleep(1000)
                    tap1(846, 367, 0xffffff) -- 加
                    tap1(661, 433, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            tap1(571, 366, 0xffffff) -- 减
                            tap1(661, 433, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            isKaSearch = false
                            break
                        end
                        if i == 3 then
                            numChuHang = numChuHang + 1
                        end
                    end
                elseif numChuHang == 2 then
                    if isColor(780 + 71, 541, 0xe0e0e0, 95) then
                        numChuHang = numChuHang + 1
                    else
                        tap1(855, 547, 0x282114) -- 三氯气
                        mSleep(1000)
                        tap1(988, 366, 0xffffff) -- 加
                        tap1(807, 431, 0x116eb9) -- 搜索
                        mSleep(1000)
                        for i = 1, 3, 1 do
                            if isColor(283, 540, 0x211b1d, 95) then
                                tap1(716, 366, 0xffffff) -- 减
                                tap1(807, 431, 0x116eb9) -- 搜索
                                mSleep(1000)
                            else
                                isKaSearch = false
                                break
                            end
                            if i == 3 then
                                numChuHang = numChuHang + 1
                            end
                        end
                    end
                elseif numChuHang == 3 then
                    tap1(568, 538, 0xef5870) -- 矿物
                    mSleep(1000)
                    tap1(704, 367, 0xffffff) -- 加
                    tap1(526, 430, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            tap1(431, 366, 0xffffff) -- 减
                            tap1(526, 430, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            isKaSearch = false
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                        end
                    end
                end
            end
        end
    end
    if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        debugA("搜索界面--出航--有粒子")
        numSeach = numSeach + 1
        if check23 == "60海盗" and num60Pirate <= 80 then
            num60Pirate = num60Pirate + 1
            writeJson("60海盗", num60Pirate)
            tap1(209, 541, 0xc0b7bf) -- 海盗
            mSleep(1000)
            if isPirateSub == true then
                tap1(76, 366, 0xffffff) -- 减号
                isPirateSub = false
            else
                tap1(349, 366, 0xffffff) --加号
                isPirateSub = true
            end
            for i = 1, 3, 1 do
                if isColor(167, 427, 0x116eb9, 95) then
                    tap1(217, 429, 0x377ab4) -- 搜索
                end
                mSleep(1000)
                if isColor(303, 431, 0x116eb9, 95) == false then
                    break
                end
                if i == 3 then
                    isKillPirate = false
                end
            end
        elseif isLiZied == false then
            tap1(925, 561, 0x1f101d) -- 粒子
            mSleep(1000)
            for i = 0, 1, 1 do
                -- if check20 == "2级粒子" and isFalseLiZi2 == false then
                if check26 == "3级粒子" and numSeachLiZi==3 then
                    if isColor(895, 366, 0xffffff, 95) then --3级

                    elseif isColor(867, 366, 0xffffff, 95) then --2级  
                        tap1(1059, 366) --  "+"   
                    elseif isColor(838, 366, 0xffffff, 95) then --1级 
                            tap1(1059, 366)  --  "+"  
                            tap1(1059, 366)  --  "+"  
                    end
                    numSeachLiZi = 3--搜索粒子的等级
                elseif check20 == "2级粒子" and numSeachLiZi==2 then
                    if isColor(895, 366, 0xffffff, 95) then --3级
                        tap1(785, 366) --  "-" 
                    elseif isColor(867, 366, 0xffffff, 95) then --2级  

                    elseif isColor(838, 366, 0xffffff, 95) then --1级
                        tap1(1059, 366) --  "+""  
                    end
                    numSeachLiZi = 2
                elseif check27 == "1级粒子" and numSeachLiZi==1 then
                    if isColor(895, 366, 0xffffff, 95) then --3级
                        tap1(785, 366) --  "-" 
                        tap1(785, 366) --  "-"
                    elseif isColor(867, 366, 0xffffff, 95) then --2级
                        tap1(785, 366) --  "-"
                    elseif isColor(838, 366, 0xffffff, 95) then --1级
                    end
                    numSeachLiZi = 1
                end
                if isColor(874, 430, 0x116eb9, 95) then
                    tap1(925, 431, 0x075ea8) -- 搜索
                end
                mSleep(1000)
                if isColor(786, 366, 0xffffff, 95) == false then
                    break
                end
                mSleep(1000 * 10)
                -- if check20 == "2级粒子" and isFalseLiZi2 == false then
                --     isFalseLiZi2 = true
                -- elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                --     isFalseLiZi2 = false
                -- elseif i >= 0 then
                --     -- isLiZi = true
                --     isBug_LiZi = true -- bug 粒子
                --     tap1(20, 20)
                -- end
            end
        elseif isKillPirate == true then
            debugA("有体力,杀海盗")
            if num3Pirate <= 4 or haoLV <= 2 then
                num3Pirate = num3Pirate + 1
                writeJson("每日3海盗", num3Pirate)
                tap1(209, 541, 0xc0b7bf) -- 海盗
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(167, 427, 0x116eb9, 95) then
                        tap1(217, 429, 0x377ab4) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(303, 431, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            else
                tap1(358, 537, 0xaecffa) -- 精英
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(307, 430, 0x116eb9, 95) then
                        tap1(353, 432, 0x075ea8) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(303, 431, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            end
        else
            if haoLV == 3 and isKaSearch == false then
                local numMin = iif(numKuang <= numJinShu, numKuang, numJinShu)
                numMin = iif(numMin <= numLvQi * 6, numMin, numLvQi)
                if check17 == "强制金属" then
                    numMin = numJinShu
                elseif check18 == "强制矿物" then
                    numMin = numKuang
                elseif check19 == "强制氯气" then
                    numMin = numLvQi
                end
                if numMin == numKuang then
                    tap1(500, 545) -- 矿物
                    mSleep(1000)
                    tap1(633, 365, 0xffffff) -- 加
                    tap1(508, 431, 0x075ea8) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            tap1(359, 367, 0xe2e4e8) -- 减
                            tap1(508, 431, 0x075ea8) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                            isKaSearch = true
                        end
                    end
                elseif numMin == numJinShu then
                    tap1(643, 548) -- 金属
                    mSleep(1000)
                    tap1(776, 365, 0xffffff) -- 加
                    tap1(639, 434) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            tap1(501, 367, 0xe2e4e8) -- 减
                            tap1(639, 434) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 2
                            isKaSearch = true
                        end
                    end
                else
                    tap1(783, 561, 0x1f101d) -- 三氯气
                    mSleep(1000)
                    tap1(917, 365, 0xffffff) -- 加
                    tap1(783, 431, 0x075ea8) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            tap1(644, 367, 0xe2e4e8) -- 减
                            tap1(783, 431, 0x075ea8) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 3
                            isKaSearch = true
                        end
                    end
                end
            else
                if numChuHang == 1 then
                    tap1(643, 548) -- 金属
                    mSleep(1000)
                    tap1(776, 365, 0xffffff) -- 加
                    tap1(639, 434) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            tap1(501, 367, 0xe2e4e8) -- 减
                            tap1(639, 434) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = numChuHang + 1
                        end
                    end
                elseif numChuHang == 2 then
                    if isColor(780, 541, 0xe0e0e0, 95) then
                        numChuHang = numChuHang + 1
                    else
                        tap1(783, 561, 0x1f101d) -- 三氯气
                        mSleep(1000)
                        tap1(917, 365, 0xffffff) -- 加
                        tap1(783, 431, 0x075ea8) -- 搜索
                        mSleep(1000)
                        for i = 1, 3, 1 do
                            if isColor(369, 535, 0x39e3f6, 95) then
                                tap1(644, 367, 0xe2e4e8) -- 减
                                tap1(783, 431, 0x075ea8) -- 搜索
                                mSleep(1000)
                            else
                                break
                            end
                            if i == 3 then
                                numChuHang = numChuHang + 1
                            end
                        end
                    end
                elseif numChuHang == 3 then
                    tap1(500, 545) -- 矿物
                    mSleep(1000)
                    tap1(633, 365, 0xffffff) -- 加
                    tap1(508, 431, 0x075ea8) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            tap1(359, 367, 0xe2e4e8) -- 减
                            tap1(508, 431, 0x075ea8) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                        end
                    end
                end
            end
        end
    end
    if outside() then
        mSleep(1000)
        if numSeach >= 10 then
            numSeach = 0
            tap1(1117, 627, 0x19293a)
            return
        end
        if isColor(144, 72, 0x41d9ff, 95) and haoLV >= 3 then -- 30体力
            -- if isColor(147, 80, 0x37b8d8, 95) and haoLV >= 3 then -- 20体力
            -- if isColor(185, 80, 0x37b8d8, 95) and haoLV >= 3 then -- 60体力
            -- if isColorPlus(210, 79, 0x39bfe1,95) then -- 70体力
            debugA("有体力")
            if nowTime - timeKillPirate >= 10 * 60 then
                isKillPirate = true -- 杀海盗
                timeKillPirate = nowTime
            end
        else
            debugA("无体力")
            isKillPirate = false -- 不杀海盗
        end
        if isColor(178, 379, 0x00ace4, 95) and isColor(232, 385, 0x00798c, 95) and isColor(380, 383, 0xa43b40, 95) then
            debugA("粒子--左")
            numSearch = numSearch + 1
            tap1(492, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZied = true
                else
                    isLiZied = true
                end
                tap1(172, 525) -- 搜索
            end
        elseif isColor(733, 377, 0x00ace4, 95) and isColor(798, 378, 0x00798c, 95) and isColor(939, 376, 0x9e393d, 95) then
            debugA("粒子--右")
            numSearch = numSearch + 1
            tap1(1070, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZied = true
                else
                    isLiZied = true
                end
                tap1(172, 525) -- 搜索
            end
        elseif isColor(125, 322, 0x6416c3, 95) and isColor(151, 305, 0x6918d9, 95) then
            debugA("粒子--左")
            numSearch = numSearch + 1
            tap1(492, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZied = true
                else
                    isLiZied = true
                end
                tap1(172, 525) -- 搜索
            end
            if isColor(522, 433, 0x1d6ebc, 95) then
                debugA("其他司令官")
                tap1(522, 433)
            end
        elseif isColor(662, 320, 0x783ede, 95) and isColor(684, 302, 0x6f1bdf, 95) then
            debugA("粒子--右")
            numSearch = numSearch + 1
            tap1(1070, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZied = true
                else
                    isLiZied = true
                end
                tap1(172, 525) -- 搜索
            end
            if isColor(522, 433, 0x1d6ebc, 95) then
                debugA("其他司令官")
                tap1(522, 433)
            end
        elseif isColor(497, 383, 0x00798c, 95) and isColor(116, 377, 0x00ace4, 95) then
            debugA("采集--左")
            numSearch = numSearch + 1
            tap1(407, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif isColor(639, 378, 0x00ace4, 95) and isColor(1027, 380, 0x00798c, 95) then
            debugA("采集--右")
            numSearch = numSearch + 1
            tap1(1027, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif numSearch >= 10 then
            debugA("回基地")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif numQueue == 5 and isColor(1022, 519, 0xffa100, 95) then --5队出完
            debugA("5队出完")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif numQueue == 4 and isColor(1022, 457, 0xffa100, 95) then -- 4队出完
            debugA("4队出完")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif numQueue == 3 and isColor(1022, 395, 0xffa100, 95) then -- 3队出完
            debugA("3队出完")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif numQueue == 2 and isColor(1022, 333, 0xffa100, 95) then -- 2队出完
            debugA("2队出完")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif numQueue == 1 and isColor(1022, 271, 0xffa100, 95) then -- 1队出完
            debugA("1队出完")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isBug_LiZi == true then
            if check23 == "60海盗" and num60Pirate <= 80 and isKillPirate == true then
                tap1(199, 522) -- 搜索
            else
                searchLiZi()
            end
        else
            if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) then
                isRewardLiZi()
                if isBug_LiZi == false then
                    tap1(199, 522) -- 搜索
                end
            elseif isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) == false then
                tap1(570, 469, 0x4a6181)
            end

        end
    end
end

-- 判断是否有队伍在采集粒子
function isRewardLiZi()
    -- if nowTime - timeLiZi >= 3 * 60 then
    debugA("判断是否有队伍在采集粒子--超过3分钟")
    if notWaLiZi == true then
        isLiZied = true
        return true
    end
    if haoLV <= 2 then
        isLiZied = true
        return false
    else
        numLiZiTeam = 0
        -- timeLiZi = nowTime
        if isColor(1115, 242, 0xfefefe, 95) then -- 1队有人
            tap1(1058, 244, 0xdaa395)
            mSleep(3000)
            debugA("1队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                tap1(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debugA("误开司令官")
                    tap1(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    if check16 ~= "vip8" then
                        debugA("isBug_LiZi = false")
                        isBug_LiZi = false -- bug 粒子
                    end
                    debugA("isLiZi = true")
                    isLiZied = true
                    return true
                end
            end
        end
        if isColor(1115, 304, 0xfefefe, 95) then -- 2队有人
            tap1(1058, 300, 0xdaa395)
            mSleep(3000)
            debugA("2队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                tap1(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debugA("误开司令官")
                    tap1(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    if check16 ~= "vip8" then
                        isBug_LiZi = false -- bug 粒子
                    end
                    isLiZied = true
                    return true
                end
            end
        end
        if isColor(1115, 367, 0xfefefe, 95) then -- 3队有人
            tap1(1058, 364, 0xdaa395)
            mSleep(3000)
            debugA("3队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                tap1(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debugA("误开司令官")
                    tap1(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    isLiZied = true
                    if check16 ~= "vip8" then
                        isBug_LiZi = false -- bug 粒子
                    end
                    return true
                end
            end
        end
        if isColor(1115, 367, 0xfefefe, 95) then -- 4队有人
            tap1(1058, 427, 0xdaa395)
            mSleep(3000)
            debugA("4队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                tap1(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debugA("误开司令官")
                    tap1(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    isLiZied = true
                    if check16 ~= "vip8" then
                        isBug_LiZi = false -- bug 粒子
                    end
                    return true
                end
            end
        end
        tap1(20, 20) -- 瞎点一下
        -- mSleep(1000)
        if isColor(9, 10, 0xff9c00, 95) then
            debugA("误开司令官")
            tap1(20, 20)
            -- mSleep(1000)
        end
        if check16 ~= "vip8" then
            isBug_LiZi = true -- bug 粒子
        end
        isLiZied = false
        return false
    end
    -- else
    --     isLiZi = true
    --     return true
    -- end
    -- return false
end

-- 搜索粒子
function searchLiZi()
    for i = 1, numSearchLiZiSecond, 1 do
        if isPause == true then
            return
        end

        nowTime = os.time();
        timeXXX = nowTime

        -- debug("搜索粒子")
        if isColor(297, 107, 0x215da6, 95) and isColor(835, 585, 0x215da6, 95) and isColor(556, 551, 0x145da9, 95) then
            debugA("未知信号")
            tap1(511, 605, 0x0c0c0e)
        end
        if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and isColor(355, 86, 0x5195db, 95) then
            debugA("司令官界面")
            tap1(20, 20)
        end
        if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) == false then
            debugA("外太空")
            tap1(571, 467, 0x05305c)
        end
        if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and isColor(503, 515, 0x233341, 95) and
            isColor(741, 516, 0x2f2a33, 95) then
            debugA("外太空玩家1")
            tap1(511, 600, 0x0c0c0e)
            tap1(571, 467, 0x05305c)
        end
        if isColor(493, 436, 0x1c6dba, 95) then
            debugA("蓝色确认")
            tap1(493, 436)
        end
        if isColor(331, 219, 0x2a6aab, 95) and isColor(337, 212, 0x2a6aab, 95) then
            debugA("任务栏误开")
            tap1(331, 219)
        end
        local intX1 = 1
        for k = 1, 50, 1 do
            if isPause == true then
                return
            end
            if isColor(1019, 544, 0x744218, 95) == false then
                debugA("搜索时卡bug")
                break
            end
            x0, y0 = findColorInRegionFuzzy(0xf8c328, 95, intX1, 100, 1020, 540) -- 黄色图标
            -- debug("x0,y0 :"..x0..","..y0)
            if x0 ~= -1 then
                if check20 == "2级粒子" then
                    x, y = tsFindText(index_lizi2, "2", x0 - 1, y0 - 1, x0 + 25, y0 + 25, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
                else
                    x, y = tsFindText(index_lizi1, "1", x0 - 1, y0 - 1, x0 + 25, y0 + 25, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
                end
                if x ~= -1 then
                    tap1(x + 48, y - 23)
                    mSleep(500)
                    -- x5, y5 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-105|0xd7d9dc", 90, 66, 14, 1126, 529)--红攻击 不抢
                    -- x6, y6 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-106|0xd6d8db", 90, 66, 14, 1126, 529)--红攻击 不抢
                    x1, y1 = findMultiColorInRegionFuzzy(0xa43b40, "-14|29|0x00798c,-265|-70|0x9e6eed", 80, 66, 14,
                        1126, 529) -- 红攻击 抢
                    x2, y2 = findMultiColorInRegionFuzzy(0x00798c, "-195|-69|0x8446e5,-14|0|0x00ace4", 90, 66, 14, 1126,
                        529) -- 蓝采集
                    if x1 ~= -1 then
                        debugA("红色攻击")
                        if check13 == "抢粒子" then -- 抢
                            tap1(x1, y1)
                            isBug_LiZi = false
                            -- numSearchLiZi = 0
                            numSearchLiZi = numSearchLiZi + 1
                            if numSearchLiZi == 7 then
                                numSearchLiZi = 0
                            end
                            writeJson("粒子方向", numSearchLiZi)
                            isLiZied = true
                            if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                                tap1(490, 431)
                            end
                            return
                        else
                            x3, y3 = findColorInRegionFuzzy(0xff0000, 95, x1 + 20, y1 - 113, x1 + 124, y1 - 101) -- 红名玩家
                            if x3 ~= -1 and y3 ~= -1 then
                                debugA("不打红名")
                                tap1(20, 20) -- 瞎点一下
                                -- mSleep(1000)
                                if isColor(9, 10, 0xff9c00, 95) then
                                    debugA("误开司令官")
                                    tap1(20, 20)
                                    -- mSleep(1000)
                                end
                            else -- 白名玩家
                                debugA("打白名")
                                tap1(x1, y1)
                                isBug_LiZi = false
                                -- numSearchLiZi = 0
                                numSearchLiZi = numSearchLiZi + 1
                                if numSearchLiZi == 7 then
                                    numSearchLiZi = 0
                                end
                                writeJson("粒子方向", numSearchLiZi)
                                isLiZied = true
                                if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                                    tap1(490, 431)
                                end
                                return
                            end
                        end
                    elseif x2 ~= -1 then
                        debugA("蓝色采集")
                        tap1(x2, y2)
                        isBug_LiZi = false
                        -- numSearchLiZi = 0
                        numSearchLiZi = numSearchLiZi + 1
                        if numSearchLiZi == 7 then
                            numSearchLiZi = 0
                        end
                        writeJson("粒子方向", numSearchLiZi)
                        isLiZied = true
                        return
                    elseif isColor(1106, 574, 0xd88b00, 95) then
                        debugA("这是海盗,不是粒子")
                        mSleep(1000)
                        tap1(20, 20)
                        mSleep(1000)
                    else
                        debugA("没找到")
                        tap1(20, 20) -- 瞎点一下
                        -- mSleep(1000)
                        if isColor(9, 10, 0xff9c00, 95) then
                            debugA("误开司令官")
                            tap1(20, 20)
                            -- mSleep(1000)
                        end
                    end
                end
                intX1 = x0 + 16

            else

                if numSearchLiZi == 0 then -- 上
                    touchMoveXY(504, 101, 511, 603 - 100)
                elseif numSearchLiZi == 1 then -- 下
                    touchMoveXY(511, 530, 504, 25 + 100)
                elseif numSearchLiZi == 2 then -- 左
                    touchMoveXY(17, 297, 874 - 200, 282)
                elseif numSearchLiZi == 3 then -- 右
                    touchMoveXY(874, 282, 17 + 200, 297)
                elseif numSearchLiZi == 4 then -- 左上
                    touchMoveXY(107, 130, 983 - 200, 503 - 100)
                elseif numSearchLiZi == 5 then -- 右上
                    touchMoveXY(885, 117, 16 + 200, 478 - 100)
                elseif numSearchLiZi == 6 then -- 右下
                    touchMoveXY(983, 503, 107 + 200, 130 + 100)
                elseif numSearchLiZi == 7 then -- 左下
                    touchMoveXY(16, 478, 885 - 200, 117 + 100)
                end
                -- mSleep(500)
                if i == numSearchLiZiSecond then
                    tap1(568, 569, 0x0a0a0f) -- 归位
                    mSleep(1000)
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                        isLiZied = true
                        isBug_LiZi = false
                    end
                    writeJson("粒子方向", numSearchLiZi)
                end
                break
            end
        end

        --[[
        local intX0 = 1
        for j = 1, 10, 1 do
            if isColor(1019, 544, 0x744218, 95) == false then
                debug("搜索时卡bug")
                break
            end
            -- 1: 0,0,0,0 范围坐标，请自行修改
            -- 2: "FAC52A , 030303" 偏色,多组或单组.请在偏色列表中选择
            -- 3: 90 匹配精度 【0-100】
            -- x1, y1 = tsFindText(index_lizi2, "1", 123, 145, 535 + 20, 310 + 20, "FAC52A , 030303", 94)
            -- x2, y2 = tsFindText(index_lizi2, "1", 535 - 20, 145, 1020, 310 + 20, "FAC52A , 030303", 94)
            -- x3, y3 = tsFindText(index_lizi2, "1", 5, 310 - 20, 535 + 20, 492, "FAC52A , 030303", 94)
            -- x4, y4 = tsFindText(index_lizi2, "1", 535 - 20, 310 - 20, 1020, 531, "FAC52A , 030303", 94)
            -- x, y = tsFindText(index_lizi2, "1", 123, 145, 893, 474, "FAC52A , 030303", 94)
            -- x, y = tsFindText(index_lizi1, "1", 123, 145, 893, 474, "775D13 , 4D3D0F", 90)
            local timeQian = os.time()
            x, y = tsFindText(index_lizi2, "1", intX0, 100, 1020, 540, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
            local timeQH = os.time() - timeQian
            debug("找字时间:" .. timeQH)
            if x ~= -1 then
                tap1(x + 48, y - 23)
                mSleep(500)
                -- x5, y5 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-105|0xd7d9dc", 90, 66, 14, 1126, 529)--红攻击 不抢
                -- x6, y6 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-106|0xd6d8db", 90, 66, 14, 1126, 529)--红攻击 不抢
                x1, y1 = findMultiColorInRegionFuzzy(0xa43b40, "-14|29|0x00798c,-265|-70|0x9e6eed", 80, 66, 14, 1126,
                    529) -- 红攻击 抢
                x2, y2 =
                    findMultiColorInRegionFuzzy(0x00798c, "-195|-69|0x8446e5,-14|0|0x00ace4", 90, 66, 14, 1126, 529) -- 蓝采集
                if x1 ~= -1 then
                    debug("红色攻击")
                    if check13 == "抢粒子" then -- 抢
                        tap1(x1, y1)
                        isBug_LiZi = false
                        -- numSearchLiZi = 0
                        numSearchLiZi = numSearchLiZi + 1
                        if numSearchLiZi == 7 then
                            numSearchLiZi = 0
                        end
                        writeJson( "粒子方向", numSearchLiZi)
                        isLiZi = true
                        if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                            tap1(490, 431)
                        end
                        return
                    else
                        x3, y3 = findColorInRegionFuzzy(0xff0000, 95, x1 + 20, y1 - 113, x1 + 124, y1 - 101) -- 红名玩家
                        if x3 ~= -1 and y3 ~= -1 then
                            debug("不打红名")
                            tap1(20, 20) -- 瞎点一下
                            -- mSleep(1000)
                            if isColor(9, 10, 0xff9c00, 95) then
                                debug("误开司令官")
                                tap1(20, 20)
                                -- mSleep(1000)
                            end
                        else -- 白名玩家
                            debug("打白名")
                            tap1(x1, y1)
                            isBug_LiZi = false
                            -- numSearchLiZi = 0
                            numSearchLiZi = numSearchLiZi + 1
                            if numSearchLiZi == 7 then
                                numSearchLiZi = 0
                            end
                            writeJson( "粒子方向", numSearchLiZi)
                            isLiZi = true
                            if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                                tap1(490, 431)
                            end
                            return
                        end
                    end
                elseif x2 ~= -1 then
                    debug("蓝色采集")
                    tap1(x2, y2)
                    isBug_LiZi = false
                    -- numSearchLiZi = 0
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                    end
                    writeJson( "粒子方向", numSearchLiZi)
                    isLiZi = true
                    return
                elseif isColor(1106, 574, 0xd88b00, 95) then
                    debug("这是海盗,不是粒子")
                    mSleep(1000)
                    tap1(20, 20)
                    mSleep(1000)
                else
                    debug("没找到")
                    tap1(20, 20) -- 瞎点一下
                    -- mSleep(1000)
                    if isColor(9, 10, 0xff9c00, 95) then
                        debug("误开司令官")
                        tap1(20, 20)
                        -- mSleep(1000)
                    end
                end
                intX0 = x + 10
            else
                if numSearchLiZi == 0 then -- 上
                    touchMoveXY(504, 101, 511, 603 - 100)
                elseif numSearchLiZi == 1 then -- 下
                    touchMoveXY(511, 530, 504, 25 + 100)
                elseif numSearchLiZi == 2 then -- 左
                    touchMoveXY(17, 297, 874 - 200, 282)
                elseif numSearchLiZi == 3 then -- 右
                    touchMoveXY(874, 282, 17 + 200, 297)
                elseif numSearchLiZi == 4 then -- 左上
                    touchMoveXY(107, 130, 983 - 200, 503 - 100)
                elseif numSearchLiZi == 5 then -- 右上
                    touchMoveXY(885, 117, 16 + 200, 478 - 100)
                elseif numSearchLiZi == 6 then -- 右下
                    touchMoveXY(983, 503, 107 + 200, 130 + 100)
                elseif numSearchLiZi == 7 then -- 左下
                    touchMoveXY(16, 478, 885 - 200, 117 + 100)
                end
                -- mSleep(500)
                if i == numSearchLiZiSecond then
                    tap1(568, 569, 0x0a0a0f) -- 归位
                    mSleep(1000)
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                        isLiZi = true
                        isBug_LiZi = false
                    end
                    writeJson( "粒子方向", numSearchLiZi)
                end
                break
            end
        end
        --]]
    end
end

-- 退出
function getOut()
    for i = 1, 10, 1 do
        if isPause == true then
            return
        end
        if isColor(7, 24, 0xff9c00, 95) then
            tap1(20, 20)
            mSleep(1000)
        else
            return true
        end
    end
    return false
end

-- 找红图
function findRed()
    x, y = findImage("red.bmp", 355, 253, 403, 351);  -- 在（0,0）到（w-1,h-1）寻找刚刚截图的图片
    if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某图片符合条件
        return true
    else -- 如果找不到符合条件的图片
        return false
    end
end

-- 挖矿
function waKuang()
    if inside1() == true then
        mSleep(1000)
        if checkRed1() == false then
            if isColor(212, 107, 0x5fe4e7, 95) then -- 有基地现况图标
                tap1(213, 107)
            end
        end
    end
    if outside() then
        if muBiaoA == mb_ChuHang then

        else
            debugA("目标挖矿,回基地")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        end
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(92, 36, 0xb4c0ce, 95) and isColor(173, 43, 0x9eabbb, 95) then
        -- debug("基地现况界面--函数挖矿")
        if isColor(217, 321, 0x306090, 95) then -- 5号休息中
            debugA("5号休息中,出航")
            numQueue = 5
            writeJson("队列总数", numQueue)
            tap1(217, 325)
            if isColor(217, 321, 0x306090, 95) then -- 4号出航失败

            else
                gaiMuBiaoNewA(3, mb_ChuHang, mm_ChuHang)
            end
        elseif isColor(94, 325, 0x306090, 95) then -- 4号休息中
            debugA("4号休息中,出航")
            numQueue = 4
            writeJson("队列总数", numQueue)
            tap1(94, 325)
            if isColor(94, 325, 0x306090, 95) then -- 4号出航失败

            else
                gaiMuBiaoNewA(3, mb_ChuHang, mm_ChuHang)
            end
        elseif isColor(338, 208, 0x306090, 95) then -- 3号休息中
            debugA("3号休息中,出航")
            numQueue = 3
            writeJson("队列总数", numQueue)
            tap1(338, 208, 0x306090)
            if isColor(338, 208, 0x306090, 95) then -- 3号出航失败

            else
                gaiMuBiaoNewA(3, mb_ChuHang, mm_ChuHang)
            end

        elseif isColor(215, 208, 0x306090, 95) then -- 2号休息中
            debugA("2号休息中,出航")
            numQueue = 2
            writeJson("队列总数", numQueue)
            tap1(215, 208, 0x306090)
            if isColor(215, 208, 0x306090, 95) then -- 2号出航失败

            else
                gaiMuBiaoNewA(3, mb_ChuHang, mm_ChuHang)
            end
        elseif isColor(92, 207, 0x306090, 95) then -- 1号休息中
            debugA("1号休息中,出航")
            numQueue = 1
            writeJson("队列总数", numQueue)
            tap1(92, 207, 0x306090)
            if isColor(92, 207, 0x306090, 95) then -- 1号出航失败

            else
                gaiMuBiaoNewA(3, mb_ChuHang, mm_ChuHang)
            end

        elseif nowTime - timeInside >= 5 * 60 then
            tap1(510, 608, 0x0c0c0e)
            timeInside = nowTime
        elseif checkXiangMu1 == "项目1" and checkXiangMu3 == "项目3" then
            if timeXiangMu1 > nowTime then
                debugA("timeXiangMu1 = nowTime")
                timeXiangMu1 = nowTime
            elseif numXiangMu == 1 and nowTime - timeXiangMu1 >= 10 * 60 then
                debugA("项目1 => 项目3")
                -- if timeMinFruit == 0 then
                --     local bool, kind = isFileExist(userPath() .. "/res/table_tree.txt")
                --     if bool == true then
                --         table_tree = readFile(userPath() .. "/res/table_tree.txt")
                --         timeMinFruit = math.min(table.unpack(table_tree))
                --         -- debugC("最小值: " .. timeMinFruit) mSleep(100)
                --     end
                -- elseif nowTime > timeMinFruit then
                numXiangMu = 3
                appXiangMu = "com.wemadeconnect.etgnft.everytown"
                timeXiangMu1 = nowTime + 60 * 60 * 24 --项目1已闲置时间
                -- end
            end
        end
    end
end

function BeAttack()
    if isAttacked == true and nowTime - timeAttacked >= 30 * 60 and muBiaoA == "战备" then
        isAttacked = false
        timeAttacked = nowTime
        gaiMuBiaoNewA(4, "")
    end
    if haoLV == 3 and numLiZi >= 80000 then
        if isColor(0, 0, 0x904f6b, 95) or isColor(0, 0, 0x95445c, 95) or isColor(0, 0, 0x924963, 95) or
            isColor(0, 0, 0xd13f00, 95) or isColor(0, 0, 0x76151a, 95) or isColor(1135, 639, 0x6a060a, 95) or
            isColor(0, 0, 0xb00101, 95) then
            debugA("被攻击,秒数:" .. nowTime - timeBeAttack2)
            if isAttacked == false then
                isAttacked = true
                timeAttacked = nowTime
            end
            if nowDateTime.hour >= 24 then
                if timeBeAttack2 == 0 then
                    timeBeAttack2 = nowTime
                elseif nowTime - timeBeAttack2 >= 5 then
                    vibratorNotice()
                    timeBeAttack2 = 0
                end
            elseif string.find(muBiaoA, "战备") == nil then
                if isColor(1019, 544, 0x793d16, 95) and isColor(1124, 618, 0x7d3915, 95) and
                    isColor(1058, 581, 0xf8e6e6, 95) then
                    debugA("基地内--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                elseif isColor(1019, 544, 0x7b3b15, 95) and isColor(1124, 618, 0x803513, 95) and
                    isColor(1039, 574, 0xe8d3d3, 95) then
                    debugA("基地外--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                    tap(1077, 579)
                elseif isColor(69, 23, 0xf35600, 95) and isColor(92, 36, 0xb4a5b1, 95) and isColor(173, 43, 0xa098a6, 95) then
                    debugA("基地现况--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                    tap(509, 608)
                elseif isColor(54, 58, 0xf29600, 95) then
                    debugA("建筑界面--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                    tap(20, 20)
                elseif isColor(93, 64, 0xf6a000, 95) then
                    debugA("邮箱界面--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                    tap(20, 20)
                else
                    closeApp(appXiangMu)
                    mSleep(2000)
                    gaiMuBiaoNewA(4, "战备")
                end
            end
        end
    end
end

--战备
function warReady()
    if (isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1039, 574, 0xf0f0f1, 95)) or
        (isColor(1019, 544, 0x793c16, 95) and isColor(1124, 618, 0x7e3814, 95) and isColor(1039, 574, 0xece0e0, 95)) then
        debugA("基地外--战备")
        tap(1077, 579)
    end
    if (isColor(964, 581, 0xa55927, 95) and isColor(1018, 543, 0x744218, 95) and isColor(1058, 581, 0xffffff, 95)) or     --背包 SECTOR左上角  C的颜色
        (isColor(964, 581, 0xa74f22, 95) and isColor(1018, 543, 0x7b3b15, 95) and isColor(1058, 581, 0xf5dddd, 95)) then
        debugA("基地内--战备")
        -- mSleep(3000)
        if muBiaoA == "战备" and isColor(1043, 99, 0x9f0f0f, 95) then     --瞭望塔红点
            debugA("瞭望塔")
            tapBefore(1043, 99, 0x9f0f0f)
            mSleep(2000)
            if isColor(187,163,0xfab4dd,95) and isColor(231,137,0xc6793b,95) and isColor(196,210,0x8bd9df,95) then
                debugA("NPC攻击")
                for i = 1, 10, 1 do
                    vibratorNotice()
                end
                tap1(486, 82, 0xfcf6f6)
                mSleep(1000)
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 83, 0xf8e9e9, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "")
            elseif isColor(163,283,0xefe4e5,95) and isColor(164,270,0x797b87,95) and isColor(231,322,0x222a36,95) then
                debugA("攻击2 侦察在上面")
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 83, 0xf8e9e9, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "战备开盾")
                -- gaiMuBiaoNewA(4, "战备跑路")
                isAttacked = false
                timeAttacked = nowTime
            elseif isColor(546,99,0xd8cfd1,95) and isColor(579,106,0x9a98a1,95) and isColor(426,192,0xca631f,95) and isColor(571,116,0xded5d7,95) then
                debugA("侦察")
                tap1(486, 82, 0xfcf6f6)
                mSleep(1000)
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 83, 0xf8e9e9, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "")
            elseif isColor(430,189,0xe1a0a3,95) then
                debugA("矿被打")
                tap1(486, 82, 0xfcf6f6)
                mSleep(1000)
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 83, 0xf8e9e9, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "")
            elseif isColor(578,117,0xb0afb6,95) and isColor(541,114,0xb8b7bd,95) and isColor(231,137,0x242935,95) then
                debugA("攻击")
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 83, 0xf8e9e9, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "战备开盾")
                -- gaiMuBiaoNewA(4, "战备跑路")
                isAttacked = false
                timeAttacked = nowTime
            else
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 83, 0xf8e9e9, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "")
            end

            --对调
            -- if isColor(160, 276, 0xfbf1f1, 80) then
            --     debug("侦察")
            --     tap1(486, 82, 0xfcf6f6)
            --     mSleep(1000)
            --     tap1(20, 20)
            --     gaiMuBiaoNew(4, "")
            -- elseif isColor(151, 261, 0xfcf7f7, 80) then
            --     debug("攻击")
            --     tap1(20, 20)
            -- gaiMuBiaoNewA(4, "战备开盾")
            -- -- gaiMuBiaoNewA(4, "战备跑路")
            -- else
            --     tap1(20, 20)
            --     gaiMuBiaoNew(4, "")
            -- end
        elseif muBiaoA == "战备跑路" then
            debugA("展开菜单栏")
            tap1(905, 73, 0x091423) --主动技能
            mSleep(1000)
            if isColor(578, 278, 0x165aab, 95) then
                -- if isColor(578, 278, 0x4f5d60, 95) then
                debugA("冷却中")
                gaiMuBiaoNewA(4, "战备开盾")
                isAttacked = false
                timeAttacked = nowTime
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
            elseif isColor(578, 278, 0x4f5d60, 90) then
                -- elseif isColor(578, 278, 0x165aab, 95) then
                debugA("可使用")
                tap1(573, 253) --使用技能--召回
                mSleep(1000)
                tap1(420, 474, 0xf39b18) --使用
                mSleep(1000)
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
            else
                debugA("技能不对")
                gaiMuBiaoNewA(4, "战备开盾")
                isAttacked = false
                timeAttacked = nowTime
                tap1(1103, 67, 0x1e1826) --收缩
                mSleep(1000)
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
                tap1(964, 581, 0xa74f22) --背包
            end
            --对调
            -- if isColor(578, 278, 0x4f5d60, 95) then
            --     debug("冷却中")
            --     gaiMuBiaoNew(4, "战备开盾")
            --     tap1(1103, 67, 0x1e1826) --收缩
            --     tap1(964, 581, 0xa74f22) --背包
            -- elseif isColor(578, 278, 0x165aab, 95) then
            --     debug("可使用")
            --     tap1(573, 258, 0xd2a414) --使用技能--召回
            --     tap1(420, 474, 0xf39b18) --使用
            --     tap1(1103, 67, 0x1e1826) --收缩
            --     tap1(1103, 67, 0x1e1826) --收缩
            --     tap1(964, 581, 0xa74f22) --背包
            -- else
            --     debug("技能不对")
            --     gaiMuBiaoNew(4, "战备开盾")
            --     tap1(1103, 67, 0x1e1826) --收缩
            --     tap1(964, 581, 0xa74f22) --背包
            -- end

        elseif muBiaoA == "战备开盾" then
            -- tap1(964, 581, 0xa74f22) --背包
            tap1(1015, 71, 0x0e1b2c) --基地加成
        end
    end
    if muBiaoA == "战备开盾" then
        if (isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and isColor(103, 75, 0xffb500, 95)) or
            (isColor(17, 24, 0xf5dfdf, 95) and isColor(5, 24, 0xf58700, 95) and isColor(103, 75, 0xf9a600, 95)) then
            debugA("背包界面--战备")
            if isColor(119, 253, 0x1e2434, 90) then
                tap1(119, 253, 0x1e2434) --战争
            end
            if isColor(294, 104, 0x3081aa, 95) or isColor(294, 104, 0x2988b3, 95) then
                tap1(294, 104) --2
                tap1(518, 456, 0x1c6cb9)
            elseif isColor(394, 104, 0x2f82ac, 95) or isColor(394, 104, 0x2988b3, 95) then
                tap1(394, 104) --3
                tap1(518, 456, 0x1c6cb9)
            elseif isColor(493, 104, 0x2e83ad, 95) or isColor(493, 104, 0x2988b3, 95) then
                tap1(493, 104) --4
                tap1(518, 456, 0x1c6cb9)
            end
            tap1(20, 20)
            gaiMuBiaoNewA(4, "")
            numTodayDefense = numTodayDefense + 1
            writeJson("今日开盾次数", numTodayDefense)
            numDefense = numDefense + 1
            writeJson("开盾总次数", numDefense)
        end
    end
    if muBiaoA == "战备跑路" then
        if (isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and isColor(103, 75, 0xffb500, 95)) or
            (isColor(17, 24, 0xf5dfdf, 95) and isColor(5, 24, 0xf58700, 95) and isColor(103, 75, 0xf9a600, 95)) then
            debugA("背包界面--战备")
            if isColor(119, 253, 0x1e2434, 90) then
                tap1(119, 253, 0x1e2434) --战争
            end
            x, y = findMultiColorInRegionFuzzy(0x2ed6f1, "16|-8|0x14b2f3,10|33|0xebbe77,53|24|0xadb3b9", 90, 173, 79,
                1049, 356)
            if x > 0 then
                tap1(x, y)
                tap1(516, 454, 0x1c6db9)
                -- tap1(20, 20)
            end
            tap1(20, 20)
            gaiMuBiaoNewA(4, "")
            numTodayRunAway = numTodayRunAway + 1
            writeJson("今日跑路次数", numTodayRunAway)
            numRunAway = numRunAway + 1
            writeJson("跑路总次数", numRunAway)
        end
    end
end

-- 基地内
function inside1(...)
    isXiaoHao()
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1031, 577, 0xffffff, 95) then
        debugA("室内")
        if check21 == "自动切换梯子" and strVpnModel == "配置" then
            autoChangeVPN("场景")
            strVpnModel = "场景"
            runApp(appXiangMu)
            mSleep(1000)
        end
        if isColor(1104, 130, 0x369469, 95) == false and isColor(1129, 102, 0x9e1111, 95) then
            debugA("验证码--红点")
            tap1(1096, 137, 0x191d1b)
        elseif isColor(1050, 106, 0x9e1111, 95) and isColor(1033, 115, 0x3f9fd8, 95) then
            debugA("验证码--红点")
            tap1(1033, 137)
        elseif isColor(1104, 130, 0x369469, 95) and isColor(1125, 106, 0x9e1111, 95) then
            -- debug("航母--红点")
        elseif isColor(1043, 99, 0x9d1111, 95) and isColor(1058, 113, 0x9d1111, 95) and isColor(1006, 131, 0xfffcff, 95) then
            debugA("援助2--红点")
            tap1(1020, 138, 0x222b33)
        elseif isColor(968, 99, 0x9d1111, 95) and isColor(932, 131, 0xffffff, 95) then
            debugA("援助1--红点")
            tap1(944, 138, 0x222b33)
        end
        if numYunDaMa ~= 0 then
            numYunDaMa = 0
        end
        if isColor(335, 213, 0x2a6aab, 95) and isColor(335, 226, 0x2a6aab, 95) then
            debugA("收缩任务栏")
            tap1(335, 213)
        end
        -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and muBiao == mb_ZhuXian then
        --     debug("展开任务栏")
        --     tap1(107, 213)
        -- end
        nowTime = os.time()
        timeXXX = nowTime
        return true
    else
        return false
    end
end

-- 基地外
function outside(...)
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1039, 574, 0xf0f0f1, 95) then
        debugA("室外")
        if check21 == "自动切换梯子" and strVpnModel == "配置" then
            autoChangeVPN("场景")
            strVpnModel = "场景"
            runApp(appXiangMu)
            mSleep(1000)
        end
        if isColor(1104, 130, 0x369469, 95) == false and isColor(1129, 102, 0x9e1111, 95) then
            debugA("验证码--红点")
            tap1(1096, 137, 0x191d1b)
        elseif isColor(1050, 106, 0x9e1111, 95) and isColor(1033, 115, 0x3f9fd8, 95) then
            debugA("验证码--红点")
            tap1(1033, 137)
            -- elseif isColor(1104, 130, 0x369469, 95) and isColor(1125, 106, 0x9e1111, 95) then
            -- debugA("航母--红点")
        elseif isColor(1043, 99, 0x9d1111, 95) and isColor(1058, 113, 0x9d1111, 95) and isColor(1006, 131, 0xfffcff, 95) then
            debugA("援助--红点")
            tap1(1020, 138, 0x222b33)
        elseif isColor(968, 99, 0x9d1111, 95) and isColor(932, 131, 0xffffff, 95) then
            debugA("援助1--红点")
            tap1(944, 138, 0x222b33)
        end
        if isColor(335, 213, 0x2a6aab, 95) and isColor(335, 226, 0x2a6aab, 95) then
            debugA("收缩任务栏")
            tap1(335, 213)
        end
        -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and muBiao == mb_ZhuXian then
        --     debug("展开任务栏")
        --     tap1(107, 213)
        -- end
        if isColor(1053, 199, 0xffffff, 95) and isColor(1068, 193, 0xffffff, 95) then
            debugA("收缩队伍")
            tap1(1068, 193, 0xffffff)
        end
        nowTime = os.time()
        timeXXX = nowTime
        return true
    else
        return false
    end
end

-- 每日重置
function everyDayInit(...)
    if nowDateTime.day ~= nowDayNight and nowDateTime.hour >= 23 and nowDateTime.min >= 50 then
        debugA("晚重置")
        nowDayNight = nowDateTime.day
        writeJson("日期晚", nowDayNight)

        -- 今日跑路次数
        numTodayRunAway = 0
        writeJson("今日跑路次数", numTodayRunAway)

        -- 今日开盾次数
        numTodayDefense = 0
        writeJson("今日开盾次数", numTodayDefense)
    end
    -- if numQuanShu ~= 0 then
    -- local tmpXuanXiang = string.find(duoXuan1, "1")
    -- if tmpXuanXiang ~= nil then
    if nowDateTime.day ~= nowDay then
        if nowDateTime.hour >= 9 and nowDateTime.min >= 0 then
            debugA("9点0分重置")

            -- closeApp(appXiangMu)

            isBuyLiZi = true
            numZiYuan = 1
            numKaiFa = 1
            numFangYu = 1
            numShengChan = 1
            numJingRui = 1
            numZhanJian = 1
            isOverHelp = false --协助已完成


            numTodayExit = 0
            writeJson("今日闪退次数", numTodayExit)

            nowDay = nowDateTime.day
            writeJson("日期", nowDay)

            numDay = numDay + 1
            writeJson("第几天", numDay)

            numGuangGao = 0
            writeJson("广告次数", numGuangGao)

            numZiYuanDuiHuan = 0
            writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)

            numChuanShu = 0
            writeJson("传输次数", numChuanShu)

            isTrade = false
            writeJson("交易行", isTrade)

            num5DaoJu = 0
            writeJson("每日5道具", num5DaoJu)

            isMixedThing = false
            writeJson("每日道具合成", isMixedThing)

            numAddChanLiang = 0
            writeJson("增产", numAddChanLiang)

            isAddChanLiangLiZi = false
            writeJson("增产粒子", isAddChanLiangLiZi)

            isAgainReward22 = false
            writeJson("再次收获22", isAgainReward22)

            isAgainReward6 = false
            writeJson("再次收获6", isAgainReward6)

            num60Pirate = 0
            writeJson("60海盗", num60Pirate)

            num3Pirate = 0
            writeJson("每日3海盗", num3Pirate)

            isKaYouHua = false
            writeJson("卡优化", isKaYouHua)

            isZhengLi = false
            writeJson("整理", isZhengLi)

            isEatEXP = false
            writeJson("吃经验", isEatEXP)

            isYanJiuZiYuan = true
            writeJson("研究资源", isYanJiuZiYuan)

            isYanJiuKaiFa = true
            writeJson("研究开发", isYanJiuKaiFa)

            isYanJiuFangYu = true
            writeJson("研究防御", isYanJiuFangYu)

            isYanJiuShengChan = true
            writeJson("研究生产", isYanJiuShengChan)

            isYanJiuJingRui = true
            writeJson("研究精锐", isYanJiuJingRui)

            isYanJiuZhanJian = true
            writeJson("研究战舰", isYanJiuZhanJian)

            isYanJiu = true
            writeJson("研究", isYanJiu)

            numTodayDigKuang = 0
            writeJson("今日矿物次数", numTodayDigKuang)

            numTodayDigJinShu = 0
            writeJson("今日金属次数", numTodayDigJinShu)

            numTodayDigLvQi = 0
            writeJson("今日氯气次数", numTodayDigLvQi)

            numTodayDigLiZi = 0
            writeJson("今日粒子次数", numTodayDigLiZi)

            if haoLV == 3 then
                gaiMuBiaoNewA(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiaoNewA(2, "", mm_Wu)
                gaiMuBiaoNewA(3, "", mm_Wu)
            end

            -- today = tonumber(os.date("%w",os.time()))
            -- if today == 1 then --如果是星期一
            --         if APP1.isZhuZhan == 2 then
            --                 APP1.isZhuZhan = 1
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","助战1",APP1.isZhuZhan)
            --         end
            --         if APP2.isZhuZhan == 2 then
            --                 APP2.isZhuZhan = 1
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","助战2",APP2.isZhuZhan)
            --         end
            --         if APP1.isJiFenDuiHuan == 1 then
            --                 APP1.isJiFenDuiHuan = 0
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","积分兑换1",APP1.isJiFenDuiHuan)
            --         end
            --         if APP2.isJiFenDuiHuan == 1 then
            --                 APP2.isJiFenDuiHuan = 0
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","积分兑换2",APP2.isJiFenDuiHuan)
            --         end
            -- end
            -- closeApp(appXiangMu)
            -- numJiaoSe = 0
            -- writeJson( "角色", numJiaoSe)
            -- huanJiaoSeChongZhi()
            -- timeMaiLan = nowTime
            -- writeJson( "timeMaiLan", timeMaiLan)

            -- isWeiXinWeiHu = false
            -- writeJson( "微信维护", isWeiXinWeiHu)
            -- hourWeiXin = random(10, 22)
            -- minWeiXin = random(1, 50)
            -- writeJson( "时", hourWeiXin)
            -- writeJson( "分", minWeiXin)

            -- gaiMuBiaoNew(1, mb_YouHua, mm_YouHua)
        end
    end
    -- end
    -- end
end

-- 小号判定
function isXiaoHao()
    if haoLV == 1 then
        if isColor(220, 92, 0x6e8598, 95) then
            haoLV = 2
        end
    end
end

-- 识字--数字
-- function ocrNumbers()

-- 请自行更改参数
-- 1: 0,0,0,0 范围坐标，请自行修改
-- 2: "B5B6BD , 4A4A42" 偏色,多组或单组.请在偏色列表中选择
-- 3: 90 匹配精度 【0-100】

-- ret_num = tsOcrText(index_num, 947, 15, 1015, 30, "B5B6BD,4A4A42", 90)
-- debug("粒子:" .. ret_num)

-- end

-- 识数
function OCR_num()
    -- 光学识字
    -- numLiZi = ocrText(947, 15, 1005, 30, 0, "0123456789.")
    -- debug("粒子:" .. numLiZi)

    -- 大漠识字
    -- 相同字库只需要加载一次，重复加载会导致内存溢出
    -- 由于大漠工具的 11 行像素限制，对于较大文字识别效率不高，推荐使用触动字库工具配合触动文字识别函数使用效果更佳
    -- numLiZi = dmOcrText(dm_num, 947, 15, 1017, 30, "D7D7DB , 282824", 90)
    -- debug(numLiZi)

    -- by新版不支持
    -- by.UseDict(dictNum)
    -- numLiZi = by.Ocr(947, 16, 1017, 28, 0xdadade, 0x252521, 0.9) -- 粒子
    -- debug(text)
    -- return text
    -- numLiZi = shiZi(dm_num,947, 16, 1017, 28, 0xdadade,0x252521,85)
    -- debug(numLiZi)
    -- local tmpYinLiang = shiZi(dm_num,87, 522, 769, 542,0xdcdee1,0x333333,85)

    -- 触动识字
    -- numLiZi = tsOcrText(index_cd_num, 947, 15, 1015, 30, "D7D7DB , 282824", 90)
    -- debug(numLiZi)

    -- 百度识字
    -- local pic_name = userPath() .. "/res/baiduAI.jpg"
    -- snapshot(pic_name, 947, 15, 1015, 30)
    -- mSleep(1000)
    -- --tab 参数仅支持 v1.3.3 及其以上版本 TSLib
    -- local tab={
    --     language_type="ENG",
    --     detect_direction="false",
    --     detect_language="false",
    --     paragraph="false",
    --     probability="false",
    --     ocrType = 1
    -- }
    -- local code1, access_token = getAccessToken(baidu_API, baidu_Secret)
    -- if code1 then
    --     -- debug("获取成功:" .. access_token)
    --     local code2, body = baiduAI(access_token, pic_name, tab)
    --     if code2 then
    --         debug("识别成功\n" .. body)
    --     else
    --         debug("识别失败\n" .. body)
    --     end
    -- else
    --     debug("获取失败:" .. access_token)
    -- end
    if haoLV == 3 then
        do
            local temStr = ocrText(645, 14, 711, 30, 0, "0123456789.KM")
            local temNum = 0
            local num1 = string.find(temStr, "K")
            local num2 = string.find(temStr, "M")
            if num1 ~= nil then
                temStr = string.gsub(temStr, "K", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000
                end
            elseif num2 ~= nil then
                temStr = string.gsub(temStr, "M", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000 * 1000
                end
            else
                temNum = 1
            end
            if temNum ~= nil then
                numKuang = temNum
                writeJson("矿物", numKuang)
            end
        end

        do
            local temStr = ocrText(746, 14, 812, 30, 0, "0123456789.KM")
            local temNum = 0
            local num1 = string.find(temStr, "K")
            local num2 = string.find(temStr, "M")
            if num1 ~= nil then
                temStr = string.gsub(temStr, "K", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000
                end
            elseif num2 ~= nil then
                temStr = string.gsub(temStr, "M", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000 * 1000
                end
            else
                temNum = 1
            end
            if temNum ~= nil then
                numJinShu = temNum
                writeJson("金属", numJinShu)
            end
        end

        do
            local temStr = ocrText(844, 14, 914, 30, 0, "0123456789.KM")
            local temNum = 0
            local num1 = string.find(temStr, "K")
            local num2 = string.find(temStr, "M")
            if num1 ~= nil then
                temStr = string.gsub(temStr, "K", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000
                end
            elseif num2 ~= nil then
                temStr = string.gsub(temStr, "M", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000 * 1000
                end
            else
                temNum = 1
            end
            if temNum ~= nil then
                numLvQi = temNum
                writeJson("氯气", numLvQi)
            end
        end

        -- do
        --     local temStr = ocrText(947, 14, 1016, 30, 0, "0123456789.KM")
        --     local temNum = 0
        --     local num1 = string.find(temStr, "K")
        --     local num2 = string.find(temStr, "M")
        --     if num1 ~= nil then
        --         temStr = string.gsub(temStr, "K", "")
        --         temNum = tonumber(temStr)
        --         if temNum ~= nil then
        --             temNum = temNum * 1000
        --         end
        --     elseif num2 ~= nil then
        --         temStr = string.gsub(temStr, "M", "")
        --         temNum = tonumber(temStr)
        --         if temNum ~= nil then
        --             temNum = temNum * 1000 * 1000
        --         end
        --     else
        --         temNum = 1
        --     end
        --     if temNum ~= nil then
        --         numLiZi = temNum
        --         writeJson("粒子", numLiZi)
        --     end
        -- end

        do
            local temStr = ocrText(1050, 14, 1119, 30, 0, "0123456789")
            -- local temNum = 0
            -- local num1 = string.find(temStr, "K")
            -- local num2 = string.find(temStr, "M")
            -- if num1 ~= nil then
            --     temStr = string.gsub(temStr, "K", "")
            --     temNum = tonumber(temStr)
            --     if temNum ~= nil then
            --         temNum = temNum * 1000
            --     end
            -- elseif num2 ~= nil then
            --     temStr = string.gsub(temStr, "M", "")
            --     temNum = tonumber(temStr)
            --     if temNum ~= nil then
            --         temNum = temNum * 1000 * 1000
            --     end
            -- else
            --     temNum = 1
            -- end
            -- if temNum ~= nil then
            --     numCoin = temNum
            --     writeJson("金币", numCoin)
            -- end
            writeJson("金币", temStr)
        end
        -- toast(numKuang .. " " .. numJinShu .. " " .. numLvQi .. " " .. numLiZi .. " " .. numCoin)
    end
end

--建筑升级条件层数
function checkShengJiCengShu()
    numShengJiCengShu = numShengJiCengShu + 1
    if numShengJiCengShu >= 10 then
        if muBiaoA == "优化" then
            gaiMuBiaoNewA(1, "主线")
        elseif muBiaoA == "主线" then
            gaiMuBiaoNewA(1, "挖矿")
        end
        RGB_NoticeBJ = "FFFF00"
        RGB_NoticeFont = "FF0000"
        strNotice = "金属"
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
        mSleep(500)
        getOut()
        numShengJiCengShu = 0
    end
end

-- 兑换检测
function duiHuanJianCe()
    if numDuiHuan ~= "0" and isDuiHuan == false then
        if nowDateTime.hour == tonumber(numDuiHuan) or nowDateTime.hour == tonumber(numDuiHuan) + 8 or
            nowDateTime.hour ==
            tonumber(numDuiHuan) + 8 * 2 then
            if muBiaoA3 == "" and muBiaoA2 == "" then
                gaiMuBiaoNewA(2, "兑换")
                gaiMuBiaoNewA(3, "钱包检测")
            end
        end
    end
end

-- 兑换
function duiHuan()

end

--自动切换梯子
function autoChangeVPN(model)
    if check21 == "自动切换梯子" then
        if model == "配置" then
            ShadowrocketToConfigure()
            strVpnModel = "配置"
            timeXXX = nowTime
        elseif model == "场景" then
            ShadowrocketToScenes()
            strVpnModel = "场景"
            timeXXX = nowTime
        end
    end
end

--活动中心--细节
function huoDongDetail()
    if isColor(1084, 83, 0x9e1111, 95) then
        debugA("规则")
        tap1(1032, 103, 0x0b7148)
    elseif isColor(250, 420, 0x18407f, 95) and isColor(307, 401, 0x9e1111, 95) then
        debugA("og精锐怪物狂欢")
        tap1(250, 420)
    elseif isColor(783, 560, 0x5966f2, 95) and isColor(944, 558, 0x1a77f3, 95) then
        debugA("STAKING")
        tap1(944, 558, 0x1a77f3)
    elseif isColor(902, 175, 0x116eb9, 95) and isColor(1009, 176, 0x168961, 95) then
        debugA("预定活动")
        tap1(88, 182, 0x182637)
    elseif isColor(996, 281, 0xf18e07, 95) then
        debugA("领取1--新1")
        tap1(1000, 281)
    elseif isColor(956, 270, 0xc97123, 95) and isColor(836, 162, 0xf08e03, 95) and isColor(1097, 313, 0xc97123, 95) then
        debugA("领取1--新2")
        tap1(1028, 293, 0xca7123)
    elseif isColor(1000, 258, 0x116eb9, 95) then
        debugA("领取1")
        tap1(1000, 267)
    elseif isColor(1000, 353, 0x116eb9, 95) then
        debugA("领取2")
        tap1(1000, 360)
    elseif isColor(1000, 449, 0x116eb9, 95) then
        debugA("领取3")
        tap1(1000, 456)
    elseif isColor(1000, 544, 0x126fba, 95) then
        debugA("领取4")
        tap1(1000, 551)
    elseif isColor(1006, 419, 0x116eb9, 95) then
        debugA("领取--中间")
        tap1(1000, 419)
    elseif isColor(905, 158, 0x931012, 95) then
        debugA("战斗力--红点")
        tap1(836, 173, 0x12253a)
    elseif isColor(329, 492, 0x1c6ebb, 95) then
        debugA("使用--遗物")
        tap1(329, 492)
    elseif isColor(297, 497, 0xd68b01, 95) then
        debugA("领取--黄色")
        tap1(297, 497)
    end
end

function plistToJson()
    local tb = plist_ts.read(userPath() .. "/lua/" .. xiangMu .. ".plist") --读取plist至table格式
    if tb ~= "" and tb ~= nil then
        local jsonstring = json_ts.encode(tb);  --将 table 格式数据转成 json 格式数据
        if jsonstring ~= "" and jsonstring ~= nil then
            bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json", jsonstring) --写入文件
        end
    end
end

-----------------------项目2--------------------------

-- 综合2
function zongHe2()
    changePkMode()
    -- if isColor(584, 265, 0xffffff, 95) and isColor(921, 220, 0xbd1f0a, 95) then
    --     debug("登录界面")
    --     tap1(558, 404)
    -- end
    -- if isColor(465,381,0x00b9f0,95) and isColor(668,427,0x00a2d1,95) and isColor(603,407,0x00263f,95) then
    --     debug("无法连接服务器")
    --     tap1(551,404)
    -- end
    if isColor(413, 381, 0xeb0000, 95) and isColor(627, 381, 0x00a0ef, 95) and isColor(557, 208, 0xb7bcc1, 95) and
        isColor(582, 226, 0x7e848c, 95) and (muBiaoA == "采集" or muBiaoA == "去采集点") then
        debugA("误开离开")
        tap1(451, 406, 0x734d45)
    end
    if isColor(166, 396, 0x0090bf, 95) and isColor(370, 403, 0xd3b301, 95) and isColor(575, 408, 0x36c400, 95) then
        debugA("误开告知")
        tap1(967, 213, 0xffffff)
    end
    if isColor(142, 25, 0xa5eb30, 95) and isColor(156, 32, 0x7bdd23, 95) and isColor(531, 38, 0xffffff, 95) then
        debugA("误开聊天框")
        tap1(531, 38, 0xffffff)
    end
    if isColor(438, 449, 0x008dbe, 95) and isColor(690, 484, 0x008ab8, 95) and isColor(559, 462, 0xccd4d9, 95) then
        debugA("奖励发放--关闭")
        tap1(559, 462, 0xccd4d9)
    end
    if isColor(47, 257, 0xf7f6f7, 95) and isColor(91, 290, 0x4592c2, 95) then
        debugA("菜单界面")
        if isColor(17, 426, 0xbf3f2f, 95) and isColor(38, 443, 0xf7f7f7, 95) then
            debugA("称号--红点")
            tap1(36, 442, 0xf7f8f7)
            -- elseif isColor(1113, 238, 0xbe3e2e, 95) and isColor(1097, 259, 0x1b1d28, 95) then
            --     debug("图鉴--红点")
            --     tap1(1097, 259)
            --     if isColor(945, 114, 0xbe3e2e, 95) then
            --         debug("怪物图鉴")
            --         tap1(930, 130, 0x2d313a)
            --     -- elseif isColor(944, 238, 0xbe3e2e, 95) then
            --     --     debug("道具图鉴")
            --     --     tap1(926, 252, 0x636468)
            --     else

            --     end
        elseif isColor(17, 177, 0xbe3e2e, 95) and isColor(46, 178, 0xfdfdfd, 95) then
            debugA("活动--红点")
            tap1(38, 196, 0xcecfd1)
            if isColor(186, 178, 0xbe3e2e, 95) then
                debugA("进行中活动--红点")
                tap1(214, 196, 0x66686e)
            end
        elseif isColor(17, 240, 0xbe3e2e, 95) and isColor(29, 244, 0xfcfcfc, 95) then
            debugA("任务--红点")
            tap1(29, 244, 0xfcfcfc)
            if isColor(186, 115, 0xbe3e2e, 95) then
                debugA("目标与成就--红点")
                tap1(214, 130, 0x40414a)
            end
            -- elseif isColor(17, 115, 0xbe3e2e, 95) then
            --     debug("英雄管理--红点")
            --     tap1(43, 136, 0x7e8189)
            --     if isColor(186, 240, 0xbe3e2e, 95) then
            --         debug("技能--红点")
            --         tap1(186, 240)
            --     elseif isColor(186, 177, 0xbe3e2e, 95) then
            --         debug("装备--红点")
            --         tap1(207, 192, 0xd6d6d8)
            --     end
            -- elseif isColor(1114, 175, 0xbe3e2e, 95) and isColor(1100, 186, 0xfcfcfc, 95) then
            --     debug("好友--红点")
            --     tap1(1100, 186, 0xfcfcfc)
        else
            timeXuanDanRed = nowTime
            tap1(558, 578, 0x454e56)
        end
    end
    if isColor(89, 21, 0x8697a6, 95) and isColor(86, 38, 0x92a5b5, 95) and isColor(122, 23, 0x7d8d99, 95) and
        isColor(124, 38, 0x899dac, 95) then
        debugA("好友界面")
        if isColor(331, 259, 0xcd0000, 95) then
            debugA("拒绝")
            tap1(380, 258, 0x391414)
            tap1(603, 402, 0x3d0f07)
        else
            x, y = findColorInRegionFuzzy(0xbe3e2e, 90, 0, 84, 890, 84)
            if x > 0 then
                tap1(x, y)
            else
                tap1(20, 20)
            end
        end
    end
    if isColor(367, 543, 0x0088db, 95) and isColor(1000, 111, 0x62c400, 95) then
        debugA("怪物图鉴界面")
        x, y = findColorInRegionFuzzy(0xbe3e2e, 90, 30, 99, 30, 585)
        if x > 0 then -- 如果在指定区域找到某点符合条件
            tap1(145, 601, 0xf9f9f9) --批量处理
            mSleep(1000)
            tap1(572, 393, 0x5e7484) --确认
        else
            tap1(20, 20)
        end
    end
    if isColor(426, 119, 0xdae1e1, 95) and isColor(1090, 108, 0x01e6fa, 95) and isColor(737, 603, 0x8af92a, 95) then
        debugA("装备管理界面")
        if isColor(551, 93, 0xbe3e2e, 95) then
            debugA("能力值--红点")
            tap1(519, 116, 0x4d5152)
        else
            tap1(20, 20)
        end
    end
    if isColor(424, 137, 0xdbdddd, 95) and isColor(519, 137, 0x4b4d52, 95) and isColor(875, 178, 0x616a6f, 95) then
        debugA("能力值界面")
        if isColor(718, 201, 0xbe3e2e, 95) then
            debugA("剩余点数--红点")
            if isColor(711, 388, 0x850e0e, 95) then
                debugA("推荐智力")
                for i = 1, 100, 1 do
                    tap1(1003, 405, 0x82fd2c) -- +号
                    if isColor(1003, 405, 0x82fd2c, 95) == false then
                        break
                    end
                end
                tap1(869, 528, 0x6d6d6e) --强化
            end
        else
            tap1(20, 20)
        end
    end
    if isColor(25, 55, 0x72cb04, 95) and isColor(150, 51, 0x71c903, 95) and isColor(98, 41, 0xe5e6e4, 95) then
        debugA("优惠界面")
        if isColor(141, 37, 0xbe3e2e, 95) then
            debugA("优惠--红点")
            if isColor(262, 458, 0xbe3e2e, 95) and isColor(236, 447, 0x1a92c3, 95) then
                debugA("在线礼包--选中")
                x, y = findColorInRegionFuzzy(0xf79700, 90, 313, 555, 1060, 555)
                if x > 0 then -- 如果在指定区域找到某点符合条件
                    touchQuickly(x, y + 10)
                    mSleep(2000)
                    -- tap1(x, y - 78)--广告
                else
                    touchMoveXY(1096, 483, 387, 100)
                    x, y = findColorInRegionFuzzy(0xf79700, 90, 313, 555, 1060, 555)
                    if x > 0 then -- 如果在指定区域找到某点符合条件
                        touchQuickly(x, y + 10)
                        mSleep(2000)
                        -- tap1(x, y - 78)--广告
                    end
                end
            elseif isColor(262, 173, 0xbe3e2e, 95) and isColor(242, 164, 0x1d9fd5, 95) then
                debugA("story--选中")
                x, y = findColorInRegionFuzzy(0x7ed703, 90, 930, 338, 930, 612)
                if x > 0 then -- 如果在指定区域找到某点符合条件
                    touchQuickly(x + 10, y)
                end
            elseif isColor(262, 458, 0xbe3e2e, 95) and isColor(236, 447, 0x1a92c3, 95) == false then
                debugA("在线礼包--未选中")
                tap1(176, 479, 0x06243d)
            elseif isColor(262, 173, 0xbe3e2e, 95) and isColor(242, 164, 0x1d9fd5, 95) == false then
                debugA("story--未选中")
                tap1(224, 196, 0x06253e)

            end
        else
            tap1(1092, 45, 0xffffff)
        end
    end
    if isColor(161, 237, 0x95a4ad, 95) and isColor(1003, 49, 0xffffff, 95) and isColor(141, 43, 0xe6e8e9, 95) then
        debugA("目标与成就界面")
        if isColor(863, 178, 0xbe7d00, 95) then
            debugA("全部领取")
            tap1(922, 176, 0x706955)
        else
            x, y = findColorInRegionFuzzy(0xbe3e2e, 90, 333, 89, 1011, 89) --找红点
            if x > 0 then -- 如果在指定区域找到某点符合条件
                touchQuickly(x, y + 10)
            else
                tap1(1002, 49, 0xffffff) --关闭
            end
        end
    end
    if isColor(440, 543, 0x5b6577, 95) and isColor(683, 590, 0x535b6d, 95) and isColor(398, 51, 0xf1e4c3, 95) then
        debugA("召唤成功")
        tap1(571, 571, 0x777e8d)
    end
    if isColor(28, 25, 0xfdfefe, 95) and isColor(992, 495, 0x696969, 95) and isColor(993, 355, 0x727272, 95) then
        debugA("坐骑界面")
        if isColor(791, 563, 0xbe3e2e, 95) then
            debugA("召唤--红点")
            tap1(922, 589, 0x728693)
        else
            tap1(20, 20)
        end
    end
    if isColor(525, 546, 0xac190b, 95) and isColor(637, 527, 0x3c4752, 95) then
        debugA("任务详情--bug")
        tap1(801, 85)
    end
    if isColor(340, 85, 0xd05a55, 95) and isColor(415, 84, 0xaf4e4d, 95) and isColor(800, 84, 0xffffff, 95) then
        debugA("支线详情")
        if isColor(596, 549, 0x324f6b, 95) then
            debugA("任务完成")
            tap1(596, 549, 0x324f6b)
        else
            tap1(799, 85, 0xffffff)
        end
    end
    if isColor(524, 548, 0x451b1a, 95) and isColor(537, 548, 0x463e2f, 95) then
        debugA("任务详情")
        if isColor(642, 528, 0x3c4753, 95) then
            -- debug("进行中--灰色")
            local temStr = ocrText(366, 71, 548, 92, 0, "0123456789.")
            if temStr ~= nil then
                debugA("temStr:" .. temStr)
                if temStr == "48." then
                    debugA("任务48.")
                    tap1(800, 84, 0xffffff)
                    tap1(968, 575, 0xd6c0a5)
                elseif temStr == "52." then
                    debugA("任务52.")
                    tap1(800, 84, 0xffffff)
                    tap1(1095, 446, 0xc23730)
                end
            end
        elseif isColor(688, 527, 0x007ea9, 95) then
            debugA("完成")
            tap1(683, 544, 0x26455a)
        end
    end
    if isColor(274, 240, 0x8e3ab0, 95) and isColor(274, 331, 0x953ab6, 95) and isColor(273, 422, 0x9238b0, 95) then
        debugA("技能管理强化")
        if isColor(615, 562, 0xdb2b05, 95) then
            debugA("可强化")
            tap1(565, 587, 0x110300)
            tap1(640, 404, 0x00203d)
        else
            tap1(20, 20)
        end
    end
    if isColor(621, 135, 0xf24833, 95) and isColor(723, 199, 0xf9efb1, 95) and isColor(516, 583, 0x913227, 95) and
        isColor(608, 579, 0x2b435a, 95) then
        debugA("老练的隐忍银蟾")
        tap1(608, 579, 0x2b435a)
    end
    if isColor(8, 153, 0xe3d4bb, 95) and isColor(260, 204, 0xf0e3cb, 95) and isColor(27, 25, 0xffffff, 95) then
        debugA("指引--退出")
        tap1(27, 25, 0xffffff)
    end
    if isColor(1090, 605, 0xb07705, 95) and isColor(1098, 608, 0xa26e07, 95) and isColor(1017, 614, 0xedd293, 95) then
        debugA("跳过对话")
        tap1(1042, 418, 0x807e70)
    end
    if isColor(465, 543, 0x960000, 95) and isColor(681, 543, 0x007ea9, 95) then
        debugA("受到攻击")
        tap1(461, 562, 0xc4a391) --不审判
    end
    if isColor(430, 328, 0x966500, 95) and isColor(713, 329, 0x0080b2, 95) then
        debugA("复活")
        isTapTask = false
        writeJson("点任务", isTapTask)
        tap1(714, 352, 0x808b6e)
        isDead = true
        numDead = numDead + 1
        if numDead >= 5 then
            if numCollect == "采集点1" then
                numCollect = "采集点3"
            elseif numCollect == "采集点3" then
                numCollect = "采集点2"
            elseif numCollect == "采集点2" then
                numCollect = "采集点4"
            elseif numCollect == "采集点4" then
                numCollect = "采集点1"
            end
            numDead = 0
        end
        if muBiaoA == "采集" then
            gaiMuBiaoNewA(1, "去采集点")
        elseif muBiaoA == "挂机" then
            gaiMuBiaoNewA(1, "去挂机点")
        end
    end
    if isColor(437, 436, 0x0078a4, 95) and isColor(698, 431, 0x0078a4, 95) and isColor(447, 417, 0x00243a, 95) and
        isColor(687, 451, 0x002740, 95) then
        debugA("增强")
        tap1(574, 432, 0x90a0aa)
    end

    if isColor(778, 576, 0x8c5900, 95) and isColor(885, 582, 0x0087a4, 95) and isColor(926, 585, 0x002a3e, 95) then
        debugA("角色选择")
        tap1(925, 578, 0x00293d)
    end
    if isColor(926, 341, 0xa3ea30, 95) and isColor(948, 353, 0x74db22, 95) and isColor(789, 540, 0x162f2e, 95) then
        debugA("云打码")
        mSleep(5000)
        local strDaMa = yunDaMaNew(op, 234, 207, 855, 485)
        if strDaMa ~= false then
            debugA("识别成功")
            tap1(456, 539, 0x0e1118)
            mSleep(1000)
            inputText(strDaMa)
            mSleep(2000)
            tap1(1027, 603, 0x000000)
            mSleep(2000)
            tap1(760, 540, 0x253d3c)
        end
    end
end

-- 城内
function inside2()

end

-- 检查红点
function checkRed2()
    if isOutside() and muBiaoA ~= "采集" then
        if nowTime - timeXuanDanRed >= 60 * 10 and isColor(794, 13, 0xc04131, 95) then
            debugA("选单--红点")
            tap1(777, 31, 0xffffff)
            timeXuanDanRed = nowTime
        end
    end
end

-- 在线脚本
function zhaojunlua()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/zhaojun.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        toast("删除失败，失败原因：" .. msg, 1)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
    local temRet = ftpDownTSnet("/Lua/zhaojun.lua", userPath() .. "/lua/zhaojun.lua")
    if temRet then
        toast("FTP下载成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/zhaojun.lua", luaFile, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            -- httpDown("https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars@main/riseOfStars.lua", "/var/mobile/Media/TouchSprite/lua/riseOfStars.lua")
            if code == 200 then
                toast("Github下载成功", 1)
                mSleep(1000)
                break
            else
                tiaoShi("下载失败：" .. msg)
                mSleep(1000)
            end
        end
    end
end

--doTarget2
function doTarget2()
    if muBiaoA == "" then
        if numHaoLV == "小号" then
            gaiMuBiaoNewA(1, "主线")
        elseif numHaoLV == "成品号" then
            gaiMuBiaoNewA(1, "主线")
        elseif numHaoLV == "大号" then
            gaiMuBiaoNewA(1, "主线")
        end
    elseif muBiaoA == "挂机" then

    elseif muBiaoA == "主线" then
        task_zhuXian()
    elseif muBiaoA == "采集" then
        collect()
    elseif muBiaoA == "去采集点" then
        goCollectPlace()
    end
    -- debug("目标："..muBiao)
end

--主线
function task_zhuXian()
    if isOutside() then
        if isTapTask == false then
            tap1(41, 170, 0x326532)
            isTapTask = true
            writeJson("点任务", isTapTask)
        end
        -- if nowTime - timeTask_ZhuXian >= 10 then
        --     timeTask_ZhuXian = nowTime
        --     tap1(41, 170, 0x326532)
        -- end
    end
end

--指引
function zhiYin()
    if numHaoLV == "小号" and muBiaoA ~= "采集" then
        x, y = findMultiColorInRegionFuzzy(0xdecfb5, "-57|-65|0xf1e5cf,198|-11|0xe2d2b9", 90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在上--左" .. numUpLeft)
            tap1(x + 5, y + 30)
            numUpLeft = numUpLeft + 1
            if numUpLeft >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numUpLeft = 0
            end
        end
        x, y = findMultiColorInRegionFuzzy(0xdecfb5, "-198|-64|0xefe2ca,58|-12|0xe1d1b9", 90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在上--右" .. numUpRight)
            tap1(x - 5, y + 30)
            numUpRight = numUpRight + 1
            if numUpRight >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numUpRight = 0
            end
        end

        x, y = findMultiColorInRegionFuzzy(0xdeceb5, "-58|10|0xe2d2b9,198|64|0xefe2ca", 90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在下--左" .. numDownLeft)
            tap1(x + 5, y - 30)
            numDownLeft = numDownLeft + 1
            if numDownLeft >= 5 then
                screenClickNew(x, y, 0xdeceb5)
                numDownLeft = 0
            end
        end
        x, y = findMultiColorInRegionFuzzy(0xdecfb5, "58|63|0xefe2ca,-197|11|0xe1d1b9", 90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在下--右" .. numDownRight)
            tap1(x - 5, y - 30)
            numDownRight = numDownRight + 1
            if numDownRight >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numDownRight = 0
            end
        end
        if isColor(1000, 6, 0x528ba5, 95) and isColor(1131, 52, 0x64a0bf, 95) and isColor(1058, 22, 0xc0c0c0, 95) then
            debugA("跳过任务")
            tap1(1058, 22)
        end
    end
end

--采集
function collect()
    if isInside() then
        if isColor(605, 583, 0xfcfdfe, 95) == false and isColor(621, 583, 0xf6fcfd, 95) == false then
            -- debug("采集")
            tap1(605, 583)
        end
        if isColor(653, 450, 0x144309, 90) then
            -- debug("采集中")
            mSleep(2000)
            if isColor(653, 450, 0x144309, 90) then
                debugA("采集--卡bug")
                tap1(612, 572, 0xd1d5d9)
                isCollectBug = true
                gaiMuBiaoNewA(1, "去采集点")
            end
        end
        if isColor(502, 447, 0x31e605, 95) then --采集条--绿色
            timeCollectBug = nowTime
        end
        if nowTime - timeCollectBug >= 60 then
            timeCollectBug = nowTime
            debugA("采集--卡bug")
            tap1(612, 572, 0xd1d5d9)
            isCollectBug = true
            gaiMuBiaoNewA(1, "去采集点")
        end
    end
end

--去采集点
function goCollectPlace()
    if isInside() then
        tap1(1061, 95, 0x37cd12) --打开地图
        mSleep(1000)
        if numCollect == "采集点1" then
            tap1(714, 255, 0x3e454c) --采集点1
            tap1(1028, 255, 0x3f4550) --移动
            numGoCollectPlace = 20
        elseif numCollect == "采集点2" then
            tap1(714, 307, 0x3e454c)
            tap1(1028, 307, 0x3f4550)
            numGoCollectPlace = 15
        elseif numCollect == "采集点3" then
            tap1(714, 360, 0x3e454c)
            tap1(1028, 360, 0x3f4550)
            numGoCollectPlace = 35
        elseif numCollect == "采集点4" then
            tap1(714, 411, 0x3e454c)
            tap1(1028, 411, 0x3f4550)
            numGoCollectPlace = 15
        end
        tap1(438, 384, 0x322709) --普通移动
        if isCollectBug == true then
            mSleep(3 * 1000)
            isCollectBug = false
        else
            mSleep(numGoCollectPlace * 1000)
        end
        gaiMuBiaoNewA(1, "采集")

    end
end

--战斗界面
function isWar()
    if isColor(177, 67, 0xc8c8c8, 95) and isColor(774, 31, 0xf7f7f7, 95) then
        -- debug("战斗界面")
        return true
    else
        return false
    end
end

--副本内
function isInside()
    if isWar() then
        if isColor(767, 142, 0xf9f9f9, 95) and isColor(769, 154, 0xf1f2f1, 95) then
            -- debug("副本内")
            return true
        end
    end
end

--副本外
function isOutside()
    if isWar() then
        if isColor(767, 142, 0xf9f9f9, 95) == false and isColor(769, 154, 0xf1f2f1, 95) == false then
            -- debug("副本外")
            return true
        end
    end
end

--PK模式
function pkMode()
    if isWar() then
        if isColor(39, 48, 0xdae0e0, 95) then
            return "和平模式"
        elseif isColor(43, 41, 0xbbd8e8, 95) then
            return "审判模式"
        elseif isColor(44, 42, 0xc3b695, 95) then
            return "结义模式"
        elseif isColor(44, 16, 0xf69c81, 95) then
            return "杀戮模式"
        end
    end
end

-- 改变pk模式
function changePkMode()
    if pkMode() == "审判模式" or pkMode() == "结义模式" or pkMode() == "杀戮模式" then
        tap1(40, 47) --PK模式
        mSleep(1000)
        if isColor(25, 103, 0xa25f2f, 95) == false then
            tap1(40, 47) --PK模式
            mSleep(1000)
        end
        tap1(130, 228, 0x6d6e75) --和平
        mSleep(1000)
        tap1(40, 47) --PK模式
    end
end

--掉线检测
function checkDropline()
    if isColor(582, 261, 0x696969, 95) and isColor(920, 222, 0x500e04, 95) then
        for i = 1, 10, 1 do
            if isColor(582, 261, 0x696969, 95) == false and isColor(920, 222, 0x500e04, 95) == false then
                break
            end
            if i == 10 then
                debugA("掉线")
                closeApp(appXiangMu)
            end
            mSleep(3000)
        end
    end
end

-- 5分钟不见某界面
function checkXXX2(...)
    nowTime = os.time()
    if isWar() then
        timeXXX = nowTime
        return
    end
    if nowTime - timeXXX >= 5 * 60 then
        -- if nowTime - timeXXX >= 20 then
        current_time = os.date("%m-%d_%H.%M", os.time());
        snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
        ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
        closeApp(appXiangMu)
        nowTime = os.time()
        timeXXX = nowTime
        -- zhuXiaoNew()
        return
    end
end

--定时检测
function timeJianCe2()
    if nowTime - timeOcrLevel >= 60 and isWar() then
        do
            local temStr = ocrText(122, 52, 148, 70, 0, "0123465789")
            if temStr ~= nil then
                temStr = tonumber(temStr)
                if type(temStr) == "number" then
                    toast(temStr)
                    numLevel = temStr
                    writeJson("等级", numLevel)
                end
            end
        end
        timeOcrLevel = nowTime
    end
end

-----------------------项目3--------------------------
function main3()
    nowTime = os.time();

    windowsDecide()
    if isLuaStart == false then
        timeXXX = nowTime
        return
    end
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))
    muBiaoZhuanHuanNewC() -- 公用 必须最优先
    -- if version ~= "2.2.4" then
    --     if getBacklightLevel() ~= 0.5 then
    --         setBacklightLevel(0.5);
    --     end
    -- end
    bid = frontAppBid()
    -- debug("bid:"..bid)
    if bid == appXiangMu then
        -- debug("apps1"..apps1)
        APP = APP1
    elseif bid == apps2 then
        -- debug("apps2"..apps2)
        APP = APP2
        -- elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
        --     nowDateTime.min >= minWeiXin then
    elseif bid == "com.apple.DocumentsApp" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "com.readdle.ReaddleDocsIPad" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "com.apple.mobileslideshow" then
        setRotationLockEnable(false);
        init(1)
    else
        -- elseif bid == "" then
        debugC("哪个都没开")
        APP.isYiDengLu = 0
        runApp(appXiangMu)
        APP = APP1
        mSleep(1000)
        if isColor(924, 39, 0xc3570e, 95) then
            tap1(1089, 47, 0xffffff)
        else
            mSleep(1000 * 14)
        end
    end
    m_iRunCount = m_iRunCount + 1
    -- return 1
    -- local numStr1 = dmOcrText(index_dm_numNumber, 61, 405, 1049, 426, "DCD7D9,232826", 95)
    -- local numStr2 = dmOcrText(index_dm_numNumber, 61, 520, 1049, 544, "DCD7D9,232826", 95)
    -- debug(numStr1)
    -- mSleep(100)
    -- debug(numStr2)
    -- lua_exit()
    -- loadTime(516, 400, 708, 427)
    isFarm()
    if check4 == "测试" then
        ScanPlace()
        checkPlace()
        other()
    end
    zongHe3()
    time_task()
    sell()
    -- findFarm()
    findHouse()
    -- autoVpn()
    autoUnlockDevice()
    -- zongHe_Mult()
    -- zongHe_Screen()
    if check4 ~= "测试" then
        doTarget3()
    end
    -- timeChongZhi()
    -- checkXXX()
    everyDayInit3()
    -- checkXXX2()
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()

end

function zongHe3()
    if isColor(499,516,0x323232,95) and isColor(500,554,0x4b4b4b,95) and isColor(641,549,0x4f4f4f,95) then
        debugC("灰色cook")
        tap1(733,97)
        tap1(1088,141) 
    end
    if isColor(532,539,0x9f9f9f,95) and isColor(575,535,0xffffff,95) and isColor(501,536,0x393939,95) and isColor(664,548,0x575757,95) then
        debugC("灰色Ovenisfull")
        tap1(733,97)
        tap1(1088,141) 
    end
    if isColor(489,564,0x4c4c4c,95) and isColor(557,411,0xbb6e11,95) and isColor(600,531,0xffffff,95) then
        debugC("灰色cooking")
        tap1(733,97)
        tap1(1088,141)

    end
    if isColor(75,52,0xea4949,95) and isColor(426,26,0x64434f,95) and isColor(72,41,0xea8395,95) and checkCook=="烹饪" then --餐厅界面并且打勾选烹饪
        debugC("restaurant")    
        gaiMuBiaoNewC(3, "烹饪") 
        debugC("改目标为烹饪")  
    end
    if isColor(435, 483, 0x6a6a6a, 95) and isColor(724, 106, 0xffffff, 95) then
        debugC("误开材料不足")
        tap1(724, 106)
    end
    if isColor(522, 593, 0xebe3d2, 95) then
        debugC("误开实景界面2")
        tap1(522, 593)
    end
    if isColor(592, 585, 0xbd3724, 95) then
        debugC("误开请求支援")
        tap1(592, 585, 0xbd3724)
    end
    if isColor(505, 389, 0x686868, 95) and isColor(565, 319, 0xd6c5a1, 95) then
        debugC("Server--OK 卡死")
        closeApp(appXiangMu)
    end
    if isColor(413, 372, 0xe65340, 95) and isColor(638, 375, 0x78bf1b, 95) and isColor(417, 306, 0x38ad19, 95) and
        isColor(434, 293, 0x80dcdf, 95) then
        debugC("拒绝支援")
        tap1(638, 375, 0x78bf1b)
    end
    if isColor(425, 272, 0xcc483a, 95) and isColor(494, 358, 0x83ba5d, 95) and isColor(645, 388, 0x63a547, 95) then
        debugC("无法购买该商品")
        tap1(645, 388, 0x63a547)
    end
    if isColor(477, 319, 0xf8b841, 95) and isColor(499, 430, 0x686868, 95) and isColor(665, 320, 0xf8b841, 95) and
        isColor(640, 427, 0x6a6a6a, 95) then
        debugC("Server")
        tap1(486, 321, 0xf8b740)
    end
    if isColor(472, 317, 0x9b775a, 95) and isColor(498, 426, 0x73b153, 95) and isColor(650, 316, 0x9d785a, 95) and
        isColor(646, 440, 0x66a749, 95) then
        debugC("Server--OK")
        tap1(646, 440, 0x66a749)
    end
    if isColor(379, 260, 0xffe06b, 95) and isColor(397, 177, 0xa4ee4e, 95) and isColor(132, 610, 0xe25665, 95) then
        debugC("Loading 卡住")
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "Loading", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        for i = 1, 60, 1 do
            if isColor(379, 260, 0xffe06b, 95) == false then
                break
            end
            mSleep(1000)
            if i == 60 then
                closeApp(appXiangMu)
            end
        end
    end
    if isColor(56, 50, 0xbe3934, 95) and isColor(30, 68, 0xf7f4e7, 95) and isColor(1088, 143, 0xffffff, 95) then
        debugC("误开My home")
        tap1(1088, 143)
    end
    if isColor(92, 49, 0xb1e47d, 95) and isColor(95, 44, 0x8df3f7, 95) and isColor(58, 62, 0xd94b37, 95) and
        isColor(1058, 142, 0xffffff, 95) then
        debugC("误开Quest")
        tap1(1058, 142)
    end
    if isColor(109, 42, 0x31b2d0, 95) and isColor(123, 62, 0xfe859d, 95) and isColor(1026, 63, 0xffffff, 95) then
        debugC("误开Exchance")
        tap1(1026, 63)
    end
    if isColor(34, 37, 0x935a1e, 95) and isColor(23, 35, 0xe6d27e, 95) and isColor(1089, 141, 0xffffff, 95) then
        debugC("误开Box Shop")
        tap1(1089, 141)
    end
    if isColor(62, 31, 0xc22d00, 95) and isColor(59, 60, 0x148d6d, 95) and isColor(1089, 141, 0xffffff, 95) then
        debugC("误开Union Shop")
        tap1(1089, 141)
    end
    if isColor(64, 284, 0xf4e8b3, 95) and isColor(45, 313, 0xea505a, 95) and isColor(1086, 301, 0xffffff, 95) then
        debugC("误开Storage")
        tap1(1086, 301)
    end
    if isColor(256, 95, 0xffca56, 95) and isColor(285, 71, 0xf1eddd, 95) and isColor(851, 96, 0xffffff, 95) then
        debugC("误开Option")
        tap1(851, 96)
    end
    if isColor(263, 42, 0xfdda4e, 95) and isColor(292, 78, 0x895730, 95) and isColor(883, 65, 0xffffff, 95) then
        debugC("Quick")
        tap1(883, 65)
    end
    if isColor(46, 192, 0xd6a263, 95) and isColor(44, 211, 0xffebe6, 95) and isColor(71, 194, 0x7e5242, 95) then
        debugC("误开Friends")
        tap1(1085, 210, 0xffffff)
    end
    if isColor(20, 45, 0xd74427, 95) and isColor(29, 46, 0xfcfbfb, 95) and isColor(28, 30, 0xbe8966, 95) then
        debugC("误开shop")
        tap1(1087, 50, 0xffffff)
    end
    if isColor(41, 47, 0x8495b7, 95) and isColor(68, 28, 0xe13537, 95) and isColor(115, 42, 0x5c3d48, 95) then
        debugC("误开my house")
        tap1(1088, 141, 0xffffff)
    end
    if isColor(438, 507, 0x62a547, 95) and isColor(724, 107, 0xffffff, 95) and isColor(725, 94, 0x78595f, 95) then
        debugC("误开地块详细信息")
        tap1(724, 107)
    end
    if isColor(794, 530, 0x69a94b, 95) and isColor(868, 540, 0xc4956f, 95) then
        debugC("Hot sale")
        tap1(868, 540, 0xc4956f)
    end
    if isColor(144, 111, 0x7abf2e, 95) and isColor(166, 97, 0xf9d859, 95) and isColor(1034, 62, 0xffffff, 95) then
        debugC("Notice")
        tap1(1034, 62)
    end
    if isColor(655, 626, 0x64a442, 95) and isColor(479, 629, 0xcaa07e, 95) then
        debugC("误开种植界面")
        tap1(655, 626)
    end
    if isColor(724, 106, 0xffffff, 95) and isColor(441, 495, 0x6aaa4c, 95) then
        debugC("误开剩余时间")
        tap1(724, 106)
    end
    if isColor(658, 633, 0x60a13f, 95) and isColor(482, 632, 0x689ad3, 95) then
        debugC("搬迁画面")
        tap1(658, 633, 0x60a13f)
    end
    if isColor(584, 90, 0xbd3935, 95) and isColor(860, 200, 0x6fae50, 95) and isColor(843, 200, 0xe4d9c3, 95) then
        debugC("云打码")
        if isColor(626, 624, 0xffffff, 95) == false then
            tap1(766, 142, 0xffffff)
        end
        local strDaMa = yunDaMaNew(op, 156, 45, 539, 217)
        if strDaMa ~= false then
            debugC("识别成功")
            inputText(strDaMa)
            mSleep(2000)
            tap1(875, 199, 0x6fae50)
            mSleep(2000)
        end
    end
    if isColor(592, 451, 0x85bb5f, 95) and isColor(905, 476, 0x6dac4f, 95) and isColor(784, 468, 0xffffff, 95) then
        debugC("对话")
        tap1(784, 468, 0xffffff)
        tap1(423, 27, 0x79942f) --四叶草
        if isColor(1089, 46, 0xffffff, 95) then
            tap1(1089, 46)
            -- else
            --     runApp(appCalculator)
            --     lua_restart()
            --     mSleep(1000)
        end
    end
    if isColor(1046, 245, 0xd8420c, 95) and isColor(1074, 138, 0xaec816, 95) then
        debugC("邮箱红点")
        tap1(1080, 263, 0xe26060)
    end
    if isColor(109, 66, 0xd94344, 95) and isColor(167, 61, 0x5b3c47, 95) then
        debugC("邮箱界面")
        if isColor(957, 166, 0x73b052, 95) then
            debugC("OK")
            tap1(957, 166)
        elseif isColor(945, 18, 0xda450c, 95) then
            debugC("公告红点")
            tap1(911, 44, 0xbbbcbd)
        else
            debugC("关闭")
            tap1(1036, 67, 0xffffff)
        end
    end
end

--农场判断
function isFarm()
    if nowTime - timeDecideIsFarm >= 20 then
        timeDecideIsFarm = nowTime
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "isFarm", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        for i = 1, 120, 1 do
            bugFor()
            if isColor(34, 557, 0xec6f8e, 95) and isColor(59, 568, 0x7e5242, 95) and isColor(55, 583, 0xffe3d9, 95) then
                -- debugC("isFarm判断")
                break
            elseif isColor(1089, 46, 0xffffff, 95) and isColor(1104, 46, 0x73555b, 95) then
                -- debugC("右上角X")
                tap1(1089, 46)
            elseif isColor(600, 455, 0x81b95d, 95) and isColor(908, 479, 0x6baa4d, 95) then
                debugC("误开对话")
                tap1(600, 455)
            else
                tap1(1135, 0)
            end
            mSleep(1000)
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        if farmLong == 30 and isColor(1087, 530, 0xc0daa2, 95) and isColor(1095, 537, 0x96c572, 95) then --主动移动后
        elseif farmLong == 30 and isColor(1134, 629, 0x8ebb64, 95) and isColor(1127, 638, 0xa8d481, 95) then --主动移动前
        elseif farmLong == 28 and isColor(1070, 514, 0x8cb960, 95) and isColor(1124, 530, 0xa1d081, 95) then --主动移动后
        elseif farmLong == 28 and isColor(1124, 633, 0x8ec06d, 95) and isColor(1134, 628, 0xa4d282, 95) then --主动移动前
        elseif farmLong == 32 and isColor(119, 630, 0x94c36d, 95) and isColor(105, 630, 0x94c46f, 95) then --主动移动后
        elseif farmLong == 32 and isColor(105, 633, 0x96c672, 95) and isColor(96, 626, 0xa5d384, 95) then --主动移动前
        elseif farmLong == 26 and isColor(132, 117, 0xa9c193, 95) and isColor(1019, 201, 0x6c8c77, 95) then --主动移动后
        elseif farmLong == 26 and isColor(210, 200, 0xabc191, 95) and isColor(1130, 262, 0x558d71, 95) then --主动移动前
        else
            debugC("移动位置了")
            mSleep(1000)
            -- pressHomeKey(0); --按下抬起 Home 键一次
            runApp(appCalculator)
            mSleep(1000)
            -- lua_restart()
            return false
        end
        return true
    else
        return false
    end
end

--找原点
function findHouse()
    if farmLong == 30 and isColor(1134, 629, 0x8ebb64, 95) and isColor(1127, 638, 0xa8d481, 95) then
        debugC("30x30初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 28 and isColor(1124, 633, 0x8ec06d, 95) and isColor(1134, 628, 0xa4d282, 95) then
        debugC("28x28初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 32 and isColor(105, 633, 0x96c672, 95) and isColor(96, 626, 0xa5d384, 95) then
        debugC("32x32初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 26 and isColor(210, 200, 0xabc191, 95) and isColor(1130, 262, 0x558d71, 95) then
        debugC("26x26初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    end
    tap(1135, 0)
    if isColor(522, 593, 0xebe3d2, 95) then
        debugC("误开实景界面1")
        tap1(522, 593)
    end
    if numOriginX == 0 then
        -- x, y = findMultiColorInRegionFuzzy(0xee4b48, "-3|2|0xe94941,4|2|0xed4b48,-2|-1|0x80b781,3|-1|0x80b67d", 90, 286, 44, 1130, 528, { orient = 2 })--房子
        x, y = findMultiColorInRegionFuzzy(0x50ff1e, "-1|1|0x51ff20,1|1|0x4fff20,0|-1|0x000000", 90, 286, 44, 1130, 528,
            { orient = 2 }) --树
        if x > 0 then
            debugC("原点1" .. x .. "," .. y)
            -- mSleep(1000)
            numOriginX = x
            numOriginY = y
            writeJson("原点X", numOriginX)
            writeJson("原点Y", numOriginY)
            -- if math.abs(x - 484) >= 70 or math.abs(y - 148) >= 70 then
            --     -- touchDown(x - 30, y - 30)
            --     -- for i = 0, 500, 50 do
            --     --     touchMove(200, 1000 - i)
            --     --     mSleep(10)
            --     -- end
            --     -- --只要 90 度滑动 1 像素就可以精准滑动
            --     -- --横向滑动 1 像素
            --     -- touchUp(484 - 30+1, 148 - 30)
            --     -- mSleep(10)
            --     moveTo(x - 10, y - 10, 484 - 10, 148 - 10, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
            --     mSleep(1000)
            -- end
            -- x, y = findMultiColorInRegionFuzzy(0x50ff1e, "-1|1|0x51ff20,1|1|0x4fff20,0|-1|0x000000", 90, 286, 44, 1130, 528, { orient = 2 }) --树
            -- if x > 0 then
            --     debug("原点2" .. x .. "," .. y)
            return x, y
            -- else
            -- return 0, 0
            -- end
        else
            -- closeApp(appXiangMu)
            -- pressHomeKey(0); --按下抬起 Home 键一次
            debugC("没找到树")
            runApp(appCalculator)
            -- lua_restart()
            return 0, 0
        end
    else
        return numOriginX, numOriginY
    end
end

--找农田
function findFarm()
    local x, y = findHouse()
    if x == 0 then
        return
    elseif x > 0 then
        farmLong = tonumber(farmLong)
        farmX = 567 / farmLong
        farmY = 284 / farmLong
        mSleep(100)
        for l = 1, 5, 1 do --种N轮
            k = 0

            ------------------种植------------------
            for j = rangeY1, rangeY2, 2 do
                for i = rangeX1, rangeX2, 2 do
                    realX1 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                    realY1 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    k = k + 1
                    debugC(realX1 .. "," .. realY1 .. "," .. k)
                    if k == 1 then
                        tap1(realX1, realY1)
                        for m = 1, 50, 1 do
                            x0, y0 = findMultiColorInRegionFuzzy(0xede9e3, "2|0|0xfcb231", 80, 496, 320, 1135, 322)
                            if x0 > 0 then
                                local numStr = dmOcrText(index_dm_numTime, x0 - 500, y0 + 206, x0 - 500 + 118,
                                    y0 + 206 + 29, "785F5D,25281C", 90)
                                -- local numStr = ocrText(x0 - 500, y0 + 206, x0 - 500 + 118, y0 + 206 + 29, 1, "012346789小时分秒")
                                -- temStr = string.gsub(temStr, " ", "")
                                -- if tonumber(numStr) >= 0 then
                                --     numLv = tonumber(numStr) - 1
                                --     writeJson("指挥中心等级", numLv)
                                --     toast(numLv)
                                -- end
                                toast(numStr)
                                luaExit()
                                tap1(x0 - 292, y0)
                                break
                            else
                                touchMoveXY(801, 631, 499, 631)
                                -- touchMoveXY(801, 321, 499, 321)
                                mSleep(1000)
                            end
                        end
                        -- tap1(452, 398, 0x65ae49) --卷心菜
                    end
                    tap(realX1, realY1)
                end
            end
            tap1(738, 612, 0xffffff)
            mSleep(2000)

            ------------------洒水------------------
            for j = rangeY1, rangeY2, 2 do
                for i = rangeX1, rangeX2, 2 do
                    if i == rangeX1 then
                        realX1 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                        realY1 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    end
                    if i == rangeX2 then
                        realX2 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                        realY2 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                        moveTo(realX1, realY1, realX2, realY2)
                    end
                    -- realX1 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                    -- realY1 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    -- tap1(realX1, realY1)
                end
            end

            ------------------收获------------------
            mSleep(1000 * 31)
            for j = rangeY1, rangeY2, 2 do
                for i = rangeX1, rangeX2, 2 do
                    if i == rangeX1 then
                        realX1 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                        realY1 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    end
                    if i == rangeX2 then
                        realX2 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                        realY2 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                        moveTo(realX1, realY1, realX2, realY2)
                    end
                    -- realX1 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                    -- realY1 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    -- tap1(realX1, realY1)
                end
            end
            mSleep(3000)
        end
        luaExit()

        -- realX1 = x + (rangeX1 - 1) * farmX - (rangeY1 - 1) * farmX
        -- realY1 = y + (rangeY1 - 1) * farmY + (rangeX1 - 1) * farmY + 12
        -- realX2 = x + (rangeX2 - 1) * farmX - (rangeY2 - 1) * farmX
        -- realY2 = y + (rangeY2 - 1) * farmY + (rangeX2 - 1) * farmY + 12
        -- debug(realX1 .. "," .. realY1 .. "," .. realX2 .. "," .. realY2)
        -- mSleep(1000)
    end

end

--doTarget3
function doTarget3()
    if numXiangMu ~= 3 and numXiangMu ~= 0 then
        return
    end
    if muBiaoC == "" then
        if numHaoLV == "小号" then
            gaiMuBiaoNewC(1, "主线")
        elseif numHaoLV == "成品号" then
            gaiMuBiaoNewC(1, "支线")
        elseif numHaoLV == "大号" then
            gaiMuBiaoNewC(1, "挂机")
        end
    elseif muBiaoC == "主线" then
        task3_zhuXian()
    elseif muBiaoC == "支线" then
        task3_zhiXian()
    elseif muBiaoC == "挂机" or muBiaoC == "种植" or muBiaoC == "等待收割" or muBiaoC == "烹饪" then
        task3_guaJi()
    end
    -- debug("目标："..muBiao)
end

-- task3_主线
function task3_zhuXian()

end

-- task3_支线
function task3_zhiXian()

end

-- cook
function cook()
    if isColor(378,564,0xf96555,95) and isColor(516,509,0x543842,95) and isColor(491,575,0x2f4e94,95) then
       debugC("烹饪失败--位置2")
       tap1(437,560)
    elseif isColor(87,536,0x563e43,95) and isColor(108,574,0x79c01b,95) and isColor(181,548,0xffffff,95) then
        debugC("finished1--位置2")
        tap1(155,556)--finished1 
    elseif isColor(390,536,0x563e43,95) and isColor(410,573,0x79c01b,95) and isColor(483,548,0xffffff,95) then
        debugC("finished2--位置2")    
        tap1(483,548)--finished2
    elseif isColor(92,565,0x5ccdff,95) and isColor(80,548,0xb24c02,95) and isColor(186,561,0x2f4e94,95) then
        debugC("Go Cook")
        tap1(155,556)
    end
    if isColor(536,460,0x7ac01c,95) and isColor(565,455,0xffffff,95) and isColor(572,455,0x76b255,95) then
        debugC("烹饪完毕 点Ok")
        tap1(572,455)
    end
    if isColor(240,135,0x3e1d19,95) and isColor(747,201,0xd1b390,95) and isColor(730,211,0xcdad88,95) then
        debugC("Menu")
        tap1(858,205)--SORt
        tap1(618,168)--开放
    end
    if isColor(240,135,0x3e1d19,95) and isColor(747,201,0xfe5656,95) and isColor(730,212,0x684613,95) then
        debugC("选套餐")
        for i=1,10,1 do
            x0,y0 = findMultiColorInRegionFuzzy( 0x960000, "13|5|0xffffff,28|-7|0x920101,61|-3|0x960000", 90, 0, 372, 1135, 386)--料理中
            --x0,y0 = findMultiColorInRegionFuzzy( 0x960000, "42|21|0xffffff,81|21|0x8a0f0f", 90, 0, 355, 1135, 400)--料理中
            if x0>0 then
                tap1(1089,139)--右上角关闭
                gaiMuBiaoNewC(3, "") 
                break
            else
                if checkEgg=="参鸡汤" then
                    x,y = findMultiColorInRegionFuzzy( 0xc3cc6c, "75|21|0xa23b31,17|-68|0x6f3628", 90, 0, 285, 1135, 477)--找参鸡汤套餐
                elseif  checkRice== "蛋包饭" then
                    x,y = findMultiColorInRegionFuzzy( 0x83b73e, "121|75|0xb32224,19|50|0xd8dfdb", 90, 0, 285, 1135, 477)--找蛋包饭 记得改范围值
                    
                end
                if x> 0 then
                    tap1(x,y)--坐标
                    tap1(557,538,0x70a1d6        )--Cook
                    tap1(1089,139)--右上角关闭
                    gaiMuBiaoNewC(3, "") 
                    break
                else
                    --拖动
                    debugC("拖动菜单")
                    touchMoveXY(801, 631, 499, 631)
                    -- touchMoveXY(801, 321, 499, 321)
                    mSleep(1000)
                end
            end
        end

    end
end

-- task3_挂机
function task3_guaJi()
    if muBiaoC == "挂机" then
        gaiMuBiaoNewC(2, "种植")---
        debugC("改目标为种植2")
    elseif  muBiaoC == "烹饪" then
        cook()
        
    elseif muBiaoC == "种植" then
        if findHouse() == 0 then
            return
        elseif findHouse() > 0 then
            -- if nowTime - timeDecideIsFarm >= 20 then
            --     timeDecideIsFarm = nowTime
            --     if isFarm() then
            --     else
            --         return
            --     end
            -- end
            farmX = 567 / farmLong
            farmY = 284 / farmLong
            -- x0 = math.floor(568 / farmLong * 2)
            -- y0 = math.floor(284 / farmLong * 2)
            ------------------种植------------------
            -- tap1(numOriginX - x0, numOriginY + y0 + 10)
            -- tap1(452, 398, 0x65ae49) --卷心菜
            -- timeCollectInterval = 35
            if isColor(610, 35, 0xb93056, 95) == false then --面板
                tap1(610, 35, 0xb93056)
            end
            if isColor(724, 106, 0xffffff, 95) and isColor(441, 495, 0x6aaa4c, 95) then
                debugC("误开剩余时间")
                tap1(724, 106)
            end
            k = 0
            local n = 0
            repeat
                n = n + 1
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "task3_guajiB", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for j = 3, 5, 2 do
                    for i = 1, farmLong - 1, 2 do
                        if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                            tap1(723, 106)
                        end
                        realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                        realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                        k = k + 1
                        if isColor(724, 106, 0xffffff, 95) and isColor(441, 495, 0x6aaa4c, 95) then
                            debugC("误开剩余时间")
                            tap1(724, 106)
                        end
                        -- debug(realX1 .. "," .. realY1 .. "," .. k)
                        if k == 1 then
                            checkFruit()
                            plant()
                        end
                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                        mSleep(1000)
                        if isColor(663, 621, 0x66a744, 95) == false then --已种完
                            break
                        end
                        if isColor(724, 107, 0xffffff, 95) then
                            tap1(724, 107) --误开
                        end
                        -- tap(realX1, realY1)
                    end
                end
            until isColor(664, 619, 0x68a844, 95) == false or n == 2 --已种完
            -- if isColor(664, 619, 0x68a844, 95) then
            --     tap1(738, 612, 0xffffff)
            -- end
            mSleep(2000)
            -- ------------------洒水------------------
            -- moveTowards(numOriginX - math.floor(farmX * 4), numOriginY + math.floor(farmY * 4), -26.56, 635)
            -- mSleep(3000)
            -- for j = 5, 3, -2 do
            --     for i = 1, farmLong - 1, 2 do
            --         realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
            --         realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
            --         if i == 1 then
            --             tap(realX1, realY1, { ["ms"] = 100, ["pic"] = "click_point_4_2.png" })
            --         end
            --         tap(realX1, realY1, { ["ms"] = 100, ["pic"] = "click_point_4_2.png" })
            --         -- tap(realX1, realY1)
            --     end
            --     mSleep(2000)
            -- end
            -- moveTo(numOriginX - x0, numOriginY + y0 + 10, numOriginX + 568 - x0 - 20, numOriginY + 284 + y0 + 10, { ["stop"] = 1 })
            -- moveTo(numOriginX - x0 * 2, numOriginY + y0 * 2 + 10, numOriginX + 568 - x0 * 2 - 20, numOriginY + 284 + y0 * 2 + 10, { ["stop"] = 1 })
            gaiMuBiaoNewC(2, "等待收割")
            debugC("改目标为等待收割")
            nowTime = os.time();
            timeCollectInterval = timeCollectInterval or 0
            timeCollect = nowTime + timeCollectInterval + 30
            writeJson("收割时间", timeCollect)
        end
    elseif muBiaoC == "等待收割" then
        if nowTime - timeDesk >= 30 * 60 then
            timeDesk = nowTime
            debugC("30秒打开计算器")
            runApp(appCalculator)
            -- lua_restart()
            -- pressHomeKey(0); --按下抬起 Home 键一次
            mSleep(1000)
            return
        end
        -- if nowTime - timeDecideIsFarm >= 20 then
        --     timeDecideIsFarm = nowTime
        --     if isFarm() then
        --     else
        --         return
        --     end
        -- end
        if findHouse() == 0 then
            return
        elseif findHouse() > 0 then
            if watering() then
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xd64428, "6|1|0x46222b,30|-4|0xba8859,36|-13|0xe6e6e6", 90, 86, 96, 1045
                , 547)
            if x > 0 then
                debugC("援助")
                tap1(x, y)
                timeDecideIsFarm = nowTime
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xd64428, "6|1|0x46222b,16|28|0xf7dc6d,33|-5|0xc38e5e", 90, 86, 96, 1045,
                547)
            if x > 0 then
                debugC("请求")
                tap1(x, y)
                debugC("xy " .. x .. " " .. y)
                mSleep(1000)
                -- if isColor(x + 16, y + 29, 0xf7dc6d, 95) then
                tap1(x + 55, y - 27)
                -- end
                timeDecideIsFarm = nowTime
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xffffff, "-10|-10|0xffffff,9|-10|0xffffff", 100, 86, 96, 1045, 547) --气泡
            if x > 0 then
                debugC("气泡")
                tap1(x, y - 90)
                timeDecideIsFarm = nowTime
                return
            end
            if nowTime - timeCollect > 0 then
                -- findHouse()
                farmX = 567 / farmLong
                farmY = 284 / farmLong
                -- x0 = math.floor(568 / farmLong * 2)
                -- y0 = math.floor(284 / farmLong * 2)
                -- moveTowards(numOriginX - math.floor(farmX * 4), numOriginY + math.floor(farmY * 4), -26.56, 635)
                -- debug("farmX farmY x0 y0:" .. farmX .. "," .. farmY .. "," .. x0 .. "," .. y0)
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "task3_guaji", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for shou2bian = 1, 2, 1 do
                    for j = 5, 3, -2 do
                        for i = 1, farmLong - 1, 2 do
                            if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                                tap1(723, 106)
                            end
                            watering()
                            realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                            realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                            -- debug("realX1 realY1:" .. realX1 .. "," .. realY1)

                            if isColor(1088, 46, 0xffffff, 95) then --误开种植界面
                                tap(1088, 46, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                mSleep(300)
                            end
                            tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                            -- tap(realX1, realY1)
                            -- debug("收割:" .. realX1 .. "," .. realY1)
                            mSleep(300)
                            if isColor(1088, 46, 0xffffff, 95) then --误开种界面
                                tap(1088, 46, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                mSleep(300)
                            end
                            if isColor(724, 106, 0xffffff, 95) then --误开剩余时间，有产品没成熟
                                tap(724, 106, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                mSleep(300)
                            end
                            timeDecideIsFarm = nowTime
                        end
                    end
                end
                -- moveTo(numOriginX - x0, numOriginY + y0 + 10, numOriginX + 568 - x0 - 20, numOriginY + 284 + y0 + 10, { ["stop"] = 1 })
                -- moveTo(numOriginX - x0 * 2, numOriginY + y0 * 2 + 10, numOriginX + 568 - x0 * 2 - 20, numOriginY + 284 + y0 * 2 + 10, { ["stop"] = 1 })
                gaiMuBiaoNewC(2, "种植")
                debugC("改目标为种植1")
                timeTree = nowTime
            elseif checkXiangMu1 == "项目1" and checkXiangMu3 == "项目3" then
                if timeXiangMu3 > nowTime then
                    debugC("timeXiangMu3 = nowTime")
                    timeXiangMu3 = nowTime
                elseif numXiangMu == 3 and nowTime - timeXiangMu3 >= 20 then
                    debugC("项目3=>项目1")
                    tapBefore(367, 20, 0x99d266)
                    numXiangMu = 1
                    appXiangMu = "com.wemademax.riseofstars"

                    -- local tempStrMuBiao1, tempStrMuBiao2, tempStrMuBiao3 = strMuBiao1, strMuBiao2, strMuBiao3
                    -- strMuBiao1, strMuBiao2, strMuBiao3 = muBiaoC1, muBiaoC2, muBiaoC3
                    -- writeJson("目标1暂存", strMuBiao1)
                    -- writeJson("目标2暂存", strMuBiao2)
                    -- writeJson("目标3暂存", strMuBiao3)

                    -- gaiMuBiaoNewC(1, tempStrMuBiao1)
                    -- gaiMuBiaoNewC(2, tempStrMuBiao2)
                    -- gaiMuBiaoNewC(3, tempStrMuBiao3)
                    timeXiangMu3 = nowTime + 60 * 60 * 24 --项目1已闲置时间
                    nowTime = os.time()
                    timeXXX = nowTime
                end
            end
        end
    end
end

--定时任务
function time_task()
    if nowTime - timeTap >= 5 then
        tap(1135, 0)
        timeTap = nowTime
    end
    if nowTime - timeTree >= 2 * 60 then
        tapTrees()
    end
end

--点击果树
function tapTrees()
    -- if nowTime - timeDecideIsFarm >= 20 then
    --     timeDecideIsFarm = nowTime
    --     if isFarm() then
    --     else
    --         return
    --     end
    -- end
    if check4 ~= "测试" then

        if watering() == false then
            if findHouse() == 0 then
                return
            elseif findHouse() > 0 then
                farmX = 567 / farmLong
                farmY = 284 / farmLong
                -- x0 = math.floor(568 / farmLong * 2)
                -- y0 = math.floor(284 / farmLong * 2)
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "tapTreesB", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for i = 1, farmLong - 1, 2 do
                    if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                        tap1(723, 106)
                    end
                    watering()
                    realX1 = math.floor(numOriginX + (i - 1) * farmX - (1 - 1) * farmX)
                    realY1 = math.floor(numOriginY + (1 - 1) * farmY + (i - 1) * farmY + 12)
                    if isColor(realX1, realY1, 0x55ff25, 80) then --地为绿色
                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                        mSleep(1000)
                    end
                    if isColor(724, 106, 0xffffff, 95) then --果树信息
                        tap1(724, 106)
                    end
                end
                -- for j = 5, 3, -2 do
                --     for i = 1, farmLong - 1, 2 do
                --         realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                --         realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "tapTrees", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for i = 1, farmLong - 1, 2 do
                    if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                        tap1(723, 106)
                    end
                    watering()
                    realX1 = math.floor(numOriginX + (i - 1) * farmX - (5 - 1) * farmX)
                    realY1 = math.floor(numOriginY + (5 - 1) * farmY + (i - 1) * farmY + 12)
                    if isColor(realX1, realY1, 0x55ff25, 80) then --地为绿色
                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                        mSleep(1000)
                    end
                    if isColor(724, 106, 0xffffff, 95) then --果树信息
                        tap1(724, 106)
                    end
                end
                if Ccheck1 == "4排为树" then
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", "4排为树", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                    mSleep(500)
                    for i = 1, farmLong - 1, 2 do
                        if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                            tap1(723, 106)
                        end
                        watering()
                        realX1 = math.floor(numOriginX + (i - 1) * farmX - (7 - 1) * farmX)
                        realY1 = math.floor(numOriginY + (7 - 1) * farmY + (i - 1) * farmY + 12)
                        if isColor(realX1, realY1, 0x55ff25, 80) then --地为绿色
                            tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                            mSleep(1000)
                        end
                        if isColor(724, 106, 0xffffff, 95) then --果树信息
                            tap1(724, 106)
                        end
                    end
                end
                if Ccheck2 == "5排为树" then
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", "5排为树", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                    mSleep(500)
                    for i = 1, farmLong - 1, 2 do
                        if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                            tap1(723, 106)
                        end
                        watering()
                        realX1 = math.floor(numOriginX + (i - 1) * farmX - (9 - 1) * farmX)
                        realY1 = math.floor(numOriginY + (9 - 1) * farmY + (i - 1) * farmY + 12)
                        if isColor(realX1, realY1, 0x55ff25, 80) then --地为绿色
                            tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                            mSleep(1000)
                        end
                        if isColor(724, 106, 0xffffff, 95) then --果树信息
                            tap1(724, 106)
                        end
                    end
                end
                nowTime = os.time();
                timeTree = nowTime
                timeDecideIsFarm = nowTime
            end
        end
    end
end

--渐开线
function jianKaiXian(x, y)
    touchDown(x, y)
    -- x,y = findMultiColorInRegionFuzzy( 0xffffff, "", 90, 91, 75, 1043, 554)
    mSleep(100)
    touchMove(90, 70)
    mSleep(20)
    for j = 0, 480, 15 do
        for i = 0, 950, 30 do
            touchMove(91 + i, 75 + j);
            --延迟
            mSleep(10);
        end
    end
    touchUp(1050, 560);
    mSleep(1000);
end

--浇水
function watering()
    x, y = findMultiColorInRegionFuzzy(0xffffff, "6|-21|0x63b7ed,14|2|0x66b8e7,22|3|0xffffff", 90, 1, 91, 1031, 550) --浇水
    if x > 0 then
        -- debug("浇水1")
        tap(x, y, { ["ms"] = 300 })
        timeDecideIsFarm = nowTime
        return true
    else
        return false
    end
end

--出货
function sell()
    if isFarm() then
        if isSell == false then
            tap1(1077, 592, 0xd6915e) --Tool Box
            mSleep(1000)
            tap1(559, 572, 0xc47b5c) --sell
            mSleep(1000)
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellF", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
            mSleep(500)
            for i = 1, 10, 1 do
                if isColor(138, 350, 0x6fb644, 95) == false then --不为蔬菜
                    tap1(176, 358, 0xcfaf8b) --all
                    tap1(333, 328, 0x6fb644) --crop
                else
                    break
                end
                mSleep(1000)
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellE", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
            mSleep(500)
            for j = 0, 1, 1 do
                for i = 0, 8, 1 do
                    if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                        tap1(723, 106)
                    end
                    if isColor(59 + i * 118, 392 + j * 116, 0x543842, 95) then
                        local numStr = dmOcrText(index_dm_numNumber, 38 + i * 118, 405 + j * 116, 109 + i * 118,
                            426 + j *
                            116, "DCD7D9,232826", 95)
                        numStr, num = string.gsub(numStr, "x", "")
                        numStr = tonumber(numStr)
                        if type(numStr) == "number" then
                            debugC("数量为" .. numStr)
                            if numStr >= 200 then
                                tap1(38 + i * 118, 405 + j * 116) --选中要卖的
                                tap1(567, 433, 0xe0e0e0) --一半
                                tap1(566, 525, 0x75b154) --sell
                                mSleep(2000)
                            end
                        end
                    end
                end
            end
            -- local numStr1 = dmOcrText(index_dm_numNumber, 61, 405, 1049, 426, "DCD7D9,232826", 95)
            -- local numStr2 = dmOcrText(index_dm_numNumber, 61, 520, 1049, 544, "DCD7D9,232826", 95)
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellD", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
            mSleep(500)
            for i = 1, 10, 1 do
                if isColor(141, 363, 0xe6515a, 95) == false then --不为tree
                    tap1(176, 358, 0xcfaf8b) --all
                    tap1(528, 325, 0xe6515a) --tree
                else
                    break
                end
                mSleep(1000)
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellC", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
            mSleep(500)
            for j = 0, 1, 1 do
                for i = 0, 8, 1 do
                    if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                        tap1(723, 106)
                    end
                    if isColor(59 + i * 118, 392 + j * 116, 0x543842, 95) then
                        local numStr = dmOcrText(index_dm_numNumber, 38 + i * 118, 405 + j * 116, 109 + i * 118,
                            426 + j *
                            116, "DCD7D9,232826", 95)
                        numStr, num = string.gsub(numStr, "x", "")
                        numStr = tonumber(numStr)
                        if type(numStr) == "number" then
                            debugC("数量为" .. numStr)
                            if numStr >= 200 then
                                tap1(38 + i * 118, 405 + j * 116) --选中要卖的
                                tap1(567, 433, 0xe0e0e0) --一半
                                tap1(566, 525, 0x75b154) --sell
                                mSleep(2000)
                            end
                        end
                    end
                end
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellB", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
            mSleep(500)
            for i = 1, 10, 1 do
                if isColor(152, 368, 0xeb573c, 95) == false then --不为Special shop
                    tap1(176, 358, 0xcfaf8b) --all
                    tap1(333, 456, 0xdb9d68) --Special shop
                else
                    break
                end
                mSleep(1000)
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellA", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
            mSleep(500)
            for j = 0, 1, 1 do
                for i = 0, 8, 1 do
                    if isColor(59 + i * 118, 392 + j * 116, 0x543842, 95) then
                        local numStr = dmOcrText(index_dm_numNumber, 38 + i * 118, 405 + j * 116, 109 + i * 118,
                            426 + j *
                            116, "DCD7D9,232826", 95)
                        numStr, num = string.gsub(numStr, "x", "")
                        numStr = tonumber(numStr)
                        if type(numStr) == "number" then
                            debugC("数量为" .. numStr)
                            if numStr >= 1 then
                                tap1(38 + i * 118, 405 + j * 116) --选中要卖的
                                tap1(703, 434, 0xd0d0d0) --全部
                                tap1(566, 525, 0x75b154) --sell
                                mSleep(2000)
                            end
                        end
                    end
                end
            end
            isSell = true
            writeJson("出货", isSell)
            tap1(1087, 302, 0xb7b7b7)
        end
    end
end

-- 每日重置3
function everyDayInit3(...)
    if nowDateTime.day ~= nowDay then
        if nowDateTime.hour >= 9 and nowDateTime.min >= 0 then
            debugC("9点0分重置")

            isSell = false
            writeJson("出货", isSell)
            nowDay = nowDateTime.day
            writeJson("日期", nowDay)
        end
    end
end

-- 目标转换--新C
function muBiaoZhuanHuanNewC(...)
    if muBiaoC4 ~= "" and muBiaoC4 ~= "无" then
        muBiaoC = muBiaoC4
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoC3 ~= "" and muBiaoC3 ~= "无" then
        muBiaoC = muBiaoC3
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoC2 ~= "" and muBiaoC2 ~= "无" then
        muBiaoC = muBiaoC2
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoC1 ~= "" and muBiaoC1 ~= "无" then
        muBiaoC = muBiaoC1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    else
        muBiaoC1 = ""
        muBiaoC = muBiaoC1
        writeConfigNew("muBiaoC1", muBiaoC1)
        timeDingShiDianRenWu = nowTime - 60 * 60
    end

end

-- 改目标--新C
function gaiMuBiaoNewC(cs_num, cs_muBiao, ...)
    if cs_num == 1 then
        muBiaoC1 = cs_muBiao
        writeConfigNew("muBiaoC1", cs_muBiao)
        muBiaoZhuanHuanNewC()
        writeJson("目标C1", cs_muBiao)
    elseif cs_num == 2 then
        muBiaoC2 = cs_muBiao
        writeConfigNew("muBiaoC2", cs_muBiao)
        muBiaoZhuanHuanNewC()
        writeJson("目标C2", cs_muBiao)
    elseif cs_num == 3 then
        muBiaoC3 = cs_muBiao
        writeConfigNew("muBiaoC3", cs_muBiao)
        muBiaoZhuanHuanNewC()
        writeJson("目标C3", cs_muBiao)
    elseif cs_num == 4 then
        muBiaoC4 = cs_muBiao
        writeConfigNew("muBiaoC4", cs_muBiao)
        muBiaoZhuanHuanNewC()
        writeJson("目标C4", cs_muBiao)
    end
end

function debugC(tiaoShiNeiRong)
    -- wLog("192.168.1.34","#    [LINE]")
    if check1 == "网络调试" then
        wLog("192.168.1.34",
            iphoneId ..
            " 目标1: " ..
            muBiaoC1 .. " 目标2: " .. muBiaoC2 .. " 目标3: " .. muBiaoC3 .. " 目标4: " ..
            muBiaoC4 .. "    操作:" ..
            tiaoShiNeiRong .. "   #" .. xiangMu .. "#   [DATE]" .. "#    [LINE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast(
            "目标1: " ..
            muBiaoC1 .. " 目标2: " ..
            muBiaoC2 .. " 目标3: " .. muBiaoC3 .. " 目标4: " .. muBiaoC4 .. "                操作:" ..
            tiaoShiNeiRong)
        mSleep(3000)
    end
end

--读时间
function loadTime(x1, y1, x2, y2)
    keepScreen(true);
    local numStr = dmOcrText(index_dm_lastTime, x1, y1, x2, y2, "786062,242820", 95)
    keepScreen(false)
    debugC("读取结果:" .. numStr)
    mSleep(200)
    local num1, num2 = string.find(numStr, "秒")
    local num3, num4 = string.find(numStr, "小")
    local num5, num6 = string.find(numStr, "分")

    if num1 ~= nil and num3 == nil and num5 == nil then --只有秒
        numStr, num = string.gsub(numStr, "秒", "")
        numStr = tonumber(numStr)
        debugC("转换结果" .. numStr)
    elseif num1 ~= nil and num3 == nil and num5 ~= nil then --有分有秒
        numStr, num = string.gsub(numStr, "秒", "")
        local data = strSplit(numStr, "分")
        numStr = tonumber(data[1]) * 60 + tonumber(data[2])
        debugC("转换结果" .. numStr)
    elseif num1 == nil and num5 ~= nil and num3 == nil then --只有分
        numStr, num = string.gsub(numStr, "分", "")
        numStr = tonumber(numStr) * 60
        debugC("转换结果" .. numStr)
    elseif num1 == nil and num5 == nil and num3 ~= nil then --只有小时
        numStr, num = string.gsub(numStr, "小时", "")
        numStr = tonumber(numStr) * 3600 + 60
        debugC("转换结果" .. numStr)
    elseif num1 == nil and num5 ~= nil and num3 ~= nil then --有小时和分
        numStr, num = string.gsub(numStr, "分", "")
        local data = strSplit(numStr, "小时")
        numStr = tonumber(data[1]) * 3600 + tonumber(data[2]) * 60 + 60
        debugC("转换结果" .. numStr)
    end
    return numStr
end

--扫描地块
function ScanPlace()
    if Ccheck0 == "重置table" then
        local bool, kind = isFileExist(userPath() .. "/res/table_tree.txt")
        if bool == false or Ccheck0 == "重置table" then
            if isScaned == false then
                if findHouse() == 0 then
                    return
                elseif findHouse() > 0 then
                    farmX = 567 / farmLong
                    farmY = 284 / farmLong
                    -- x0 = math.floor(568 / farmLong * 2)
                    -- y0 = math.floor(284 / farmLong * 2)

                    for j = 1, 7, 2 do
                        -- table_tree[math.floor(j/2)+1]={}
                        for i = 1, farmLong - 1, 2 do
                            nowTime = os.time()
                            realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                            realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                            for k = 1, 60, 1 do
                                if isColor(663, 621, 0x66a744, 95) then --done
                                    tap1(663, 621)
                                end
                                if isColor(realX1, realY1, 0x3688d1, 95) or isColor(realX1 + 2, realY1, 0x3486ce, 95) or
                                    isColor(realX1 - 2, realY1, 0x2f82c8, 95) or
                                    isColor(realX1, realY1 + 2, 0x3787d0, 95) or
                                    isColor(realX1, realY1 - 2, 0x3787d0, 95) then
                                    debugC("没地了")
                                    Ccheck0 = ""
                                    writeConfigNew2("Ccheck0", "")
                                    return
                                end
                                if isColor(1089, 47, 0xffffff, 95) == false then --不为shop
                                    tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                    mSleep(200)
                                end
                                if isColor(537, 374, 0x80c321, 95) and isColor(591, 371, 0xffffff, 95) then --无法购买该商品
                                    tap1(537, 374, 0x80c321)
                                end
                                if isColor(724, 106, 0xffffff, 95) then --剩余时间
                                    -- table_tree[math.floor(j/2)+1][math.floor(i/2)+1]=loadTime(516, 400, 708, 427) + os.time();
                                    table_tree[#table_tree + 1] = loadTime(516, 400, 708, 427) + os.time();
                                    writeFile(userPath() .. "/res/table_tree.txt", table_tree, "w", 1) --将 table 内容存入文件，成功返回 true
                                    break
                                elseif k >= 60 then
                                    break
                                end
                                if isColor(20, 45, 0xd74427, 95) and isColor(29, 46, 0xfcfbfb, 95) and
                                    isColor(28, 30, 0xbe8966, 95) then
                                    debugC("shop")
                                    nowTime = os.time()
                                    if nowTime - timeLastShop >= 0 and nowTime - timeLastShop <= 30 then
                                        for l = 1, 10, 1 do
                                            debugC("timeLastShop低于60秒: " .. lastFruitX)
                                            mSleep(100)
                                            debugC("采用lastFruitX: " .. lastFruitX)
                                            timeLastShop = os.time()
                                            tap(lastFruitX, 380, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                            mSleep(1000)
                                            if isColor(1089, 47, 0xffffff, 95) == false then
                                                break
                                            end
                                        end
                                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then --done
                                            tap1(663, 621)
                                        end
                                    else
                                        debugC("timeLastShop高于60秒: " .. lastFruitX)
                                        tapBefore(1089, 47, 0xffffff) --关闭
                                        checkFruit()
                                        plantNew()
                                        timeLastShop = os.time()
                                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then --done
                                            tap1(663, 621)
                                        end
                                    end
                                end
                            end
                            for k = 1, 100, 1 do
                                if isColor(724, 106, 0xffffff, 95) then --关闭剩余时间
                                    tap1(724, 106)
                                else
                                    break
                                end
                                mSleep(200)
                            end
                        end
                    end
                    isScaned = true
                end
            end
            for i = 1, #table_tree, 1 do
                debugC("table_tree" .. i .. " " .. table_tree[i])
                mSleep(100)
            end
            Ccheck0 = ""
            writeConfigNew2("Ccheck0", "")
            -- lua_exit()
        end
    end
end

--扫描树
function ScanTree()
    if Ccheck0 == "重置table" then
        local bool, kind = isFileExist(userPath() .. "/res/table_tree.txt")
        if bool == false or Ccheck0 == "重置table" then
            if isScaned == false then
                if findHouse() == 0 then
                    return
                elseif findHouse() > 0 then
                    farmX = 567 / farmLong
                    farmY = 284 / farmLong

                    local zhengShu, xiaoShu = math.modf(numTree / (farmLong / 2))
                    if xiaoShu == 0 then
                        zhengShu = zhengShu - 1
                        numLastTreeRow = zhengShu + 1 --行
                        numLastTreeColumn = farmLong / 2 --列
                    else
                        numLastTreeRow = zhengShu + 1 --行
                        numLastTreeColumn = xiaoShu * (farmLong / 2) --列
                    end
                    for j = 1, 7, 2 do
                        -- table_tree[math.floor(j/2)+1]={}
                        for i = 1, farmLong - 1, 2 do
                            nowTime = os.time()
                            realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                            realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                            for k = 1, 60, 1 do
                                if isColor(663, 621, 0x66a744, 95) then --done
                                    tap1(663, 621)
                                end
                                if isColor(realX1, realY1, 0x3688d1, 95) or isColor(realX1 + 2, realY1, 0x3486ce, 95) or
                                    isColor(realX1 - 2, realY1, 0x2f82c8, 95) or
                                    isColor(realX1, realY1 + 2, 0x3787d0, 95) or
                                    isColor(realX1, realY1 - 2, 0x3787d0, 95) then
                                    debugC("没地了")
                                    Ccheck0 = ""
                                    writeConfigNew2("Ccheck0", "")
                                    return
                                end
                                if isColor(1089, 47, 0xffffff, 95) == false then --不为shop
                                    tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                    mSleep(200)
                                end
                                if isColor(537, 374, 0x80c321, 95) and isColor(591, 371, 0xffffff, 95) then --无法购买该商品
                                    tap1(537, 374, 0x80c321)
                                end
                                if isColor(724, 106, 0xffffff, 95) then --剩余时间
                                    -- table_tree[math.floor(j/2)+1][math.floor(i/2)+1]=loadTime(516, 400, 708, 427) + os.time();
                                    table_tree[#table_tree + 1] = loadTime(516, 400, 708, 427) + os.time();
                                    writeFile(userPath() .. "/res/table_tree.txt", table_tree, "w", 1) --将 table 内容存入文件，成功返回 true
                                    break
                                elseif k >= 60 then
                                    break
                                end
                                if isColor(20, 45, 0xd74427, 95) and isColor(29, 46, 0xfcfbfb, 95) and
                                    isColor(28, 30, 0xbe8966, 95) then
                                    debugC("shop")
                                    nowTime = os.time()
                                    if nowTime - timeLastShop >= 0 and nowTime - timeLastShop <= 30 then
                                        for l = 1, 10, 1 do
                                            debugC("timeLastShop低于60秒: " .. lastFruitX)
                                            mSleep(100)
                                            debugC("采用lastFruitX: " .. lastFruitX)
                                            timeLastShop = os.time()
                                            tap(lastFruitX, 380, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                            mSleep(1000)
                                            if isColor(1089, 47, 0xffffff, 95) == false then
                                                break
                                            end
                                        end
                                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then --done
                                            tap1(663, 621)
                                        end
                                    else
                                        debugC("timeLastShop高于60秒: " .. lastFruitX)
                                        tapBefore(1089, 47, 0xffffff) --关闭
                                        checkFruit()
                                        plantNew()
                                        timeLastShop = os.time()
                                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then --done
                                            tap1(663, 621)
                                        end
                                    end
                                end
                            end
                            for k = 1, 100, 1 do
                                if isColor(724, 106, 0xffffff, 95) then --关闭剩余时间
                                    tap1(724, 106)
                                else
                                    break
                                end
                                mSleep(200)
                            end
                        end
                    end
                    isScaned = true
                end
            end
            for i = 1, #table_tree, 1 do
                debugC("table_tree" .. i .. " " .. table_tree[i])
                mSleep(100)
            end
            Ccheck0 = ""
            writeConfigNew2("Ccheck0", "")
            -- lua_exit()
        end
    end
end

--检查地块
function checkPlace()
    if timeMinFruit == 0 then
        local bool, kind = isFileExist(userPath() .. "/res/table_tree.txt")
        if bool == true then
            table_tree = readFile(userPath() .. "/res/table_tree.txt")
            timeMinFruit = math.min(table.unpack(table_tree))
            -- debugC("最小值: " .. timeMinFruit) mSleep(100)

        end
    elseif nowTime > timeMinFruit then
        for i = 1, #table_tree do
            if tonumber(table_tree[i]) == timeMinFruit then
                -- debugC("最小值下标为:" .. i) mSleep(100)
                numMinID = i
                local zhengShu, xiaoShu = math.modf(i / (farmLong / 2))
                if xiaoShu == 0 then
                    zhengShu = zhengShu - 1
                    numRowFruit = zhengShu + 1 --行
                    numColumnFruit = farmLong / 2 --列
                else
                    numRowFruit = zhengShu + 1 --行
                    numColumnFruit = xiaoShu * (farmLong / 2) --列
                end
                debugC("最小值行为:" .. numRowFruit .. "  列为: " .. numColumnFruit)
                mSleep(100)
                -- lua_exit()
                break
            end
        end
        if isColor(34, 557, 0xec6f8e, 95) and isColor(59, 568, 0x7e5242, 95) and isColor(55, 583, 0xffe3d9, 95) then
            if findHouse() == 0 then
                return
            elseif findHouse() > 0 then
                -- for j = 3, 5, 2 do
                --     for i = 1, farmLong - 1, 2 do
                --         j = 2 * numRowFruit - 1
                --         1 1+0 2*1-1
                --         3 2+1 2*2-1
                --         5 3+2 2*3-1
                --         7 4+3 2*4-1
                --         i = 2 * numColumnFruit - 1
                --         1 2*1-1
                --         3 2*2-1
                --         5 2*3-1
                farmX = 567 / farmLong
                farmY = 284 / farmLong

                local j = 2 * numRowFruit - 1
                local i = 2 * numColumnFruit - 1

                realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                for k = 1, 60, 1 do
                    if isColor(663, 621, 0x66a744, 95) then --done
                        tap1(663, 621)
                    end
                    if isColor(realX1, realY1, 0x3688d1, 95) or isColor(realX1 + 2, realY1, 0x3486ce, 95) or
                        isColor(realX1 - 2, realY1, 0x2f82c8, 95) or isColor(realX1, realY1 + 2, 0x3787d0, 95) or
                        isColor(realX1, realY1 - 2, 0x3787d0, 95) then
                        debugC("没地了")
                        Ccheck0 = ""
                        writeConfigNew2("Ccheck0", "")
                        return
                    end
                    debugC("最快的坐标为: " .. realX1 .. "," .. realY1)
                    if isColor(1089, 47, 0xffffff, 95) == false then --不为shop
                        tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                        mSleep(200)
                    end
                    if isColor(537, 374, 0x80c321, 95) and isColor(591, 371, 0xffffff, 95) then --无法购买该商品
                        tap1(537, 374, 0x80c321)
                    end
                    if isColor(724, 106, 0xffffff, 95) then --剩余时间
                        -- table_tree[math.floor(j/2)+1][math.floor(i/2)+1]=loadTime(516, 400, 708, 427) + os.time();
                        table_tree[numMinID] = loadTime(516, 400, 708, 427) + os.time();
                        writeFile(userPath() .. "/res/table_tree.txt", table_tree, "w", 1) --将 table 内容存入文件，成功返回 true
                        break
                    elseif k >= 60 then
                        break
                    end
                    if isColor(20, 45, 0xd74427, 95) and isColor(29, 46, 0xfcfbfb, 95) and
                        isColor(28, 30, 0xbe8966, 95) then
                        debugC("shop")
                        nowTime = os.time()
                        if nowTime - timeLastShop >= 0 and nowTime - timeLastShop <= 30 then
                            for l = 1, 10, 1 do
                                debugC("timeLastShop低于60秒: " .. lastFruitX)
                                mSleep(100)
                                debugC("采用lastFruitX: " .. lastFruitX)
                                timeLastShop = os.time()
                                tap(lastFruitX, 380, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                                mSleep(1000)
                                if isColor(1089, 47, 0xffffff, 95) == false then
                                    break
                                end
                            end
                            tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                            mSleep(1000)
                            if isColor(663, 621, 0x66a744, 95) then --done
                                tap1(663, 621)
                            end
                        else
                            debugC("timeLastShop高于60秒: " .. lastFruitX)
                            tapBefore(1089, 47, 0xffffff) --关闭
                            checkFruit()
                            plantNew()
                            timeLastShop = os.time()
                            tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                            mSleep(1000)
                            if isColor(663, 621, 0x66a744, 95) then --done
                                tap1(663, 621)
                            end
                        end
                    end
                end
                for k = 1, 100, 1 do
                    if isColor(724, 106, 0xffffff, 95) then --关闭剩余时间
                        tap1(724, 106)
                    else
                        break
                    end
                    mSleep(200)
                end
                timeMinFruit = 0
            else
                debugC("findhouse小于0")
            end
        else
            debugC("不为农场")
        end
    end
end

--检查果实
function checkFruit()
    if checkGuoShi == "检查果实" then
        tap1(1077, 592, 0xd6915e) --Tool Box
        mSleep(1000)
        tap1(559, 572, 0xc47b5c) --sell
        mSleep(1000)
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "checkFruit", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        for i = 1, 10, 1 do
             if isColor(138, 350, 0x6fb644, 95) == false then --不为蔬菜
                tap1(176, 358, 0xcfaf8b) --all
                tap1(333, 328, 0x6fb644) --crop
             else
                 break
             end
            mSleep(1000)
         end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        isZhiDingFruit = false
        for i=1,3,1 do
            if checkTomato == "番茄" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x68a646,
                    "16|-10|0xef5138,43|7|0xf87b5b,46|27|0xef5138", 90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 3, y - 36, x + 75, y - 13,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("番茄:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "番茄"
                    end
                end
            end
            if checkCaoMei == "草莓" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x307c2d,
                    "-10|33|0xebb956,38|34|0xf0404a,44|51|0xb81f2a", 90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 4, y - 14, x + 78, y + 10,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("草莓:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "草莓"
                    end
                end
            end
            if checkSunflower == "向日葵" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x99502a, "-20|-15|0xf8e780,24|25|0x589a29", 90, 3
                    , 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 21, y - 29, x + 49, y - 6,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("向日葵:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "向日葵"
                    end
                end
            end
            if checkGrape == "葡萄" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x589a29, "-20|71|0x77337a,32|45|0xeb85eb", 90, 3
                    , 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 25, y - 4, x + 60, y + 22,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("葡萄:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "葡萄"
                    end
                end
            end
            if checkCane == "甘蔗" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xedd2c0, "-12|71|0x99044e,20|44|0xc2af6f", 90, 3
                    , 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 15, y - 2, x + 60, y + 24,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("甘蔗:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "甘蔗"
                    end
                end
            end
            if checkSouthMelon == "南瓜" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xfbe4ba, "-6|29|0xef9527,61|22|0xd15705", 90, 3
                    , 389, 1127, 614)
                if x > 0 then
                    debugC("南瓜x:" .. x .. " y:" .. y)
                    local numStr = dmOcrText(index_dm_numNumber, x + 15, y - 26, x + 72, y + 1,
                        "DCD7D9,232826", 95)
                    debugC("南瓜:" .. numStr)

                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("南瓜:" .. numStr)
                    if numStr <= 100 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "南瓜"
                    end
                end
            end
            if checkDingxiang == "丁香" and isZhiDingFruit == false then
                x,y = findMultiColorInRegionFuzzy( 0x91396f, "-2|-23|0x543e42,17|5|0x533842", 90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 27, y - 56, x + 37, y - 30,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("丁香:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "丁香"
                    end
                end
            end
            if checkRenshen == "人参" and isZhiDingFruit == false then
                x,y = findMultiColorInRegionFuzzy( 0x9c5600, "-39|36|0x543842,16|8|0xffca70", 90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 20, y - 45, x + 40, y - 20,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("人参:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "人参"
                    end
                end
            end
            if checkHongdou == "红豆" and isZhiDingFruit == false then
                x,y = findMultiColorInRegionFuzzy( 0x533842, "-38|-11|0x853436,22|16|0x662121", 90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 17, y - 46, x + 45, y - 19,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("红豆:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "红豆"
                    end
                end
            end
            if checkXiangCao == "香草" and isZhiDingFruit == false then
                x,y = findMultiColorInRegionFuzzy( 0xf1ece2, "41|44|0x778195,58|38|0x463039,51|57|0x0e0f13", 90, 3, 395, 1127, 454)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 1, y + 6, x + 96, y + 34,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("香草:" .. numStr)
                    if numStr <= 100 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "香草"
                    end
                end
            end
            if checkShuiDao == "水稻" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x7dbe66, "23|-9|0xc67c00,45|9|0x568344", 90, 3
                    , 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 24, y - 35, x + 80, y - 5,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("水稻:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "水稻"
                    end
                end
            end
            if checkPotato == "土豆" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x987c4c, "19|23|0x8d714e,64|38|0xdfb879", 90, 3
                    , 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 20, y - 26, x + 80, y + 5,
                        "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("土豆:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "土豆"
                    end
                end
            end

            debugC("拖动果实")
            touchMoveXY(801, 631, 499, 631)
            -- touchMoveXY(801, 321, 499, 321)
            mSleep(1000)
        end
        tap1(1088, 303, 0xbebebd) --关闭
    end
end

--种植
function plant()
    tap1(396, 28, 0x77932d) --四叶草
    fwCloseView("window1", "more"); -- 关闭文字视图
    fwShowButton("window1", "more", "plantF", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
    mSleep(500)
    -- tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
    for l = 1, 10, 1 do
        if isColor(1088, 46, 0xffffff, 95) then
            break
        else
            tap1(396, 28, 0x77932d) --四叶草
        end
        mSleep(1000)
    end
    fwCloseView("window1", "more"); -- 关闭文字视图
    fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
    mSleep(500)
    if isColor(262, 128, 0xf0404a, 95) == false then
        tap1(262, 128) --种植选项
    end
    -- if check4 ~= "测试" then
    if isZhiDingFruit == false then
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantD", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                tap1(723, 106)
            elseif isColor(600, 455, 0x81b95d, 95) and isColor(908, 479, 0x6baa4d, 95) then
                debugC("误开对话")
                tap1(600, 455)
            end
            x0, y0 = findMultiColorInRegionFuzzy(0xede9e3, "2|0|0xfcb231", 80, 496, 320, 1135
                , 322)
            if x0 > 0 then
                local numStr = dmOcrText(index_dm_numTime, x0 - 500, y0 + 206, x0 - 500 + 118
                    , y0 + 206 + 29, "785F5D,25281C", 90)
                debugC("读取结果:" .. numStr)
                mSleep(200)
                local num1, num2 = string.find(numStr, "秒")
                local num3, num4 = string.find(numStr, "小")
                local num5, num6 = string.find(numStr, "分")

                if num1 ~= nil and num3 == nil and num5 == nil then --只有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    numStr = tonumber(numStr)
                    debugC("转换结果" .. numStr)
                elseif num1 ~= nil and num3 == nil and num5 ~= nil then --有分有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    local data = strSplit(numStr, "分")
                    numStr = tonumber(data[1]) * 60 + tonumber(data[2])
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 == nil then --只有分
                    numStr, num = string.gsub(numStr, "分", "")
                    numStr = tonumber(numStr) * 60
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 == nil and num3 ~= nil then --只有小时
                    numStr, num = string.gsub(numStr, "小时", "")
                    numStr = tonumber(numStr) * 3600
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 ~= nil then --有小时和分
                    numStr, num = string.gsub(numStr, "分", "")
                    local data = strSplit(numStr, "小时")
                    numStr = tonumber(data[1]) * 3600 + tonumber(data[2]) * 60
                    debugC("转换结果" .. numStr)
                end
                timeCollectInterval = numStr
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantC", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    bugFor()
                    tap(x0 - 292, y0, { ["ms"] = 300 })
                    mSleep(1000)
                    if isColor(1089, 47, 0xffffff, 95) == false then
                        break
                    end
                end
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                break
            else
                debugC("拖动种子")
                touchMoveXY(801, 631, 499, 631)
                -- touchMoveXY(801, 321, 499, 321)
                mSleep(1000)
            end
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
    else
        if isColor(1, 629, 0x5f5a51, 95) == false then --滚动条不在左边
            tap1(1050, 204, 0x89663e) --sort
            tap1(841, 104, 0xffffff) --nosort
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantB", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                tap1(723, 106)
            end
            if strZhiDingFruit == "番茄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x68a646,
                    "-1|15|0xf8b87b,34|19|0xef5138,34|-12|0x75ae4f", 90, 200, 493, 1122, 544)
                timeCollectInterval = 60
            elseif strZhiDingFruit == "草莓" then
                x0, y0 = findMultiColorInRegionFuzzy(0x307c2d,
                    "-9|21|0xe29d4e,36|20|0x3a8636,29|33|0xb81f2a", 90, 200, 500, 1122, 540)
                timeCollectInterval = 90
            elseif strZhiDingFruit == "向日葵" then
                x0, y0 = findMultiColorInRegionFuzzy(0x99502a,
                    "-8|-17|0xf7e683,-1|35|0x4b7e2f", 90, 200, 492, 1122, 546)
                timeCollectInterval = 60 * 10
            elseif strZhiDingFruit == "葡萄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x58942a, "-12|51|0x77337a,23|31|0xeb85eb", 90, 200, 488, 1122, 549)
                timeCollectInterval = 60 * 110
            elseif strZhiDingFruit == "甘蔗" then
                x0, y0 = findMultiColorInRegionFuzzy(0xecd0bf, "-9|51|0x95074e,20|21|0xc2af6f", 90, 200, 488, 1122, 543)
                timeCollectInterval = 60 * 20
            elseif strZhiDingFruit == "南瓜" then
                x0, y0 = findMultiColorInRegionFuzzy(0x6eb454, "-21|19|0xf7ad2a,22|39|0xca5509", 90, 200, 493, 1122, 545)
                timeCollectInterval = 60 * 3
            elseif strZhiDingFruit == "水稻" then
                x0, y0 = findMultiColorInRegionFuzzy(0x498e40, "17|-17|0xf2ac48,30|8|0x5ca454", 90, 200, 495, 1122, 522)
                timeCollectInterval = 60 * 5
            elseif strZhiDingFruit == "土豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0xbb976b, "5|27|0xdfb879,38|41|0xd0ad71", 90, 200, 491, 1122, 534)
                timeCollectInterval = 60 * 45
            elseif strZhiDingFruit == "丁香" then
                x0, y0 = findMultiColorInRegionFuzzy( 0x883969, "-36|-25|0x5e9847,9|-2|0x89406d", 90, 200, 506, 1122, 533)
                timeCollectInterval = 60 * 82
            elseif strZhiDingFruit == "人参" then
                x0, y0 = findMultiColorInRegionFuzzy( 0xb52734, "26|2|0x446b3d,4|35|0x533842", 90, 200, 496, 1122, 533)
                timeCollectInterval = 60 * 210
            elseif strZhiDingFruit == "红豆" then
                x0, y0 = findMultiColorInRegionFuzzy( 0x543842, "-26|-10|0x873436,8|14|0x60292c", 90, 200, 510, 1122, 536)
                timeCollectInterval = 60 * 75
            elseif strZhiDingFruit == "香草" then
                x0, y0 = findMultiColorInRegionFuzzy( 0x505a6c, "2|23|0x757f93,9|40|0x533842", 90, 200, 489, 1122, 531)
                timeCollectInterval = 60 * 60
            end
            if x0 > 0 then
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantA", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    tap(x0, y0, { ["ms"] = 300 })
                    mSleep(1000)
                    if isColor(1089, 47, 0xffffff, 95) == false then
                        break
                    end
                end
                break
            else
                debugC("拖动种子")
                touchMoveXY(801, 631, 499, 631)
                -- touchMoveXY(801, 321, 499, 321)
                mSleep(1000)
            end
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
        mSleep(500)
    end
    -- else
    --     for l = 1, 10, 1 do
    --         tap(452, 398, { ["ms"] = 300 }) --卷心菜
    --         mSleep(1000)
    --         if isColor(1089, 47, 0xffffff, 95) == false then
    --             break
    --         end
    --     end
    --     mSleep(1000)
    --     timeCollectInterval = 33
    -- end
end

--种植
function plantNew()
    tap1(396, 28, 0x77932d) --四叶草
    -- tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
    fwCloseView("window1", "more"); -- 关闭文字视图
    fwShowButton("window1", "more", "plantNewE", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
    mSleep(500)
    for l = 1, 10, 1 do
        bugFor()
        if isColor(1088, 46, 0xffffff, 95) then
            break
        else
            tap1(396, 28, 0x77932d) --四叶草
        end
        mSleep(1000)
    end
    if isColor(262, 128, 0xf0404a, 95) == false then
        tap1(262, 128) --种植选项
    end
    if isZhiDingFruit == false then
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantNewD", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                tap1(723, 106)
            end
            x0, y0 = findMultiColorInRegionFuzzy(0xede9e3, "2|0|0xfcb231", 80, 496, 320, 1135
                , 322)
            if x0 > 0 then
                local numStr = dmOcrText(index_dm_numTime, x0 - 500, y0 + 206, x0 - 500 + 118
                    , y0 + 206 + 29, "785F5D,25281C", 90)
                debugC("读取结果:" .. numStr)
                mSleep(200)
                local num1, num2 = string.find(numStr, "秒")
                local num3, num4 = string.find(numStr, "小")
                local num5, num6 = string.find(numStr, "分")

                if num1 ~= nil and num3 == nil and num5 == nil then --只有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    numStr = tonumber(numStr)
                    debugC("转换结果" .. numStr)
                elseif num1 ~= nil and num3 == nil and num5 ~= nil then --有分有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    local data = strSplit(numStr, "分")
                    numStr = tonumber(data[1]) * 60 + tonumber(data[2])
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 == nil then --只有分
                    numStr, num = string.gsub(numStr, "分", "")
                    numStr = tonumber(numStr) * 60
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 == nil and num3 ~= nil then --只有小时
                    numStr, num = string.gsub(numStr, "小时", "")
                    numStr = tonumber(numStr) * 3600
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 ~= nil then --有小时和分
                    numStr, num = string.gsub(numStr, "分", "")
                    local data = strSplit(numStr, "小时")
                    numStr = tonumber(data[1]) * 3600 + tonumber(data[2]) * 60
                    debugC("转换结果" .. numStr)
                end
                timeCollectInterval = numStr
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantNewC", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    bugFor()
                    tap(x0 - 292, y0, { ["ms"] = 300 })
                    lastFruitX = x0 - 292
                    debugC("lastFruitX: " .. lastFruitX)
                    mSleep(1000)
                    if isColor(1089, 47, 0xffffff, 95) == false then
                        break
                    end
                end
                break
            else
                debugC("拖动种子")
                touchMoveXY(801, 631, 499, 631)
                -- touchMoveXY(801, 321, 499, 321)
                mSleep(1000)
            end
        end
    else
        if isColor(1, 629, 0x5f5a51, 95) == false then --滚动条不在左边
            tap1(1050, 204, 0x89663e) --sort
            tap1(841, 104, 0xffffff) --nosort
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantNewB", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                tap1(723, 106)
            end
            if strZhiDingFruit == "番茄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x68a646,
                    "-1|15|0xf8b87b,34|19|0xef5138,34|-12|0x75ae4f", 90, 200, 493, 1122, 544)
                timeCollectInterval = 60
            elseif strZhiDingFruit == "草莓" then
                x0, y0 = findMultiColorInRegionFuzzy(0x307c2d,
                    "-9|21|0xe29d4e,36|20|0x3a8636,29|33|0xb81f2a", 90, 200, 500, 1122, 540)
                timeCollectInterval = 90
            elseif strZhiDingFruit == "向日葵" then
                x0, y0 = findMultiColorInRegionFuzzy(0x99502a,
                    "-8|-17|0xf7e683,-1|35|0x4b7e2f", 90, 200, 492, 1122, 546)
                timeCollectInterval = 60 * 10
            elseif strZhiDingFruit == "葡萄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x58942a, "-12|51|0x77337a,23|31|0xeb85eb", 90, 200, 488, 1122, 549)
                timeCollectInterval = 60 * 110
            elseif strZhiDingFruit == "甘蔗" then
                x0, y0 = findMultiColorInRegionFuzzy(0xecd0bf, "-9|51|0x95074e,20|21|0xc2af6f", 90, 200, 488, 1122, 543)
                timeCollectInterval = 60 * 20
            elseif strZhiDingFruit == "南瓜" then
                x0, y0 = findMultiColorInRegionFuzzy(0x6eb454, "-21|19|0xf7ad2a,22|39|0xca5509", 90, 200, 493, 1122, 545)
                timeCollectInterval = 60 * 3
            elseif strZhiDingFruit == "水稻" then
                x0, y0 = findMultiColorInRegionFuzzy(0x498e40, "17|-17|0xf2ac48,30|8|0x5ca454", 90, 200, 495, 1122, 522)
                timeCollectInterval = 60 * 5
            elseif strZhiDingFruit == "土豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0xbb976b, "5|27|0xdfb879,38|41|0xd0ad71", 90, 200, 491, 1122, 534)
                timeCollectInterval = 60 * 45
            elseif strZhiDingFruit == "丁香" then
                x0, y0 = findMultiColorInRegionFuzzy( 0x883969, "-36|-25|0x5e9847,9|-2|0x89406d", 90, 200, 506, 1122, 533)
                timeCollectInterval = 60 * 82
            elseif strZhiDingFruit == "人参" then
                x0, y0 = findMultiColorInRegionFuzzy( 0xb52734, "26|2|0x446b3d,4|35|0x533842", 90, 200, 496, 1122, 533)
                timeCollectInterval = 60 * 210
            elseif strZhiDingFruit == "红豆" then
                x0, y0 = findMultiColorInRegionFuzzy( 0x543842, "-26|-10|0x873436,8|14|0x60292c", 90, 200, 510, 1122, 536)
                timeCollectInterval = 60 * 75
            elseif strZhiDingFruit == "香草" then
                x0, y0 = findMultiColorInRegionFuzzy( 0x505a6c, "2|23|0x757f93,9|40|0x533842", 90, 200, 489, 1122, 531)
                timeCollectInterval = 60 * 60
            end
            if x0 > 0 then
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantNewA", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    bugFor()
                    tap(x0, y0, { ["ms"] = 300 })
                    lastFruitX = x0
                    debugC("lastFruitX: " .. lastFruitX)
                    mSleep(1000)
                    if isColor(1089, 47, 0xffffff, 95) == false then
                        break
                    end
                end
                break
            else
                debugC("拖动种子")
                touchMoveXY(801, 631, 499, 631)
                -- touchMoveXY(801, 321, 499, 321)
                mSleep(1000)
            end
        end
    end
end

--其它
function other()
    if findHouse() == 0 then
        return
    elseif findHouse() > 0 then
        x, y = findMultiColorInRegionFuzzy(0xd64428, "6|1|0x46222b,30|-4|0xba8859,36|-13|0xe6e6e6", 90, 86, 96, 1045, 547)
        if x > 0 then
            debugC("援助")
            tap1(x, y)
            timeDecideIsFarm = nowTime
            return
        end
        x, y = findMultiColorInRegionFuzzy(0xd64428, "6|1|0x46222b,16|28|0xf7dc6d,33|-5|0xc38e5e", 90, 86, 96, 1045, 547)
        if x > 0 then
            debugC("请求")
            tap1(x, y)
            debugC("xy " .. x .. " " .. y)
            mSleep(1000)
            -- if isColor(x + 16, y + 29, 0xf7dc6d, 95) then
            tap1(x + 55, y - 27)
            -- end
            timeDecideIsFarm = nowTime
            return
        end
        x, y = findMultiColorInRegionFuzzy(0xffffff, "-10|-10|0xffffff,9|-10|0xffffff", 100, 86, 96, 1045, 547) --气泡
        if x > 0 then
            debugC("气泡")
            tap1(x, y - 90)
            timeDecideIsFarm = nowTime
            return
        end
    end
end

--卡循环
function bugFor()
    if isColor(144, 108, 0x9bd124, 95) and isColor(1020, 63, 0x72555a, 95) and isColor(1034, 63, 0xffffff, 95) then
        debugC("Notice")
        tap1(1034, 63, 0xffffff)
    end
    if isColor(1088, 141, 0xffffff, 95) and isColor(1101, 141, 0x73555b, 95) then
        debugC("右上角X1")
        if isColor(75,52,0xea4949,95) and isColor(426,26,0x64434f,95) and isColor(72,41,0xea8395,95) and checkCook=="烹饪" and muBiaoC == "烹饪"  then --餐厅界面,打勾选烹饪,目标为烹饪
            debugC("restaurant")    
        else
            tap1(1088, 141)
        end
    end
    if isColor(1037, 67, 0xffffff, 95) and isColor(1051, 67, 0x73555b, 95) then
        debugC("右上角X2")
        tap1(1037, 67)
    end
end



---------------------------------------riseOfStars终--------------------------------

function zongHe_zj()
    -- toast("test")
    if isColor(584, 265, 0xffffff, 95) and isColor(921, 220, 0xbd1f0a, 95) then
        debugA("登录界面")
        tap(558, 404)
    end
    if isColor(465,381,0x00b9f0,95) and isColor(668,427,0x00a2d1,95) and isColor(603,407,0x00263f,95) then
        debugA("无法连接服务器")
        tap(551,404)
    end
    -- if (isColor(1084,  492, 0xfdfdfd, 85) and isColor(1121,  514, 0xffffff, 85) and isColor(1089,  511, 0xebebeb, 85)) then
    --     touchClick(1014,  507, 0xadc7d5)--点击设置
    -- end
    -- if (isColor(242,   80, 0xbdc5cb, 85) and isColor(869,   97, 0xffffff, 85) and isColor(798,  226, 0x00ade6, 85)) then
    --     touchClick(489,  246, 0xb2b3bd)--游戏画质调成低
    -- end
    -- if (isColor(242,   80, 0xbdc5cb, 85) and isColor(869,   97, 0xffffff, 85) and isColor(796,  299, 0x00b9f3,85 )) then
    --     touchClick(481,  318, 0x9a9ca5)--游戏像素调成低
    -- end
    -- if (isColor(327,  216, 0xd0d5dc, 85) and isColor(790,  230, 0xffffff, 85) and isColor(568,  372, 0x00c0f7, 85)) then
    --     touchClick(562,  395, 0xe6eaec)--关闭更改游戏像素调成低的告知
    -- end
end
---------------------------------------赵军 止-------------------------------


-- kuoZhanKuDown()
-- onlineLua()
-- package.loaded["riseOfStars"] = nil
-- require("riseOfStars")
chuCiJiaZai()
-- chuCiJiaZaiDouYu()
s1 = os.time()
m_iRunCount = 1
while isXunHuanLua do
    main()
end

goto TZ_zhuangTai

-- ::TZ_updateLua::
httpDown(httpMuLu .. "lua/game6.lua", luaPath .. "/lua/game6.lua")
require("game6")
