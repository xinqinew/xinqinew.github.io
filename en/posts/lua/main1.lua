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

appXiangMu = "apps1"
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
    appXiangMu = appApple
elseif pingTai1 == "1" then
    appXiangMu = appDianKa
elseif pingTai1 == "2" then
    appXiangMu = appI4
elseif pingTai1 == "3" then
    appXiangMu = appTongBu
elseif pingTai1 == "4" then
    appXiangMu = appGuoPan
elseif pingTai1 == "5" then
    appXiangMu = appXY
elseif pingTai1 == "6" then
    appXiangMu = appIapple
elseif pingTai1 == "7" then
    appXiangMu = appKuaiYong
elseif pingTai1 == "8" then
    appXiangMu = appItools
elseif pingTai1 == "9" then
    appXiangMu = appTuTu
elseif pingTai1 == "10" then
else
    appXiangMu = appApple
end
if pingTai2 == "0" then
    if appXiangMu == appDianKa then
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

APP1.name = appXiangMu;
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

file_severIP1 = "/Library/Preferences/" .. appXiangMu .. ".plist"
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
        appPath1 = appBundlePath(appXiangMu);
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
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", appXiangMu)
        local tmpNum2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps2)
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu)
        local tmpNumBenDi2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2)
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu, 0)
        end
        if tmpNumBenDi2 == nil then
            tmpNumBenDi2 = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2, 0)
        end
        if tmpNum ~= nil and tmpNumBenDi ~= nil then
            if tmpNum ~= tmpNumBenDi then
                closeApp(appXiangMu)
                mSleep(1000)
                init("0", 0)
                xunLeiXiaZai1(httpMuLu .. "APP/" .. appXiangMu .. ".ipa")
                mSleep(2000)
                runFilza()
                mSleep(2000)
                init(1)
                runApp(appXiangMu)
                APP1.isYiDengLu = 0
                mSleep(5000)
                writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu, tmpNum)
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
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", appXiangMu)
        local tmpNum2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps2)
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu)
        local tmpNumBenDi2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2)
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu, 0)
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
                    closeApp(appXiangMu)
                    mSleep(1000)
                    init("0", 0)
                    xunLeiXiaZai1(httpMuLu .. "APP/" .. appXiangMu .. ".ipa")
                    mSleep(2000)
                    runFilza()
                    mSleep(2000)
                    init(1)
                    runApp(appXiangMu)
                    APP1.isYiDengLu = 0
                    mSleep(5000)
                    writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu, tmpNum)
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
        local tmpNum = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", appXiangMu)
        local tmpNum2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. "0.plist", apps2)
        delFile(luaPath .. "/lua/lua" .. xiangMu .. "0.plist")
        local tmpNumBenDi = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu)
        local tmpNumBenDi2 = loadPlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", apps2)
        if tmpNumBenDi == nil then
            tmpNumBenDi = 0
            writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu, tmpNumBenDi)
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
                    closeApp(appXiangMu)
                    mSleep(1000)
                    init("0", 0)
                    xunLeiXiaZai1(httpMuLu .. "APP/" .. appXiangMu .. ".ipa")
                    mSleep(2000)
                    runFilza()
                    mSleep(2000)
                    init(1)
                    runApp(appXiangMu)
                    APP1.isYiDengLu = 0
                    mSleep(5000)
                    writePlist(luaPath .. "/lua/lua" .. xiangMu .. ".plist", appXiangMu, tmpNum)
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
        closeApp(appXiangMu)
        mSleep(1000)
        runApp(appXiangMu)
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
        if bid == appXiangMu then
            runApp(apps2)
            -- APP2.isYiDengLu = 0
            APP = APP2
            mSleep(1000)
        elseif bid == apps2 then
            runApp(appXiangMu)
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
        closeApp(appXiangMu)
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
--全屏乱点
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
        if bid == appXiangMu then
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
            runApp(appXiangMu)
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
    if ret1.success then
        tiaoShi(ret1.text)
        return ret1.text
    else
        tiaoShi(ret1.message)
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

-- kuoZhanKuDown()
onlineLua()
package.loaded["riseOfStars"] = nil
require("riseOfStars")
-- require("rise of stars")
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
