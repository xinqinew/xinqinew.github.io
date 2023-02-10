numLua = 23.4
toast("在线版本:" .. numLua)
local image_tsing = require("tsimg")
appXiangMu1 = "com.wemademax.riseofstars"
appXiangMu2 = "com.xd.TLglobal"
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
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
    'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', '+', '/'
};
ZZBase64.__decode = {}
for k, v in pairs(ZZBase64.__code) do
    ZZBase64.__decode[string.byte(v, 1)] = k - 1
end

function ZZBase64.encode(text)
    local len = string.len(text)
    local left = len % 3
    len = len - left
    local res = {}
    local index = 1
    for i = 1, len, 3 do
        local a = string.byte(text, i)
        local b = string.byte(text, i + 1)
        local c = string.byte(text, i + 2)
        -- num = a<<16 + b<<8 + c
        local num = a * 65536 + b * 256 + c
        for j = 1, 4 do
            -- tmp = num >> ((4 -j) * 6)
            local tmp = math.floor(num / (2 ^ ((4 - j) * 6)))
            -- curPos = tmp&0x3f
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
    num1 = num1 * 1024 -- lshift 10
    local num2 = string.byte(text, len + 2)
    num2 = num2 * 4 -- lshift 2
    local num = num1 + num2

    local tmp1 = math.floor(num / 4096) -- rShift 12
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

        -- num = a<<18 + b<<12 + c<<6 + d
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
        username = user, -- 填写账户名
        password = pwd, -- 填写密码
        typeid = typeid, -- 验证码类型(默认 3 数英混合)：16:汉字 14:图片旋转 11:计算题 7:无感学习，4:闪动GIF，3:数英混合， 2:纯英文，1:纯数字
        -- 返回坐标类型(默认 19 一个坐标)。 19: 1个坐标， 20: 1 ~ 4个坐标， 21: 3 ~ 5个坐标， 22: 5 ~ 8个坐标。
        image = ttImagebase64(imagefile)
    }
    request_body = json_ts.encode(request_body)
    local url = "http://api.ttshitu.com/predict";

    local response_body = {}
    local res, code, response_headers = http.request {
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = #request_body
        },
        source = ltn12.source.string(request_body),
        sink = ltn12.sink.table(response_body)
    }
    if type(response_body) == "table" then
        -- 解析返回结果
        local strBody = table.concat(response_body);
        local bl, tbody = pcall(json_ts.decode, strBody)
        if bl then
            if tbody.success == true then
                local id, vcode = tbody.data.id, tbody.data.result
                print("id:", id); -- 识别结果的id
                print("suceess:", vcode); -- 识别的结果
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

-- 识别报错
local function ttReportError(yzmid)
    local response_body = {}
    local post_data = "id=" .. yzmid;
    local res, code = http.request {
        url = "http://api.ttshitu.com/reporterror.json",
        method = "POST",
        headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Content-Length"] = #post_data
        },
        source = ltn12.source.string(post_data),
        sink = ltn12.sink.table(response_body)
    }
    -- 解析返回结果
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
    local lzRe, yzmid, jieguo, err = ttRecoginze(username, password, path,
                                                 typeid)
    if lzRe then
        yzmId = yzmid
        return jieguo, yzmid
    else
        return nil, err
    end
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
        if not (isColor(x1, y1, color, dim)) then break end
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
        if not (isColor(x1, y1, color, dim)) then break end
    end
end

-- 全屏乱点
function screenClickNew(intX, intY, color)
    for x = 1, 113, 1 do
        for y = 1, 63, 1 do
            if isColor(intX, intY, color, 90) == false then return end
            if math.abs(intX - x * 10) <= 40 and math.abs(intY - y * 10) <= 40 then

            else
                touchSuper(x * 10, y * 10)
            end
        end
    end
end

function ttScreen(x1, y1, x2, y2, scale) -- 此处为触动截图方法 开发者请根据实际脚本工具自己编写
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
        local picPath = ttScreen(x1, y1, x2, y2) -- 图片的路径完整路径此处为截图获取的路径
        local res, id = tt.Image(picPath, 7) -- 开始识别
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
    tableFromJson = json_ts.decode(readFileString(
                                       userPath() .. "/res/" .. iphoneId ..
                                           ".json")) -- 将 json 格式数据转成 table 格式数据

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
        HuoYan_username, HuoYan_password = dialogInput(
                                               "请输入云打码帐号和密钥",
                                               "在这里输入YDM_username #在这里输入YDM_password",
                                               "确认");
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
    isTest = false

    -----------------------私有部分--------------------------
    RGB_NoticeBJ = "306090" -- "FFFF00"
    RGB_NoticeFont = "FFFFFF" -- "FF0000"
    strNotice = "..."

    isJiKu = false -- 机库
    isPirateSub = true -- 海盗减号
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
    isFalseLiZi2 = false -- 2级粒子挖掘失败
    isOverHelp = false -- 协助已完成
    isCheckLiZiNum = false -- 检查粒子数量
    isAttacked = false -- 被攻击
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
    numShengJiCengShu = 0 -- 建筑升级条件层数
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
    timeJiKu = nowTime - 60 * 60 * 1 -- 库存间隔时间
    timeXiangMu1 = nowTime + 60 * 60 * 24 -- 项目1已闲置时间
    timeCheckLiZiNum = nowTime - 60 * 60 * 1 -- 定时检查粒子数量
    timeShengJiTongXingZheng = nowTime -- 升级通行证
    timeUpJson = nowTime - 10 * 60 -- 上传间隔
    timeZhengLi = nowTime - 5 * 60 -- 检测背包
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
    strZhuangTai = ""

    numDead = 0
    numUpLeft = 0
    numUpRight = 0
    numDownLeft = 0
    numDownRight = 0

    isDead = false
    isCollectBug = false

    timeOcrLevel = nowTime - 60 -- 定时认别等级
    timeXuanDanRed = nowTime - 60 * 10 -- 选单红点
    timeCollectBug = nowTime
    timeTask_ZhuXian = nowTime - 10

    ---------------项目3---------------
    table_tree = {}
    lastFruitX = 0
    isZhiDingFruit = false -- 指定种植水果
    isScaned = false -- 扫描所有地块

    strZhiDingFruit = ""

    timeTap = nowTime
    timeXiangMu3 = nowTime + 60 * 60 * 24 -- 项目1已闲置时间
    timeTree = nowTime -- 果树收割间隔
    timeDesk = nowTime -- 返回桌面
    timeDecideIsFarm = nowTime -- 决定是否判定是农场
    timeLastShop = nowTime + 60 * 60 * 24 -- 上次商店打开时间
    timeMinFruit = 0 -- 最小的剩余时间

    numRowFruit = 0 -- 最小值的行
    numColumnFruit = 0 -- 最小值的列
    numMinID = 0 -- 最小值的下标
    numLastTreeRow = 0 -- 最后一颗树的所在行
    numLastTreeColumn = 0 -- 最后一颗树的所在列

    ---------------项目4---------------

    numFangXiang = 1
    numPathStep = 0
    timeCheckBackpack = nowTime - 60 * 10 -- 检查背包
    timeHungry = nowTime - 2000 -- 饥饿
    timeCheckNet = nowTime - 10 * 60 -- 网络检测

end

-- 新UI
function newUi()
    w, h = getScreenSize()
    UINew(5, "公共设置,项目1,项目2,项目3,项目4", "开始", "取消",
          uiconfig, 0, 5, w, h, "245,245,245", "175,238,238", "", "dot", 1, 15,
          "left")

    -- UILabel("--------------------公共设置--------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck(
        "check1,check2,check3,check4,check5,check6,checkXiangMu1,checkXiangMu2,TTtuJian,checkXiangMu3,checkXiangMu4",
        "网络调试,本地调试,集中文件,测试,注销,删除配置,项目1,项目2,TT图鉴,项目3,项目4",
        "4@6", -1, 0, "", 1, 3) -- 多选1
    -- UILabel(2, "---------------------项目1---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck(2,
            "check7,check8,check9,check10,check11,check12,check13,check14,check15,check16,check17,check18,check19,check20,check21,check22,check23,check24,check25,check26,check27,check28",
            "联盟任务,大号,成品号,小号,不生产,不挖粒子,抢粒子,研究,生产加速,vip8,强制金属,强制矿物,强制氯气,2级粒子,自动切换梯子,活动,60海盗,买钛,库存,3级粒子,1级粒子,4级粒子",
            "3@5", -1, 0, "", 1, 3) -- 多选1
    UILabel(2, "航母数量", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(2, "numShip", "0,1,2,3,4", "0", -1, 1, true) -- 下拉框
    UILabel(2, "兑换批次", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(2, "numDuiHuan", "0,1,2,3,4,5,6,7,8", "0", -1, 0, true) -- 下拉框
    UILabel(2,
            "目标1 无,优化,主线,挖矿,日常,挂机,开区检测,章节,采集,去采集点",
            10, "left", "72,61,139", -1, 0, "center") -- 标签
    UIEdit(2, "muBiaoA1", "目标1", "", 15, "left", "95,158,160", "default", 0,
           0) -- 编辑框
    UILabel(2, "目标2 无,5道具,采集,收获,技能,兑换,道具合成",
            10, "left", "72,61,139", -1, 0, "center")
    UIEdit(2, "muBiaoA2", "目标2", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(2,
            "目标3 无,整理,出航,修船,研究,钱包检测,登录钱包,兑换粒子",
            10, "left", "72,61,139", -1, 0, "center")
    UIEdit(2, "muBiaoA3", "目标3", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(2, "目标4 无,战备,战备跑路,战备开盾", 10, "left",
            "72,61,139", -1, 0, "center")
    UIEdit(2, "muBiaoA4", "目标4", "", 15, "left", "95,158,160", "default", 0,
           0)

    -- UILabel(3, "---------------------项目2---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICombo(3, "numHaoLV_B", "小号,成品号,大号", "0", -1, 0, true) -- 下拉框
    UILabel(3, "目标1 无,占位1", 10, "left", "72,61,139", -1, 0, "center") -- 标签
    UIEdit(3, "muBiaoB1", "目标1", "", 15, "left", "95,158,160", "default", 0,
           0) -- 编辑框
    UILabel(3, "目标2 无,占位1", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(3, "muBiaoB2", "目标2", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(3, "目标3 无,占位1", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(3, "muBiaoB3", "目标3", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(3, "目标4 无,占位1", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(3, "muBiaoB4", "目标4", "", 15, "left", "95,158,160", "default", 0,
           0)
    UICheck(3, "Bcheck1,Bcheck2", "占位1,占位2", "0", -1, 0, "", 1, 3) -- 多选1

    -- UILabel(4, "---------------------项目3---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICombo(4, "numHaoLV", "小号,成品号,大号", "0", -1, 0, true) -- 下拉框
    UICheck(4, "Ccheck1,Ccheck2,Ccheck3", "4排为树,5排为树,占位", "0",
            -1, 0, "", 1, 3) -- 多选1
    UICheck(4, "Ccheck0", "重置table", "", -1, 0, "", 1, 3) -- 多选1
    UICheck(4,
            "checkGuoShi,checkTomato,checkCaoMei,checkSunflower,checkGrape,checkCane,checkSouthMelon,checkShuiDao,checkPotato,checkDingxiang,checkRenshen,checkHongdou,checkXiangCao,checkHuaSheng,checkXiaoMai,checkLuoBo,checkYuMi,checkBaoXinCai,checkHuangDou,checkYangCong,checkBoHe,checkLaJiao,checkXunYiCao,checkBoLuo",
            "检查果实,番茄,草莓,向日葵,葡萄,甘蔗,南瓜,水稻,土豆,丁香,人参,红豆,香草,花生,小麦,萝卜,玉米,包心菜,黄豆,洋葱,薄荷,辣椒,薰衣草,菠萝",
            "0", -1, 0, "", 0, 3) -- 多选1
    UICheck(4,
            "checkCook,checkEgg,checkRice,checkBingGan,checkGanLanYou,checkZaoWuTaoCan",
            "烹饪,参鸡汤,蛋包饭,饼干冰淇淋,橄榄油意大利面,早午套餐",
            "0", -1, 0, "", 0, 3) -- 多选1
    -- UIEdit(4, "rangeX1", "X1", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeY1", "Y1", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeX2", "X2", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeY2", "Y2", "", 15, "left", "95,158,160", "number", 120, 0) -- 编辑框
    UIEdit(4, "farmLong", "边", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    UIEdit(4, "numTree", "树", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    UIEdit(4, "numFarm", "田", "", 15, "left", "95,158,160", "number", 120, 0) -- 编辑框
    UILabel(4, "目标1 无,挂机", 10, "left", "72,61,139", -1, 0, "center") -- 标签
    UIEdit(4, "muBiaoC1", "目标1", "", 15, "left", "95,158,160", "default", 0,
           0) -- 编辑框
    UILabel(4, "目标2 无,种植,等待收割", 10, "left", "72,61,139", -1,
            0, "center")
    UIEdit(4, "muBiaoC2", "目标2", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(4, "目标3 无,烹饪", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(4, "muBiaoC3", "目标3", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(4, "目标4 无", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(4, "muBiaoC4", "目标4", "", 15, "left", "95,158,160", "default", 0,
           0)

    -- UILabel(5, "---------------------项目4---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICombo(5, "numHaoLV_D", "小号,成品号,大号", "0", -1, 0, true) -- 下拉框
    UILabel(5, "目标1 无,占位1", 10, "left", "72,61,139", -1, 0, "center") -- 标签
    UIEdit(5, "muBiaoD1", "目标1", "", 15, "left", "95,158,160", "default", 0,
           0) -- 编辑框
    UILabel(5, "目标2 无,占位1", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(5, "muBiaoD2", "目标2", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(5, "目标3 无,占位1", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(5, "muBiaoD3", "目标3", "", 15, "left", "95,158,160", "default", 0,
           0)
    UILabel(5, "目标4 无,占位1", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(5, "muBiaoD4", "目标4", "", 15, "left", "95,158,160", "default", 0,
           0)
    UIEdit(5, "upDown", "几上下", "1", 15, "left", "95,158,160", "number",
           100, 1)
    UILabel(5, "上下", 10, "left", "72,61,139", 200, 1, "center")
    UIEdit(5, "leftRight", "几左右", "1", 15, "left", "95,158,160", "number",
           100, 1)
    UILabel(5, "左右", 10, "left", "72,61,139", 200, 0, "center")
    UICheck(5, "check_monster0,check_monster1,check_monster2,check_monster3",
            "任意怪,夏洛特花,燃火兽,陨石幽鬼", "0", -1, 0, "", 1,
            3) -- 多选1
    UICheck(5,
            "check_skill_up,check_skill_down,check_skill_left,check_skill_right,check_hungry",
            "技能上,下,左,右,饥饿", "0", -1, 0, "", 1, 3) -- 多选1
    UICheck(5, "map0,map1,map2,map3", "地图 无,1,2,3", "0", -1, 0, "", 1, 3) -- 多选1
    -- UICheck(5, "Dcheck1,Dcheck2", "占位1,占位2", "0", -1, 0, "", 1, 3) -- 多选1

    UIShow()

    ---------------------项目1---------------------
    if check28 == "4级粒子" then
        numSeachLiZi = 4
    elseif check26 == "3级粒子" then
        numSeachLiZi = 3
    elseif check20 == "2级粒子" then
        numSeachLiZi = 2
    elseif check27 == "1级粒子" then
        numSeachLiZi = 1
    end
    if check12 == "不挖粒子" then
        notWaLiZi = true
    else
        notWaLiZi = false
    end

    if check10 == "小号" then haoLV = 1 end
    if check9 == "成品号" then haoLV = 2 end
    if check8 == "大号" then haoLV = 3 end
    ---------------------项目4---------------------
    if checkXiangMu4 == "项目4" then
        upDown = tonumber(upDown)
        leftRight = tonumber(leftRight)
    end
    ---------------------公共---------------------
    if checkXiangMu1 == "项目1" then numInit = 1 end
    if checkXiangMu2 == "项目2" then numInit = 1 end
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
    if checkXiangMu4 == "项目4" then numInit = 1 end
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
            tableFromJson[key] = {"luabool", 1}
        else
            tableFromJson[key] = {"luabool", 0}
        end
    else
        tableFromJson[key] = value
    end
    local jsonstring = json_ts.encode(tableFromJson); -- 将 table 格式数据转成 json 格式数据
    if jsonstring ~= "" and jsonstring ~= nil then
        bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json",
                               jsonstring) -- 写入文件
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
    if whoAmI() ~= 4 then
        os.execute(
            "chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/clientiPhone.lua")
    -- local bool = os.remove(userPath() .. "/lua/clientiPhone.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        dialog("删除失败，失败原因：" .. msg, 5)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@6w04b66789.goho.co/"
    local temRet = ftpDownOnce(ftpMuLu .. "Lua/clientiPhone.lua",
                               userPath() .. "/lua/clientiPhone.lua")
    if temRet then
        toast("FTP下载clientiPhone成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/clientiPhone.lua",
                                      luaFile, {["tstab"] = 1, ["mode"] = true})
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

function expand(s) return string.gsub(s, "$(%w+)", _G) end

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
        if numXiangMu == 0 then numXiangMu = 1 end
    end
    if checkXiangMu1 == "项目1" and (numXiangMu == 0 or numXiangMu == 1) then
        if m_iRunCount == 1 then appXiangMu = "com.wemademax.riseofstars" end
        main1()
    elseif checkXiangMu2 == "项目2" and (numXiangMu == 0 or numXiangMu == 2) then
        if m_iRunCount == 1 then
            appXiangMu = "com.xd.TLglobal"
            -- if whoAmI() ~= 4 then
            --     zhaojunlua()
            --     package.loaded["zhaojun"] = nil
            --     require("zhaojun")
            -- end
        end
        main2()
    elseif checkXiangMu3 == "项目3" and (numXiangMu == 0 or numXiangMu == 3) then
        if m_iRunCount == 1 then
            appXiangMu = "com.wemadeconnect.etgnft.everytown"
        end
        main3()
    elseif checkXiangMu4 == "项目4" and (numXiangMu == 0 or numXiangMu == 4) then
        if m_iRunCount == 1 then appXiangMu = "ai.metap.gensokishi" end
        main4()
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
    muBiaoZhuanHuanNewB() -- 公用 必须最优先
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
        -- isTapTask = false
        -- writeJson("点任务", isTapTask)
    end
    m_iRunCount = m_iRunCount + 1

    -- autoVpn()
    autoUnlockDevice()
    zongHe2()
    -- zongHe_zj()
    checkRed2()
    -- checkDropline()
    -- zhiYin()
    -- timeJianCe2()

    -- zongHe_Mult()
    -- zongHe_Screen()
    doTarget2()
    -- timeChongZhi()
    -- checkXXX()
    -- everyDayInit()
    -- checkXXX2()
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
        ftpMuLu = "ftp://xinqinew:Qwer1234@6w04b66789.goho.co/"
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
    -- 人物状态
    strZhuangTai = loadJson("人物状态")
    if strZhuangTai == nil then
        strZhuangTai = ""
        writeJson("人物状态", strZhuangTai)
    end
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

    -- 收割时间
    timeCollect = loadJson("收割时间")
    if timeCollect == nil then
        timeCollect = 0
        writeJson("收割时间", timeCollect)
    end

    -- 出货
    isSell = loadJson("出货")
    if isSell == nil then
        isSell = false
        writeJson("出货", isSell)
    end
    -----------------------------项目4---------------------

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
    tab_lizi1 = {
        "ffffffffffffffffffffffffffffff3fffc7fff0fffe000fc001f8003fffffffffffffffffffffffffffffffff@1$1$313$19$19",
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
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff87ffffc1fffff0fffffc0001ff00007fc0001ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff@11$1$569$26$25"
    }
    index_lizi1 = addTSOcrDictEx(tab_lizi1)

    -- 内容已复制到剪贴板!
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

    tab_dm_numTime = {
        "03E3FCFFBFD701C03803807E07FC7F83F$0$0.0.127$19",
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
        "300E01C03FFFFFFFFFF8$1$1.3.99$18", "700E01C07FFFFFFFC$1$1.4.87$18",
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
             iphoneId .. " 目标1: " .. muBiaoA1 .. " 目标2: " .. muBiaoA2 ..
                 " 目标3: " .. muBiaoA3 .. " 目标4: " .. muBiaoA4 ..
                 "    操作:" .. tiaoShiNeiRong .. "   #" .. xiangMu ..
                 "#   [DATE]" .. "#    [LINE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast("目标1: " .. muBiaoA1 .. " 目标2: " .. muBiaoA2 ..
                  " 目标3: " .. muBiaoA3 .. " 目标4: " .. muBiaoA4 ..
                  "                操作:" .. tiaoShiNeiRong)
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
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12,
                     0, 0, 50, 30);
    else
        fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ,
                     "", 12, 0, 0, 50, 30);
    end
    -- fwShowButton("window1", "more", "...", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
    mSleep(500)
end

-- 多功能窗口
function moreWindow()
    isLuaStart = false
    fwShowWnd("moreWin", 50, 50, wScreen - 50, hScreen - 50, 0);
    -- 子窗口视图是以父窗口载体的（100,100）点坐标为（0,0）点坐标显示的
    fwShowButton("moreWin", "btn_update", "更新", "FFFFFF", "025062", "", 12,
                 0, 0, 150, 50);
    if check1 == "网络调试" then
        fwShowButton("moreWin", "btn_tiaoShi", "调试ON", "FFFFFF", "306090",
                     "", 12, 1 + 150, 0, 150 * 2, 50);
    else
        fwShowButton("moreWin", "btn_tiaoShi", "调试OFF", "FFFFFF", "306090",
                     "", 12, 1 + 150, 0, 150 * 2, 50);
    end
    fwShowButton("moreWin", "btn_snapshot", "截图", "FFFFFF", "025062", "",
                 12, 1 + 150 * 2, 0, 150 * 3, 50);
    fwShowButton("moreWin", "btn_restart", "重载", "FFFFFF", "306090", "", 12,
                 1 + 150 * 3, 0, 150 * 4, 50);
    fwShowButton("moreWin", "btn_hide", "X", "FFFFFF", "9e393d", "", 12,
                 1 + 150 * 4, 0, 150 * 5, 50);
    if appXiangMu == appXiangMu1 then
        fwShowTextView("moreWin", "text_MuBiao",
                       "目标1 : " .. muBiaoA1 .. "  目标2 : " .. muBiaoA2 ..
                           "  目标3 : " .. muBiaoA3 .. " 目标4: " ..
                           muBiaoA4, "left", "FFFFFF", "0C2037", 12, 0, 0, 51,
                       wScreen - 100, 100, 1);
    elseif appXiangMu == appXiangMu3 then
        fwShowTextView("moreWin", "text_MuBiao",
                       "目标1 : " .. muBiaoC1 .. "  目标2 : " .. muBiaoC2 ..
                           "  目标3 : " .. muBiaoC3 .. " 目标4: " ..
                           muBiaoC4, "left", "FFFFFF", "0C2037", 12, 0, 0, 51,
                       wScreen - 100, 100, 1);
    end
    fwShowTextView("moreWin", "text_info",
                   "机器名 : " .. iphoneId .. "  IP : " .. strIphoneIP,
                   "left", "FFFFFF", "025062", 12, 0, 0, 101, wScreen - 100,
                   150, 1);

    mSleep(500)
end

-- 窗口判断
function windowsDecide()
    vid, kind = fwGetPressedButton();
    if vid == "btn1" then
        fwCloseView("window1", "btn1"); -- 关闭文字视图
        fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0,
                     50, 30);
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
                fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "",
                             12, 0, 0, 50, 30);
                mSleep(500)
            elseif vid == "more" then
                isLuaStart = false
                fwCloseView("window1", "btn1"); -- 关闭文字视图
                fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "",
                             12, 0, 0, 50, 30);
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "moreX", "X", "FFFFFF", "9e393d", "",
                             12, 0, 0, 50, 30);
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
        fwShowButton("window1", "moreX", "X", "FFFFFF", "9e393d", "", 12, 0, 0,
                     50, 30);
        mSleep(500)
        moreWindow()
    elseif vid == "moreX" then
        isPause = false
        isLuaStart = true
        -- fwCloseView("window1", "btn2"); -- 关闭文字视图
        -- fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
        fwCloseView("window1", "moreX"); -- 关闭文字视图
        if haoLV == 3 then
            fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg",
                         12, 0, 0, 50, 30);
        else
            fwShowButton("window1", "more", strNotice, RGB_NoticeFont,
                         RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
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
            fwShowButton("moreWin", "btn_tiaoShi", "调试OFF", "FFFFFF",
                         "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
        else
            check1 = ""
            fwShowButton("moreWin", "btn_tiaoShi", "调试ON", "FFFFFF",
                         "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
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
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time ..
                      ".png")
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
    if flag.active == false then setVPNEnable(true) end
end

-- 上传json
function ftpUpJson()
    if nowTime - timeUpJson >= 10 * 60 then
        timeUpJson = nowTime
        local tb = plist_ts.read(userPath() .. "/lua/" .. xiangMu .. ".plist") -- 读取plist至table格式
        if tb ~= "" and tb ~= nil then
            local jsonstring = json_ts.encode(tb); -- 将 table 格式数据转成 json 格式数据
            if jsonstring ~= "" and jsonstring ~= nil then
                bool = writeFileString(userPath() .. "/res/" .. iphoneId ..
                                           ".json", jsonstring) -- 写入文件
                if bool then
                    ftpUpPNG(iphoneId .. ".json", "JSON/") -- 上传
                end
            end
        end
    end
end

-- 上传json 2
function ftpUpJson2()
    if nowTime - timeUpJson >= 10 * 60 then
        timeUpJson = nowTime
        ftpUpPNG(iphoneId .. ".json", "JSON/") -- 上传
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
    -- 脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 1)
        -- 下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
    return false
end

function ftpUpTsPNG(localFile, ftpFile)
    -- 脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 0)
        -- 下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() -- 操作完成后，断开 FTP 服务器连接
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
    if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) and
        muBiaoA ~= mb_ChuHang and muBiaoA ~= "章节" and muBiaoA ~= mb_ZhuXian then
        debugA("搜索界面--误开--有粒子")
        tap1(1, 1)
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) and
        muBiaoA ~= mb_ChuHang and muBiaoA ~= "章节" and muBiaoA ~= mb_ZhuXian then
        debugA("搜索界面--误开--无粒子")
        tap1(1, 1)
    end
    if isColor(310, 107, 0xf8a501, 95) and isColor(306, 137, 0xe0e0e0, 95) and
        isColor(831, 248, 0x436c9e, 95) and isColor(333, 243, 0x46627e, 95) then
        debugA("误开满期提示")
        tap1(511, 537, 0x0c0c0e)
    end
    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and
        isColor(866, 599, 0xd78b00, 95) and isColor(116, 596, 0x517fad, 95) and
        muBiaoA ~= mb_ChuHang and muBiaoA ~= mb_ZhuXian then
        debugA("误开出航界面")
        tap1(20, 20)
    end
    if isColor(454, 585, 0x284b73, 95) and isColor(477, 607, 0x284b73, 95) and
        isColor(911, 589, 0x3e5c7f, 95) then
        debugA("今天不再观看")
        tap1(474, 589, 0x3e5c7f)
        tap1(911, 589, 0x3e5c7f)
    end
    if isColor(229, 73, 0xff6600, 95) and isColor(655, 127, 0x4a9ce9, 95) and
        isColor(205, 214, 0x9ca0a4, 95) and isColor(1071, 577, 0x215da6, 95) then
        debugA("误开NFT")
        tap1(511, 603)
    end
    if isColor(94, 87, 0xa5b6ca, 95) and isColor(118, 81, 0x4e78aa, 95) and
        isColor(108, 542, 0xd78b01, 95) then
        debugA("库存战舰")
        if isColor(897, 539, 0x2a394c, 95) then -- 未库存
            tap1(112, 543, 0xd68b01) -- 快速
            tap1(749, 538, 0x616a76) -- 12小时
            tap1(897, 539, 0x2a394c) -- 库存
            tap1(484, 429, 0x1c6db9) -- 确定
        else
            tap1(506, 603, 0x3b577b)
        end
    end
    if isColor(471, 527, 0x114c8a, 95) and isColor(659, 561, 0x145da9, 95) and
        isColor(271, 65, 0x0096ff, 95) and isColor(269, 49, 0xf8a901, 95) then
        debugA("合成")
        tap1(511, 612, 0x0c0c0e)
    end
    if isColor(842, 101, 0x80171a, 95) and isColor(80, 66, 0xff6600, 95) and
        isColor(91, 59, 0xf8a901, 95) then
        debugA("点数商店--精锐怪物旗帜")
        if isColor(389, 389, 0xffe087, 95) then -- 2
            tap1(389, 389)
        elseif isColor(197, 388, 0xf4c463, 95) then -- 1
            tap1(197, 388)
        else
            tap1(511, 603, 0x0c0c0e)
        end
    end
    if isColor(480, 471, 0x6b4500, 95) and isColor(489, 470, 0xa31c1e, 95) and
        isColor(527, 483, 0xd77e00, 95) and isColor(681, 385, 0x0e3d74, 95) then
        debugA("购买道具--精锐怪物旗帜")
        tap1(681, 385, 0x0e3d74) -- 最多
        tap1(527, 483, 0xd77e00) -- 购买
    end
    if (isColor(338, 45, 0xe0e0e0, 95) and isColor(575, 219, 0xbaab81, 95) and
        isColor(482, 485, 0x1c6db9, 95) and isColor(688, 397, 0x0d3a70, 95)) or
        (isColor(337, 46, 0xe0e0e0, 95) and isColor(575, 219, 0xc1b78e, 95) and
            isColor(482, 485, 0x1c6eba, 95) and isColor(688, 397, 0x0c376b, 95)) then
        debugA("使用道具--遗物")
        tap1(690, 397, 0x0d3a70) -- 最多
        tap1(507, 482, 0x1c6eba) -- 使用
    end
    if isColor(17, 23, 0xffffff, 95) and isColor(7, 23, 0xff9c00, 95) and
        isColor(1073, 598, 0x233a62, 95) and isColor(1063, 596, 0xd1ffff, 95) then
        debugA("区域档案")
        if isColor(1089, 572, 0x9e1111, 95) then -- 红点
            tap1(1073, 598)
        else
            tap1(20, 20)
        end
    end
    if isColor(18, 24, 0xffffff, 95) and isColor(9, 24, 0xff9c00, 95) and
        isColor(185, 100, 0x4a9ce9, 95) and isColor(186, 622, 0x728a9d, 95) then
        debugA("未确认记录")
        if isColor(263, 582, 0x116eb9, 95) then tap1(263, 582) end
        x, y = findColorInRegionFuzzy(0x931012, 90, 131, 85, 131, 495)
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            tap1(x, y + 10)
        else
            tap1(20, 20)
        end
    end
    if isColor(17, 24, 0xafafaf, 95) and isColor(381, 588, 0x00769c, 95) and
        isColor(561, 425, 0x9f6800, 95) and isColor(881, 585, 0x1d6dba, 95) then
        debugA("卡指引--编队--整编")
        tap1(881, 585, 0x1d6dba)
    end
    if isColor(20, 440, 0x8ab9f2, 95) and isColor(1103, 93, 0x444545, 95) and
        isColor(1057, 30, 0x808080, 95) and isColor(1071, 31, 0xffffff, 95) then
        debugA("提示1")
        tap1(1071, 31)
    end
    if isColor(1071, 31, 0xffffff, 95) and isColor(1057, 31, 0x808080, 95) and
        isColor(28, 130, 0x444545, 95) and isColor(24, 504, 0x8ab9f2, 95) then
        debugA("提示2")
        tap1(1071, 31)
    end
    if isColor(1073, 32, 0xffffff, 95) and isColor(1058, 32, 0x808080, 95) and
        isColor(14, 625, 0x000000, 95) then
        debugA("提示3")
        tap1(1073, 32)
    end
    if isColor(279, 286, 0x02ff00, 95) and isColor(319, 350, 0x02ff00, 95) and
        isColor(23, 249, 0xff8a00, 95) then
        debugA("新号--任务3绿")
        tap1(279, 286)
    end
    if isColor(16, 23, 0xffffff, 95) and isColor(858, 593, 0xd78b02, 95) and
        isColor(685, 589, 0x0474d7, 95) and isColor(558, 108, 0x517fad, 95) ==
        false then
        debugA("错误的出航界面")
        tap1(20, 20)
    end
    if isColor(76, 68, 0xff6600, 95) and isColor(387, 68, 0xff2a00, 95) and
        isColor(629, 607, 0x306090, 95) then
        debugA("旗舰--升级")
        if isColor(1019, 254, 0x116eb9, 95) then
            tap1(1019, 254)
            tap1(20, 20)
        else
            tap1(20, 20)
        end
    end
    if isColor(337, 11, 0xe0e0e0, 95) and isColor(499, 515, 0x6a3920, 95) and
        isColor(498, 497, 0x6b4600, 95) and isColor(795, 56, 0x718c9c, 95) then
        debugA("高级VIP点数--金币购买--误开")
        tap1(511, 596, 0x0c0c0e)
    end
    if isColor(291, 72, 0xf8a901, 95) and isColor(459, 502, 0x8f4d14, 95) and
        isColor(664, 542, 0xd87501, 95) then
        debugA("布置")
        tap1(664, 542, 0xd87501)
    end
    if isColor(472, 485, 0x114c8a, 95) and isColor(659, 505, 0x1c6fbb, 95) and
        isColor(772, 228, 0x5a5f65, 95) then
        debugA("集结时间")
        tap1(510, 570, 0x0c0c0e)
    end
    if isColor(834, 163, 0xff6600, 95) and isColor(667, 433, 0xd78b00, 95) and
        isColor(489, 421, 0x6b4600, 95) then
        debugA("误开加工缩短时间")
        tap1(510, 526, 0x0c0c0e)
    end
    if isColor(377, 211, 0xa353c5, 95) and isColor(495, 203, 0xf8ec61, 95) and
        isColor(632, 210, 0x4080cb, 95) then
        debugA("中级装备材料选择箱子--误开")
        tap1(515, 569, 0x3d5879)
    end
    if isColor(297, 107, 0x215da6, 95) and isColor(835, 585, 0x215da6, 95) and
        isColor(556, 551, 0x145da9, 95) then
        debugA("未知信号")
        tap1(511, 605, 0x0c0c0e)
    end
    if isColor(1049, 607, 0x1c68af, 95) and isColor(1045, 554, 0x1c68af, 95) and
        isColor(1, 1, 0xff9000, 95) then
        debugA("宇宙地图")
        tap1(511, 611, 0x0c0c0e)
    end
    if isColor(507, 519, 0x135eaa, 95) and isColor(646, 523, 0x121a22, 95) and
        isColor(782, 523, 0x121a22, 95) then
        debugA("司令官信息")
        tap1(511, 600, 0x0c0c0e)
    end
    if isColor(460, 430, 0x8f4d14, 95) and isColor(487, 448, 0xd3a363, 95) and
        isColor(291, 146, 0xf9aa01, 95) and isColor(781, 210, 0x85baf9, 95) then
        debugA("消耗积分币完成工作")
        tap1(511, 516, 0x0c0c0e)
    end
    if isColor(310, 314, 0xffffff, 95) and isColor(712, 309, 0x116eb9, 95) and
        isColor(310, 466, 0xffffff, 95) and isColor(719, 462, 0x116eb9, 95) then
        debugA(
            "挖出高级粒子后,继续挖高级粒子,弹出的对话框,标题为移动至高级商店")
        if isColor(714, 311, 0x116eb9, 95) then
            debugA("移动至高级商店")
            if numSeachLiZi == 4 then
                if check26 == "3级粒子" then
                    numSeachLiZi = 3
                    isLiZied = false -- 粒子
                elseif check20 == "2级粒子" then
                    numSeachLiZi = 2
                    isLiZied = false -- 粒子
                elseif check27 == "1级粒子" then
                    numSeachLiZi = 1
                    isLiZied = false -- 粒子
                else
                    isLiZied = true -- 粒子
                end
            elseif numSeachLiZi == 3 then
                if check20 == "2级粒子" then
                    numSeachLiZi = 2
                    isLiZied = false -- 粒子
                elseif check27 == "1级粒子" then
                    numSeachLiZi = 1
                    isLiZied = false -- 粒子
                else
                    isLiZied = true -- 粒子
                end
            elseif numSeachLiZi == 2 then
                -- if  check26 == "3级粒子" then
                -- numSeachLiZi=3
                if check27 == "1级粒子" then
                    numSeachLiZi = 1
                    isLiZied = false -- 粒子
                else
                    isLiZied = true -- 粒子
                end

            elseif numSeachLiZi == 1 then
                -- if  check26 == "3级粒子" then
                -- numSeachLiZi=3
                -- elseif  check20 == "2级粒子"  then
                -- numSeachLiZi=2
                -- end
                isLiZied = true -- 粒子     
            else
                isLiZied = true -- 粒子
            end
            tap1(510, 592, 0x0c0c0e) -- 关闭
            -- isLiZied = true -- 粒子
            tap1(172, 525) -- 搜索
        else
            debugA("通过以下途径获得以下道具")
            tap1(512, 594, 0x0c0c0e)
        end
    end
    if isColor(696, 250, 0x116eb9, 95) and isColor(823, 255, 0x126fba, 95) and
        isColor(460, 509, 0x8f4d14, 95) and isColor(465, 548, 0xd78c00, 95) then
        debugA("司令官经验值")
        tap1(465, 548, 0xd78c00)
        if isColor(487, 431, 0x1c6eb9, 95) then -- 确定
            tap1(487, 431)
        end
    end
    if isColor(308, 424, 0x167dfb, 95) and isColor(816, 554, 0x167dfb, 95) and
        isColor(518, 592, 0xa5a5a5, 95) then
        debugA("确认年龄")
        tap1(308, 424, 0x167dfb)
    end
    if isColor(242, 533, 0x167dfb, 95) and isColor(717, 586, 0x167dfb, 95) and
        isColor(145, 42, 0x333333, 95) and isColor(772, 579, 0xffffff, 95) then
        debugA("全部同意")
        tap1(242, 533)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(6, 24, 0xff9c00, 95) and
        isColor(56, 108, 0x75ff2d, 95) and isColor(243, 574, 0x114c8a, 95) and
        isColor(447, 618, 0x115dad, 95) then
        debugA("只有个建设按钮")
        tap1(447, 618, 0x115dad)
    end
    if isColor(515, 499, 0xd77500, 95) and isColor(291, 108, 0xf8ad01, 95) and
        isColor(469, 479, 0x6b4500, 95) and isColor(329, 180, 0x787b81, 95) then
        debugA("变更口号")
        tap1(511, 554, 0x0c0c0e)
    end
    if isColor(16, 25, 0xffffff, 95) and isColor(4, 25, 0xff9c00, 95) and
        isColor(48, 83, 0xffffff, 95) and isColor(61, 103, 0x4b4a54, 95) and
        isColor(346, 578, 0x227bc8, 95) then
        debugA("金属1/2")
        tap1(346, 578, 0x227bc8)
    end
    if isColor(282, 66, 0xff6600, 95) and isColor(458, 513, 0x114c8a, 95) and
        isColor(318, 205, 0xff6600, 95) then
        debugA("联盟推荐")
        -- tap1(458, 513, 0x114c8a)
        tap1(511, 603, 0x0c0c0e)
    end
    if isColor(773, 278, 0x5b7f98, 95) and isColor(772, 352, 0x5b7f98, 95) and
        isColor(1112, 314, 0x4a9ce9, 95) then
        debugA("合成人物--关闭")
        tap1(563, 595, 0x0a1829)
    end
    if isColor(504, 489, 0x1c6eba, 95) and isColor(305, 111, 0xff6600, 95) and
        isColor(827, 529, 0xff6600, 95) then
        debugA("人物--获得")
        tap1(504, 489, 0x1c6eba)
    end
    if isColor(849, 548, 0x8f4d14, 95) and isColor(1066, 596, 0xde7500, 95) and
        isColor(165, 599, 0x0c0c0e, 95) and isColor(157, 599, 0x3c587d, 95) then
        debugA("抽奖人物")
        tap1(885, 569, 0xd68b02)
    end
    -- if isColor(0, 0, 0xa80404, 95) and isColor(1135, 0, 0xa60101, 95) and isColor(0, 639, 0xa90304, 95) and
    --     isColor(1135, 639, 0xa60001, 95) then
    --         debug("被攻击")
    --     nowTime = os.time()
    --     timeXXX = nowTime
    -- end
    if isColor(725, 435, 0x117955, 95) and isColor(845, 460, 0x14a977, 95) and
        isColor(505, 614, 0x3a5475, 95) and isColor(272, 467, 0xffa900, 95) then
        debugA("升阶--关闭")
        tap1(510, 615, 0x0c0c0e)
    end

    if isColor(282, 186, 0xff6600, 95) and isColor(377, 462, 0xff6600, 95) and
        isColor(851, 177, 0x718d9f, 95) then
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
    if isColor(271, 196, 0xf7a901, 95) and isColor(690, 355, 0x114c8a, 95) and
        isColor(860, 412, 0xb8b7b8, 95) then
        -- if isColor(273, 149, 0xf7a901, 95) and isColor(260, 490, 0x658090, 95) and isColor(694, 318, 0x4693cf, 95) and
        -- isColor(844, 462, 0x052b57, 95) then
        debugA("认证和观看视频")
        -- tap1(726, 433, 0x1c6dba) -- 观看视频
        tap1(769, 381, 0xffffff) -- 认证
    end
    if isColor(310, 103, 0xf5a801, 95) and isColor(311, 159, 0x264569, 95) and
        isColor(691, 202, 0x116eb9, 95) and isColor(813, 201, 0x116eb9, 95) then
        debugA("expire notice")
        tap1(511, 540, 0x0c0c0e)
    end
    if isColor(605, 474, 0xc9a571, 95) and isColor(645, 492, 0xd77500, 95) and
        isColor(682, 387, 0x0b3365, 95) and isColor(616, 392, 0x4a5e9b, 95) then
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
    if isColor(639, 468, 0xd68b01, 95) and isColor(624, 473, 0x6b4500, 95) and
        isColor(685, 397, 0x0b305f, 95) and isColor(629, 392, 0xffffff, 95) then
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
    if isColor(123, 125, 0xff6600, 95) and isColor(776, 515, 0xce890e, 95) and
        isColor(123, 268, 0x5798dc, 95) and isColor(999, 431, 0x413013, 95) then
        -- if isColor(123, 125, 0xff6600, 95) and isColor(147, 254, 0x5fb1ff, 95) and isColor(785, 505, 0xd78c01, 95) then
        debugA("骗你充一次钱")
        tap1(510, 607, 0x375070)
        if isColor(339, 429, 0x1c6fbb, 95) and isColor(592, 438, 0x1c6eba, 95) and
            isColor(282, 217, 0xff6600, 95) then
            debugA("关闭礼包")
            tap1(339, 429, 0x1c6fbb)
        end
    end

    if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and
        isColor(503, 515, 0x233341, 95) and isColor(741, 516, 0x2f2a33, 95) then
        debugA("外太空玩家2")
        tap1(511, 600, 0x0c0c0e)
        tap1(571, 467, 0x05305c)
    end
    if isColor(158, 328, 0xf57508, 95) and isColor(771, 599, 0xf57508, 95) and
        isColor(225, 328, 0x426f99, 95) then
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
    if isColor(222, 123, 0x4c4334, 95) and isColor(229, 123, 0x102846, 95) and
        isColor(265, 258, 0x81d2fc, 95) then
        debugA("加成信息")
        if muBiaoA == "战备开盾" then
            if isColor(840, 181, 0x116eb9, 95) then -- 蓝色使用
                tap1(840, 181, 0x116eb9) -- 使用
                gaiMuBiaoNewA(4, "")
                numTodayDefense = numTodayDefense + 1
                writeJson("今日开盾次数", numTodayDefense)
                numDefense = numDefense + 1
                writeJson("开盾总次数", numDefense)
            elseif isColor(817, 162, 0xf18e06, 95) then -- 黄色--购买及使用
                tap1(840, 181, 0x116eb9) -- 购买
                mSleep(1000)
                tap1(656, 426, 0xd78b01) -- 确定
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
    if isColor(143, 57, 0xe0e0e0, 95) and isColor(500, 164, 0xd4dc39, 95) and
        isColor(833, 184, 0x116eb9, 95) then
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
    if isColor(474, 421, 0x1d6fbb, 95) and isColor(391, 306, 0x556c82, 95) and
        isColor(569, 304, 0x556c82, 95) then
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
    if isColor(50, 598, 0x071011, 95) and isColor(50, 601, 0x666666, 95) and
        isColor(571, 308, 0xffffff, 95) then
        debugA("广告,白色小手--点击")
        tap1(571, 308)
    end
    if isColor(850, 434, 0x05c237, 95) and isColor(913, 207, 0x05c237, 95) and
        isColor(990, 336, 0xb0b5b5, 95) then
        debugA("广告,绿色--继续")
        tap1(850, 434, 0x05c237)
        mSleep(45 * 1000)
    end
    if isColor(60, 55, 0xffffff, 95) and isColor(71, 44, 0xffffff, 95) and
        isColor(1069, 593, 0x9f95b5, 95) then
        debugA("关广告--X,白--左上")
        tap1(60, 55)
    end
    if isColor(48, 51, 0xe8e8e8, 95) and isColor(37, 40, 0xe8e8e8, 95) and
        isColor(1076, 591, 0xbabec1, 95) then
        debugA("关广告--X,白--左上2")
        tap1(48, 51)
    end
    if isColor(59, 56, 0xffffff, 95) and isColor(50, 597, 0x13282b, 95) and
        isColor(1069, 593, 0x586c9a, 95) then
        debugA("关广告--X,白--左上3")
        tap1(59, 56)
    end
    if isColor(563, 314, 0xffffff, 95) and isColor(1103, 39, 0x666666, 95) and
        isColor(1059, 584, 0xb3b3b3, 95) then
        debugA("关广告--X,白--小手")
        tap1(562, 308)
        mSleep(60 * 1000)
    end
    if isColor(59, 56, 0xffffff, 95) and isColor(48, 44, 0xffffff, 95) and
        isColor(1104, 40, 0xffffff, 95) then
        debugA("关广告--X,白--左上4")
        tap1(59, 55, 0xffffff)
    end
    if isColor(49, 52, 0xe8e8e8, 95) and isColor(36, 39, 0xe8e8e8, 95) and
        isColor(31, 53, 0x567274, 95) then
        debugA("关广告--X,白")
        tap1(49, 52)
    end
    if isColor(1099, 35, 0x7c7c7c, 95) and isColor(1100, 41, 0xfafafa, 95) then
        debugA("关广告--X,灰白色")
        tap1(1099, 35, 0x7c7c7c)
    end
    if isColor(1088, 47, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and
        isColor(929, 50, 0x868686, 95) then
        debugA("关广告--X,黑色")
        tap1(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and
        isColor(930, 50, 0x000000, 95) then
        debugA("关广告--X,黑色2")
        tap1(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0xffffff, 95) and isColor(1088, 62, 0x3c4043, 95) and
        isColor(30, 599, 0xffffff, 95) == false then
        debugA("关广告--X,白色")
        tap1(1088, 47, 0x202124)
    end
    if isColor(1078, 57, 0xffffff, 95) and isColor(1087, 57, 0x101010, 95) and
        isColor(28, 604, 0xe6e6e6, 95) then
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
    if isColor(1088, 52, 0xffffff, 95) and isColor(1098, 41, 0xffffff, 95) and
        isColor(33, 17, 0xe6e6e6, 95) then
        debugA("关广告--X,白色1--左上角")
        tap1(1088, 52)
    end
    if isColor(1088, 47, 0xfafafa, 95) and isColor(1088, 58, 0x505050, 95) and
        isColor(981, 57, 0xadafb2, 95) then
        debugA("广告--奖励已发放--灰底白字")
        tap1(1088, 47, 0xfafafa)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and
        isColor(792, 121, 0xe0b8ab, 95) and isColor(836, 102, 0xfab1cb, 95) then
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
            if isColor(98, 272, 0x2d5996, 95) and
                isColor(1030, 563, 0x2d5a98, 95) and
                isColor(566, 195, 0xeccfc0, 95) then
                debugA("已观看视频2")
                tap1(512, 606, 0x0d0d10)
                return
            end
            if isColor(98, 272, 0x2c5995, 95) and
                isColor(1030, 563, 0x2d5a98, 95) and
                isColor(566, 195, 0xedcfc1, 95) then
                debugA("已观看视频")
                tap1(512, 606, 0x0d0d10)
                return
            end
            mSleep(55 * 1000)
            nowTime = os.time()
            timeXXX = nowTime
            if isColor(1078, 58, 0xffffff, 95) and
                isColor(1087, 48, 0xffffff, 95) and
                isColor(1087, 67, 0xffffff, 95) then
                tap1(1078, 58)
            elseif isColor(1088, 48, 0xffffff, 95) and
                isColor(1096, 39, 0xffffff, 95) and
                isColor(1096, 56, 0xffffff, 95) then
                tap1(1088, 48)
            elseif isColor(1088, 48, 0x202124, 95) and
                isColor(1096, 39, 0x202124, 95) and
                isColor(1096, 56, 0x202124, 95) then
                tap1(1088, 48)
            elseif isColor(1088, 51, 0xffffff, 95) and
                isColor(1100, 39, 0xffffff, 95) and
                isColor(1100, 64, 0xffffff, 95) then
                tap1(1088, 51)
            elseif isColor(1099, 35, 0x7c7c7c, 95) and
                isColor(1106, 29, 0x7c7c7c, 95) and
                isColor(1106, 42, 0x7c7c7c, 95) then
                tap1(1099, 35)
            elseif isColor(1087, 51, 0xffffff, 95) and
                isColor(1100, 40, 0xffffff, 95) and
                isColor(1099, 62, 0xffffff, 95) then
                tap1(1087, 51)
            end
            for i = 1, 30, 1 do
                if isPause == true then return end
                if isColor(1078, 58, 0xffffff, 95) and
                    isColor(1087, 48, 0xffffff, 95) and
                    isColor(1087, 67, 0xffffff, 95) then
                    tap1(1078, 58)
                elseif isColor(1088, 48, 0xffffff, 95) and
                    isColor(1096, 39, 0xffffff, 95) and
                    isColor(1096, 56, 0xffffff, 95) then
                    tap1(1088, 48)
                elseif isColor(1088, 48, 0x202124, 95) and
                    isColor(1096, 39, 0x202124, 95) and
                    isColor(1096, 56, 0x202124, 95) then
                    tap1(1088, 48)
                elseif isColor(1088, 51, 0xffffff, 95) and
                    isColor(1100, 39, 0xffffff, 95) and
                    isColor(1100, 64, 0xffffff, 95) then
                    tap1(1088, 51)
                elseif isColor(1099, 35, 0x7c7c7c, 95) and
                    isColor(1106, 29, 0x7c7c7c, 95) and
                    isColor(1106, 42, 0x7c7c7c, 95) then
                    tap1(1099, 35)
                elseif isColor(1087, 51, 0xffffff, 95) and
                    isColor(1100, 40, 0xffffff, 95) and
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
    if isColor(98, 272, 0x2d5996, 95) and isColor(1030, 563, 0x2d5a98, 95) and
        isColor(566, 195, 0xeccfc0, 95) then
        debugA("已观看视频2")
        tap1(512, 606, 0x0d0d10)
    end
    if isColor(98, 272, 0x2c5995, 95) and isColor(1030, 563, 0x2d5a98, 95) and
        isColor(566, 195, 0xedcfc1, 95) then
        debugA("已观看视频")
        tap1(512, 606, 0x0d0d10)
    end
    if isColor(155, 144, 0xff6600, 95) and isColor(171, 137, 0xf8a901, 95) and
        isColor(345, 467, 0x1d6eba, 95) and isColor(600, 470, 0xd78b00, 95) then
        debugA("掌握--达成满级")
        tap1(514, 530, 0x0e0f12)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and
        isColor(1094, 39, 0xe8d9a3, 95) and isColor(1077, 19, 0xc07f20, 95) then
        debugA("司令官技能--误开")
        tap1(20, 20)
    end
    if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and
        isColor(900, 120, 0xffffff, 95) then
        debugA("云打码")
        nowTime = os.time()
        timeXXX = nowTime
        -- snapshot("yudama.png", 222, 12, 596, 157)
        current_time = os.date("%m-%d_%H.%M", os.time());
        snapshot(iphoneId .. "-" .. current_time .. ".png", 222, 12, 596, 157); -- 以时间戳命名进行截图
        -- ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "YDM/")
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/YDM/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        mSleep(2000)
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time ..
                      ".png")
        if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and
            isColor(900, 120, 0xffffff, 95) then
            closeFw() -- 关闭所有视图
            mSleep(500)
            local strDaMa = yunDaMaNew(op, 222, 12, 596, 157)
            if strDaMa ~= false then
                for i = 1, 10, 1 do
                    if isPause == true then return end
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
                x, y = findImage(iphoneId .. "-" .. current_time .. ".png", 221,
                                 11, 597, 158)
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
    if isColor(269, 510, 0xc3841e, 95) and isColor(281, 128, 0xffffff, 95) and
        isColor(300, 121, 0x0c345b, 95) then
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
    if isColor(457, 454, 0xf27c00, 95) and isColor(677, 453, 0xf2d600, 95) and
        isColor(513, 508, 0x1c6eba, 95) and isColor(308, 80, 0x0b4991, 95) then
        debugA("100 vip点数")
        tap1(556, 509, 0x1c6eba)
    end
    if isColor(498, 469, 0x1c6eba, 95) and isColor(646, 470, 0x1c6fbb, 95) and
        isColor(567, 242, 0x9d9962, 95) then
        -- if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        debugA("100 vip点数 单数")
        tap1(539, 475, 0x1c6ebb)
    end
    if isColor(498, 469, 0x1c6eba, 95) and isColor(646, 470, 0x1c6fbb, 95) and
        isColor(568, 243, 0xffff74, 95) then
        -- if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        debugA("10 vip点数 单数")
        tap1(539, 475, 0x1c6ebb)
    end

    if isColor(273, 72, 0xf5a801, 95) and isColor(270, 85, 0xe0e0e0, 95) and
        isColor(506, 590, 0x3f5d81, 95) and isColor(275, 146, 0x436c9e, 95) then
        debugA("奖励目录")
        if isColor(469, 517, 0x1eb585, 95) then
            tap1(477, 507)
        else
            tap1(511, 589, 0x0c0c0e)
        end
    end
    if isColor(170, 165, 0xa99280, 95) and isColor(214, 315, 0x56596a, 95) and
        isColor(354, 228, 0x246594, 95) then
        debugA("每日联盟任务")
        if isColor(146, 511, 0x1d6eb9, 95) then
            tap1(146, 511)
        else
            tap1(512, 612, 0x0c0c0e)
        end
    end
    if isColor(921, 44, 0x116eb9, 95) and isColor(330, 533, 0x49d9ec, 95) and
        isColor(83, 36, 0x30e4ff, 95) then
        debugA("联盟星球")
        tap1(877, 542)
        tap1(511, 609, 0x3a597d)
    end
    if isColor(111, 106, 0x215da6, 95) and isColor(137, 70, 0x757677, 95) and
        isColor(345, 65, 0xd4d4d5, 95) then
        -- if isColor(111, 106, 0x215da6, 95) and isColor(140, 71, 0xa9a9aa, 95) and isColor(345, 67, 0xd4d4d5, 95) then
        debugA("援助联盟成员工作")
        if isColor(916, 82, 0x0d9098, 95) then
            tap1(916, 82)
        else
            tap1(511, 609, 0x3a597d)
        end
    end
    if isColor(126, 118, 0x00ace4, 95) and isColor(150, 109, 0xc0c0c0, 95) and
        isColor(313, 130, 0xe1e2e2, 95) then
        debugA("联盟成员礼物")
        if isColor(902, 128, 0x0d9098, 95) then
            tap1(902, 128)
        else
            tap1(511, 590, 0x0c0c0e)
        end
    end
    if isColor(126, 59, 0x00ace4, 95) and isColor(116, 85, 0x215da6, 95) and
        isColor(519, 617, 0x3a597d, 95) then
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
    if isColor(89, 35, 0x00ace4, 95) and isColor(91, 71, 0x215da6, 95) and
        isColor(125, 28, 0xc4bfbe, 95) and isColor(231, 42, 0xdbdcdc, 95) then
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
        elseif isColor(218, 169, 0x9d1111, 95) and
            isColor(199, 182, 0xa17316, 95) then
            debugA("进行--红点--已选中")
            if isColor(311, 445, 0x1db687, 95) then
                tap1(311, 445)
            elseif isColor(558, 443, 0x1db586, 95) then
                tap1(558, 443)
            end
        elseif isColor(227, 233, 0x931012, 95) and
            isColor(199, 250, 0xa07316, 95) then
            debugA("协助--红点--已选中")
            if isColor(303, 449, 0x1c6dba, 95) then
                tap1(303, 449, 0x1c6dba)
            else
                tap1(513, 606, 0x395679)
            end
        elseif isColor(228, 105, 0x931012, 95) and
            isColor(213, 114, 0x1b2b3e, 95) then
            debugA("任务--红点--未选中")
            tap1(171, 140, 0x283544)
        elseif isColor(218, 169, 0x9d1111, 95) and
            isColor(212, 178, 0x1b2b3e, 95) then
            debugA("进行--红点--未选中")
            tap1(171, 211, 0x283544)
        elseif isColor(227, 233, 0x931012, 95) and
            isColor(210, 244, 0x1b2a3d, 95) then
            debugA("协助--红点--未选中")
            tap1(166, 263, 0x855f15)

        elseif isColor(315, 448, 0x1db587, 95) then
            debugA("分享")
            tap1(315, 448)
        elseif isColor(186, 262, 0x876115, 95) and
            isColor(323, 448, 0x1d6ebb, 95) then
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
    if isColor(48, 44, 0x00ace4, 95) and isColor(72, 119, 0xa17316, 95) and
        isColor(94, 136, 0xffffff, 95) then
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
    if isColor(129, 66, 0xf5a801, 95) and isColor(146, 170, 0x30e5ff, 95) and
        isColor(159, 366, 0xac6c27, 95) then
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
        elseif isColor(543, 207, 0x3e8fee, 95) or
            isColor(995, 181, 0x1d426f, 95) then -- 缺少条件1
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
    if isColor(679, 457, 0xd78b00, 95) and isColor(912, 177, 0x1c6eba, 95) and
        isColor(562, 198, 0x68defb, 95) then
        debugA("招募公告")
        tap1(679, 457, 0xd78b00)

    end
    if isColor(370, 469, 0x1c6db9, 95) and isColor(660, 477, 0xd78b00, 95) and
        isColor(368, 213, 0xabf4f7, 95) then
        debugA("立即捐款")
        tap1(370, 469, 0x1c6db9)
    end
    if isColor(380, 420, 0x1c6dba, 95) and isColor(651, 420, 0xd78b00, 95) and
        isColor(282, 175, 0xff6600, 95) and isColor(613, 409, 0x6b4500, 95) then
        debugA("捐完了")
        tap1(380, 420, 0x1c6dba) -- 取消
        tap1(512, 541, 0x0c0c0e) -- 关闭
        tap1(511, 528, 0x0c0c0e) -- 关闭
        tap1(510, 602, 0x0c0c0e) -- 关闭
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(92, 36, 0xb4c0ce, 95) and
        isColor(173, 43, 0x9eabbb, 95) then
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
        elseif isColor(466, 175, 0x306090, 95) and isShengChan == true and
            check11 ~= "不生产" then
            debugA("攻击舰-休息")
            tap1(466, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(685, 174, 0x306090, 95) and isShengChan == true and
            check11 ~= "不生产" then
            debugA("高速舰-休息")
            tap1(685, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(471, 253, 0x306090, 95) and isShengChan == true and
            check11 ~= "不生产" then
            debugA("运输舰-休息")
            tap1(471, 253)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(681, 257, 0x306090, 95) and isShengChan == true and
            check11 ~= "不生产" then
            debugA("防御舰-休息")
            tap1(685, 257)
            isJiDiXianKuangIntoProduce = true
            -- 474,257,0x8a4c17 完毕
            -- 518,175,0x306090 休息中
        elseif isColor(460, 175, 0x064f61, 95) and check15 == "生产加速" and
            numSpeedUp == 1 then
            debugA("攻击舰-加速")
            tap1(466, 175)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(655, 174, 0x064f61, 95) and check15 == "生产加速" and
            numSpeedUp == 2 then
            debugA("高速舰-加速")
            tap1(685, 175)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(469, 258, 0x064f61, 95) and check15 == "生产加速" and
            numSpeedUp == 3 then
            debugA("运输舰-加速")
            tap1(471, 253)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(659, 255, 0x064f61, 95) and check15 == "生产加速" and
            numSpeedUp == 4 then
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
        elseif isColor(686, 321, 0x9e1111, 95) and nowTime - timeLianMengRenWu >=
            60 * 60 then
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
        elseif isColor(996, 177, 0x306090, 95) and isYanJiu == true and check14 ==
            "研究" then
            debugA("技术研究--休息中")
            tap1(996, 177)
            gaiMuBiaoNewA(3, "研究")
            -- elseif check25 == "库存" and isColor(953, 303, 0x306090, 95) then
            -- debugA("机库--休息中")
            -- tap1(982, 276, 0x306090)
        elseif muBiaoA1 == mb_WaKuang then

        else
            tap1(510, 608, 0x0c0c0e)
        end
    end
    if isColor(553, 205, 0x345214, 90) and isColor(581, 188, 0x2a72ba, 90) then
        debugA("个人活动--点数奖励")
        tap1(512, 577, 0x0c0c0e)
    end
    if isColor(274, 160, 0xcda099, 95) and isColor(292, 81, 0x9badde, 95) and
        isColor(366, 330, 0x78551a, 95) then
        debugA("签到奖励")
        x, y = findColorInRegionFuzzy(0x145e99, 95, 857, 133, 857, 539);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            tap1(x, y)
        else
            tap1(508, 609)
        end
    end
    if isColor(141, 75, 0x406898, 95) and isColor(170, 67, 0xff6600, 95) and
        isColor(738, 504, 0xd78b01, 95) then
        debugA("推荐礼包--广告")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(366, 363, 0x423113, 95) and isColor(672, 365, 0x453313, 95) and
        isColor(472, 527, 0xd88b00, 95) then
        debugA("推荐礼包--广告2")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(110, 63, 0xff6600, 95) and isColor(449, 500, 0x8f4d14, 95) and
        isColor(1055, 557, 0x406898, 95) then
        debugA("推荐礼包--广告3")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(98, 288, 0xffffff, 95) and isColor(1036, 286, 0xffffff, 95) and
        isColor(493, 522, 0xd78b00, 95) and isColor(897, 587, 0x425f82, 95) then
        debugA("广告画廊")
        tap1(471, 590)
        tap1(907, 590)
    end
    if isColor(16, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and
        isColor(75, 13, 0xb1c2d5, 95) and isColor(160, 32, 0x9aacc0, 95) then
        debugA("探险关门")
        tap1(20, 20)
        redJudge()
    end
    if isColor(7, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and
        isColor(73, 14, 0xe2e8ef, 95) and isColor(161, 29, 0xa8b8c9, 95) then
        debugA("活动中心")
        x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0xf29203", 90, 133,
                                           120, 134, 603)
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
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x34618e, 95) and
        isColor(612, 24, 0xff6600, 95) then
        debugA("每日报告1")
        tap1(510, 609)
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x356290, 95) and
        isColor(618, 24, 0xff6600, 95) then
        debugA("每日报告2")
        tap1(510, 609)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and
        isColor(73, 16, 0xe2e8ef, 95) and isColor(159, 23, 0x97a9be, 95) then
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
        elseif isColor(137, 103, 0x9e1111, 95) and
            isColor(117, 103, 0xa17316, 95) then
            debugA("签到奖励--红点--已选")
            x, y = findColorInRegionFuzzy(0x145e99, 95, 972, 145, 972, 587);
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                tap1(x, y)
            else
                tap1(20, 20)
            end
        elseif isColor(136, 173, 0x9e1111, 95) and
            isColor(116, 173, 0xa17316, 95) then
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
        elseif isColor(137, 103, 0x9e1111, 95) and
            isColor(122, 107, 0x1b2a3d, 95) then
            debugA("签到奖励--红点--未选")
            tap1(137, 104)
        elseif isColor(137, 172, 0x9e1111, 95) and
            isColor(127, 189, 0x192738, 95) then
            debugA("欢迎礼物--红点--未选")
            tap1(137, 172)
        elseif isColor(137, 311, 0x9e1111, 95) and
            isColor(122, 311, 0x1b2b3f, 95) then
            debugA("航母活动--红点--未选")
            tap1(137, 311)
        elseif isColor(137, 380, 0x9e1111, 95) and
            isColor(124, 380, 0x1b2b3f, 95) then
            debugA("司令官任务--红点--未选")
            tap1(137, 380)
        elseif isColor(137, 311, 0x9e1111, 95) and
            isColor(114, 311, 0xa17316, 95) then
            debugA("航母活动--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 95, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     tap1(x, y)
            -- else
            --     tap1(20, 20)
            -- end
            tap1(20, 20)
            -- timeRed = nowTime
        elseif isColor(396, 339, 0x1b7b55, 95) and
            isColor(247, 400, 0x7d8a96, 95) then
            debugA("航母活动--向上移位置了--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 95, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     tap1(x, y)
            -- else
            --     tap1(20, 20)
            -- end
            tap1(20, 20)
            -- timeRed = nowTime
        elseif isColor(1082, 287, 0xa6a4a9, 95) and
            isColor(1082, 276, 0x473271, 95) then
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
                if isColor(179 + 133 * i, 549, 0xeeb30b, 80) then -- 连续签到次数
                    tap1(210 + 133 * i, 549)
                end
            end
            if isColor(17, 25, 0xffffff, 95) then tap1(20, 20) end
        else
            x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0x1a293c", 90,
                                               128, 95, 131, 590)
            if x ~= -1 then
                tap1(x, y)
            else
                tap1(20, 20)
            end
        end
    end
    if isColor(312, 75, 0xf9ab01, 95) and isColor(307, 103, 0xe0e0e0, 95) and
        isColor(457, 438, 0xf27c00, 95) and isColor(511, 504, 0x1d6db9, 95) then
        -- if isColor(312, 77, 0xf5a801, 95) and isColor(308, 98, 0x0b4992, 95) and isColor(457, 438, 0xf27d00, 95) and
        -- isColor(511, 504, 0x1d6dba, 95) then
        debugA("道具信息--复数--使用")
        if muBiaoA == mb_5DaoJu then
            tap1(458, 438, 0xf27c00) -- 1个 
            tap1(511, 504)
            if num5DaoJu >= 5 then gaiMuBiaoNewA(2, "道具合成") end
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
    if isColor(312, 115, 0xf9ab01, 95) and isColor(307, 126, 0xe0e0e0, 95) and
        isColor(486, 436, 0x114c8a, 95) and isColor(490, 455, 0x1d6eba, 95) then
        -- if isColor(312, 116, 0xf5a801, 95) and isColor(307, 127, 0xe0e0e0, 95) and isColor(486, 436, 0x114c8a, 95) and
        -- isColor(490, 455, 0x1c6ebb, 95) then
        debugA("道具信息--单数--使用")
        tap1(490, 455, 0x1c6ebb)
        if muBiaoA == mb_5DaoJu then
            if num5DaoJu >= 5 then gaiMuBiaoNewA(2, "道具合成") end
        end
    end
    if isColor(89, 59, 0xf5a801, 95) and isColor(208, 252, 0x2c4968, 95) and
        isColor(300, 430, 0x8f4d14, 95) then
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

    if isColor(5, 25, 0xff6600, 95) and isColor(17, 25, 0xffffff, 95) and
        isColor(467, 518, 0x448db2, 95) then
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
                elseif isColor(1020, 461, 0x116eb9, 95) and isKaJianZhangJingYan ==
                    3 then
                    tap1(1020, 461)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 2
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(819, 357, 0x00ace4, 95) and isKaJianZhangJingYan ==
                    2 then
                    debugA("2满")
                    tap1(860, 357)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 1
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(1020, 359, 0x116eb9, 95) and isKaJianZhangJingYan ==
                    2 then
                    tap1(1020, 359)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 1
                        tap1(510, 494, 0x0c0c0e)
                    end
                elseif isColor(819, 239, 0x00ace4, 95) and isKaJianZhangJingYan ==
                    1 then
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
    if isColor(7, 24, 0xff9c00, 95) and isColor(626, 62, 0x005c8b, 95) and
        isColor(712, 387, 0x5798dc, 95) then
        debugA("舰长列表")
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then bMultiColor = true end
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
    if isColor(250, 135, 0xf5a801, 95) and isColor(247, 148, 0xe0e0e0, 95) and
        isColor(896, 504, 0x647e8f, 95) then
        debugA("主专长")
        tap1(512, 572)
    end
    if isColor(307, 126, 0xe0e0e0, 95) and isColor(312, 116, 0xf5a801, 95) and
        isColor(514, 457, 0x1c6db9, 95) and isColor(583, 291, 0x22d5c9, 95) then
        debugA("租用无人机8小时")
        tap1(514, 457)
    end
    if isColor(8, 24, 0xff9c00, 95) and isColor(63, 333, 0xffffff, 95) and
        isColor(323, 447, 0x0078fe, 95) then
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

    if isColor(450, 467, 0xd68b01, 95) and isColor(687, 477, 0x1d6ebb, 95) and
        isColor(339, 117, 0xff6600, 95) then
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
    if isColor(17, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and
        isColor(48, 208, 0x9d96a8, 95) then
        debugA("平台界面")
        if haoLV == 3 then
            tap1(20, 20)
            return
        end
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then bMultiColor = true end
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
                fwShowButton("window1", "more", strNotice, RGB_NoticeFont,
                             RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
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
                fwShowButton("window1", "more", strNotice, RGB_NoticeFont,
                             RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                mSleep(500)
            else
                tap1(20, 20)
            end
        end
    end
    if isColor(288, 173, 0x0b4992, 95) and isColor(291, 161, 0xf5a801, 95) and
        isColor(491, 414, 0x45586c, 95) then
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
    if isColor(5, 25, 0xff9c00, 95) and isColor(104, 85, 0x30e3fe, 95) and
        isColor(618, 537, 0xbf7702, 95) then
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
    if isColor(435, 30, 0x1b68c8, 95) and isColor(515, 54, 0x0f1c2b, 95) and
        isColor(626, 75, 0xffffff, 95) and isColor(510, 617, 0x0c0c0e, 95) then
        debugA("传输结果")
        tap1(510, 623)
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(993, 595, 0xd77400, 95) and
        isColor(962, 579, 0x0780fe, 95) then
        debugA("海盗界面")
        tap1(993, 595)
        isKillPirate = false -- 杀海盗
        timeKillPirate = nowTime
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(936, 558, 0x114c8a, 95) and
        isColor(942, 591, 0x1c6eba, 95) then
        debugA("海盗--移动")
        tap1(942, 591, 0x1c6eba)
    end
    if isColor(6, 24, 0xff9c00, 95) and isColor(76, 113, 0xaa3d3d, 95) and
        isColor(866, 594, 0xd68b02, 95) then
        debugA("海盗--出航")
        if isColor(813, 65, 0xfbfbfb, 95) or isColor(810, 66, 0xff9999, 95) or
            isColor(793, 63, 0xc80305, 95) then -- 不利
            tap1(20, 20)
            if haoLV <= 2 and muBiaoA == "主线" and numLv >= 6 then
                gaiMuBiaoNewA(1, "章节")
            end
        elseif isColor(242, 150, 0xffffff, 95) or
            isColor(226, 149, 0xffffff, 95) then
            debugA("无人物")
            tap1(20, 20)
        else
            tap1(866, 594)
            isKillPirate = false -- 杀海盗
            timeKillPirate = nowTime
        end
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(476, 383, 0x116eb9, 95) and
        isColor(475, 539, 0xf18e07, 95) then
        debugA("领取奖励")
        tap1(476, 383)
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(503, 386, 0x124067, 95) and
        isColor(475, 539, 0xf18e07, 95) then
        debugA("领取奖励--未到时")
        tap1(20, 20)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and
        isColor(56, 217, 0x5dfe09, 95) then
        debugA("建设界面")
        if isColor(46, 57, 0xffb500, 95) == false then -- 无黄色条
            tap1(20, 20)
            return
        end
        local bMultiColor = false;
        for i = 0, 3, 1 do
            if zongHe_Mult() == true then bMultiColor = true end
            mSleep(100)
        end
        if isColor(57, 216, 0x64ff15, 95) and isColor(53, 190, 0xffffff, 95) then
            debugA("升级界面")
            if haoLV <= 2 and
                ((isColor(63, 548, 0x31bcd8, 95) and
                    isColor(42, 440, 0xa82400, 95)) or
                    (isColor(64, 545 - 107, 0x40d1e8, 95) and
                        isColor(53, 571 - 107, 0x5daa9f, 95))) then
                debugA("指挥中心")
                -- x, y = findMultiColorInRegionFuzzy(0x32bed9, "-21|-108|0xb72700", 90, 749, 126, 772, 145)
                local numStr = ocrText(749, 126, 772, 145, 0, "012346789")
                if tonumber(numStr) >= 0 then
                    numLv = tonumber(numStr) - 1
                    writeJson("指挥中心等级", numLv)
                    toast(numLv)
                end
            end
            if haoLV >= 3 and isTrade == false and
                isColor(42, 331, 0xbe78b9, 95) then
                debugA("点击交易所")
                tap1(42, 331)
                return
            elseif haoLV >= 3 and isJiKu == true and
                isColor(62, 338, 0x245459, 95) then
                debugA("机库升级界面")
                tap1(62, 338)
                isJiKu = false
                return
            elseif haoLV >= 3 and isCheckLiZiNum == false and
                isColor(42, 331, 0xbe78b9, 95) then
                debugA("交易所--点击兑换")
                tap1(51, 434)
                isCheckLiZiNum = true
                return
            elseif haoLV >= 3 and numAddChanLiang <= 2 and
                isColor(32, 336, 0x00fc21, 95) then
                debugA("点击增产")
                tap1(42, 331)
                return
            elseif haoLV >= 3 and isAddChanLiangLiZi == false and
                isColor(32, 336, 0x00fc21, 95) and check16 == "vip8" then
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
                if isShipBad == true and isColor(41, 343, 0x938d99, 95) and
                    isColor(38, 190, 0xffffff, 95) then
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
                        if isColor(246, 604, 0xfddb81, 95) and
                            isColor(269, 612, 0xfad275, 95) then
                            debugA("免费")
                            tap1(246, 604)
                        else
                            debugA("花钱升级")
                            tap1(442, 592)
                        end
                    else
                        getOut()
                    end
                elseif isColor(246, 604, 0xfddb81, 95) and
                    isColor(270, 612, 0xf5c566, 95) then
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
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >=
                        10) then
                    debugA("2蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(843, 390)
                    else
                        getOut()
                    end
                elseif isColor(1104, 390, 0x1a406b, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >=
                        10) then
                    debugA("2蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(843, 390)
                    else
                        getOut()
                    end
                elseif isColor(652, 368, 0x3e8fee, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >=
                        10) then
                    debugA("1蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        tap1(1089, 356)
                    else
                        getOut()
                    end
                elseif isColor(1104, 356, 0x1a406b, 95) and
                    (isAutoNext == true or nowTime - timeShengJiTongXingZheng >=
                        10) then
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
                    if isColor(851, 357, 0x15273f, 95) and
                        isColor(851, 411, 0x15273f, 95) and
                        isColor(1087, 357, 0x15273f, 95) and
                        isColor(1087, 411, 0x15273f, 95) then
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
        elseif isColor(41, 296, 0xffffff, 95) and isColor(34, 321, 0xbf9721, 95) and
            isColor(111, 108, 0x4c87ba, 95) then
            debugA("维修界面")
            if isColor(1077, 527, 0x1eb686, 95) and
                isColor(993, 574, 0x237bc8, 95) then -- 重置
                debugA("可修理--不缺少资源")
                tap1(984, 589, 0x1d6ebb)
            elseif isColor(988, 525, 0x15a976, 95) and
                isColor(989, 588, 0x1f2830, 95) then
                debugA("可修理--缺少资源")
                isReceiveEmail = true
                tap1(20, 20)
                tap1(698, 586, 0xb4cdf3) -- 打开邮件
            elseif isColor(946, 586, 0x1db587, 95) and
                isColor(984, 586, 0xffffff, 95) then
                debugA("援助请求")
                tap1(946, 586)
            else
                tap1(20, 20)
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(38, 320, 0xdeb748, 95) and
            isColor(341, 601, 0xd77500, 95) then
            debugA("指挥中心--维修界面")
            if isColor(793, 584, 0x155daa, 95) then
                tap1(793, 584)
            else
                tap1(48, 233, 0x325240)
            end
        elseif isColor(57, 296, 0xffffff, 95) and isColor(44, 357, 0xffe75f, 95) and
            isColor(45, 322, 0x0e5dd7, 95) then
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
            elseif check16 == "vip8" and numBuyTaiByCoin <= 15 and
                isColor(1002, 426, 0xf18e07, 95) and check24 == "买钛" then -- 金币购买
                tap1(971, 427)
                if isColor(359, 431, 0x1c6dba, 95) and
                    isColor(429, 427, 0xeff5fa, 95) then
                    debugA("可免费兑换")
                    tap1(452, 428, 0x2266ae) -- 使用
                    mSleep(1000)
                    if isColor(643, 515, 0x165da9, 95) then
                        tap1(678, 437, 0x000000) -- 全部
                        tap1(521, 490, 0x1c6dba) -- 使用
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
                if isColor(359, 431, 0x1c6dba, 95) and
                    isColor(429, 427, 0xeff5fa, 95) then
                    debugA("可免费兑换")
                    tap1(452, 428, 0x2266ae) -- 使用
                    mSleep(1000)
                    tap1(678, 437, 0x000000) -- 全部
                    tap1(521, 490, 0x1c6dba) -- 使用
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
                    if numZiYuan <= 2 then numZiYuan = 2 end
                end
                if isColor(187, 323, 0xffffff, 95) then -- 2
                    if numZiYuan <= 3 then numZiYuan = 3 end
                end
                if isColor(411, 234, 0xffffff, 95) then -- 3
                    if numZiYuan <= 4 then numZiYuan = 4 end
                end
                if isColor(634, 145, 0xffffff, 95) then -- 4
                    if numZiYuan <= 5 then numZiYuan = 5 end
                end
                if isColor(634, 323, 0xffffff, 95) then -- 5
                    if numZiYuan <= 6 then numZiYuan = 6 end
                end
                if isColor(858, 234, 0xffffff, 95) then -- 6
                    if numZiYuan <= 7 then numZiYuan = 7 end
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
                    if numKaiFa <= 2 then numKaiFa = 2 end
                end
                if isColor(411, 145, 0xffffff, 95) then -- 2
                    if numKaiFa <= 3 then numKaiFa = 3 end
                end
                if isColor(411, 323, 0xffffff, 95) then -- 3
                    if numKaiFa <= 4 then numKaiFa = 4 end
                end
                if isColor(634, 234, 0xffffff, 95) then -- 4
                    if numKaiFa <= 5 then numKaiFa = 5 end
                end
                if isColor(858, 145, 0xffffff, 95) then -- 5
                    if numKaiFa <= 6 then numKaiFa = 6 end
                end
                if isColor(858, 323, 0xffffff, 95) then -- 6
                    if numKaiFa <= 7 then numKaiFa = 7 end
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
                    if numFangYu <= 2 then numFangYu = 2 end
                end
                if isColor(411, 145, 0xffffff, 95) then -- 2
                    if numFangYu <= 3 then numFangYu = 3 end
                end
                if isColor(411, 323, 0xffffff, 95) then -- 3
                    if numFangYu <= 4 then numFangYu = 4 end
                end
                if isColor(634, 145, 0xffffff, 95) then -- 4
                    if numFangYu <= 5 then numFangYu = 5 end
                end
                if isColor(634, 323, 0xffffff, 95) then -- 5
                    if numFangYu <= 6 then numFangYu = 6 end
                end
                if isColor(858, 56, 0xffffff, 95) then -- 6
                    if numFangYu <= 7 then numFangYu = 7 end
                end
                if isColor(858, 234, 0xffffff, 95) then -- 7
                    if numFangYu <= 8 then numFangYu = 8 end
                end
                if isColor(858, 411, 0xffffff, 95) then -- 8
                    if numFangYu <= 9 then numFangYu = 9 end
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
            elseif isColor(600, 157, 0x13669a, 95) and
                isColor(726, 286, 0x13669a, 95) and
                isColor(600, 403, 0x13669a, 95) then
                debugA("研究--强制")
                tap1(600, 262, 0xb8b9d4)
                if isColor(543, 207, 0x3e8fee, 95) or
                    isColor(995, 181, 0x1d426f, 95) then -- 缺少条件1
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
            if isColor(656, 483, 0x111111, 95) and
                isColor(785, 510, 0x0c0c0c, 95) then
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
                    elseif isColor(548 + j * 167, 251 + i * 238, 0x6c28d6, 95) and
                        isBuyLiZi == true then -- 粒子
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
                        isColor(515 + j * 167, 182 + i * 238, 0x359e1f, 95) and
                        check16 == "vip8" and isBuyLiZi == true and check24 ==
                        "买钛" then -- 钛
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
                        isColor(552 + j * 167, 228 + i * 238, 0x0f1d22, 95) then -- 护盾
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
                if isColor(811, 589, 0x89898c, 95) and
                    isColor(826, 589, 0x89898c, 95) and
                    isColor(833, 589, 0x89898c, 95) and
                    isColor(848, 589, 0x89898c, 95) and
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
                if isColor(811, 589, 0x89898c, 95) and
                    isColor(826, 589, 0x89898c, 95) and
                    isColor(833, 589, 0x89898c, 95) and
                    isColor(848, 589, 0x89898c, 95) and
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
            if isColor(505, 110, 0x3e6b96, 95) == false and
                isColor(505, 110, 0x191c27, 95) == false then
                debugA("无航母")
                tap1(20, 20)
                if muBiaoA == mb_FixShip then
                    gaiMuBiaoNewA(3, "", mm_Wu)
                end
                return
            end
            if (isColor(505, 110, 0x3e6b96, 95) or
                isColor(505, 110, 0x191c27, 95)) -- 1号航母存在
            and isColor(440, 263, 0xffffff, 95) == false -- 没在充电
            and isColor(410, 271, 0xffffff, 95) == false -- 没在升阶
            and isColor(491, 119, 0xffffff, 95) == false -- 不是0级
            and isColor(440, 281, 0xffffff, 95) == false -- 没在使用
            and isColor(596 - 199, 290, 0xe4e4e5, 95) == false then -- 没在满期
                debugA("1号来充电吧")
                tap1(440, 263)
                -- elseif isColor(704, 110, 0x3e6b96, 95) -- 2号航母存在
            elseif (isColor(704, 110, 0x3e6b96, 95) or
                isColor(704, 110, 0x191c27, 95)) -- 2号航母存在
            and isColor(639, 256, 0xffffff, 95) == false -- 没在充电
            and isColor(609, 271, 0xffffff, 95) == false -- 没在升阶
            and isColor(690, 119, 0xffffff, 95) == false -- 不是0级
            and isColor(639, 281, 0xffffff, 95) == false -- 没在使用
            and isColor(596, 290, 0xe4e4e5, 95) == false then -- 没在满期
                debugA("2号来充电吧")
                tap1(639, 263)
                -- elseif isColor(902, 110, 0x3e6b96, 95) -- 3号航母存在
            elseif (isColor(902, 110, 0x3e6b96, 95) or
                isColor(902, 110, 0x191c27, 95)) -- 3号航母存在
            and isColor(838, 256, 0xffffff, 95) == false -- 没在充电
            and isColor(808, 271, 0xffffff, 95) == false -- 没在升阶
            and isColor(888, 119, 0xffffff, 95) == false -- 不是0级
            and isColor(838, 281, 0xffffff, 95) == false -- 没在使用
            and isColor(795, 290, 0xe4e4e5, 95) == false then -- 没在满期
                debugA("3号来充电吧")
                tap1(838, 263)
                -- elseif isColor(1079, 110, 0x3e6b96, 95) -- 4号航母存在
            elseif (isColor(1079, 110, 0x3e6b96, 95) or
                isColor(1079, 110, 0x191c27, 95)) -- 4号航母存在
            and isColor(1036, 256, 0xffffff, 95) == false -- 没在充电
            and isColor(1006, 271, 0xffffff, 95) == false -- 没在升阶
            and isColor(1087, 119, 0xffffff, 95) == false -- 不是0级
            and isColor(1036, 281, 0xffffff, 95) == false -- 没在使用
            and isColor(993, 290, 0xe4e4e5, 95) == false then -- 没在满期
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
            if isColor(327, 181, 0x4e6374, 95) or
                isColor(328, 337, 0x4e6374, 95) or
                isColor(327, 495, 0x4e6374, 95) then
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
                if numCaiLiao >= 13 then numCaiLiao = 1 end
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
                tap1(934, 609, 0x1c6eba) -- 库存
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
            local tab = {
                userPath() .. "/res/lizi1.jpg", userPath() .. "/res/lizi2.jpg"
            }
            local path = userPath() .. "/res/lizi.jpg"
            local dir = 1
            local quality = 1
            local bool, msg = image_tsing.operMerge(tab, path, dir, quality) -- 合并图片

            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg",
                         12, 0, 0, 50, 30);
            mSleep(500)
            tap1(16, 24, 0xffffff)
        else
            tap1(20, 20)

        end
    end
    if isColor(215, 189, 0xb283ca, 95) and isColor(344, 191, 0xf7eb5e, 95) and
        isColor(494, 210, 0x113199, 95) then
        debugA("制作材料")
        if isColor(500, 518, 0x604411, 95) or isColor(529, 524, 0x081525, 95) or
            isColor(529, 524, 0x151e2b, 95) then
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
            if numCaiLiao >= 13 then numCaiLiao = 1 end
            writeJson("材料编号", numCaiLiao)
        else
            tap1(516, 523, 0x604411)
        end
    end
    if isColor(34, 111, 0xff6600, 95) and isColor(59, 106, 0xff8400, 95) and
        isColor(526, 84, 0x01ace4, 95) and isColor(905, 134, 0x116eb9, 95) then
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

    if isColor(476, 459, 0xd68b00, 95) and isColor(496, 470, 0x279fd5, 95) and
        isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--矿物")
        tap1(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 474, 0x9a95a3, 95) and
        isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--金属")
        tap1(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(499, 476, 0x8644ed, 95) and
        isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--粒子")
        tap1(513, 552, 0x0c0c0e)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 464, 0xf8eea7, 95) and
        isColor(469, 447, 0x8f4d14, 95) then
        debugA("购买道具--金币")
        tap1(513, 552, 0x0c0c0e)
    end
    if isColor(217, 437, 0x67e5f5, 95) and isColor(399, 444, 0x837e8b, 95) and
        isColor(597, 444, 0xb1d272, 95) then
        debugA("充电--第二步")
        tap1(884, 187, 0x0b3466)
        tap1(884, 271, 0x0b3466)
        tap1(882, 349, 0x8b9fb7)
        tap1(647, 504, 0x1a69b6)
    end
    if isColor(586, 189, 0x6375a7, 95) and isColor(776, 270, 0xffffff, 95) and
        isColor(587, 354, 0x5b6ea3, 95) and isColor(719, 507, 0x1c6eba, 95) then
        debugA("充电缺少资源")
        tap1(511, 586, 0x0c0c0e)
        isChongDianKaZiYuan = true
        getOut()
    end
    if isColor(275, 58, 0xf5a801, 95) and isColor(737, 130, 0x0d9098, 95) and
        isColor(290, 225, 0xffffff, 95) and isColor(538, 488, 0xba7b00, 95) then
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
    if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and
        isColor(355, 86, 0x5195db, 95) then
        debugA("司令官界面")
        if isColor(1113, 84, 0x9e1111, 95) then -- 战绩红点
            tap1(1113, 84)
        else
            tap1(20, 20)
        end
    end
    if isColor(33, 45, 0xff6600, 95) and isColor(77, 149, 0x55aeff, 95) and
        isColor(1094, 559, 0x7088a9, 95) then
        debugA("战绩")
        if isColor(141, 490, 0xf49a16, 95) then
            tap1(141, 490)
        else
            tap1(511, 594, 0x0c0c0e)
        end
    end
    if isColor(291, 168, 0xf5a801, 95) and isColor(282, 175, 0xff6600, 95) and
        isColor(783, 235, 0x85baf9, 95) then
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
        elseif isColor(474, 300, 0xdfe0e2, 95) and
            isColor(476, 430, 0x1c6eb9, 95) then
            debugA("清除残迹")
            tap1(474, 430)
        elseif isColor(587, 344, 0xff0099, 95) and
            isColor(486, 433, 0x1c6eba, 95) then
            debugA("升级,解除护盾")
            tap1(486, 433, 0x1c6eba)
        else
            tap1(511, 497)
        end
    end
    if isColor(567, 80, 0x99b5cb, 95) and isColor(567, 558, 0x99b5cb, 95) and
        isColor(567, 572, 0x536270, 95) then
        debugA("剧情图片")
        tap1(567, 308, 0x7b726d)
    end
    if isColor(430, 206, 0xf87808, 95) and isColor(439, 206, 0x583818, 95) and
        isColor(567, 269, 0x59271b, 95) then
        debugA("完成章节")
        tap1(556, 614, 0x262b33)
        tap1(556, 614, 0x262b33)
    end
    if isColor(69, 95, 0xf5a801, 95) and isColor(60, 119, 0xff6600, 95) and
        isColor(66, 157, 0xff6600, 95) then
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
                if isColor(81, 106, 0xf26202, 95) and
                    isColor(84, 104, 0xff6600, 95) and
                    isColor(83, 110, 0xf36202, 95) then -- 1-6
                    if haoLV <= 2 then
                        gaiMuBiaoNewA(1, "优化")
                    else
                        gaiMuBiaoNewA(1, mb_WaKuang)
                    end
                    tap1(510, 567, 0x0c0c0e)
                else
                    x, y = findMultiColorInRegionFuzzy(0x126fbb,
                                                       "112|22|0x075ea8", 90,
                                                       73, 385, 836, 428)
                    if x ~= -1 then tap1(x, y) end
                end
            else
                tap1(511, 567, 0x0c0c0e)
                redJudge()
            end
        end
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and
        isColor(111, 15, 0xdde4eb, 95) and isColor(149, 33, 0xa2b3c6, 95) then
        debugA("议会界面")
        tap1(20, 20)
        redJudge()
    end
    if isColor(7, 25, 0xff9c00, 95) and isColor(18, 25, 0xffffff, 95) and
        isColor(103, 166, 0xffb500, 95) and isColor(119, 166, 0x718d9f, 95) then
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
    if isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and
        isColor(103, 75, 0xffb500, 95) then
        debugA("背包界面")
        if muBiaoA == mb_5DaoJu and num5DaoJu <= 7 then
            if isColor(111, 127, 0x182536, 95) then
                tap1(111, 127) -- 资源
                mSleep(1000)
            end
            for i = 0, 8, 1 do
                if isPause == true then return end
                if isColor(215 + i * 100, 78, 0xa0a0a0, 95) or
                    isColor(215 + i * 100, 78, 0x33a904, 95) then
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
            -- 分解
            for i = 0, 8, 1 do
                if isPause == true then return end
                if isColor(172 + i * 100, 78, 0x34b200, 95) then
                    tap1(172 + i * 100, 78) -- 物品
                    tap1(396, 471, 0x1d6ebb) -- 分解
                    tap1(689, 543, 0x1c6eba) -- 分解
                    tap1(488, 429, 0x1c6db9) -- 确定
                    mSleep(2000)
                    break
                end
            end
            for i = 1, 10, 1 do
                if isPause == true then return end
                if isColor(17, 24, 0xffffff, 95) then -- 没转圈
                    break
                end
                mSleep(1000)
            end
            -- 合成
            for i = 0, 8, 1 do
                if isPause == true then return end
                tap1(215 + i * 100, 78) -- 点击物品
                if isColor(604, 471, 0xd78b01, 95) then -- 有合成按钮
                    tap1(611, 466, 0xd78b01) -- 合成
                    if isColor(681, 545, 0x1c6dba, 95) then -- 有合成按钮
                        tap1(331, 546, 0xf27c00) -- 1个
                        tap1(681, 545, 0x1c6eba) -- 合成
                        tap1(497, 433, 0x1c6eba) -- 确定
                        isMixedThing = true
                        writeJson("每日道具合成", isMixedThing)
                        gaiMuBiaoNewA(2, mb_CaiJi)
                        break
                    else
                        tap1(511, 611, 0x0c0c0e) -- 关闭
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
                if isPause == true then return end
                x, y = findMultiColorInRegionFuzzy(0xd5c29f, "-9|51|0x9c683e",
                                                   90, 169, 75, 1048, 612) -- 金币
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x87807d,
                                                   "-3|41|0x7a7d79,-26|-12|0x54ac1c",
                                                   90, 169, 75, 1048, 612) -- 钛
                useBagThings()
            end
            if isColor(111, 448, 0x182536, 95) then
                tap1(111, 449) -- 其他
                mSleep(1000)
            end
            for i = 1, 20, 1 do
                if isPause == true then return end
                x, y = findMultiColorInRegionFuzzy(0x1d232f,
                                                   "-18|-20|0xcbd1d3,23|-21|0xf1f5f6",
                                                   90, 169, 75, 249, 162) -- 补给箱
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xa9a9a9, "12|0|0xa9a9a9",
                                                   90, 169, 75, 1052, 76) -- 战舰--灰
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x34b300, "12|0|0x34b300",
                                                   90, 169, 75, 1052, 76) -- 战舰--绿
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x13c8d4,
                                                   "12|10|0x1a99b9,89|9|0x2cb6d2",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x425e6a,
                                                   "35|32|0x0c2748,9|35|0x333b4c",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x4984a3,
                                                   "32|32|0xf4eeff,7|36|0x3c314a",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x725050,
                                                   "30|30|0xfff6f6,4|28|0x5e2827",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x673300,
                                                   "32|31|0xfbf0ce,5|36|0x692c01",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x00b3ff,
                                                   "17|20|0x0076d2,6|41|0x526256",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x93a6ca,
                                                   "0|31|0x94a1c3,15|16|0x8cbeea",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x9b597a,
                                                   "0|31|0xa96a87,14|14|0xad7ed1",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xab8f0a,
                                                   "0|31|0xb3990a,14|14|0xb5b453",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xfc2000,
                                                   "5|28|0x86210c,26|19|0xf9f6f1",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x13f3f7,
                                                   "32|-7|0x0ae0e8,18|17|0x90b5b9",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x94a3c7,
                                                   "-5|23|0x92acd5,12|19|0x91b3eb",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xa8527f,
                                                   "-2|18|0xaa5888,17|15|0xae72b0",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xbdad0b, "0|26|0xb79b07",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x69c4d3, "49|-5|0x356167",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x6bc7d2, "45|-2|0x33696f",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x73c5d4, "49|-2|0x356369",
                                                   90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xb16290, "2|22|0xa4628b",
                                                   90, 169, 75, 1052, 162)
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
    if isColor(4, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and
        isColor(1001, 25, 0x0d9098, 95) then
        debugA("邮件界面")
        x, y = findMultiColorInRegionFuzzy(0x931012, "-1|0|0x1c2c40", 90, 112,
                                           98, 115, 491)
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
                elseif isColor(138, 347, 0x65ee01, 95) and
                    isColor(156, 340, 0x61f001, 95) and
                    isColor(183, 329, 0x52f001, 95) and
                    isColor(115, 507, 0x116eb9, 95) then
                    debugA("升级任务")
                    timeShengJiTongXingZheng = nowTime
                    tap1(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        tap1(38, 492) -- 工具
                    end
                elseif isColor(163, 353, 0x2c507f, 95) and
                    isColor(152, 324, 0xb9ced4, 95) and
                    isColor(129, 511, 0x116eb9, 95) then
                    debugA("使用100艘战舰")
                    if nowTime - timeZhengLi >= 5 * 60 then
                        tap1(511, 572, 0x0c0c0e) -- 关闭
                        mSleep(1000)
                        tap1(968, 580, 0xa95a2a) -- 背包
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
                elseif isColor(198, 336, 0xbfffd8, 95) and
                    isColor(197, 364, 0x9dffc3, 95) and
                    isColor(114, 511, 0x116eb9, 95) then
                    debugA("拥有一名舰长")
                    tap1(511, 572, 0x0c0c0e) -- 关闭
                    tap1(782, 583, 0xf8efd1) -- 舰长
                    isKaZhuXianJianZhang = true
                elseif isColor(191, 366, 0x08507e, 95) and
                    isColor(191, 345, 0x16c3d2, 95) and
                    isColor(114, 511, 0x116eb9, 95) then
                    debugA("生产20战舰")
                    isKaShengChan = true
                    tap1(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        tap1(38, 492) -- 工具
                    end
                elseif isColor(197, 336, 0xffe3bf, 95) and
                    isColor(197, 367, 0xffd39b, 95) and
                    isColor(182, 366, 0xffe59f, 95) and
                    isColor(223, 501, 0x116eb9, 95) then
                    debugA("提升1次舰长星级")
                    gaiMuBiaoNewA(1, mb_WaKuang)
                    tap1(511, 572, 0x0c0c0e) -- 关闭
                    RGB_NoticeBJ = "FFFF00"
                    RGB_NoticeFont = "FF0000"
                    strNotice = "升星"
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", strNotice, RGB_NoticeFont,
                                 RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                    mSleep(500)
                elseif isColor(185, 333, 0x33ece3, 95) and
                    isColor(119, 506, 0x116eb9, 95) then
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
                elseif isColor(178, 340, 0x5da9db, 95) and
                    isColor(121, 509, 0x116eb9, 95) then
                    debugA("海盗任务")
                    if nowTime - timeZhengLi >= 5 * 60 then
                        tap1(511, 572, 0x0c0c0e) -- 关闭
                        mSleep(1000)
                        tap1(968, 580, 0xa95a2a) -- 背包
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
                elseif isColor(148, 340, 0x1b87df, 95) and
                    isColor(189, 341, 0x0c67b0, 95) and
                    isColor(124, 507, 0x116eb9, 95) then
                    debugA("卡主线--建资源")
                    gaiMuBiaoNewA(1, mb_WaKuang)
                    tap1(511, 572, 0x0c0c0e) -- 关闭
                    RGB_NoticeBJ = "FFFF00"
                    RGB_NoticeFont = "FF0000"
                    strNotice = "资源"
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", strNotice, RGB_NoticeFont,
                                 RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
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
    if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and
        isColor(311, 142, 0x0b4992, 95) then
        debugA("获得道具")
        tap1(510, 549, 0x0c0c0e)
    end
    if multiColor({{287, 611, 0x4eabf0}, {844, 451, 0xff8a00}}) then
        debugA("对话框1")
        tap1(567, 540)
    end
    if multiColor({{286, 611, 0x4aa9f1}, {846, 449, 0xde8116}}) then
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
        if isColor(109, 501, 0xf09006, 95) and isColor(228, 523, 0xf87808, 95) and
            isColor(984, 495, 0x106fb9, 95) and isColor(967, 494, 0x153557, 85) then
            debugA("指引--任务--领取")
            tap1(109, 501)
        end
    end
end

-- 综合--多点
function zongHe_Mult(...)
    if haoLV == 3 then return false end
    x, y = findMultiColorInRegionFuzzy(0xffde8c,
                                       "-43|-3|0xbd834d,-1|-44|0xc68852", 90, 0,
                                       0, 1136, 640, {orient = 5})
    if x ~= -1 then
        -- 右下
        debugA("右下")
        tap1(x + 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdd85,
                                       "-1|-33|0xcfad66,-33|1|0xcc9856", 90, 0,
                                       0, 1136, 640, {orient = 5})
    if x ~= -1 then
        debugA("右下2")
        tap1(x + 20, y + 20)
        return true

    end
    x, y = findMultiColorInRegionFuzzy(0xffdc83,
                                       "2|-41|0xe8b07c,40|-3|0xbe8e63", 90, 0,
                                       0, 1136, 640, {orient = 8})
    if x ~= -1 then
        -- 左下
        debugA("左下")
        tap1(x - 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc87, "1|-36|0xc18349,41|0|0xc68551",
                                       90, 0, 0, 1136, 640, {orient = 8})
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
    x, y = findMultiColorInRegionFuzzy(0xffde8b, "3|41|0xc38f60,36|2|0xc4a174",
                                       90, 0, 0, 1136, 640, {orient = 1})
    if x ~= -1 then
        -- 左上
        debugA("左上")
        tap1(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc86, "1|44|0xb6855c,43|1|0xb27c4d",
                                       90, 0, 0, 1135, 639, {orient = 1})
    if x ~= -1 then
        -- 左上
        debugA("左上2")
        tap1(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffde88,
                                       "-44|3|0xb98454,-4|44|0xb88456", 90, 0,
                                       0, 1135, 639, {orient = 4})
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
        if isColor(511, 542, 0x40658d, 95) then tap1(511, 542) end
        if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and
            isColor(311, 142, 0x0b4992, 95) then
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
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12,
                     0, 0, 50, 30);
        mSleep(500)
    end
    OCR_num()
    if isColor(1104, 130, 0x369469, 95) == false and
        isColor(1129, 102, 0x9e1111, 95) then
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
    elseif isColor(20, 297, 0x24c8e9, 95) or isColor(20, 295, 0x703a0d, 95) or
        isColor(21, 297, 0xffdf51, 95) then
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
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and nowTime -
        timeJiKu >= 60 * 60 * 1 and haoLV >= 2 then
        debugA("机库")
        tap1(783, 137, 0xff2a58)
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
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        numAddChanLiang == 0 and haoLV >= 2 then
        debugA("准备增产1")
        tap1(449, 105, 0x28171d)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        numAddChanLiang == 1 and haoLV >= 2 then
        debugA("准备增产2")
        tap1(387, 153, 0x203d5a)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        numAddChanLiang == 2 and haoLV >= 2 then
        debugA("准备增产3")
        tap1(37, 321, 0x257700)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        isAddChanLiangLiZi == false and haoLV >= 2 and check16 == "vip8" then
        debugA("准备粒子增产")
        tap1(183, 259, 0x40414d)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isTrade ==
        false and haoLV >= 2 then
        debugA("准备交易行")
        tap1(320, 468, 0x6e1313)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        isCheckLiZiNum == false and haoLV >= 3 then
        debugA("准备交易行--检查粒子数量")
        tap1(320, 468, 0x6e1313)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        numGuangGao <= 9 and haoLV >= 2 then
        debugA("看广告")
        tap1(809, 221, 0x7aa0d8)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and
        numChuanShu <= 4 and haoLV >= 2 then
        debugA("点传输")
        tap1(623, 497, 0xffd4a1)
        return true
    elseif isColor(233, 100, 0x9e1111, 95) and isColor(210, 108, 0x6de4e9, 95) and
        nowTime - timeJiDi >= 10 * 60 then
        debugA("基地现况--红点")
        tap1(209, 111, 0x61d5e9)
        return true

    elseif isColor(295, 9, 0x9d1111, 95) and isColor(310, 24, 0x9d1111, 95) then
        debugA("VIP--红点")
        tap1(285, 42, 0x68401a)
        return true
    elseif isColor(75, 213, 0x961112, 95) and isColor(90, 228, 0x9d1111, 95) and
        haoLV == 1 then
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
    elseif isColor(902, 541, 0x9d1111, 95) and nowTime - timeLianMeng >= 60 * 60 *
        2 then -- 联盟红点
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
        elseif isColor(1114, 262, 0x9d1111, 95) and bRedOut8 == false then -- 2-4红点
            numRed = 8
            tap1(1070, 321, 0x546272)
        elseif isColor(730, 396, 0x931012, 95) and bRedOut9 == false then -- 3-1红点
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

-- 红点判断
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
    if numXiangMu ~= 1 and numXiangMu ~= 0 then return end
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
        repeat mSleep(1000) until isColor(219, 595, 0xea4335, 95) and
            isColor(229, 591, 0x4285f4, 95) and isColor(239, 593, 0x34a853, 95) and
            isColor(187, 639, 0x007aff, 95) == false -- 选择账号
        tap1(563, 432, 0xffffff)
        for i = 1, 30, 1 do
            if isColor(1066, 78, 0xb2b2b2, 95) then -- 钱包齿轮
                gaiMuBiaoNewA(3, "兑换粒子")
                runApp(appXiangMu)
                mSleep(1000)
                break
            end
            if isColor(477, 447, 0xa6a6a6, 95) and
                isColor(697, 293, 0x949494, 95) and
                isColor(477, 442, 0x000000, 95) then
                debugA("Error")
                closeApp(appWallet)
                gaiMuBiaoNewA(3, "钱包检测")
                runApp(appWallet)
                mSleep(1000)
                timeWalletWatch = nowTime - 10 * 60 -- 钱包检测
                break
            end
            if isColor(122, 605, 0x007aff, 95) and
                isColor(1092, 589, 0xcccccc, 95) and
                isColor(142, 490, 0x000000, 95) == false then
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
    repeat mSleep(1000) until isColor(1096, 569, 0x2473bd, 95) and
        isColor(1096, 581, 0xf5f5f5, 95) -- 首页
    tap1(293, 116, 0x8a8a8a) -- 全局路由
    mSleep(1000)
    tap1(465, 378, 0xffffff) -- 配置
    mSleep(1000)
    for i = 1, 30, 1 do
        if isColor(206, 131, 0xffffff, 95) then -- 未连接
            tap1(206, 131)
        end
        webdata = httpGet("https://www.google.com.hk/") -- 获取百度首页网页数据
        if webdata and webdata ~= "" then break end
        if i == 30 then toast("翻墙失败") end
        mSleep(1000)
    end
end

-- Shadowrocket 切换至场景
function ShadowrocketToScenes()
    runApp(appShadowrocket)
    repeat mSleep(1000) until isColor(1096, 569, 0x2473bd, 95) and
        isColor(1096, 581, 0xf5f5f5, 95) -- 首页
    tap1(293, 116, 0x8a8a8a) -- 全局路由
    mSleep(1000)
    tap1(721, 474, 0xffffff) -- 场景
    mSleep(1000)
    for i = 1, 30, 1 do
        if isColor(206, 131, 0xffffff, 95) then -- 未连接
            tap1(206, 131)
        end
        webdata = httpGet("https://www.baidu.com/") -- 获取百度首页网页数据
        if webdata and webdata ~= "" then break end
        if i == 30 then toast("境内失败") end
        mSleep(1000)
    end
end

-- 播放音频
function playMusic()
    setVolumeLevel(1)
    local file = userPath() .. "/res/Lapislazuli.mp3"
    local bool = isFileExist(file)
    if bool == false then
        local http_mp3 =
            "https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars/Lapislazuli.mp3"
        for i = 1, 10, 1 do
            if isPause == true then return end
            local code, msg = ts.tsDownload(file, http_mp3,
                                            {["tstab"] = 1, ["mode"] = true})
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

-- 震动提醒
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

    if isColor(62, 42, 0x215da6, 95) and isColor(62, 47, 0x0b58b2, 95) and
        nowDateTime.hour >= 8 then
        timeXXX = nowTime
        debugA("选择宇宙")
        for i = 1, 7, 1 do
            if isPause == true then return end
            tap1(205, 147 + 60 * (i - 1), 0x8a6315)
            mSleep(1000)
            if isColor(595, 189, 0x780b12, 95) == false and
                isColor(595, 182, 0x3a65ab, 95) then
                tap1(595, 189)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 283, 0x780b12, 95) == false and
                isColor(595, 276, 0x3965ac, 95) then
                tap1(595, 283)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 377, 0x780b12, 95) == false and
                isColor(595, 370, 0x3965ac, 95) then
                tap1(595, 377)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 472, 0x780b12, 95) == false and
                isColor(595, 464, 0x3965ac, 95) then
                tap1(595, 472)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 189, 0x780b12, 95) == false and
                isColor(966, 182, 0x3965ac, 95) then
                tap1(966, 189)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 283, 0x780b12, 95) == false and
                isColor(966, 276, 0x3965ac, 95) then
                tap1(966, 283)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 377, 0x780b12, 95) == false and
                isColor(966, 370, 0x3965ac, 95) then
                tap1(966, 377)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 472, 0x780b12, 95) == false and
                isColor(966, 464, 0x3965ac, 95) then
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
    if muBiaoA2 == "" then gaiMuBiaoNewA(2, mb_5DaoJu, mm_5DaoJu) end
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
        tap1(905, 73, 0x091423) -- 主动技能
        if isColor(960, 185, 0x835523, 95) and isColor(1119, 186, 0x835523, 95) then
            debugA("技能目录")
            x, y = findMultiColorInRegionFuzzy(0x375297,
                                               "14|-4|0x7c5758,14|10|0xa48e9d",
                                               90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808",
                                                   90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0xc7af1f,
                                               "-7|32|0x111515,5|14|0x72303f",
                                               90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808",
                                                   90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0x5d9cb7,
                                               "6|25|0x15497f,25|0|0x151b20",
                                               90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808",
                                                   90, 388, 454, 1126, 628)
                if x ~= -1 then
                    tap1(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0x09baff,
                                               "13|-33|0x6796a7,26|-18|0xffff52",
                                               90, 533, 219, 1117, 418)
            if x ~= -1 then
                tap1(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808",
                                                   90, 388, 454, 1126, 628)
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
        if check15 == "生产加速" then isShengChan = true end
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
                snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135,
                         639); -- 以时间戳命名进行截图
                ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
                -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                os.remove(userPath() .. "/res/" .. iphoneId .. "-" ..
                              current_time .. ".png")
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
                snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135,
                         639); -- 以时间戳命名进行截图
                ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
                -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                os.remove(userPath() .. "/res/" .. iphoneId .. "-" ..
                              current_time .. ".png")
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
    if check28 == "4级粒子" then
        numSeachLiZi = 4
    elseif check26 == "3级粒子" then
        numSeachLiZi = 3
    elseif check20 == "2级粒子" then
        numSeachLiZi = 2
    elseif check27 == "1级粒子" then
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
        if isColor(387, 372, 0xa43b40, 95) and isColor(501, 389, 0xa43b40, 95) and
            isColor(109, 371, 0x00ace4, 95) then
            debugA("粒子--左")
            numSearch = numSearch + 1
            tap1(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                isLiZied = true
                tap1(172, 525) -- 搜索
            end
        elseif isColor(919, 373, 0xa43b40, 95) and
            isColor(1028, 386, 0xa43b40, 95) and isColor(643, 371, 0x00ace4, 95) then
            debugA("粒子--右")
            numSearch = numSearch + 1
            tap1(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                isLiZied = true
                tap1(172, 525) -- 搜索
            end
        elseif isColor(497, 383, 0x00798c, 95) and
            isColor(116, 377, 0x00ace4, 95) then
            debugA("采集--左")
            numSearch = numSearch + 1
            tap1(407, 383)
            if isColor(358, 428, 0x1c6db9, 95) and
                isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif isColor(639, 378, 0x00ace4, 95) and
            isColor(1027, 380, 0x00798c, 95) then
            debugA("采集--右")
            numSearch = numSearch + 1
            tap1(1027, 383)
            if isColor(358, 428, 0x1c6db9, 95) and
                isColor(620, 435, 0x1c6dba, 95) then
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
    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and
        isColor(866, 599, 0xd78b00, 95) and isColor(116, 596, 0x517fad, 95) then
        debugA("出航界面--主线")
        if isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debugA("无人物")
            tap1(20, 20)
        end
        if isColor(559, 122, 0x3e6b96, 95) and isColor(550, 127, 0xffffff, 95) ==
            false then -- 航母
            tap1(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续
                if check13 == "抢粒子" then -- 抢
                    tap1(504, 432, 0x1c6eba) -- 确定
                else
                    tap1(510, 494, 0x0c0c0e) -- 关闭
                    tap1(20, 20)
                end
            end
            isLiZied = true -- 粒子
            -- timeLiZi = nowTime
        elseif (isColor(634, 157, 0x38b3c8, 95) and
            isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95)) then
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
                if numChuHang >= 4 then numChuHang = 1 end
            end
        end
    end
end

--- 出航
function chuHang()
    if inside1() then
        tap1(1074, 582) -- 出基地
    end

    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and
        isColor(866, 599, 0xd78b00, 95) and isColor(116, 596, 0x517fad, 95) then
        debugA("出航界面--出航")
        if isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debugA("无人物")
            tap1(20, 20)
        end
        if isColor(559, 122, 0x3e6b96, 95) and isColor(550, 127, 0xffffff, 95) ==
            false then -- 航母
            debugA("有航母")
            isFalseLiZi2 = false
            tap1(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            isLiZied = true -- 粒子

            numTodayDigLiZi = numTodayDigLiZi + 1
            numDigLiZi = numDigLiZi + 1
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续
                if check13 == "抢粒子" then -- 抢
                    tap1(504, 432, 0x1c6eba) -- 确定
                else
                    tap1(510, 494, 0x0c0c0e) -- 关闭
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

        elseif (isColor(634, 157, 0x38b3c8, 95) and
            isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95)) or
            (isColor(634, 157, 0x36b2c7, 95) and isColor(550, 127, 0xffffff, 95) and
                isColor(596, 53, 0x5f9ede, 95)) then
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
            if isColor(366, 152, 0xffffff, 95) == false then -- 两名舰长
                tap1(518, 161, 0xa0bfee) -- +号
                tap1(946, 270, 0xd1b4b4) -- 右侧角色
                tap1(114, 596, 0xb21d2c) -- 卸除
                tap1(976, 582, 0xdde9f4) -- 整编
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
                if numChuHang >= 4 then numChuHang = 1 end
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
                    tap1(420, 366, 0xffffff) -- 加号
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
                    if i == 3 then isKillPirate = false end
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
                    if i == 3 then isKillPirate = false end
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
                    if i == 3 then isKillPirate = false end
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
                        if i == 3 then numChuHang = 1 end
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
                tap1(349, 366, 0xffffff) -- 加号
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
                if i == 3 then isKillPirate = false end
            end
        elseif isLiZied == false then
            tap1(925, 561, 0x1f101d) -- 粒子
            mSleep(1000)
            for i = 0, 1, 1 do
                -- if check20 == "2级粒子" and isFalseLiZi2 == false then
                if check28 == "4级粒子" and numSeachLiZi == 4 then
                    if isColor(923, 366, 0xffffff, 95) then -- 4级

                    elseif isColor(895, 366, 0xffffff, 95) then -- 3级
                        tap1(1059, 366) --  "+"   
                    elseif isColor(867, 366, 0xffffff, 95) then -- 2级  
                        tap1(1059, 366) --  "+"   
                        tap1(1059, 366) --  "+"  
                    elseif isColor(838, 366, 0xffffff, 95) then -- 1级 
                        tap1(1059, 366) --  "+"  
                        tap1(1059, 366) --  "+"  
                        tap1(1059, 366) --  "+"  
                    end
                    numSeachLiZi = 4 -- 搜索粒子的等级
                elseif check26 == "3级粒子" and numSeachLiZi == 3 then
                    if isColor(923, 366, 0xffffff, 95) then -- 4级
                        tap1(785, 366) --  "-" 
                    elseif isColor(895, 366, 0xffffff, 95) then -- 3级

                    elseif isColor(867, 366, 0xffffff, 95) then -- 2级  
                        tap1(1059, 366) --  "+"   
                    elseif isColor(838, 366, 0xffffff, 95) then -- 1级 
                        tap1(1059, 366) --  "+"  
                        tap1(1059, 366) --  "+"  
                    end
                    numSeachLiZi = 3 -- 搜索粒子的等级
                elseif check20 == "2级粒子" and numSeachLiZi == 2 then
                    if isColor(923, 366, 0xffffff, 95) then -- 4级
                        tap1(785, 366) --  "-" 
                        tap1(785, 366) --  "-" 
                    elseif isColor(895, 366, 0xffffff, 95) then -- 3级
                        tap1(785, 366) --  "-" 
                    elseif isColor(867, 366, 0xffffff, 95) then -- 2级  

                    elseif isColor(838, 366, 0xffffff, 95) then -- 1级
                        tap1(1059, 366) --  "+""  
                    end
                    numSeachLiZi = 2
                elseif check27 == "1级粒子" and numSeachLiZi == 1 then
                    if isColor(923, 366, 0xffffff, 95) then -- 4级
                        tap1(785, 366) --  "-"
                        tap1(785, 366) --  "-"
                        tap1(785, 366) --  "-"
                    elseif isColor(895, 366, 0xffffff, 95) then -- 3级
                        tap1(785, 366) --  "-" 
                        tap1(785, 366) --  "-"
                    elseif isColor(867, 366, 0xffffff, 95) then -- 2级
                        tap1(785, 366) --  "-"
                    elseif isColor(838, 366, 0xffffff, 95) then -- 1级
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
                    if i == 3 then isKillPirate = false end
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
                    if i == 3 then isKillPirate = false end
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
                        if i == 3 then numChuHang = 1 end
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
        if isColor(178, 379, 0x00ace4, 95) and isColor(232, 385, 0x00798c, 95) and
            isColor(380, 383, 0xa43b40, 95) then
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
        elseif isColor(733, 377, 0x00ace4, 95) and
            isColor(798, 378, 0x00798c, 95) and isColor(939, 376, 0x9e393d, 95) then
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
        elseif isColor(125, 322, 0x6416c3, 95) and
            isColor(151, 305, 0x6918d9, 95) then
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
        elseif isColor(662, 320, 0x783ede, 95) and
            isColor(684, 302, 0x6f1bdf, 95) then
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
        elseif isColor(497, 383, 0x00798c, 95) and
            isColor(116, 377, 0x00ace4, 95) then
            debugA("采集--左")
            numSearch = numSearch + 1
            tap1(407, 383)
            if isColor(358, 428, 0x1c6db9, 95) and
                isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif isColor(639, 378, 0x00ace4, 95) and
            isColor(1027, 380, 0x00798c, 95) then
            debugA("采集--右")
            numSearch = numSearch + 1
            tap1(1027, 383)
            if isColor(358, 428, 0x1c6db9, 95) and
                isColor(620, 435, 0x1c6dba, 95) then
                debugA("研究才能出4队")
                tap1(513, 496, 0x0c0c0e)
                tap1(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif numSearch >= 10 then
            debugA("回基地")
            tap1(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif numQueue == 5 and isColor(1022, 519, 0xffa100, 95) then -- 5队出完
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
            if check23 == "60海盗" and num60Pirate <= 80 and isKillPirate ==
                true then
                tap1(199, 522) -- 搜索
            else
                searchLiZi()
            end
        else
            if isColor(45, 517, 0xd8e4ee, 95) and
                isColor(282, 518, 0xe0ecf6, 95) then
                isRewardLiZi()
                if isBug_LiZi == false then
                    tap1(199, 522) -- 搜索
                end
            elseif isColor(45, 517, 0xd8e4ee, 95) and
                isColor(282, 518, 0xe0ecf6, 95) == false then
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
            if isColor(129, 287, 0xb44aec, 95) or
                isColor(662, 287, 0xb44aec, 95) then
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
            if isColor(129, 287, 0xb44aec, 95) or
                isColor(662, 287, 0xb44aec, 95) then
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
            if isColor(129, 287, 0xb44aec, 95) or
                isColor(662, 287, 0xb44aec, 95) then
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
            if isColor(129, 287, 0xb44aec, 95) or
                isColor(662, 287, 0xb44aec, 95) then
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
        if isPause == true then return end

        nowTime = os.time();
        timeXXX = nowTime

        -- debug("搜索粒子")
        if isColor(297, 107, 0x215da6, 95) and isColor(835, 585, 0x215da6, 95) and
            isColor(556, 551, 0x145da9, 95) then
            debugA("未知信号")
            tap1(511, 605, 0x0c0c0e)
        end
        if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and
            isColor(355, 86, 0x5195db, 95) then
            debugA("司令官界面")
            tap1(20, 20)
        end
        if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) ==
            false then
            debugA("外太空")
            tap1(571, 467, 0x05305c)
        end
        if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and
            isColor(503, 515, 0x233341, 95) and isColor(741, 516, 0x2f2a33, 95) then
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
            if isPause == true then return end
            if isColor(1019, 544, 0x744218, 95) == false then
                debugA("搜索时卡bug")
                break
            end
            x0, y0 = findColorInRegionFuzzy(0xf8c328, 95, intX1, 100, 1020, 540) -- 黄色图标
            -- debug("x0,y0 :"..x0..","..y0)
            if x0 ~= -1 then
                if check20 == "2级粒子" then
                    x, y = tsFindText(index_lizi2, "2", x0 - 1, y0 - 1, x0 + 25,
                                      y0 + 25, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
                else
                    x, y = tsFindText(index_lizi1, "1", x0 - 1, y0 - 1, x0 + 25,
                                      y0 + 25, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
                end
                if x ~= -1 then
                    tap1(x + 48, y - 23)
                    mSleep(500)
                    -- x5, y5 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-105|0xd7d9dc", 90, 66, 14, 1126, 529)--红攻击 不抢
                    -- x6, y6 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-106|0xd6d8db", 90, 66, 14, 1126, 529)--红攻击 不抢
                    x1, y1 = findMultiColorInRegionFuzzy(0xa43b40,
                                                         "-14|29|0x00798c,-265|-70|0x9e6eed",
                                                         80, 66, 14, 1126, 529) -- 红攻击 抢
                    x2, y2 = findMultiColorInRegionFuzzy(0x00798c,
                                                         "-195|-69|0x8446e5,-14|0|0x00ace4",
                                                         90, 66, 14, 1126, 529) -- 蓝采集
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
                            x3, y3 = findColorInRegionFuzzy(0xff0000, 95,
                                                            x1 + 20, y1 - 113,
                                                            x1 + 124, y1 - 101) -- 红名玩家
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
        if isPause == true then return end
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
    x, y = findImage("red.bmp", 355, 253, 403, 351); -- 在（0,0）到（w-1,h-1）寻找刚刚截图的图片
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
    if isColor(69, 23, 0xff6600, 95) and isColor(92, 36, 0xb4c0ce, 95) and
        isColor(173, 43, 0x9eabbb, 95) then
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
                timeXiangMu1 = nowTime + 60 * 60 * 24 -- 项目1已闲置时间
                -- end
            end
        end
    end
end

function BeAttack()
    if isAttacked == true and nowTime - timeAttacked >= 30 * 60 and muBiaoA ==
        "战备" then
        isAttacked = false
        timeAttacked = nowTime
        gaiMuBiaoNewA(4, "")
    end
    if haoLV == 3 and numLiZi >= 80000 then
        if isColor(0, 0, 0x904f6b, 95) or isColor(0, 0, 0x95445c, 95) or
            isColor(0, 0, 0x924963, 95) or isColor(0, 0, 0xd13f00, 95) or
            isColor(0, 0, 0x76151a, 95) or isColor(1135, 639, 0x6a060a, 95) or
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
                if isColor(1019, 544, 0x793d16, 95) and
                    isColor(1124, 618, 0x7d3915, 95) and
                    isColor(1058, 581, 0xf8e6e6, 95) then
                    debugA("基地内--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                elseif isColor(1019, 544, 0x7b3b15, 95) and
                    isColor(1124, 618, 0x803513, 95) and
                    isColor(1039, 574, 0xe8d3d3, 95) then
                    debugA("基地外--被攻击")
                    gaiMuBiaoNewA(4, "战备")
                    tap(1077, 579)
                elseif isColor(69, 23, 0xf35600, 95) and
                    isColor(92, 36, 0xb4a5b1, 95) and
                    isColor(173, 43, 0xa098a6, 95) then
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

-- 战备
function warReady()
    if (isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and
        isColor(1039, 574, 0xf0f0f1, 95)) or
        (isColor(1019, 544, 0x793c16, 95) and isColor(1124, 618, 0x7e3814, 95) and
            isColor(1039, 574, 0xece0e0, 95)) then
        debugA("基地外--战备")
        tap(1077, 579)
    end
    if (isColor(964, 581, 0xa55927, 95) and isColor(1018, 543, 0x744218, 95) and
        isColor(1058, 581, 0xffffff, 95)) or -- 背包 SECTOR左上角  C的颜色
        (isColor(964, 581, 0xa74f22, 95) and isColor(1018, 543, 0x7b3b15, 95) and
            isColor(1058, 581, 0xf5dddd, 95)) then
        debugA("基地内--战备")
        -- mSleep(3000)
        if muBiaoA == "战备" and isColor(1043, 99, 0x9f0f0f, 95) then -- 瞭望塔红点
            debugA("瞭望塔")
            tapBefore(1043, 99, 0x9f0f0f)
            mSleep(2000)
            if isColor(187, 163, 0xfab4dd, 95) and
                isColor(231, 137, 0xc6793b, 95) and
                isColor(196, 210, 0x8bd9df, 95) then
                debugA("NPC攻击")
                for i = 1, 10, 1 do vibratorNotice() end
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
            elseif isColor(163, 283, 0xefe4e5, 95) and
                isColor(164, 270, 0x797b87, 95) and
                isColor(231, 322, 0x222a36, 95) then
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
            elseif isColor(546, 99, 0xd8cfd1, 95) and
                isColor(579, 106, 0x9a98a1, 95) and
                isColor(426, 192, 0xca631f, 95) and
                isColor(571, 116, 0xded5d7, 95) then
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
            elseif isColor(430, 189, 0xe1a0a3, 95) then
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
            elseif isColor(578, 117, 0xb0afb6, 95) and
                isColor(541, 114, 0xb8b7bd, 95) and
                isColor(231, 137, 0x242935, 95) then
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

            -- 对调
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
            tap1(905, 73, 0x091423) -- 主动技能
            mSleep(1000)
            if isColor(578, 278, 0x165aab, 95) then
                -- if isColor(578, 278, 0x4f5d60, 95) then
                debugA("冷却中")
                gaiMuBiaoNewA(4, "战备开盾")
                isAttacked = false
                timeAttacked = nowTime
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
            elseif isColor(578, 278, 0x4f5d60, 90) then
                -- elseif isColor(578, 278, 0x165aab, 95) then
                debugA("可使用")
                tap1(573, 253) -- 使用技能--召回
                mSleep(1000)
                tap1(420, 474, 0xf39b18) -- 使用
                mSleep(1000)
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
            else
                debugA("技能不对")
                gaiMuBiaoNewA(4, "战备开盾")
                isAttacked = false
                timeAttacked = nowTime
                tap1(1103, 67, 0x1e1826) -- 收缩
                mSleep(1000)
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
                tap1(964, 581, 0xa74f22) -- 背包
            end
            -- 对调
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
            tap1(1015, 71, 0x0e1b2c) -- 基地加成
        end
    end
    if muBiaoA == "战备开盾" then
        if (isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and
            isColor(103, 75, 0xffb500, 95)) or
            (isColor(17, 24, 0xf5dfdf, 95) and isColor(5, 24, 0xf58700, 95) and
                isColor(103, 75, 0xf9a600, 95)) then
            debugA("背包界面--战备")
            if isColor(119, 253, 0x1e2434, 90) then
                tap1(119, 253, 0x1e2434) -- 战争
            end
            if isColor(294, 104, 0x3081aa, 95) or
                isColor(294, 104, 0x2988b3, 95) then
                tap1(294, 104) -- 2
                tap1(518, 456, 0x1c6cb9)
            elseif isColor(394, 104, 0x2f82ac, 95) or
                isColor(394, 104, 0x2988b3, 95) then
                tap1(394, 104) -- 3
                tap1(518, 456, 0x1c6cb9)
            elseif isColor(493, 104, 0x2e83ad, 95) or
                isColor(493, 104, 0x2988b3, 95) then
                tap1(493, 104) -- 4
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
        if (isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and
            isColor(103, 75, 0xffb500, 95)) or
            (isColor(17, 24, 0xf5dfdf, 95) and isColor(5, 24, 0xf58700, 95) and
                isColor(103, 75, 0xf9a600, 95)) then
            debugA("背包界面--战备")
            if isColor(119, 253, 0x1e2434, 90) then
                tap1(119, 253, 0x1e2434) -- 战争
            end
            x, y = findMultiColorInRegionFuzzy(0x2ed6f1,
                                               "16|-8|0x14b2f3,10|33|0xebbe77,53|24|0xadb3b9",
                                               90, 173, 79, 1049, 356)
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
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and
        isColor(1031, 577, 0xffffff, 95) then
        debugA("室内")
        if check21 == "自动切换梯子" and strVpnModel == "配置" then
            autoChangeVPN("场景")
            strVpnModel = "场景"
            runApp(appXiangMu)
            mSleep(1000)
        end
        if isColor(1104, 130, 0x369469, 95) == false and
            isColor(1129, 102, 0x9e1111, 95) then
            debugA("验证码--红点")
            tap1(1096, 137, 0x191d1b)
        elseif isColor(1050, 106, 0x9e1111, 95) and
            isColor(1033, 115, 0x3f9fd8, 95) then
            debugA("验证码--红点")
            tap1(1033, 137)
        elseif isColor(1104, 130, 0x369469, 95) and
            isColor(1125, 106, 0x9e1111, 95) then
            -- debug("航母--红点")
        elseif isColor(1043, 99, 0x9d1111, 95) and
            isColor(1058, 113, 0x9d1111, 95) and
            isColor(1006, 131, 0xfffcff, 95) then
            debugA("援助2--红点")
            tap1(1020, 138, 0x222b33)
        elseif isColor(968, 99, 0x9d1111, 95) and
            isColor(932, 131, 0xffffff, 95) then
            debugA("援助1--红点")
            tap1(944, 138, 0x222b33)
        end
        if numYunDaMa ~= 0 then numYunDaMa = 0 end
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
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and
        isColor(1039, 574, 0xf0f0f1, 95) then
        debugA("室外")
        if check21 == "自动切换梯子" and strVpnModel == "配置" then
            autoChangeVPN("场景")
            strVpnModel = "场景"
            runApp(appXiangMu)
            mSleep(1000)
        end
        if isColor(1104, 130, 0x369469, 95) == false and
            isColor(1129, 102, 0x9e1111, 95) then
            debugA("验证码--红点")
            tap1(1096, 137, 0x191d1b)
        elseif isColor(1050, 106, 0x9e1111, 95) and
            isColor(1033, 115, 0x3f9fd8, 95) then
            debugA("验证码--红点")
            tap1(1033, 137)
            -- elseif isColor(1104, 130, 0x369469, 95) and isColor(1125, 106, 0x9e1111, 95) then
            -- debugA("航母--红点")
        elseif isColor(1043, 99, 0x9d1111, 95) and
            isColor(1058, 113, 0x9d1111, 95) and
            isColor(1006, 131, 0xfffcff, 95) then
            debugA("援助--红点")
            tap1(1020, 138, 0x222b33)
        elseif isColor(968, 99, 0x9d1111, 95) and
            isColor(932, 131, 0xffffff, 95) then
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
    if nowDateTime.day ~= nowDayNight and nowDateTime.hour >= 23 and
        nowDateTime.min >= 50 then
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
            isOverHelp = false -- 协助已完成

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
    if haoLV == 1 then if isColor(220, 92, 0x6e8598, 95) then haoLV = 2 end end
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
                if temNum ~= nil then temNum = temNum * 1000 end
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
                if temNum ~= nil then temNum = temNum * 1000 end
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
                if temNum ~= nil then temNum = temNum * 1000 end
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

-- 建筑升级条件层数
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
        fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ,
                     "", 12, 0, 0, 50, 30);
        mSleep(500)
        getOut()
        numShengJiCengShu = 0
    end
end

-- 兑换检测
function duiHuanJianCe()
    if numDuiHuan ~= "0" and isDuiHuan == false then
        if nowDateTime.hour == tonumber(numDuiHuan) or nowDateTime.hour ==
            tonumber(numDuiHuan) + 8 or nowDateTime.hour == tonumber(numDuiHuan) +
            8 * 2 then
            if muBiaoA3 == "" and muBiaoA2 == "" then
                gaiMuBiaoNewA(2, "兑换")
                gaiMuBiaoNewA(3, "钱包检测")
            end
        end
    end
end

-- 兑换
function duiHuan() end

-- 自动切换梯子
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

-- 活动中心--细节
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
    elseif isColor(956, 270, 0xc97123, 95) and isColor(836, 162, 0xf08e03, 95) and
        isColor(1097, 313, 0xc97123, 95) then
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
    local tb = plist_ts.read(userPath() .. "/lua/" .. xiangMu .. ".plist") -- 读取plist至table格式
    if tb ~= "" and tb ~= nil then
        local jsonstring = json_ts.encode(tb); -- 将 table 格式数据转成 json 格式数据
        if jsonstring ~= "" and jsonstring ~= nil then
            bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json",
                                   jsonstring) -- 写入文件
        end
    end
end

-----------------------项目2--------------------------
-- 目标转换--新B
function muBiaoZhuanHuanNewB(...)
    if muBiaoB4 ~= "" and muBiaoB4 ~= "无" then
        muBiaoB = muBiaoB4
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoB3 ~= "" and muBiaoB3 ~= "无" then
        muBiaoB = muBiaoB3
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoB2 ~= "" and muBiaoB2 ~= "无" then
        muBiaoB = muBiaoB2
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoB1 ~= "" and muBiaoB1 ~= "无" then
        muBiaoB = muBiaoB1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    else
        debugB("目标空")
        muBiaoB1 = ""
        muBiaoB = muBiaoB1
        writeConfigNew("muBiaoB1", muBiaoB1)
        timeDingShiDianRenWu = nowTime - 60 * 60
    end

end

-- 改目标--新B
function gaiMuBiaoNewB(cs_num, cs_muBiao, ...)
    if cs_num == 1 then
        muBiaoB1 = cs_muBiao
        writeConfigNew("muBiaoB1", cs_muBiao)
        muBiaoZhuanHuanNewB()
        writeJson("目标B1", cs_muBiao)
    elseif cs_num == 2 then
        muBiaoB2 = cs_muBiao
        writeConfigNew("muBiaoB2", cs_muBiao)
        muBiaoZhuanHuanNewB()
        writeJson("目标B2", cs_muBiao)
    elseif cs_num == 3 then
        muBiaoB3 = cs_muBiao
        writeConfigNew("muBiaoB3", cs_muBiao)
        muBiaoZhuanHuanNewB()
        writeJson("目标B3", cs_muBiao)
    elseif cs_num == 4 then
        muBiaoB4 = cs_muBiao
        writeConfigNew("muBiaoB4", cs_muBiao)
        muBiaoZhuanHuanNewB()
        writeJson("目标B4", cs_muBiao)
    end
end

function debugB(tiaoShiNeiRong)
    -- wLog("192.168.1.34","#    [LINE]")
    if check1 == "网络调试" then
        wLog("192.168.1.34",
             iphoneId .. " 目标1: " .. muBiaoB1 .. " 目标2: " .. muBiaoB2 ..
                 " 目标3: " .. muBiaoB3 .. " 目标4: " .. muBiaoB4 ..
                 "    操作:" .. tiaoShiNeiRong .. "   #" .. xiangMu ..
                 "#   [DATE]" .. "#    [LINE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast("目标1: " .. muBiaoB1 .. " 目标2: " .. muBiaoB2 ..
                  " 目标3: " .. muBiaoB3 .. " 目标4: " .. muBiaoB4 ..
                  "                操作:" .. tiaoShiNeiRong)
        mSleep(3000)
    end
end
-- 综合2
function zongHe2()
    if isColor(840, 136, 0xb7b1b4, 95) and isColor(937, 131, 0xd9d9dd, 95) and
        isColor(1034, 125, 0xbab9bb, 95) then
        debugB("误开菜单列表")
        tap1(1044, 41)
        mSleep(1000)
    end
    if isColor(480, 570, 0x3693f5, 95) and isColor(504, 596, 0xbce4ff, 95) and
        isColor(508, 601, 0xfdfeff, 95) and isColor(526, 610, 0x91a8a7, 95) then
        debugB("开始游戏")
        tap1(629, 589, 0xffffff)
    end
    if isColor(0, 68, 0xc00e11, 95) and isColor(95, 110, 0xfc2626, 95) and
        isColor(375, 110, 0xfec300, 95) and isColor(1071, 79, 0xffffff, 95) then
        debugB("游戏公告")
        tap1(1071, 79, 0xffffff)
    end
    if isColor(1004, 90, 0xcfcfcf, 95) and isColor(1010, 101, 0x000000, 95) and
        isColor(1020, 173, 0xb7babd, 95) then
        debugB("点击开始游戏")
        tap1(560, 571, 0xffffff)
    end
    if isColor(114, 528, 0xfed81f, 95) and isColor(127, 558, 0x887511, 95) and
        isColor(131, 562, 0x71630e, 95) then
        debugB("前往获取")
        tap1(986, 61, 0xffffff)
        strZhuangTai = "原点"
    end
    if isColor(526, 265, 0x242322, 95) and isColor(609, 348, 0xffbb68, 95) and
        isColor(607, 274, 0x302d2b, 95) then
        debugB("月卡奖励")
        tap1(567, 578, 0xffffff)
    end
    if isColor(579, 311, 0x000000, 95) and isColor(368, 403, 0xfe831f, 95) and
        isColor(428, 302, 0x0f0f0f, 95) then
        debugB("前往评分")
        tap1(442, 421, 0xffffff)
    end
    if isColor(512, 315, 0xa7a7a7, 95) and isColor(595, 314, 0xa6a6a6, 95) and
        isColor(441, 343, 0xa7a7a7, 95) then
        debugB("购买赛季等级")
        tap1(442, 421, 0xffffff)
    end
    if isColor(496, 432, 0xa89237, 95) and isColor(639, 479, 0xb7953c, 95) and
        isColor(541, 454, 0xf2ca42, 95) then
        debugB("新时刻已解锁")
        tap1(541, 454, 0xffffff)
    end
    if isColor(489, 403, 0x9e862d, 95) and isColor(636, 445, 0xa88f3e, 95) and
        isColor(640, 401, 0x996e25, 95) and isColor(564, 422, 0xf0c840, 95) then
        debugB("功能解锁")
        tap1(564, 422, 0xffffff)
    end
    if isColor(477, 496, 0xfed81f, 95) and isColor(494, 530, 0x74650e, 95) and
        isColor(540, 530, 0xc1a918, 95) then
        debugB("已解锁新的混乱卡牌")
        tap1(572, 515, 0xffffff)
    end
    if isColor(567, 111, 0xffde41, 95) and isColor(509, 217, 0xfff841, 95) and
        isColor(626, 217, 0xfff841, 95) then
        debugB("恭喜获得")
        tap1(561, 582, 0xffffff)
    end
    if isColor(927, 241, 0x59fb34, 95) and isColor(929, 243, 0x2a5521, 95) and
        isColor(1034, 244, 0x4fd82f, 95) then
        debugB("冲刺送英雄")
        tap1(981, 256, 0xffffff)
    end
    if isColor(678, 18, 0xffdacb, 95) and isColor(676, 16, 0xf05d1d, 95) and
        isColor(679, 32, 0xfc3c10, 95) then
        debugB("主界面-活动中心红点")
        tap1(652, 47, 0xffffff)
    end
    if isColor(776, 23, 0xff4c13, 95) and isColor(779, 25, 0xffaf9c, 95) and
        isColor(780, 31, 0xfd614c, 95) then
        debugB("主界面-活动中心红点")
        tap1(753, 50, 0xffffff)
    end
    if isColor(878, 23, 0xff4b13, 95) and isColor(883, 30, 0xffe5df, 95) and
        isColor(885, 30, 0xff694a, 95) then
        debugB("主界面-活动中心红点")
        tap1(859, 51, 0xffffff)
    end
    if isColor(1067, 120, 0xff5214, 95) and isColor(1060, 120, 0xff9680, 95) and
        isColor(1062, 125, 0xffc9bc, 95) then
        debugB("主界面-赛季手册红点")
        tap1(1038, 143, 0xffffff)
    end
    if isColor(84, 14, 0xb0beec, 95) and isColor(938, 54, 0x000000, 95) and
        isColor(1002, 43, 0xff4c13, 95) then
        debugB("赛季手册--任务红点")
        tap1(963, 57, 0xffffff)
    end
    if isColor(324, 308, 0xc8c8c8, 95) and isColor(326, 310, 0x7f7f7f, 95) and
        isColor(471, 311, 0xb9b9b9, 95) then
        debugB("登录送背饰-第一天")
        tap1(398, 322, 0xffffff)
    end
    if isColor(513, 308, 0xc4c4c4, 95) and isColor(515, 310, 0x757575, 95) and
        isColor(662, 311, 0xbebebe, 95) then
        debugB("登录送背饰-第二天")
        tap1(590, 323, 0xffffff)
    end
    if isColor(703, 308, 0xc5c5c5, 95) and isColor(705, 310, 0x797979, 95) and
        isColor(855, 315, 0xbfbfbf, 95) then
        debugB("登录送背饰-第三天")
        tap1(780, 322, 0xffffff)
    end
    if isColor(324, 541, 0xc6c6c6, 95) and isColor(326, 543, 0x7a7a7a, 95) and
        isColor(473, 545, 0xc3c3c3, 95) then
        debugB("登录送背饰-第四天")
        tap1(397, 554, 0xffffff)
    end
    if isColor(513, 541, 0xc6c6c6, 95) and isColor(515, 543, 0x797979, 95) and
        isColor(663, 545, 0xc3c3c3, 95) then
        debugB("登录送背饰-第五天")
        tap1(588, 558, 0xffffff)
    end
    if isColor(703, 541, 0xcbcbcb, 95) and isColor(705, 543, 0x868686, 95) and
        isColor(852, 544, 0xc9c9c9, 95) then
        debugB("登录送背饰-第六天")
        tap1(775, 554, 0xffffff)
    end
    if isColor(909, 543, 0xbfbfbf, 95) and isColor(911, 545, 0x6a6a6a, 95) and
        isColor(1058, 548, 0xacacac, 95) then
        debugB("登录送背饰-第七天")
        tap1(981, 556, 0xffffff)
    end
    if isColor(324, 308, 0xc8c8c8, 95) and isColor(326, 310, 0x7f7f7f, 95) and
        isColor(471, 311, 0xb9b9b9, 95) then
        debugB("七日登录-第一天")
        tap1(398, 322, 0xffffff)
    end
    if isColor(513, 308, 0xc4c4c4, 95) and isColor(515, 310, 0x757575, 95) and
        isColor(662, 311, 0xbebebe, 95) then
        debugB("七日登录-第二天")
        tap1(590, 323, 0xffffff)
    end
    if isColor(703, 308, 0xc5c5c5, 95) and isColor(705, 310, 0x797979, 95) and
        isColor(855, 315, 0xbfbfbf, 95) then
        debugB("七日登录-第三天")
        tap1(780, 322, 0xffffff)
    end
    if isColor(324, 541, 0xc6c6c6, 95) and isColor(326, 543, 0x7a7a7a, 95) and
        isColor(473, 545, 0xc3c3c3, 95) then
        debugB("七日登录-第四天")
        tap1(397, 554, 0xffffff)
    end
    if isColor(513, 541, 0xc6c6c6, 95) and isColor(515, 543, 0x797979, 95) and
        isColor(663, 545, 0xc3c3c3, 95) then
        debugB("七日登录-第五天")
        tap1(588, 558, 0xffffff)
    end
    if isColor(703, 541, 0xcbcbcb, 95) and isColor(705, 543, 0x868686, 95) and
        isColor(852, 544, 0xc9c9c9, 95) then
        debugB("七日登录-第六天")
        tap1(775, 554, 0xffffff)
    end
    if isColor(909, 543, 0xbfbfbf, 95) and isColor(911, 545, 0x6a6a6a, 95) and
        isColor(1058, 548, 0xacacac, 95) then
        debugB("七日登录-第七天")
        tap1(981, 556, 0xffffff)
    end
end
-- 传送门至传送门
function doorToDoor()
    init("0", 0);
    mSleep(1470);

    touchDown(1, 119, 148);
    mSleep(378);
    touchMove(1, 130, 157);
    mSleep(16);
    touchMove(1, 130, 158);
    mSleep(17);
    touchMove(1, 130, 159);
    mSleep(16);
    touchMove(1, 130, 160);
    mSleep(34);
    touchMove(1, 130, 161);
    mSleep(18);
    touchMove(1, 130, 162);
    mSleep(14);
    touchMove(1, 130, 163);
    mSleep(35);
    touchMove(1, 130, 164);
    mSleep(15);
    touchMove(1, 130, 165);
    mSleep(52);
    touchMove(1, 130, 166);
    mSleep(14);
    touchMove(1, 131, 168);
    mSleep(16);
    touchMove(1, 133, 170);
    mSleep(17);
    touchMove(1, 134, 172);
    mSleep(16);
    touchMove(1, 135, 173);
    mSleep(17);
    touchMove(1, 136, 175);
    mSleep(20);
    touchMove(1, 138, 176);
    mSleep(14);
    touchMove(1, 139, 178);
    mSleep(16);
    touchMove(1, 140, 179);
    mSleep(16);
    touchMove(1, 141, 180);
    mSleep(18);
    touchMove(1, 142, 181);
    mSleep(18);
    touchMove(1, 144, 183);
    mSleep(15);
    touchMove(1, 146, 185);
    mSleep(17);
    touchMove(1, 147, 186);
    mSleep(17);
    touchMove(1, 148, 187);
    mSleep(50);
    touchMove(1, 149, 187);
    mSleep(18);
    touchMove(1, 149, 188);
    mSleep(66);
    touchMove(1, 150, 188);
    mSleep(17);
    touchMove(1, 151, 188);
    mSleep(19);
    touchMove(1, 151, 189);
    mSleep(32);
    touchMove(1, 152, 189);
    mSleep(17);
    touchMove(1, 153, 190);
    mSleep(33);
    touchMove(1, 154, 190);
    mSleep(33);
    touchMove(1, 154, 191);
    mSleep(101);
    touchMove(1, 155, 192);
    mSleep(33);
    touchMove(1, 155, 193);
    mSleep(33);
    touchMove(1, 155, 195);
    mSleep(16);
    touchMove(1, 156, 195);
    mSleep(17);
    touchMove(1, 156, 196);
    mSleep(16);
    touchMove(1, 157, 197);
    mSleep(34);
    touchMove(1, 158, 197);
    mSleep(16);
    touchMove(1, 158, 198);
    mSleep(17);
    touchMove(1, 159, 199);
    mSleep(17);
    touchMove(1, 159, 200);
    mSleep(16);
    touchMove(1, 160, 201);
    mSleep(17);
    touchMove(1, 160, 202);
    mSleep(17);
    touchMove(1, 160, 203);
    mSleep(16);
    touchMove(1, 160, 204);
    mSleep(17);
    touchMove(1, 161, 205);
    mSleep(34);
    touchMove(1, 162, 206);
    mSleep(18);
    touchMove(1, 162, 207);
    mSleep(15);
    touchMove(1, 163, 208);
    mSleep(33);
    touchMove(1, 163, 209);
    mSleep(17);
    touchMove(1, 164, 210);
    mSleep(19);
    touchMove(1, 165, 210);
    mSleep(32);
    touchMove(1, 165, 211);
    mSleep(32);
    touchMove(1, 165, 212);
    mSleep(16);
    touchMove(1, 166, 212);
    mSleep(67);
    touchMove(1, 167, 212);
    mSleep(16);
    touchMove(1, 167, 213);
    mSleep(67);
    touchMove(1, 167, 214);
    mSleep(17);
    touchMove(1, 167, 215);
    mSleep(17);
    touchMove(1, 168, 216);
    mSleep(16);
    touchMove(1, 168, 217);
    mSleep(17);
    touchMove(1, 168, 219);
    mSleep(17);
    touchMove(1, 168, 221);
    mSleep(16);
    touchMove(1, 168, 224);
    mSleep(17);
    touchMove(1, 168, 228);
    mSleep(17);
    touchMove(1, 167, 231);
    mSleep(17);
    touchMove(1, 164, 235);
    mSleep(51);
    touchMove(1, 157, 242);
    mSleep(15);
    touchMove(1, 155, 245);
    mSleep(16);
    touchMove(1, 153, 247);
    mSleep(17);
    touchMove(1, 152, 248);
    mSleep(17);
    touchMove(1, 151, 249);
    mSleep(17);
    touchMove(1, 151, 250);
    mSleep(16);
    touchMove(1, 151, 251);
    mSleep(300);
    touchMove(1, 151, 252);
    mSleep(68);
    touchMove(1, 151, 253);
    mSleep(348);
    touchMove(1, 152, 253);
    mSleep(18);
    touchMove(1, 153, 253);
    mSleep(15);
    touchMove(1, 154, 253);
    mSleep(17);
    touchMove(1, 155, 253);
    mSleep(16);
    touchMove(1, 157, 253);
    mSleep(19);
    touchMove(1, 160, 253);
    mSleep(15);
    touchMove(1, 163, 253);
    mSleep(17);
    touchMove(1, 166, 253);
    mSleep(16);
    touchMove(1, 167, 253);
    mSleep(17);
    touchMove(1, 168, 253);
    mSleep(16);
    touchMove(1, 169, 253);
    mSleep(400);
    touchMove(1, 170, 253);
    mSleep(534);
    touchUp(1, 172, 254);

    init(1)

end
-- 召一次怪
function callMonster()
    for i = 1, 5, 1 do
        tap1(916, 487, 0x90231a)
        mSleep(1000)
    end
    for i = 1, 4, 1 do
        tap1(780, 529, 0x822017)
        mSleep(1000)
    end
end
-- 副本内门口
function insideDoor()
    init("0", 0);
    -- luaExitIfCall(true);
    mSleep(1160);

    touchDown(7, 160, 217);
    mSleep(111);
    touchMove(7, 153, 227);
    mSleep(16);
    touchMove(7, 153, 229);
    mSleep(16);
    touchMove(7, 153, 231);
    mSleep(18);
    touchMove(7, 153, 232);
    mSleep(16);
    touchMove(7, 152, 233);
    mSleep(17);
    touchMove(7, 152, 234);
    mSleep(16);
    touchMove(7, 151, 235);
    mSleep(53);
    touchMove(7, 149, 236);
    mSleep(14);
    touchMove(7, 148, 237);
    mSleep(18);
    touchMove(7, 147, 237);
    mSleep(15);
    touchMove(7, 147, 238);
    mSleep(18);
    touchMove(7, 146, 238);
    mSleep(33);
    touchMove(7, 145, 239);
    mSleep(49);
    touchMove(7, 145, 240);
    mSleep(19);
    touchMove(7, 144, 240);
    mSleep(18);
    touchMove(7, 143, 240);
    mSleep(48);
    touchMove(7, 142, 241);
    mSleep(48);
    touchMove(7, 141, 241);
    mSleep(50);
    touchMove(7, 141, 242);
    mSleep(17);
    touchMove(7, 140, 242);
    mSleep(17);
    touchMove(7, 140, 243);
    mSleep(71);
    touchMove(7, 139, 243);
    mSleep(48);
    touchMove(7, 138, 243);
    mSleep(31);
    touchMove(7, 137, 243);
    mSleep(149);
    touchMove(7, 136, 243);
    mSleep(153);
    touchMove(7, 135, 243);
    mSleep(1331);
    touchUp(7, 135, 245);
    mSleep(19);

    touchDown(3, 203, 226);
    mSleep(64);
    touchMove(3, 212, 232);
    mSleep(16);
    touchMove(3, 213, 235);
    mSleep(19);
    touchMove(3, 214, 236);
    mSleep(14);
    touchMove(3, 215, 238);
    mSleep(20);
    touchMove(3, 217, 241);
    mSleep(14);
    touchMove(3, 219, 244);
    mSleep(21);
    touchMove(3, 221, 245);
    mSleep(13);
    touchMove(3, 222, 247);
    mSleep(19);
    touchMove(3, 223, 248);
    mSleep(14);
    touchMove(3, 224, 249);
    mSleep(16);
    touchMove(3, 225, 250);
    mSleep(16);
    touchMove(3, 225, 251);
    mSleep(20);
    touchMove(3, 226, 252);
    mSleep(13);
    touchMove(3, 226, 253);
    mSleep(20);
    touchMove(3, 226, 254);
    mSleep(14);
    touchMove(3, 227, 255);
    mSleep(17);
    touchMove(3, 227, 256);
    mSleep(99);
    touchMove(3, 227, 257);
    mSleep(33);
    touchMove(3, 228, 258);
    mSleep(150);
    touchMove(3, 229, 258);
    mSleep(135);
    touchMove(3, 230, 258);
    mSleep(49);
    touchMove(3, 231, 258);
    mSleep(86);
    touchMove(3, 232, 258);
    mSleep(15);
    touchMove(3, 233, 258);
    mSleep(50);
    touchMove(3, 234, 258);
    mSleep(33);
    touchMove(3, 235, 259);
    mSleep(86);
    touchMove(3, 236, 259);
    mSleep(46);
    touchMove(3, 237, 259);
    mSleep(69);
    touchMove(3, 238, 259);
    mSleep(15);
    touchMove(3, 239, 259);
    mSleep(21);
    touchMove(3, 240, 259);
    mSleep(12);
    touchMove(3, 241, 259);
    mSleep(17);
    touchMove(3, 242, 259);
    mSleep(16);
    touchMove(3, 243, 259);
    mSleep(20);
    touchMove(3, 244, 259);
    mSleep(14);
    touchMove(3, 245, 259);
    mSleep(84);
    touchMove(3, 246, 259);
    mSleep(487);
    touchUp(3, 253, 260);
    mSleep(1821);

    touchDown(3, 215, 239);
    mSleep(370);
    touchMove(3, 238, 259);
    mSleep(47);
    touchMove(3, 239, 259);
    mSleep(267);
    touchMove(3, 239, 260);
    mSleep(151);
    touchMove(3, 240, 260);
    mSleep(1963);
    touchUp(3, 241, 260);
    mSleep(1036);

    touchDown(8, 272, 1026);
    mSleep(67);
    touchUp(8, 272, 1026);
    mSleep(798);

    touchDown(3, 240, 246);
    mSleep(149);
    touchMove(3, 249, 255);
    mSleep(18);
    touchMove(3, 250, 255);
    mSleep(15);
    touchMove(3, 252, 257);
    mSleep(18);
    touchMove(3, 254, 259);
    mSleep(16);
    touchMove(3, 255, 260);
    mSleep(18);
    touchMove(3, 256, 261);
    mSleep(15);
    touchMove(3, 257, 262);
    mSleep(19);
    touchMove(3, 258, 262);
    mSleep(15);
    touchMove(3, 259, 263);
    mSleep(17);
    touchMove(3, 260, 263);
    mSleep(33);
    touchMove(3, 261, 263);
    mSleep(34);
    touchMove(3, 261, 264);
    mSleep(83);
    touchMove(3, 261, 265);
    mSleep(133);
    touchMove(3, 262, 265);
    mSleep(50);
    touchMove(3, 263, 266);
    mSleep(217);
    touchMove(3, 264, 266);
    mSleep(317);
    touchMove(3, 265, 266);
    mSleep(651);
    touchMove(3, 266, 266);
    mSleep(67);
    touchMove(3, 267, 266);
    mSleep(16);
    touchMove(3, 268, 266);
    mSleep(18);
    touchMove(3, 269, 266);
    mSleep(19);
    touchMove(3, 270, 265);
    mSleep(32);
    touchMove(3, 271, 265);
    mSleep(165);
    touchMove(3, 271, 264);
    mSleep(267);
    touchMove(3, 271, 263);
    mSleep(53);
    touchMove(3, 271, 261);
    mSleep(14);
    touchUp(3, 272, 257);
    mSleep(939);

    touchDown(3, 237, 219);
    mSleep(78);
    touchMove(3, 252, 214);
    mSleep(21);
    touchMove(3, 256, 214);
    mSleep(15);
    touchMove(3, 259, 214);
    mSleep(18);
    touchMove(3, 260, 214);
    mSleep(13);
    touchMove(3, 261, 213);
    mSleep(21);
    touchMove(3, 262, 213);
    mSleep(13);
    touchMove(3, 263, 211);
    mSleep(19);
    touchMove(3, 264, 211);
    mSleep(14);
    touchMove(3, 266, 209);
    mSleep(21);
    touchMove(3, 268, 207);
    mSleep(13);
    touchMove(3, 269, 206);
    mSleep(19);
    touchMove(3, 270, 205);
    mSleep(14);
    touchMove(3, 271, 204);
    mSleep(21);
    touchMove(3, 272, 203);
    mSleep(11);
    touchMove(3, 273, 202);
    mSleep(17);
    touchMove(3, 274, 202);
    mSleep(18);
    touchMove(3, 275, 201);
    mSleep(23);
    touchMove(3, 277, 200);
    mSleep(8);
    touchMove(3, 279, 199);
    mSleep(17);
    touchMove(3, 280, 199);
    mSleep(16);
    touchMove(3, 281, 199);
    mSleep(18);
    touchMove(3, 281, 198);
    mSleep(51);
    touchMove(3, 281, 197);
    mSleep(14);
    touchMove(3, 281, 195);
    mSleep(16);
    touchMove(3, 281, 193);
    mSleep(18);
    touchMove(3, 281, 191);
    mSleep(16);
    touchMove(3, 281, 188);
    mSleep(18);
    touchMove(3, 281, 186);
    mSleep(16);
    touchMove(3, 281, 184);
    mSleep(17);
    touchMove(3, 281, 182);
    mSleep(17);
    touchMove(3, 281, 179);
    mSleep(17);
    touchMove(3, 281, 177);
    mSleep(16);
    touchMove(3, 281, 176);
    mSleep(17);
    touchMove(3, 281, 175);
    mSleep(16);
    touchMove(3, 281, 174);
    mSleep(16);
    touchMove(3, 281, 173);
    mSleep(34);
    touchMove(3, 281, 172);
    mSleep(33);
    touchMove(3, 281, 171);
    mSleep(51);
    touchMove(3, 281, 170);
    mSleep(69);
    touchMove(3, 281, 169);
    mSleep(264);
    touchMove(3, 282, 169);
    mSleep(67);
    touchMove(3, 283, 169);
    mSleep(34);
    touchMove(3, 284, 169);
    mSleep(200);
    touchMove(3, 284, 170);
    mSleep(15);
    touchMove(3, 285, 170);
    mSleep(71);
    touchMove(3, 285, 171);
    mSleep(133);
    touchMove(3, 285, 172);
    mSleep(30);
    touchMove(3, 285, 173);
    mSleep(83);
    touchMove(3, 285, 174);
    mSleep(33);
    touchMove(3, 285, 175);
    mSleep(34);
    touchMove(3, 285, 176);
    mSleep(52);
    touchMove(3, 285, 177);
    mSleep(36);
    touchUp(3, 288, 180);
    mSleep(18);

    touchDown(3, 270, 197);
    mSleep(84);
    touchMove(3, 277, 203);
    mSleep(15);
    touchMove(3, 282, 203);
    mSleep(16);
    touchMove(3, 288, 206);
    mSleep(17);
    touchMove(3, 294, 207);
    mSleep(17);
    touchMove(3, 300, 209);
    mSleep(16);
    touchMove(3, 305, 209);
    mSleep(17);
    touchMove(3, 308, 209);
    mSleep(19);
    touchMove(3, 310, 209);
    mSleep(15);
    touchMove(3, 312, 210);
    mSleep(16);
    touchMove(3, 313, 210);
    mSleep(17);
    touchMove(3, 313, 211);
    mSleep(17);
    touchMove(3, 315, 211);
    mSleep(33);
    touchMove(3, 316, 212);
    mSleep(1033);
    touchMove(3, 316, 213);
    mSleep(150);
    touchMove(3, 316, 214);
    mSleep(49);
    touchMove(3, 316, 215);
    mSleep(34);
    touchMove(3, 316, 216);
    mSleep(33);
    touchMove(3, 316, 217);
    mSleep(18);
    touchMove(3, 316, 218);
    mSleep(32);
    touchMove(3, 316, 219);
    mSleep(17);
    touchMove(3, 316, 220);
    mSleep(18);
    touchMove(3, 315, 221);
    mSleep(15);
    touchMove(3, 315, 222);
    mSleep(50);
    touchMove(3, 313, 223);
    mSleep(18);
    touchMove(3, 313, 224);
    mSleep(16);
    touchMove(3, 312, 224);
    mSleep(67);
    touchUp(3, 309, 230);
    mSleep(19);

    touchDown(3, 273, 198);
    mSleep(132);
    touchMove(3, 286, 209);
    mSleep(19);
    touchMove(3, 291, 210);
    mSleep(13);
    touchMove(3, 294, 211);
    mSleep(18);
    touchMove(3, 297, 213);
    mSleep(15);
    touchMove(3, 298, 214);
    mSleep(17);
    touchMove(3, 300, 215);
    mSleep(16);
    touchMove(3, 301, 216);
    mSleep(19);
    touchMove(3, 302, 217);
    mSleep(32);
    touchMove(3, 302, 218);
    mSleep(15);
    touchMove(3, 303, 219);
    mSleep(33);
    touchMove(3, 303, 220);
    mSleep(18);
    touchMove(3, 304, 220);
    mSleep(82);
    touchMove(3, 304, 221);
    mSleep(17);
    touchMove(3, 304, 222);
    mSleep(250);
    touchMove(3, 305, 222);
    mSleep(85);
    touchMove(3, 306, 222);
    mSleep(32);
    touchMove(3, 307, 222);
    mSleep(34);
    touchMove(3, 308, 222);
    mSleep(15);
    touchMove(3, 309, 222);
    mSleep(17);
    touchMove(3, 310, 222);
    mSleep(17);
    touchMove(3, 311, 222);
    mSleep(52);
    touchMove(3, 312, 222);
    mSleep(15);
    touchMove(3, 313, 222);
    mSleep(33);
    touchMove(3, 315, 222);
    mSleep(153);
    touchMove(3, 316, 222);
    mSleep(1432);
    touchUp(3, 317, 222);
    mSleep(585);

    touchDown(8, 263, 1048);
    mSleep(81);
    touchUp(8, 263, 1048);
    mSleep(1117);

    touchDown(3, 292, 222);
    mSleep(181);
    touchMove(3, 300, 230);
    mSleep(17);
    touchMove(3, 301, 230);
    mSleep(17);
    touchMove(3, 302, 230);
    mSleep(16);
    touchMove(3, 303, 230);
    mSleep(17);
    touchMove(3, 304, 231);
    mSleep(17);
    touchMove(3, 305, 232);
    mSleep(68);
    touchMove(3, 306, 233);
    mSleep(15);
    touchMove(3, 308, 233);
    mSleep(17);
    touchMove(3, 309, 234);
    mSleep(17);
    touchMove(3, 309, 235);
    mSleep(18);
    touchMove(3, 310, 235);
    mSleep(15);
    touchMove(3, 310, 236);
    mSleep(51);
    touchMove(3, 311, 237);
    mSleep(34);
    touchMove(3, 312, 237);
    mSleep(16);
    touchMove(3, 313, 237);
    mSleep(17);
    touchMove(3, 315, 237);
    mSleep(35);
    touchMove(3, 316, 237);
    mSleep(48);
    touchMove(3, 317, 237);
    mSleep(33);
    touchMove(3, 318, 238);
    mSleep(17);
    touchMove(3, 319, 238);
    mSleep(49);
    touchMove(3, 320, 238);
    mSleep(217);
    touchMove(3, 320, 239);
    mSleep(1487);
    touchUp(3, 321, 239);
    mSleep(1682);

    touchDown(3, 279, 201);
    mSleep(81);
    touchMove(3, 287, 195);
    mSleep(17);
    touchMove(3, 290, 195);
    mSleep(17);
    touchMove(3, 293, 193);
    mSleep(18);
    touchMove(3, 295, 190);
    mSleep(16);
    touchMove(3, 297, 187);
    mSleep(16);
    touchMove(3, 299, 185);
    mSleep(16);
    touchMove(3, 301, 182);
    mSleep(17);
    touchMove(3, 302, 181);
    mSleep(17);
    touchMove(3, 303, 179);
    mSleep(16);
    touchMove(3, 305, 178);
    mSleep(18);
    touchMove(3, 306, 177);
    mSleep(15);
    touchMove(3, 307, 176);
    mSleep(17);
    touchMove(3, 308, 176);
    mSleep(17);
    touchMove(3, 310, 176);
    mSleep(17);
    touchMove(3, 311, 176);
    mSleep(16);
    touchMove(3, 312, 176);
    mSleep(17);
    touchMove(3, 312, 175);
    mSleep(17);
    touchMove(3, 312, 174);
    mSleep(32);
    touchMove(3, 312, 173);
    mSleep(33);
    touchMove(3, 312, 172);
    mSleep(52);
    touchMove(3, 312, 171);
    mSleep(65);
    touchMove(3, 313, 171);
    mSleep(100);
    touchMove(3, 315, 171);
    mSleep(300);
    touchMove(3, 316, 171);
    mSleep(433);
    touchMove(3, 316, 172);
    mSleep(16);
    touchMove(3, 316, 173);
    mSleep(17);
    touchMove(3, 316, 174);
    mSleep(17);
    touchMove(3, 316, 175);
    mSleep(34);
    touchUp(3, 319, 178);
    mSleep(1003);

    touchDown(3, 279, 213);
    mSleep(347);
    touchMove(3, 292, 223);
    mSleep(18);
    touchMove(3, 293, 223);
    mSleep(15);
    touchMove(3, 294, 223);
    mSleep(67);
    touchMove(3, 295, 223);
    mSleep(50);
    touchMove(3, 296, 223);
    mSleep(83);
    touchMove(3, 297, 223);
    mSleep(51);
    touchMove(3, 298, 223);
    mSleep(50);
    touchMove(3, 299, 223);
    mSleep(34);
    touchMove(3, 300, 224);
    mSleep(51);
    touchMove(3, 301, 224);
    mSleep(15);
    touchMove(3, 301, 225);
    mSleep(18);
    touchMove(3, 302, 225);
    mSleep(34);
    touchMove(3, 303, 225);
    mSleep(14);
    touchMove(3, 303, 226);
    mSleep(18);
    touchMove(3, 304, 226);
    mSleep(16);
    touchMove(3, 305, 227);
    mSleep(20);
    touchMove(3, 305, 228);
    mSleep(12);
    touchMove(3, 306, 228);
    mSleep(19);
    touchMove(3, 307, 229);
    mSleep(31);
    touchMove(3, 308, 230);
    mSleep(35);
    touchMove(3, 309, 230);
    mSleep(81);
    touchMove(3, 310, 230);
    mSleep(67);
    touchMove(3, 311, 230);
    mSleep(801);
    touchUp(3, 313, 230);
    mSleep(670);

    touchDown(3, 269, 188);
    mSleep(195);
    touchMove(3, 280, 180);
    mSleep(17);
    touchMove(3, 282, 180);
    mSleep(20);
    touchMove(3, 284, 180);
    mSleep(14);
    touchMove(3, 285, 180);
    mSleep(16);
    touchMove(3, 286, 180);
    mSleep(17);
    touchMove(3, 287, 179);
    mSleep(16);
    touchMove(3, 288, 179);
    mSleep(17);
    touchMove(3, 289, 178);
    mSleep(16);
    touchMove(3, 290, 178);
    mSleep(17);
    touchMove(3, 291, 178);
    mSleep(17);
    touchMove(3, 292, 178);
    mSleep(17);
    touchMove(3, 293, 177);
    mSleep(19);
    touchMove(3, 293, 176);
    mSleep(31);
    touchMove(3, 294, 175);
    mSleep(19);
    touchMove(3, 294, 174);
    mSleep(14);
    touchMove(3, 295, 174);
    mSleep(17);
    touchMove(3, 295, 173);
    mSleep(34);
    touchMove(3, 296, 173);
    mSleep(18);
    touchMove(3, 296, 172);
    mSleep(32);
    touchMove(3, 296, 171);
    mSleep(15);
    touchMove(3, 296, 170);
    mSleep(16);
    touchMove(3, 297, 170);
    mSleep(18);
    touchMove(3, 297, 169);
    mSleep(67);
    touchMove(3, 297, 168);
    mSleep(166);
    touchMove(3, 298, 168);
    mSleep(16);
    touchMove(3, 298, 167);
    mSleep(66);
    touchMove(3, 298, 166);
    mSleep(84);
    touchMove(3, 298, 165);
    mSleep(99);
    touchMove(3, 298, 164);
    mSleep(184);
    touchMove(3, 298, 163);
    mSleep(49);
    touchMove(3, 299, 163);
    mSleep(50);
    touchMove(3, 299, 162);
    mSleep(200);
    touchMove(3, 299, 161);
    mSleep(817);
    touchUp(3, 301, 163);
    mSleep(435);

    touchDown(8, 263, 1047);
    mSleep(99);
    touchUp(8, 263, 1047);
    mSleep(18);

    touchDown(3, 293, 170);
    mSleep(652);
    touchMove(3, 301, 163);
    mSleep(14);
    touchMove(3, 301, 162);
    mSleep(33);
    touchMove(3, 302, 161);
    mSleep(99);
    touchMove(3, 303, 161);
    mSleep(52);
    touchMove(3, 304, 161);
    mSleep(16);
    touchMove(3, 304, 160);
    mSleep(65);
    touchMove(3, 304, 159);
    mSleep(20);
    touchMove(3, 305, 159);
    mSleep(47);
    touchMove(3, 305, 158);
    mSleep(16);
    touchMove(3, 306, 158);
    mSleep(37);
    touchMove(3, 306, 156);
    mSleep(297);
    touchUp(3, 306, 158);
    mSleep(801);

    touchDown(5, 214, 215);
    mSleep(115);
    touchMove(5, 226, 202);
    mSleep(19);
    touchMove(5, 227, 199);
    mSleep(18);
    touchMove(5, 230, 198);
    mSleep(14);
    touchMove(5, 234, 195);
    mSleep(16);
    touchMove(5, 237, 193);
    mSleep(17);
    touchMove(5, 240, 191);
    mSleep(19);
    touchMove(5, 242, 190);
    mSleep(14);
    touchMove(5, 244, 188);
    mSleep(18);
    touchMove(5, 245, 188);
    mSleep(17);
    touchMove(5, 246, 187);
    mSleep(19);
    touchMove(5, 247, 186);
    mSleep(36);
    touchMove(5, 248, 185);
    mSleep(11);
    touchMove(5, 249, 184);
    mSleep(17);
    touchMove(5, 249, 183);
    mSleep(51);
    touchMove(5, 250, 181);
    mSleep(52);
    touchMove(5, 252, 181);
    mSleep(203);
    touchMove(5, 253, 181);
    mSleep(112);
    touchMove(5, 254, 181);
    mSleep(99);
    touchMove(5, 255, 181);
    mSleep(35);
    touchMove(5, 256, 181);
    mSleep(66);
    touchMove(5, 257, 181);
    mSleep(1100);
    touchUp(5, 254, 184);
    mSleep(1553);

    touchDown(5, 242, 196);
    mSleep(148);
    touchMove(5, 255, 193);
    mSleep(15);
    touchMove(5, 257, 193);
    mSleep(20);
    touchMove(5, 260, 193);
    mSleep(13);
    touchMove(5, 264, 193);
    mSleep(18);
    touchMove(5, 268, 193);
    mSleep(16);
    touchMove(5, 272, 193);
    mSleep(17);
    touchMove(5, 275, 193);
    mSleep(16);
    touchMove(5, 277, 193);
    mSleep(18);
    touchMove(5, 279, 193);
    mSleep(16);
    touchMove(5, 280, 193);
    mSleep(19);
    touchMove(5, 281, 193);
    mSleep(14);
    touchMove(5, 282, 193);
    mSleep(18);
    touchMove(5, 283, 193);
    mSleep(15);
    touchMove(5, 284, 193);
    mSleep(18);
    touchMove(5, 285, 193);
    mSleep(16);
    touchMove(5, 286, 193);
    mSleep(51);
    touchMove(5, 287, 193);
    mSleep(31);
    touchMove(5, 288, 193);
    mSleep(349);
    touchMove(5, 289, 193);
    mSleep(653);
    touchUp(5, 291, 192);
    mSleep(1351);

    touchDown(5, 260, 192);
    mSleep(231);
    touchMove(5, 271, 180);
    mSleep(16);
    touchMove(5, 272, 180);
    mSleep(16);
    touchMove(5, 273, 180);
    mSleep(67);
    touchMove(5, 274, 180);
    mSleep(33);
    touchMove(5, 275, 180);
    mSleep(17);
    touchMove(5, 276, 179);
    mSleep(36);
    touchMove(5, 277, 179);
    mSleep(33);
    touchMove(5, 278, 179);
    mSleep(37);
    touchMove(5, 279, 178);
    mSleep(10);
    touchMove(5, 279, 177);
    mSleep(22);
    touchMove(5, 280, 177);
    mSleep(15);
    touchMove(5, 280, 176);
    mSleep(16);
    touchMove(5, 281, 176);
    mSleep(14);
    touchMove(5, 282, 175);
    mSleep(66);
    touchMove(5, 283, 174);
    mSleep(33);
    touchMove(5, 283, 173);
    mSleep(34);
    touchMove(5, 284, 173);
    mSleep(17);
    touchMove(5, 284, 172);
    mSleep(16);
    touchMove(5, 284, 171);
    mSleep(203);
    touchMove(5, 285, 171);
    mSleep(1080);
    touchUp(5, 286, 173);
    mSleep(985);

    touchDown(8, 257, 1035);
    mSleep(82);
    touchUp(8, 257, 1035);
    mSleep(654);

    touchDown(5, 268, 184);
    mSleep(313);
    touchMove(5, 285, 173);
    mSleep(36);
    touchMove(5, 286, 172);
    mSleep(34);
    touchMove(5, 286, 171);
    mSleep(14);
    touchMove(5, 286, 170);
    mSleep(31);
    touchMove(5, 286, 169);
    mSleep(36);
    touchMove(5, 287, 169);
    mSleep(16);
    touchMove(5, 287, 168);
    mSleep(83);
    touchMove(5, 288, 168);
    mSleep(19);
    touchMove(5, 288, 167);
    mSleep(33);
    touchMove(5, 289, 167);
    mSleep(31);
    touchMove(5, 289, 166);
    mSleep(16);
    touchMove(5, 290, 166);
    mSleep(68);
    touchMove(5, 290, 165);
    mSleep(84);
    touchMove(5, 291, 165);
    mSleep(1067);
    touchUp(5, 293, 164);
    mSleep(716);

    touchDown(5, 254, 151);
    mSleep(500);
    touchMove(5, 241, 138);
    mSleep(66);
    touchMove(5, 241, 137);
    mSleep(83);
    touchMove(5, 241, 136);
    mSleep(18);
    touchMove(5, 241, 135);
    mSleep(16);
    touchMove(5, 241, 134);
    mSleep(33);
    touchMove(5, 240, 132);
    mSleep(51);
    touchMove(5, 240, 130);
    mSleep(33);
    touchMove(5, 239, 130);
    mSleep(36);
    touchMove(5, 238, 130);
    mSleep(15);
    touchMove(5, 238, 129);
    mSleep(19);
    touchMove(5, 237, 128);
    mSleep(14);
    touchMove(5, 236, 128);
    mSleep(19);
    touchMove(5, 235, 127);
    mSleep(33);
    touchMove(5, 234, 126);
    mSleep(14);
    touchMove(5, 233, 126);
    mSleep(34);
    touchMove(5, 233, 125);
    mSleep(151);
    touchUp(5, 238, 132);
    mSleep(636);

    touchDown(3, 291, 156);
    mSleep(298);
    touchMove(3, 304, 141);
    mSleep(19);
    touchMove(3, 305, 141);
    mSleep(15);
    touchMove(3, 306, 140);
    mSleep(17);
    touchMove(3, 307, 140);
    mSleep(15);
    touchMove(3, 308, 140);
    mSleep(20);
    touchMove(3, 309, 140);
    mSleep(14);
    touchMove(3, 310, 139);
    mSleep(19);
    touchMove(3, 311, 139);
    mSleep(14);
    touchMove(3, 312, 139);
    mSleep(20);
    touchMove(3, 313, 139);
    mSleep(31);
    touchMove(3, 313, 138);
    mSleep(16);
    touchMove(3, 315, 138);
    mSleep(35);
    touchMove(3, 316, 136);
    mSleep(15);
    touchMove(3, 317, 136);
    mSleep(17);
    touchMove(3, 318, 136);
    mSleep(20);
    touchMove(3, 319, 135);
    mSleep(31);
    touchMove(3, 319, 134);
    mSleep(35);
    touchMove(3, 320, 134);
    mSleep(866);
    touchUp(3, 321, 136);
    mSleep(800);

    touchDown(3, 283, 169);
    mSleep(165);
    touchMove(3, 301, 162);
    mSleep(16);
    touchMove(3, 303, 162);
    mSleep(18);
    touchMove(3, 305, 162);
    mSleep(16);
    touchMove(3, 307, 162);
    mSleep(17);
    touchMove(3, 308, 162);
    mSleep(16);
    touchMove(3, 310, 162);
    mSleep(17);
    touchMove(3, 311, 162);
    mSleep(17);
    touchMove(3, 312, 162);
    mSleep(17);
    touchMove(3, 313, 162);
    mSleep(17);
    touchMove(3, 315, 162);
    mSleep(17);
    touchMove(3, 316, 162);
    mSleep(33);
    touchMove(3, 317, 162);
    mSleep(16);
    touchMove(3, 318, 162);
    mSleep(51);
    touchMove(3, 319, 162);
    mSleep(33);
    touchMove(3, 320, 161);
    mSleep(51);
    touchMove(3, 321, 161);
    mSleep(51);
    touchMove(3, 322, 161);
    mSleep(200);
    touchMove(3, 322, 160);
    mSleep(183);
    touchMove(3, 322, 159);
    mSleep(449);
    touchMove(3, 323, 159);
    mSleep(268);
    touchMove(3, 324, 159);
    mSleep(66);
    touchMove(3, 325, 159);
    mSleep(69);
    touchMove(3, 326, 160);
    mSleep(116);
    touchMove(3, 326, 161);
    mSleep(15);
    touchMove(3, 326, 162);
    mSleep(17);
    touchUp(3, 327, 166);
    mSleep(1102);

    touchDown(3, 279, 171);
    mSleep(131);
    touchMove(3, 291, 181);
    mSleep(17);
    touchMove(3, 294, 181);
    mSleep(18);
    touchMove(3, 297, 182);
    mSleep(15);
    touchMove(3, 300, 183);
    mSleep(16);
    touchMove(3, 302, 183);
    mSleep(17);
    touchMove(3, 305, 184);
    mSleep(17);
    touchMove(3, 308, 184);
    mSleep(16);
    touchMove(3, 311, 184);
    mSleep(17);
    touchMove(3, 316, 184);
    mSleep(18);
    touchMove(3, 319, 184);
    mSleep(15);
    touchMove(3, 321, 184);
    mSleep(17);
    touchMove(3, 324, 184);
    mSleep(16);
    touchMove(3, 325, 184);
    mSleep(17);
    touchMove(3, 326, 184);
    mSleep(17);
    touchMove(3, 327, 184);
    mSleep(17);
    touchMove(3, 328, 184);
    mSleep(83);
    touchMove(3, 329, 184);
    mSleep(33);
    touchMove(3, 330, 184);
    mSleep(17);
    touchMove(3, 331, 184);
    mSleep(683);
    touchMove(3, 331, 185);
    mSleep(33);
    touchMove(3, 331, 186);
    mSleep(53);
    touchMove(3, 331, 187);
    mSleep(14);
    touchMove(3, 331, 188);
    mSleep(101);
    touchMove(3, 331, 189);
    mSleep(386);
    touchUp(3, 330, 191);
    mSleep(1237);

    touchDown(8, 265, 1049);
    mSleep(61);
    touchUp(8, 265, 1049);
    mSleep(553);

    touchDown(5, 244, 160);
    mSleep(64);
    touchMove(5, 253, 166);
    mSleep(17);
    touchMove(5, 261, 169);
    mSleep(16);
    touchMove(5, 266, 172);
    mSleep(18);
    touchMove(5, 270, 174);
    mSleep(15);
    touchMove(5, 273, 176);
    mSleep(17);
    touchMove(5, 275, 177);
    mSleep(16);
    touchMove(5, 277, 179);
    mSleep(17);
    touchMove(5, 279, 181);
    mSleep(18);
    touchMove(5, 281, 183);
    mSleep(15);
    touchMove(5, 283, 185);
    mSleep(18);
    touchMove(5, 285, 187);
    mSleep(15);
    touchMove(5, 286, 188);
    mSleep(18);
    touchMove(5, 288, 189);
    mSleep(15);
    touchMove(5, 289, 190);
    mSleep(17);
    touchMove(5, 290, 191);
    mSleep(16);
    touchMove(5, 290, 192);
    mSleep(84);
    touchMove(5, 291, 193);
    mSleep(19);
    touchMove(5, 292, 193);
    mSleep(13);
    touchMove(5, 293, 193);
    mSleep(17);
    touchMove(5, 294, 195);
    mSleep(667);
    touchMove(5, 295, 195);
    mSleep(1217);
    touchUp(5, 295, 193);
    mSleep(1337);

    touchDown(5, 276, 171);
    mSleep(198);
    touchMove(5, 284, 160);
    mSleep(30);
    touchMove(5, 286, 158);
    mSleep(11);
    touchMove(5, 288, 157);
    mSleep(10);
    touchMove(5, 289, 155);
    mSleep(23);
    touchMove(5, 291, 153);
    mSleep(15);
    touchMove(5, 292, 151);
    mSleep(9);
    touchMove(5, 293, 150);
    mSleep(17);
    touchMove(5, 294, 149);
    mSleep(17);
    touchMove(5, 295, 148);
    mSleep(17);
    touchMove(5, 296, 147);
    mSleep(49);
    touchMove(5, 297, 147);
    mSleep(49);
    touchMove(5, 298, 147);
    mSleep(67);
    touchMove(5, 299, 147);
    mSleep(133);
    touchMove(5, 300, 146);
    mSleep(152);
    touchMove(5, 301, 146);
    mSleep(48);
    touchMove(5, 302, 146);
    mSleep(21);
    touchMove(5, 303, 146);
    mSleep(15);
    touchMove(5, 304, 146);
    mSleep(64);
    touchMove(5, 305, 146);
    mSleep(88);
    touchMove(5, 306, 146);
    mSleep(46);
    touchMove(5, 307, 146);
    mSleep(150);
    touchMove(5, 308, 146);
    mSleep(804);
    touchMove(5, 308, 147);
    mSleep(66);
    touchMove(5, 308, 148);
    mSleep(82);
    touchMove(5, 308, 149);
    mSleep(17);
    touchMove(5, 308, 151);
    mSleep(16);
    touchUp(5, 308, 155);
    mSleep(1417);

    touchDown(5, 300, 142);
    mSleep(114);
    touchMove(5, 311, 137);
    mSleep(17);
    touchMove(5, 316, 137);
    mSleep(17);
    touchMove(5, 318, 137);
    mSleep(16);
    touchMove(5, 320, 137);
    mSleep(17);
    touchMove(5, 322, 137);
    mSleep(18);
    touchMove(5, 323, 137);
    mSleep(15);
    touchMove(5, 325, 137);
    mSleep(17);
    touchMove(5, 326, 137);
    mSleep(17);
    touchMove(5, 327, 137);
    mSleep(16);
    touchMove(5, 328, 137);
    mSleep(17);
    touchMove(5, 329, 137);
    mSleep(17);
    touchMove(5, 330, 137);
    mSleep(84);
    touchMove(5, 331, 137);
    mSleep(66);
    touchMove(5, 331, 136);
    mSleep(17);
    touchMove(5, 332, 136);
    mSleep(151);
    touchMove(5, 332, 135);
    mSleep(50);
    touchMove(5, 332, 134);
    mSleep(17);
    touchMove(5, 332, 133);
    mSleep(16);
    touchMove(5, 332, 132);
    mSleep(18);
    touchMove(5, 332, 131);
    mSleep(17);
    touchMove(5, 332, 130);
    mSleep(15);
    touchMove(5, 332, 126);
    mSleep(15);
    touchMove(5, 332, 125);
    mSleep(18);
    touchMove(5, 332, 124);
    mSleep(16);
    touchMove(5, 332, 122);
    mSleep(18);
    touchMove(5, 332, 121);
    mSleep(71);
    touchMove(5, 332, 120);
    mSleep(78);
    touchMove(5, 332, 119);
    mSleep(100);
    touchMove(5, 332, 118);
    mSleep(933);
    touchUp(5, 330, 113);
    mSleep(216);

    touchDown(8, 268, 1052);
    mSleep(99);
    touchUp(8, 268, 1052);
    mSleep(805);

    touchDown(5, 323, 115);
    mSleep(165);
    touchMove(5, 322, 102);
    mSleep(15);
    touchMove(5, 322, 101);
    mSleep(18);
    touchMove(5, 322, 99);
    mSleep(14);
    touchMove(5, 322, 97);
    mSleep(16);
    touchMove(5, 322, 96);
    mSleep(17);
    touchMove(5, 322, 95);
    mSleep(19);
    touchMove(5, 323, 94);
    mSleep(14);
    touchMove(5, 324, 93);
    mSleep(21);
    touchMove(5, 325, 93);
    mSleep(13);
    touchMove(5, 326, 92);
    mSleep(19);
    touchMove(5, 326, 91);
    mSleep(14);
    touchMove(5, 327, 90);
    mSleep(33);
    touchMove(5, 328, 89);
    mSleep(19);
    touchMove(5, 328, 88);
    mSleep(15);
    touchMove(5, 329, 87);
    mSleep(18);
    touchMove(5, 330, 87);
    mSleep(15);
    touchMove(5, 331, 86);
    mSleep(53);
    touchMove(5, 331, 85);
    mSleep(14);
    touchMove(5, 332, 85);
    mSleep(32);
    touchMove(5, 332, 84);
    mSleep(68);
    touchMove(5, 333, 84);
    mSleep(618);
    touchUp(5, 334, 84);
    mSleep(737);

    touchDown(1, 248, 89);
    mSleep(46);
    touchMove(1, 240, 83);
    mSleep(15);
    touchMove(1, 238, 83);
    mSleep(16);
    touchMove(1, 236, 83);
    mSleep(18);
    touchMove(1, 232, 82);
    mSleep(16);
    touchMove(1, 228, 81);
    mSleep(15);
    touchMove(1, 224, 79);
    mSleep(17);
    touchMove(1, 220, 76);
    mSleep(18);
    touchMove(1, 217, 74);
    mSleep(16);
    touchMove(1, 214, 72);
    mSleep(17);
    touchMove(1, 211, 69);
    mSleep(16);
    touchMove(1, 209, 67);
    mSleep(17);
    touchMove(1, 206, 64);
    mSleep(16);
    touchMove(1, 205, 62);
    mSleep(17);
    touchMove(1, 204, 61);
    mSleep(17);
    touchMove(1, 204, 60);
    mSleep(16);
    touchMove(1, 203, 59);
    mSleep(16);
    touchMove(1, 203, 57);
    mSleep(18);
    touchMove(1, 202, 56);
    mSleep(15);
    touchMove(1, 201, 55);
    mSleep(18);
    touchMove(1, 200, 54);
    mSleep(65);
    touchMove(1, 199, 54);
    mSleep(251);
    touchMove(1, 199, 53);
    mSleep(1200);
    touchMove(1, 199, 54);
    mSleep(16);
    touchMove(1, 199, 56);
    mSleep(17);
    touchUp(1, 203, 61);
    mSleep(420);

    touchDown(8, 260, 1060);
    mSleep(65);
    touchUp(8, 260, 1060);
    mSleep(1084);

    touchDown(1, 220, 70);
    mSleep(165);
    touchMove(1, 204, 56);
    mSleep(17);
    touchMove(1, 204, 55);
    mSleep(16);
    touchMove(1, 204, 54);
    mSleep(17);
    touchMove(1, 204, 52);
    mSleep(17);
    touchMove(1, 204, 51);
    mSleep(16);
    touchMove(1, 203, 50);
    mSleep(18);
    touchMove(1, 202, 49);
    mSleep(16);
    touchMove(1, 200, 49);
    mSleep(16);
    touchMove(1, 200, 48);
    mSleep(17);
    touchMove(1, 198, 48);
    mSleep(18);
    touchMove(1, 197, 47);
    mSleep(16);
    touchMove(1, 195, 46);
    mSleep(18);
    touchMove(1, 193, 45);
    mSleep(16);
    touchMove(1, 191, 45);
    mSleep(16);
    touchMove(1, 190, 45);
    mSleep(17);
    touchMove(1, 189, 45);
    mSleep(68);
    touchMove(1, 189, 44);
    mSleep(1333);
    touchMove(1, 189, 45);
    mSleep(21);
    touchUp(1, 194, 52);
    mSleep(1336);

    touchDown(8, 258, 1057);
    mSleep(15);
    touchMove(8, 258, 1057);
    mSleep(87);
    touchUp(8, 258, 1057);
    mSleep(767);

    touchDown(4, 256, 103);
    mSleep(114);
    touchMove(4, 268, 95);
    mSleep(16);
    touchMove(4, 270, 95);
    mSleep(17);
    touchMove(4, 273, 95);
    mSleep(18);
    touchMove(4, 275, 95);
    mSleep(21);
    touchMove(4, 276, 94);
    mSleep(11);
    touchMove(4, 277, 94);
    mSleep(16);
    touchMove(4, 279, 93);
    mSleep(20);
    touchMove(4, 281, 92);
    mSleep(13);
    touchMove(4, 282, 91);
    mSleep(17);
    touchMove(4, 284, 90);
    mSleep(17);
    touchMove(4, 285, 90);
    mSleep(17);
    touchMove(4, 286, 89);
    mSleep(15);
    touchMove(4, 287, 89);
    mSleep(17);
    touchMove(4, 288, 89);
    mSleep(34);
    touchMove(4, 289, 89);
    mSleep(17);
    touchMove(4, 289, 88);
    mSleep(50);
    touchMove(4, 290, 88);
    mSleep(53);
    touchMove(4, 290, 87);
    mSleep(14);
    touchMove(4, 291, 87);
    mSleep(33);
    touchMove(4, 291, 86);
    mSleep(35);
    touchMove(4, 291, 85);
    mSleep(15);
    touchMove(4, 291, 84);
    mSleep(17);
    touchMove(4, 291, 83);
    mSleep(17);
    touchMove(4, 291, 82);
    mSleep(17);
    touchMove(4, 291, 81);
    mSleep(18);
    touchMove(4, 291, 80);
    mSleep(16);
    touchMove(4, 291, 78);
    mSleep(16);
    touchMove(4, 291, 77);
    mSleep(17);
    touchMove(4, 291, 75);
    mSleep(17);
    touchMove(4, 291, 74);
    mSleep(17);
    touchMove(4, 291, 73);
    mSleep(50);
    touchUp(4, 285, 71);

    mSleep(1647);

    touchDown(6, 206, 195);
    mSleep(82);
    touchMove(6, 209, 187);
    mSleep(18);
    touchMove(6, 209, 183);
    mSleep(14);
    touchMove(6, 210, 180);
    mSleep(18);
    touchMove(6, 212, 178);
    mSleep(16);
    touchMove(6, 215, 175);
    mSleep(19);
    touchMove(6, 217, 172);
    mSleep(13);
    touchMove(6, 220, 170);
    mSleep(17);
    touchMove(6, 224, 167);
    mSleep(17);
    touchMove(6, 227, 165);
    mSleep(17);
    touchMove(6, 228, 165);
    mSleep(16);
    touchMove(6, 230, 163);
    mSleep(17);
    touchMove(6, 231, 162);
    mSleep(16);
    touchMove(6, 232, 160);
    mSleep(17);
    touchMove(6, 233, 160);
    mSleep(17);
    touchMove(6, 234, 159);
    mSleep(18);
    touchMove(6, 235, 159);
    mSleep(16);
    touchMove(6, 235, 158);
    mSleep(17);
    touchMove(6, 235, 157);
    mSleep(16);
    touchMove(6, 235, 156);
    mSleep(33);
    touchMove(6, 235, 155);
    mSleep(18);
    touchMove(6, 236, 154);
    mSleep(16);
    touchMove(6, 237, 152);
    mSleep(51);
    touchMove(6, 238, 151);
    mSleep(66);
    touchMove(6, 239, 151);
    mSleep(134);
    touchMove(6, 239, 150);
    mSleep(16);
    touchMove(6, 240, 150);
    mSleep(717);
    touchMove(6, 241, 150);
    mSleep(117);
    touchMove(6, 242, 150);
    mSleep(67);
    touchMove(6, 243, 150);
    mSleep(17);
    touchMove(6, 244, 150);
    mSleep(16);
    touchMove(6, 245, 150);
    mSleep(17);
    touchMove(6, 246, 150);
    mSleep(17);
    touchMove(6, 247, 150);
    mSleep(17);
    touchMove(6, 248, 151);
    mSleep(16);
    touchMove(6, 249, 151);
    mSleep(17);
    touchMove(6, 250, 151);
    mSleep(17);
    touchMove(6, 252, 152);
    mSleep(16);
    touchMove(6, 253, 152);
    mSleep(17);
    touchMove(6, 254, 153);
    mSleep(17);
    touchMove(6, 255, 153);
    mSleep(16);
    touchMove(6, 256, 153);
    mSleep(17);
    touchMove(6, 257, 153);
    mSleep(17);
    touchMove(6, 258, 153);
    mSleep(17);
    touchMove(6, 259, 153);
    mSleep(33);
    touchMove(6, 260, 153);
    mSleep(18);
    touchMove(6, 261, 153);
    mSleep(17);
    touchMove(6, 262, 153);
    mSleep(19);
    touchMove(6, 263, 153);
    mSleep(13);
    touchMove(6, 264, 153);
    mSleep(20);
    touchMove(6, 265, 153);
    mSleep(13);
    touchMove(6, 266, 153);
    mSleep(66);
    touchMove(6, 267, 153);
    mSleep(50);
    touchMove(6, 268, 153);
    mSleep(152);
    touchUp(6, 264, 158);
    mSleep(686);

    touchDown(8, 241, 1033);
    mSleep(99);
    touchUp(8, 241, 1033);
    mSleep(869);

    touchDown(8, 250, 1031);
    mSleep(66);
    touchUp(8, 250, 1031);
    mSleep(667);

    touchDown(6, 253, 161);
    mSleep(98);
    touchMove(6, 265, 158);
    mSleep(17);
    touchMove(6, 268, 158);
    mSleep(16);
    touchMove(6, 271, 158);
    mSleep(17);
    touchMove(6, 274, 158);
    mSleep(17);
    touchMove(6, 276, 158);
    mSleep(18);
    touchMove(6, 279, 158);
    mSleep(15);
    touchMove(6, 281, 157);
    mSleep(17);
    touchMove(6, 284, 156);
    mSleep(16);
    touchMove(6, 287, 154);
    mSleep(17);
    touchMove(6, 289, 153);
    mSleep(16);
    touchMove(6, 290, 153);
    mSleep(17);
    touchMove(6, 291, 152);
    mSleep(17);
    touchMove(6, 292, 151);
    mSleep(15);
    touchMove(6, 293, 150);
    mSleep(33);
    touchMove(6, 294, 150);
    mSleep(18);
    touchMove(6, 294, 149);
    mSleep(15);
    touchMove(6, 295, 148);
    mSleep(34);
    touchMove(6, 296, 146);
    mSleep(33);
    touchMove(6, 297, 145);
    mSleep(17);
    touchMove(6, 297, 144);
    mSleep(50);
    touchMove(6, 297, 143);
    mSleep(16);
    touchMove(6, 297, 142);
    mSleep(17);
    touchMove(6, 298, 142);
    mSleep(16);
    touchMove(6, 298, 140);
    mSleep(16);
    touchMove(6, 298, 139);
    mSleep(19);
    touchMove(6, 298, 138);
    mSleep(15);
    touchMove(6, 298, 136);
    mSleep(17);
    touchMove(6, 298, 135);
    mSleep(16);
    touchMove(6, 298, 134);
    mSleep(17);
    touchMove(6, 299, 132);
    mSleep(34);
    touchMove(6, 299, 131);
    mSleep(134);
    touchMove(6, 300, 131);
    mSleep(535);
    touchMove(6, 300, 133);
    mSleep(15);
    touchUp(6, 300, 137);
    mSleep(18);

    touchDown(3, 287, 182);
    mSleep(132);
    touchMove(3, 305, 181);
    mSleep(18);
    touchMove(3, 311, 181);
    mSleep(14);
    touchMove(3, 316, 181);
    mSleep(20);
    touchMove(3, 319, 181);
    mSleep(14);
    touchMove(3, 321, 181);
    mSleep(18);
    touchMove(3, 322, 181);
    mSleep(15);
    touchMove(3, 323, 181);
    mSleep(20);
    touchMove(3, 324, 181);
    mSleep(14);
    touchMove(3, 325, 181);
    mSleep(16);
    touchMove(3, 326, 181);
    mSleep(33);
    touchMove(3, 327, 181);
    mSleep(17);
    touchMove(3, 328, 181);
    mSleep(34);
    touchMove(3, 329, 181);
    mSleep(17);
    touchMove(3, 330, 181);
    mSleep(83);
    touchMove(3, 331, 181);
    mSleep(367);
    touchMove(3, 331, 180);
    mSleep(1507);
    touchUp(3, 333, 181);
    mSleep(1052);

    touchDown(9, 253, 193);
    mSleep(233);
    touchMove(9, 263, 203);
    mSleep(16);
    touchMove(9, 265, 204);
    mSleep(17);
    touchMove(9, 266, 205);
    mSleep(16);
    touchMove(9, 267, 206);
    mSleep(17);
    touchMove(9, 268, 207);
    mSleep(18);
    touchMove(9, 269, 207);
    mSleep(16);
    touchMove(9, 270, 207);
    mSleep(16);
    touchMove(9, 271, 208);
    mSleep(17);
    touchMove(9, 273, 209);
    mSleep(16);
    touchMove(9, 274, 210);
    mSleep(17);
    touchMove(9, 275, 210);
    mSleep(50);
    touchMove(9, 276, 210);
    mSleep(33);
    touchMove(9, 277, 210);
    mSleep(51);
    touchMove(9, 277, 211);
    mSleep(34);
    touchMove(9, 278, 211);
    mSleep(49);
    touchMove(9, 279, 211);
    mSleep(33);
    touchMove(9, 280, 211);
    mSleep(51);
    touchMove(9, 281, 211);
    mSleep(16);
    touchMove(9, 282, 211);
    mSleep(17);
    touchMove(9, 285, 211);
    mSleep(18);
    touchMove(9, 289, 211);
    mSleep(15);
    touchMove(9, 291, 211);
    mSleep(17);
    touchMove(9, 294, 211);
    mSleep(18);
    touchMove(9, 296, 211);
    mSleep(15);
    touchMove(9, 297, 211);
    mSleep(18);
    touchMove(9, 298, 211);
    mSleep(1968);
    touchUp(9, 297, 212);
    mSleep(350);

    touchDown(8, 255, 1035);
    mSleep(81);
    touchUp(8, 255, 1035);
    mSleep(17);

    touchDown(9, 252, 201);
    mSleep(151);
    touchMove(9, 259, 212);
    mSleep(15);
    touchMove(9, 259, 215);
    mSleep(17);
    touchMove(9, 259, 217);
    mSleep(19);
    touchMove(9, 260, 219);
    mSleep(14);
    touchMove(9, 262, 222);
    mSleep(17);
    touchMove(9, 263, 223);
    mSleep(17);
    touchMove(9, 264, 225);
    mSleep(19);
    touchMove(9, 265, 226);
    mSleep(16);
    touchMove(9, 266, 227);
    mSleep(19);
    touchMove(9, 267, 229);
    mSleep(13);
    touchMove(9, 268, 230);
    mSleep(22);
    touchMove(9, 268, 231);
    mSleep(11);
    touchMove(9, 268, 232);
    mSleep(89);
    touchMove(9, 269, 232);
    mSleep(46);
    touchMove(9, 269, 233);
    mSleep(54);
    touchMove(9, 269, 234);
    mSleep(279);
    touchUp(9, 265, 238);
    mSleep(21);

    touchDown(2, 200, 188);
    mSleep(163);
    touchMove(2, 188, 195);
    mSleep(18);
    touchMove(2, 186, 197);
    mSleep(15);
    touchMove(2, 184, 198);
    mSleep(20);
    touchMove(2, 183, 200);
    mSleep(16);
    touchMove(2, 182, 201);
    mSleep(17);
    touchMove(2, 180, 202);
    mSleep(14);
    touchMove(2, 179, 203);
    mSleep(21);
    touchMove(2, 178, 205);
    mSleep(12);
    touchMove(2, 177, 206);
    mSleep(22);
    touchMove(2, 176, 207);
    mSleep(12);
    touchMove(2, 175, 209);
    mSleep(22);
    touchMove(2, 174, 209);
    mSleep(12);
    touchMove(2, 172, 210);
    mSleep(21);
    touchMove(2, 171, 211);
    mSleep(12);
    touchMove(2, 170, 211);
    mSleep(22);
    touchMove(2, 169, 211);
    mSleep(12);
    touchMove(2, 168, 211);
    mSleep(16);
    touchMove(2, 167, 211);
    mSleep(18);
    touchMove(2, 167, 212);
    mSleep(22);
    touchMove(2, 166, 212);
    mSleep(11);
    touchMove(2, 165, 212);
    mSleep(22);
    touchMove(2, 164, 212);
    mSleep(12);
    touchMove(2, 164, 213);
    mSleep(20);
    touchMove(2, 163, 213);
    mSleep(80);
    touchMove(2, 162, 214);
    mSleep(99);
    touchMove(2, 161, 215);
    mSleep(950);
    touchMove(2, 161, 216);
    mSleep(168);
    touchUp(2, 161, 216);
    mSleep(20);

    touchDown(9, 233, 217);
    mSleep(198);
    touchMove(9, 245, 226);
    mSleep(18);
    touchMove(9, 246, 227);
    mSleep(15);
    touchMove(9, 247, 228);
    mSleep(17);
    touchMove(9, 248, 228);
    mSleep(17);
    touchMove(9, 250, 229);
    mSleep(16);
    touchMove(9, 253, 230);
    mSleep(17);
    touchMove(9, 254, 231);
    mSleep(17);
    touchMove(9, 255, 232);
    mSleep(33);
    touchMove(9, 256, 232);
    mSleep(17);
    touchMove(9, 256, 233);
    mSleep(16);
    touchMove(9, 257, 233);
    mSleep(17);
    touchMove(9, 257, 234);
    mSleep(117);
    touchMove(9, 258, 234);
    mSleep(33);
    touchMove(9, 258, 235);
    mSleep(217);
    touchMove(9, 258, 236);
    mSleep(218);
    touchMove(9, 259, 236);
    mSleep(32);
    touchMove(9, 260, 236);
    mSleep(17);
    touchMove(9, 260, 237);
    mSleep(185);
    touchMove(9, 260, 238);
    mSleep(465);
    touchMove(9, 261, 238);
    mSleep(50);
    touchMove(9, 262, 238);
    mSleep(33);
    touchMove(9, 263, 238);
    mSleep(33);
    touchMove(9, 264, 238);
    mSleep(583);
    touchMove(9, 265, 238);
    mSleep(252);
    touchUp(9, 263, 238);
    mSleep(516);

    touchDown(8, 266, 1045);
    mSleep(68);
    touchUp(8, 266, 1045);
    mSleep(20);

    touchDown(9, 259, 242);
    mSleep(131);
    touchMove(9, 270, 245);
    mSleep(16);
    touchMove(9, 274, 245);
    mSleep(16);
    touchMove(9, 278, 245);
    mSleep(17);
    touchMove(9, 280, 245);
    mSleep(17);
    touchMove(9, 283, 245);
    mSleep(16);
    touchMove(9, 285, 245);
    mSleep(17);
    touchMove(9, 287, 245);
    mSleep(16);
    touchMove(9, 288, 245);
    mSleep(17);
    touchMove(9, 289, 245);
    mSleep(16);
    touchMove(9, 290, 245);
    mSleep(17);
    touchMove(9, 291, 246);
    mSleep(16);
    touchMove(9, 293, 246);
    mSleep(17);
    touchMove(9, 294, 246);
    mSleep(17);
    touchMove(9, 295, 246);
    mSleep(50);
    touchMove(9, 295, 247);
    mSleep(250);
    touchMove(9, 295, 248);
    mSleep(18);
    touchMove(9, 295, 249);
    mSleep(15);
    touchMove(9, 295, 250);
    mSleep(17);
    touchMove(9, 295, 251);
    mSleep(18);
    touchMove(9, 295, 252);
    mSleep(17);
    touchMove(9, 295, 253);
    mSleep(16);
    touchMove(9, 295, 254);
    mSleep(16);
    touchMove(9, 295, 255);
    mSleep(20);
    touchMove(9, 295, 256);
    mSleep(14);
    touchMove(9, 293, 259);
    mSleep(20);
    touchMove(9, 292, 260);
    mSleep(12);
    touchMove(9, 292, 263);
    mSleep(19);
    touchMove(9, 291, 264);
    mSleep(15);
    touchMove(9, 291, 266);
    mSleep(17);
    touchMove(9, 291, 269);
    mSleep(17);
    touchMove(9, 291, 272);
    mSleep(17);
    touchMove(9, 291, 273);
    mSleep(15);
    touchMove(9, 290, 274);
    mSleep(51);
    touchMove(9, 290, 277);
    mSleep(15);
    touchMove(9, 290, 279);
    mSleep(19);
    touchMove(9, 290, 281);
    mSleep(15);
    touchMove(9, 290, 282);
    mSleep(18);
    touchMove(9, 290, 284);
    mSleep(16);
    touchMove(9, 290, 285);
    mSleep(17);
    touchMove(9, 290, 286);
    mSleep(15);
    touchMove(9, 290, 287);
    mSleep(17);
    touchMove(9, 290, 288);
    mSleep(16);
    touchMove(9, 290, 290);
    mSleep(33);
    touchMove(9, 290, 291);
    mSleep(120);
    touchMove(9, 290, 292);
    mSleep(399);
    touchUp(9, 288, 293);
    mSleep(19);

    touchDown(9, 237, 249);
    mSleep(201);
    touchMove(9, 248, 256);
    mSleep(14);
    touchMove(9, 252, 256);
    mSleep(16);
    touchMove(9, 255, 256);
    mSleep(17);
    touchMove(9, 257, 256);
    mSleep(15);
    touchMove(9, 259, 256);
    mSleep(17);
    touchMove(9, 261, 257);
    mSleep(17);
    touchMove(9, 263, 258);
    mSleep(17);
    touchMove(9, 266, 259);
    mSleep(16);
    touchMove(9, 268, 260);
    mSleep(17);
    touchMove(9, 269, 261);
    mSleep(18);
    touchMove(9, 271, 261);
    mSleep(16);
    touchMove(9, 272, 262);
    mSleep(19);
    touchMove(9, 274, 263);
    mSleep(15);
    touchMove(9, 275, 264);
    mSleep(16);
    touchMove(9, 276, 264);
    mSleep(36);
    touchMove(9, 277, 264);
    mSleep(16);
    touchMove(9, 278, 264);
    mSleep(49);
    touchMove(9, 279, 264);
    mSleep(15);
    touchMove(9, 280, 265);
    mSleep(33);
    touchMove(9, 281, 265);
    mSleep(18);
    touchMove(9, 281, 266);
    mSleep(34);
    touchMove(9, 282, 266);
    mSleep(165);
    touchMove(9, 282, 267);
    mSleep(102);
    touchMove(9, 282, 268);
    mSleep(15);
    touchMove(9, 282, 269);
    mSleep(18);
    touchMove(9, 282, 270);
    mSleep(16);
    touchMove(9, 282, 272);
    mSleep(17);
    touchMove(9, 282, 273);
    mSleep(15);
    touchMove(9, 282, 274);
    mSleep(17);
    touchMove(9, 282, 275);
    mSleep(17);
    touchMove(9, 282, 276);
    mSleep(17);
    touchMove(9, 282, 277);
    mSleep(16);
    touchMove(9, 282, 278);
    mSleep(20);
    touchMove(9, 282, 279);
    mSleep(32);
    touchMove(9, 282, 280);
    mSleep(67);
    touchMove(9, 282, 281);
    mSleep(34);
    touchMove(9, 282, 282);
    mSleep(65);
    touchMove(9, 282, 283);
    mSleep(101);
    touchMove(9, 282, 284);
    mSleep(33);
    touchMove(9, 283, 284);
    mSleep(34);
    touchMove(9, 284, 284);
    mSleep(15);
    touchMove(9, 284, 285);
    mSleep(50);
    touchMove(9, 284, 286);
    mSleep(16);
    touchMove(9, 285, 286);
    mSleep(34);
    touchMove(9, 286, 287);
    mSleep(899);
    touchMove(9, 286, 288);
    mSleep(154);
    touchUp(9, 287, 288);
    mSleep(866);

    touchDown(9, 283, 279);
    mSleep(267);
    touchMove(9, 294, 291);
    mSleep(33);
    touchMove(9, 294, 292);
    mSleep(15);
    touchMove(9, 295, 293);
    mSleep(19);
    touchMove(9, 296, 294);
    mSleep(14);
    touchMove(9, 297, 294);
    mSleep(20);
    touchMove(9, 297, 295);
    mSleep(15);
    touchMove(9, 297, 296);
    mSleep(98);
    touchMove(9, 298, 297);
    mSleep(335);
    touchUp(9, 298, 295);
    mSleep(583);

    touchDown(8, 264, 1032);
    mSleep(100);
    touchUp(8, 264, 1032);
    mSleep(1019);

    touchDown(8, 258, 1032);
    mSleep(83);
    touchUp(8, 258, 1032);
    mSleep(616);

    touchDown(3, 308, 196);
    mSleep(115);
    touchMove(3, 316, 184);
    mSleep(16);
    touchMove(3, 319, 184);
    mSleep(17);
    touchMove(3, 321, 183);
    mSleep(18);
    touchMove(3, 325, 181);
    mSleep(15);
    touchMove(3, 328, 180);
    mSleep(16);
    touchMove(3, 330, 178);
    mSleep(53);
    touchMove(3, 334, 173);
    mSleep(14);
    touchMove(3, 336, 171);
    mSleep(17);
    touchMove(3, 339, 168);
    mSleep(17);
    touchMove(3, 341, 167);
    mSleep(17);
    touchMove(3, 342, 165);
    mSleep(16);
    touchMove(3, 343, 164);
    mSleep(17);
    touchMove(3, 345, 163);
    mSleep(17);
    touchMove(3, 347, 162);
    mSleep(17);
    touchMove(3, 348, 162);
    mSleep(16);
    touchMove(3, 349, 162);
    mSleep(17);
    touchMove(3, 350, 161);
    mSleep(17);
    touchMove(3, 351, 160);
    mSleep(17);
    touchMove(3, 352, 160);
    mSleep(50);
    touchMove(3, 353, 159);
    mSleep(33);
    touchMove(3, 354, 159);
    mSleep(17);
    touchMove(3, 355, 159);
    mSleep(17);
    touchMove(3, 356, 159);
    mSleep(18);
    touchMove(3, 357, 159);
    mSleep(15);
    touchMove(3, 358, 159);
    mSleep(17);
    touchMove(3, 359, 159);
    mSleep(17);
    touchMove(3, 360, 159);
    mSleep(17);
    touchMove(3, 361, 159);
    mSleep(67);
    touchMove(3, 362, 159);
    mSleep(16);
    touchMove(3, 362, 160);
    mSleep(134);
    touchMove(3, 362, 161);
    mSleep(283);
    touchMove(3, 362, 162);
    mSleep(17);
    touchMove(3, 363, 162);
    mSleep(67);
    touchMove(3, 363, 163);
    mSleep(34);
    touchMove(3, 364, 163);
    mSleep(50);
    touchMove(3, 364, 164);
    mSleep(183);
    touchMove(3, 365, 165);
    mSleep(33);
    touchMove(3, 365, 166);
    mSleep(85);
    touchMove(3, 366, 167);
    mSleep(31);
    touchMove(3, 366, 168);
    mSleep(34);
    touchMove(3, 366, 169);
    mSleep(33);
    touchMove(3, 367, 169);
    mSleep(50);
    touchUp(3, 374, 172);
    mSleep(569);

    touchDown(7, 303, 211);
    mSleep(114);
    touchMove(7, 319, 222);
    mSleep(17);
    touchMove(7, 323, 223);
    mSleep(17);
    touchMove(7, 325, 225);
    mSleep(17);
    touchMove(7, 327, 228);
    mSleep(16);
    touchMove(7, 328, 231);
    mSleep(17);
    touchMove(7, 330, 232);
    mSleep(17);
    touchMove(7, 331, 233);
    mSleep(17);
    touchMove(7, 333, 233);
    mSleep(16);
    touchMove(7, 334, 234);
    mSleep(17);
    touchMove(7, 335, 235);
    mSleep(17);
    touchMove(7, 336, 235);
    mSleep(102);
    touchMove(7, 337, 235);
    mSleep(15);
    touchMove(7, 337, 236);
    mSleep(17);
    touchMove(7, 338, 236);
    mSleep(15);
    touchMove(7, 339, 236);
    mSleep(17);
    touchMove(7, 339, 237);
    mSleep(17);
    touchMove(7, 340, 237);
    mSleep(67);
    touchMove(7, 340, 238);
    mSleep(783);
    touchMove(7, 341, 238);
    mSleep(1150);
    touchUp(7, 345, 243);
    mSleep(19);

    touchDown(7, 292, 224);
    mSleep(248);
    touchMove(7, 304, 233);
    mSleep(17);
    touchMove(7, 305, 234);
    mSleep(17);
    touchMove(7, 307, 236);
    mSleep(17);
    touchMove(7, 310, 237);
    mSleep(17);
    touchMove(7, 312, 239);
    mSleep(18);
    touchMove(7, 315, 240);
    mSleep(16);
    touchMove(7, 316, 242);
    mSleep(16);
    touchMove(7, 317, 243);
    mSleep(17);
    touchMove(7, 318, 245);
    mSleep(16);
    touchMove(7, 320, 246);
    mSleep(17);
    touchMove(7, 321, 247);
    mSleep(17);
    touchMove(7, 322, 248);
    mSleep(17);
    touchMove(7, 323, 249);
    mSleep(16);
    touchMove(7, 324, 250);
    mSleep(16);
    touchMove(7, 325, 251);
    mSleep(17);
    touchMove(7, 325, 252);
    mSleep(17);
    touchMove(7, 326, 252);
    mSleep(16);
    touchMove(7, 326, 253);
    mSleep(50);
    touchMove(7, 327, 253);
    mSleep(33);
    touchMove(7, 327, 254);
    mSleep(50);
    touchMove(7, 327, 255);
    mSleep(17);
    touchMove(7, 327, 256);
    mSleep(50);
    touchMove(7, 328, 256);
    mSleep(433);
    touchMove(7, 328, 257);
    mSleep(17);
    touchMove(7, 329, 257);
    mSleep(417);
    touchUp(7, 330, 256);
    mSleep(134);

    touchDown(8, 248, 1032);
    mSleep(66);
    touchUp(8, 248, 1032);
    mSleep(468);

    touchDown(7, 286, 244);
    mSleep(148);
    touchMove(7, 295, 248);
    mSleep(17);
    touchMove(7, 297, 250);
    mSleep(16);
    touchMove(7, 299, 251);
    mSleep(17);
    touchMove(7, 301, 252);
    mSleep(17);
    touchMove(7, 302, 253);
    mSleep(16);
    touchMove(7, 304, 254);
    mSleep(18);
    touchMove(7, 305, 255);
    mSleep(16);
    touchMove(7, 306, 256);
    mSleep(17);
    touchMove(7, 308, 257);
    mSleep(17);
    touchMove(7, 309, 257);
    mSleep(16);
    touchMove(7, 310, 258);
    mSleep(17);
    touchMove(7, 311, 258);
    mSleep(16);
    touchMove(7, 312, 258);
    mSleep(18);
    touchMove(7, 312, 259);
    mSleep(15);
    touchMove(7, 313, 259);
    mSleep(17);
    touchMove(7, 315, 260);
    mSleep(33);
    touchMove(7, 316, 260);
    mSleep(17);
    touchMove(7, 317, 260);
    mSleep(17);
    touchMove(7, 317, 261);
    mSleep(33);
    touchMove(7, 318, 261);
    mSleep(67);
    touchMove(7, 319, 261);
    mSleep(33);
    touchMove(7, 319, 262);
    mSleep(49);
    touchMove(7, 320, 262);
    mSleep(33);
    touchMove(7, 320, 263);
    mSleep(33);
    touchMove(7, 321, 263);
    mSleep(33);
    touchMove(7, 321, 264);
    mSleep(50);
    touchMove(7, 322, 264);
    mSleep(50);
    touchMove(7, 322, 265);
    mSleep(52);
    touchMove(7, 323, 266);
    mSleep(131);
    touchMove(7, 324, 266);
    mSleep(67);
    touchMove(7, 324, 267);
    mSleep(17);
    touchMove(7, 325, 267);
    mSleep(117);
    touchMove(7, 326, 267);
    mSleep(83);
    touchMove(7, 326, 268);
    mSleep(397);
    touchMove(7, 326, 269);
    mSleep(40);
    touchMove(7, 326, 270);
    mSleep(597);
    touchMove(7, 326, 272);
    mSleep(16);
    touchMove(7, 327, 272);
    mSleep(370);
    touchUp(7, 328, 273);

    init(1)

end
-- 起点跑到刷图门口
function qiDianRunToDoor()
    debugB("起点跑到刷图门口")
    init("0", 0);
    -- luaExitIfCall(true);
    mSleep(1779);

    touchDown(4, 168, 241);
    mSleep(365);
    touchMove(4, 167, 252);
    mSleep(18);
    touchMove(4, 167, 253);
    mSleep(14);
    touchMove(4, 167, 254);
    mSleep(67);
    touchMove(4, 167, 255);
    mSleep(20);
    touchMove(4, 167, 256);
    mSleep(32);
    touchMove(4, 167, 257);
    mSleep(33);
    touchMove(4, 167, 258);
    mSleep(15);
    touchMove(4, 167, 259);
    mSleep(35);
    touchMove(4, 167, 260);
    mSleep(66);
    touchMove(4, 167, 261);
    mSleep(87);
    touchMove(4, 167, 262);
    mSleep(35);
    touchMove(4, 167, 263);
    mSleep(46);
    touchMove(4, 167, 264);
    mSleep(32);
    touchMove(4, 167, 265);
    mSleep(33);
    touchMove(4, 167, 266);
    mSleep(17);
    touchMove(4, 167, 267);
    mSleep(37);
    touchMove(4, 167, 268);
    mSleep(32);
    touchMove(4, 167, 269);
    mSleep(15);
    touchMove(4, 168, 270);
    mSleep(16);
    touchMove(4, 168, 272);
    mSleep(17);
    touchMove(4, 168, 273);
    mSleep(18);
    touchMove(4, 169, 274);
    mSleep(16);
    touchMove(4, 170, 275);
    mSleep(18);
    touchMove(4, 170, 276);
    mSleep(67);
    touchMove(4, 171, 277);
    mSleep(14);
    touchMove(4, 171, 278);
    mSleep(33);
    touchMove(4, 172, 278);
    mSleep(17);
    touchMove(4, 172, 279);
    mSleep(34);
    touchMove(4, 173, 280);
    mSleep(49);
    touchMove(4, 174, 280);
    mSleep(19);
    touchMove(4, 175, 280);
    mSleep(34);
    touchMove(4, 176, 281);
    mSleep(15);
    touchMove(4, 177, 281);
    mSleep(33);
    touchMove(4, 178, 281);
    mSleep(16);
    touchMove(4, 179, 282);
    mSleep(50);
    touchMove(4, 180, 282);
    mSleep(53);
    touchMove(4, 181, 283);
    mSleep(34);
    touchMove(4, 181, 284);
    mSleep(79);
    touchMove(4, 181, 285);
    mSleep(34);
    touchMove(4, 181, 286);
    mSleep(19);
    touchMove(4, 181, 287);
    mSleep(51);
    touchMove(4, 181, 288);
    mSleep(80);
    touchMove(4, 181, 289);
    mSleep(150);
    touchMove(4, 181, 290);
    mSleep(51);
    touchMove(4, 181, 291);
    mSleep(99);
    touchMove(4, 181, 292);
    mSleep(33);
    touchMove(4, 181, 293);
    mSleep(117);
    touchMove(4, 181, 294);
    mSleep(68);
    touchMove(4, 181, 295);
    mSleep(35);
    touchMove(4, 181, 296);
    mSleep(13);
    touchMove(4, 180, 296);
    mSleep(54);
    touchMove(4, 180, 297);
    mSleep(31);
    touchMove(4, 179, 297);
    mSleep(16);
    touchMove(4, 179, 298);
    mSleep(17);
    touchMove(4, 178, 298);
    mSleep(67);
    touchMove(4, 178, 299);
    mSleep(383);
    touchMove(4, 178, 300);
    mSleep(535);
    touchMove(4, 179, 300);
    mSleep(68);
    touchMove(4, 180, 300);
    mSleep(31);
    touchMove(4, 181, 300);
    mSleep(155);
    touchMove(4, 182, 300);
    mSleep(112);
    touchMove(4, 183, 300);
    mSleep(67);
    touchMove(4, 184, 300);
    mSleep(34);
    touchMove(4, 185, 300);
    mSleep(134);
    touchMove(4, 186, 300);
    mSleep(654);
    touchMove(4, 186, 301);
    mSleep(245);
    touchMove(4, 185, 301);
    mSleep(16);
    touchMove(4, 184, 301);
    mSleep(17);
    touchMove(4, 182, 302);
    mSleep(21);
    touchMove(4, 181, 302);
    mSleep(28);
    touchMove(4, 180, 303);
    mSleep(17);
    touchMove(4, 179, 303);
    mSleep(19);
    touchMove(4, 178, 303);
    mSleep(31);
    touchMove(4, 177, 303);
    mSleep(33);
    touchMove(4, 176, 304);
    mSleep(16);
    touchMove(4, 174, 304);
    mSleep(16);
    touchMove(4, 173, 304);
    mSleep(17);
    touchMove(4, 172, 305);
    mSleep(20);
    touchMove(4, 171, 305);
    mSleep(13);
    touchMove(4, 170, 305);
    mSleep(22);
    touchMove(4, 169, 305);
    mSleep(11);
    touchMove(4, 168, 305);
    mSleep(33);
    touchMove(4, 167, 306);
    mSleep(19);
    touchMove(4, 165, 306);
    mSleep(31);
    touchMove(4, 164, 306);
    mSleep(18);
    touchMove(4, 163, 306);
    mSleep(16);
    touchMove(4, 163, 307);
    mSleep(33);
    touchMove(4, 162, 307);
    mSleep(233);
    touchMove(4, 163, 307);
    mSleep(17);
    touchMove(4, 164, 307);
    mSleep(17);
    touchMove(4, 165, 307);
    mSleep(17);
    touchMove(4, 167, 307);
    mSleep(16);
    touchMove(4, 168, 307);
    mSleep(17);
    touchMove(4, 170, 307);
    mSleep(17);
    touchMove(4, 171, 307);
    mSleep(17);
    touchMove(4, 172, 307);
    mSleep(18);
    touchMove(4, 174, 307);
    mSleep(16);
    touchMove(4, 175, 307);
    mSleep(17);
    touchMove(4, 176, 307);
    mSleep(17);
    touchMove(4, 177, 307);
    mSleep(17);
    touchMove(4, 179, 307);
    mSleep(17);
    touchMove(4, 180, 307);
    mSleep(16);
    touchMove(4, 183, 307);
    mSleep(18);
    touchMove(4, 185, 307);
    mSleep(15);
    touchMove(4, 188, 307);
    mSleep(18);
    touchMove(4, 190, 307);
    mSleep(16);
    touchMove(4, 191, 307);
    mSleep(17);
    touchMove(4, 192, 307);
    mSleep(17);
    touchMove(4, 193, 307);
    mSleep(51);
    touchMove(4, 194, 307);
    mSleep(15);
    touchMove(4, 195, 307);
    mSleep(17);
    touchMove(4, 196, 307);
    mSleep(185);
    touchMove(4, 196, 306);
    mSleep(50);
    touchMove(4, 197, 306);
    mSleep(333);
    touchMove(4, 198, 306);
    mSleep(50);
    touchMove(4, 199, 306);
    mSleep(33);
    touchMove(4, 200, 306);
    mSleep(51);
    touchMove(4, 201, 306);
    mSleep(34);
    touchMove(4, 201, 305);
    mSleep(17);
    touchMove(4, 202, 305);
    mSleep(16);
    touchMove(4, 203, 305);
    mSleep(33);
    touchMove(4, 204, 305);
    mSleep(16);
    touchMove(4, 205, 304);
    mSleep(19);
    touchMove(4, 206, 303);
    mSleep(16);
    touchMove(4, 207, 303);
    mSleep(16);
    touchMove(4, 208, 303);
    mSleep(16);
    touchMove(4, 209, 302);
    mSleep(33);
    touchMove(4, 210, 301);
    mSleep(17);
    touchMove(4, 211, 301);
    mSleep(67);
    touchMove(4, 212, 301);
    mSleep(16);
    touchMove(4, 212, 300);
    mSleep(50);
    touchMove(4, 213, 300);
    mSleep(516);
    touchMove(4, 214, 300);
    mSleep(17);
    touchMove(4, 215, 299);
    mSleep(16);
    touchMove(4, 216, 299);
    mSleep(17);
    touchMove(4, 217, 298);
    mSleep(51);
    touchMove(4, 218, 297);
    mSleep(15);
    touchMove(4, 219, 297);
    mSleep(18);
    touchMove(4, 220, 297);
    mSleep(15);
    touchMove(4, 221, 296);
    mSleep(17);
    touchMove(4, 222, 296);
    mSleep(16);
    touchMove(4, 223, 294);
    mSleep(18);
    touchMove(4, 224, 293);
    mSleep(15);
    touchMove(4, 227, 292);
    mSleep(17);
    touchMove(4, 229, 290);
    mSleep(20);
    touchMove(4, 230, 289);
    mSleep(13);
    touchMove(4, 232, 289);
    mSleep(16);
    touchMove(4, 233, 289);
    mSleep(433);
    touchMove(4, 232, 289);
    mSleep(17);
    touchMove(4, 231, 290);
    mSleep(33);
    touchMove(4, 231, 291);
    mSleep(100);
    touchMove(4, 231, 292);
    mSleep(33);
    touchMove(4, 230, 292);
    mSleep(34);
    touchMove(4, 229, 293);
    mSleep(49);
    touchMove(4, 228, 294);
    mSleep(17);
    touchMove(4, 227, 295);
    mSleep(17);
    touchMove(4, 226, 295);
    mSleep(16);
    touchMove(4, 226, 296);
    mSleep(18);
    touchMove(4, 225, 296);
    mSleep(49);
    touchMove(4, 225, 297);
    mSleep(101);
    touchMove(4, 224, 297);
    mSleep(48);
    touchMove(4, 223, 298);
    mSleep(17);
    touchMove(4, 222, 298);
    mSleep(17);
    touchMove(4, 221, 299);
    mSleep(83);
    touchMove(4, 220, 299);
    mSleep(100);
    touchMove(4, 220, 300);
    mSleep(50);
    touchMove(4, 219, 301);
    mSleep(17);
    touchMove(4, 217, 301);
    mSleep(16);
    touchMove(4, 217, 302);
    mSleep(54);
    touchMove(4, 216, 303);
    mSleep(15);
    touchMove(4, 215, 303);
    mSleep(16);
    touchMove(4, 214, 304);
    mSleep(16);
    touchMove(4, 213, 304);
    mSleep(33);
    touchMove(4, 212, 304);
    mSleep(52);
    touchMove(4, 211, 305);
    mSleep(182);
    touchMove(4, 211, 306);
    mSleep(17);
    touchMove(4, 210, 306);
    mSleep(16);
    touchMove(4, 209, 307);
    mSleep(18);
    touchMove(4, 209, 308);
    mSleep(16);
    touchMove(4, 207, 308);
    mSleep(17);
    touchMove(4, 206, 309);
    mSleep(16);
    touchMove(4, 205, 310);
    mSleep(17);
    touchMove(4, 204, 310);
    mSleep(16);
    touchMove(4, 203, 311);
    mSleep(17);
    touchMove(4, 201, 312);
    mSleep(16);
    touchMove(4, 199, 313);
    mSleep(17);
    touchMove(4, 198, 314);
    mSleep(17);
    touchMove(4, 197, 314);
    mSleep(51);
    touchMove(4, 196, 314);
    mSleep(289);
    touchMove(4, 197, 314);
    mSleep(11);
    touchMove(4, 199, 314);
    mSleep(18);
    touchMove(4, 201, 312);
    mSleep(18);
    touchMove(4, 204, 310);
    mSleep(13);
    touchMove(4, 206, 309);
    mSleep(17);
    touchMove(4, 207, 308);
    mSleep(18);
    touchMove(4, 208, 307);
    mSleep(16);
    touchMove(4, 209, 307);
    mSleep(17);
    touchMove(4, 210, 307);
    mSleep(17);
    touchMove(4, 211, 307);
    mSleep(868);
    touchMove(4, 211, 308);
    mSleep(33);
    touchMove(4, 211, 309);
    mSleep(16);
    touchMove(4, 211, 310);
    mSleep(18);
    touchMove(4, 210, 310);
    mSleep(17);
    touchMove(4, 210, 311);
    mSleep(18);
    touchMove(4, 209, 311);
    mSleep(31);
    touchMove(4, 208, 311);
    mSleep(50);
    touchMove(4, 208, 312);
    mSleep(1250);
    touchMove(4, 208, 313);
    mSleep(50);
    touchMove(4, 208, 314);
    mSleep(50);
    touchMove(4, 207, 314);
    mSleep(17);
    touchMove(4, 207, 315);
    mSleep(50);
    touchMove(4, 207, 316);
    mSleep(34);
    touchMove(4, 206, 316);
    mSleep(33);
    touchMove(4, 205, 316);
    mSleep(33);
    touchMove(4, 205, 317);
    mSleep(1503);
    touchMove(4, 206, 317);
    mSleep(14);
    touchMove(4, 207, 317);
    mSleep(17);
    touchMove(4, 208, 317);
    mSleep(17);
    touchMove(4, 209, 317);
    mSleep(19);
    touchMove(4, 210, 316);
    mSleep(15);
    touchMove(4, 211, 315);
    mSleep(19);
    touchMove(4, 212, 315);
    mSleep(14);
    touchMove(4, 213, 314);
    mSleep(17);
    touchMove(4, 214, 314);
    mSleep(33);
    touchMove(4, 215, 313);
    mSleep(69);
    touchMove(4, 216, 313);
    mSleep(115);
    touchMove(4, 217, 313);
    mSleep(300);
    touchMove(4, 217, 314);
    mSleep(16);
    touchMove(4, 216, 315);
    mSleep(17);
    touchMove(4, 214, 315);
    mSleep(16);
    touchMove(4, 213, 316);
    mSleep(17);
    touchMove(4, 212, 317);
    mSleep(117);
    touchMove(4, 212, 318);
    mSleep(651);
    touchMove(4, 211, 318);
    mSleep(416);
    touchMove(4, 210, 318);
    mSleep(67);
    touchMove(4, 209, 318);
    mSleep(33);
    touchMove(4, 208, 317);
    mSleep(19);
    touchMove(4, 208, 316);
    mSleep(16);
    touchMove(4, 207, 315);
    mSleep(17);
    touchMove(4, 206, 313);
    mSleep(16);
    touchMove(4, 205, 312);
    mSleep(16);
    touchMove(4, 204, 310);
    mSleep(17);
    touchMove(4, 203, 310);
    mSleep(16);
    touchMove(4, 202, 308);
    mSleep(17);
    touchMove(4, 200, 306);
    mSleep(18);
    touchMove(4, 198, 304);
    mSleep(15);
    touchMove(4, 196, 301);
    mSleep(18);
    touchMove(4, 193, 298);
    mSleep(16);
    touchMove(4, 191, 293);
    mSleep(19);
    touchMove(4, 189, 289);
    mSleep(14);
    touchMove(4, 185, 284);
    mSleep(17);
    touchMove(4, 183, 280);
    mSleep(16);
    touchMove(4, 182, 278);
    mSleep(17);
    touchMove(4, 180, 275);
    mSleep(17);
    touchMove(4, 178, 272);
    mSleep(16);
    touchMove(4, 176, 267);
    mSleep(17);
    touchMove(4, 174, 264);
    mSleep(17);
    touchMove(4, 173, 260);
    mSleep(15);
    touchMove(4, 171, 257);
    mSleep(53);
    touchMove(4, 168, 249);
    mSleep(14);
    touchMove(4, 167, 245);
    mSleep(19);
    touchMove(4, 166, 241);
    mSleep(15);
    touchMove(4, 165, 237);
    mSleep(17);
    touchMove(4, 164, 234);
    mSleep(17);
    touchMove(4, 163, 231);
    mSleep(17);
    touchMove(4, 162, 228);
    mSleep(16);
    touchMove(4, 161, 226);
    mSleep(17);
    touchMove(4, 161, 224);
    mSleep(18);
    touchMove(4, 160, 221);
    mSleep(16);
    touchMove(4, 159, 219);
    mSleep(16);
    touchMove(4, 159, 216);
    mSleep(17);
    touchMove(4, 158, 213);
    mSleep(17);
    touchMove(4, 157, 210);
    mSleep(16);
    touchMove(4, 157, 208);
    mSleep(17);
    touchMove(4, 157, 206);
    mSleep(17);
    touchMove(4, 157, 205);
    mSleep(16);
    touchMove(4, 156, 203);
    mSleep(17);
    touchMove(4, 156, 202);
    mSleep(16);
    touchMove(4, 156, 201);
    mSleep(17);
    touchMove(4, 156, 200);
    mSleep(16);
    touchMove(4, 155, 199);
    mSleep(17);
    touchMove(4, 155, 198);
    mSleep(17);
    touchMove(4, 155, 197);
    mSleep(567);
    touchMove(4, 155, 198);
    mSleep(16);
    touchMove(4, 155, 200);
    mSleep(16);
    touchMove(4, 155, 201);
    mSleep(17);
    touchMove(4, 156, 202);
    mSleep(17);
    touchMove(4, 160, 202);
    mSleep(30);
    touchUp(4, 164, 202);
    mSleep(639);

    touchDown(4, 145, 183);
    mSleep(316);
    touchUp(4, 145, 183);

    init(1)

end

-- 副本内
function inside2()
    if isColor(960, 61, 0xffffff, 95) and isColor(89, 591, 0xdfdce2, 95) then
        tap1(1045, 50)
        if isColor(926, 511, 0xbbb9bb, 95) then
            tap1(1045, 50)
            mSleep(1000)
            return true
        else
            tap1(1045, 50)
            mSleep(1000)
        end
    end
end
-- 副本外
function outside2()
    -- if isColor(750,50,0xddf0fe,95) and isColor(961,61,0xffffff,95) and isColor(918,541,0xb5a599,90) then
    -- -- if isColor(749,48,0xddf0fe,95) and isColor(959,62,0xffffff,95) and isColor(918,540,0xa19897,95) then
    --     return true
    -- end
    if isColor(960, 61, 0xffffff, 95) and isColor(89, 591, 0xdfdce2, 95) then
        tap1(1045, 50)
        if isColor(907, 509, 0xd9d9dd, 95) then
            tap1(1045, 50)
            mSleep(1000)
            return true
        else
            tap1(1045, 50)
            mSleep(1000)
        end
    end
end

-- 检查红点
function checkRed2()
    -- if isOutside() and muBiaoA ~= "采集" then
    --     if nowTime - timeXuanDanRed >= 60 * 10 and isColor(794, 13, 0xc04131, 95) then
    --         debugA("选单--红点")
    --         tap1(777, 31, 0xffffff)
    --         timeXuanDanRed = nowTime
    --     end
    -- end
    if (isColor(483, 238, 0xbf7109, 95) and isColor(520, 236, 0xcd741f, 95) and
        isColor(519, 221, 0xc95e0d, 95)) or
        (isColor(510, 544, 0x565656, 95) and isColor(597, 547, 0xf0d988, 95) and
            isColor(1076, 591, 0xfee31f, 95)) or
        (isColor(1070, 117, 0xa396c9, 95) and isColor(903, 51, 0xa48fd8, 95) and
            isColor(1061, 74, 0x9489bf, 95)) or
        (isColor(928, 47, 0x7a5b3f, 95) and isColor(1070, 112, 0x32261b, 95) and
            isColor(1075, 112, 0x8b8680, 95)) or
        (isColor(895, 42, 0x816990, 95) and isColor(1063, 77, 0x2e0d48, 95) and
            isColor(1068, 77, 0x867495, 95)) or
        (isColor(938, 40, 0x636182, 95) and isColor(1063, 77, 0x3b2f43, 95) and
            isColor(1068, 77, 0x8f8894, 95)) or
        (isColor(1048, 538, 0xfe9345, 95) and isColor(1078, 531, 0x8e5838, 95) and
            isColor(1076, 501, 0x514e55, 95)) or
        (isColor(824, 27, 0x3e394e, 95) and isColor(1057, 94, 0x3c3e57, 95) and
            isColor(1062, 94, 0x90909e, 95)) then -----活动中心 内部判定
        debugB("活动中心 内部")
        if isColor(262, 195, 0xfe4712, 95) then
            debugB("灰烬矩阵--红点")
            tap1(188, 210, 0xffffff)
        elseif isColor(261, 262, 0xff4813, 95) then
            debugB("吉玛英雄献礼--红点")
            tap1(189, 284, 0xffffff)
        elseif isColor(262, 330, 0xff4a13, 95) then
            debugB("狂心魔影--红点")
            tap1(187, 348, 0xffffff)
        elseif isColor(261, 399, 0xfe4612, 95) then
            debugB("冲刺领英雄--红点")
            tap1(194, 418, 0xffffff)
        elseif isColor(261, 467, 0xfe4712, 95) then
            debugB("赛季挑战--红点")
            tap1(189, 483, 0xffffff)
        elseif isColor(261, 535, 0xfe4712, 95) then
            debugB("登录送背饰--红点")
            tap1(189, 553, 0xffffff)
        else
            moveTo(189, 552, 187, 146,
                   {["step"] = 10, ["ms"] = 50, ["stop"] = 1})
            mSleep(5000)
            if isColor(262, 112, 0xfe4912, 95) then
                debugB("狂心魔影--红点")
                tap1(187, 130, 0xffffff)
            elseif isColor(262, 179, 0xff4a13, 95) then
                debugB("冲刺领英雄--红点")
                tap1(194, 200, 0xffffff)
            elseif isColor(262, 247, 0xff4a13, 95) then
                debugB("赛季挑战--红点")
                tap1(188, 265, 0xffffff)
            elseif isColor(261, 315, 0xff4913, 95) then
                debugB("登录送背饰--红点")
                tap1(189, 553, 0xffffff)
            elseif isColor(261, 385, 0xfe4612, 95) then
                debugB("七日登录--红点")
                tap1(189, 403, 0xffffff)
            elseif isColor(261, 452, 0xff4813, 95) then
                debugB("赛季介绍--红点")
                tap1(188, 471, 0xffffff)
            elseif isColor(261, 519, 0xff4b13, 95) then
                debugB("卡里诺英雄献礼--红点")
                tap1(188, 537, 0xffffff)
            else
                -- 关闭
                tap1(36, 38, 0xffffff)
            end
        end
    end

    if isColor(84, 14, 0xb0beec, 95) and isColor(88, 17, 0x8298e1, 95) and
        isColor(837, 55, 0xffffff, 95) then -----赛季手册 内部判定
        debugB("赛季手册 奖励")
        x, y = findMultiColorInRegionFuzzy(0xff5715, "", 90, 83, 300, 945, 300)
        if x > 0 then
            debugB("找到红点")
            tap1(x, y)
        else
            debugB("未找到红点")
            tap1(35, 40)
        end
    end
    if isColor(84, 14, 0xb0beec, 95) and isColor(88, 17, 0x8298e1, 95) and
        isColor(936, 53, 0xffffff, 95) then -----赛季手册 内部判定
        debugB("赛季手册 任务")
        x, y = findMultiColorInRegionFuzzy(0xff4d13, "", 90, 223, 230, 223, 540,
                                           {orient = 1})
        if x > 0 then
            debugB("找到红点")
            tap1(x, y)
        else
            debugB("未找到红点")
            moveTo(155, 503, 155, 237,
                   {["step"] = 10, ["ms"] = 50, ["stop"] = 1})
            mSleep(5000)
            x, y = findMultiColorInRegionFuzzy(0xff4d13, "", 90, 223, 230, 223,
                                               540, {orient = 1})
            if x > 0 then
                debugB("找到红点")
                tap1(x, y)
            else
                debugB("未找到红点")
                tap1(35, 40)
            end
        end
        -- if isColor(223,252,0xff4b13,95) then
        --     debugB("每日任务--红点")
        --     tap1(156,267, 0xffffff)    
        -- elseif isColor(223,308,0xff4913,95) then
        --     debugB("第一周--红点")
        --     tap1(156,321, 0xffffff)
        -- elseif isColor(223,371,0xff4813,95) then
        --     debugB("第二周--红点")
        --     tap1(149,385, 0xffffff)
        -- elseif isColor(223,426,0xff4813,95) then
        --     debugB("第三周--红点")
        --     tap1(152,440, 0xffffff)
        -- elseif isColor(224,482,0xfe4912,95) then
        --     debugB("第四周--红点")
        --     tap1(154,494, 0xffffff)
        -- else
        --     moveTo(155,503, 155,237, { ["step"] = 10, ["ms"] = 50, ["stop"] = 1 })
        --     mSleep(5000)
        --     if isColor(262,112,0xfe4912,95) then
        --         debugB("狂心魔影--红点")
        --         tap1(187,130, 0xffffff)
        --     elseif isColor(262,179,0xff4a13,95) then
        --         debugB("冲刺领英雄--红点")
        --         tap1(194,200, 0xffffff)
        -- end

        if isColor(305, 266, 0x69ff74, 95) and isColor(959, 285, 0xff6446, 95) then
            debugB("1绿点领取")
            tap1(959, 285, 0xffffff)
        elseif isColor(310, 376, 0x62ff6c, 95) and
            isColor(977, 402, 0xff6446, 95) then
            debugB("2绿点领取")
            tap1(977, 402)
        end
    end
end

-- 在线脚本
function zhaojunlua()
    if whoAmI() ~= 4 then
        os.execute(
            "chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/zhaojun.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        toast("删除失败，失败原因：" .. msg, 1)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@6w04b66789.goho.co/"
    local temRet = ftpDownTSnet("/Lua/zhaojun.lua",
                                userPath() .. "/lua/zhaojun.lua")
    if temRet then
        toast("FTP下载成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/zhaojun.lua", luaFile,
                                      {["tstab"] = 1, ["mode"] = true})
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

-- doTarget2
function doTarget2()
    if muBiaoB == "" then
        if numHaoLV_B == "小号" then
            gaiMuBiaoNewB(1, "主线")
        elseif numHaoLV_B == "成品号" then
            gaiMuBiaoNewB(1, "主线")
        elseif numHaoLV_B == "大号" then
            debugB("大号刷目标为刷图")
            gaiMuBiaoNewB(1, "刷图")
        end
    elseif muBiaoB == "挂机" then

    elseif muBiaoB == "刷图" then
        if strZhuangTai == "原点" and outside2() == true then
            -- if outside2()==true then
            qiDianRunToDoor()
            strZhuangTai = "传送门"
            writeJson("人物状态", strZhuangTai)
        end
        if strZhuangTai == "传送门" and outside2() == true then
            tap1(746, 321) -- 传送门
            strZhuangTai = "异界选择"
            writeJson("人物状态", strZhuangTai)
        end
        if strZhuangTai == "异界选择" and isColor(148, 118, 0xe1733e, 95) and
            isColor(530, 123, 0xff6e43, 95) and isColor(759, 466, 0x443461, 95) then
            tap1(196, 486) -- 冰封寒渊
            strZhuangTai = "监视者"
            writeJson("人物状态", strZhuangTai)
            mSleep(2000)
        end
        if strZhuangTai == "监视者" and isColor(62, 142, 0x9fbadb, 95) and
            isColor(502, 636, 0x38548f, 95) and isColor(1130, 516, 0x3b5b95, 95) then
            tap1(153, 95) -- 信仰之墙
            mSleep(2000)
            tap1(903, 566)
            tap1(903, 566)
            strZhuangTai = "等待进入副本"
            writeJson("人物状态", strZhuangTai)
        end
        if strZhuangTai == "等待进入副本" and outside2() then
            doorToDoor()
            tap1(747, 316)
            strZhuangTai = "已进入副本"
            writeJson("人物状态", strZhuangTai)
        end
        if strZhuangTai == "已进入副本" and inside2() then
            callMonster()
            insideDoor()
            -- tap1(747,316)
            strZhuangTai = "副本完成"
            writeJson("人物状态", strZhuangTai)
        end

    elseif muBiaoB == "主线" then
        task_zhuXian()
    elseif muBiaoB == "采集" then
        collect()
    elseif muBiaoB == "去采集点" then
        goCollectPlace()
    end
    -- debug("目标："..muBiao)
end

-- 主线
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

-- 指引
function zhiYin()
    if numHaoLV == "小号" and muBiaoA ~= "采集" then
        x, y = findMultiColorInRegionFuzzy(0xdecfb5,
                                           "-57|-65|0xf1e5cf,198|-11|0xe2d2b9",
                                           90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在上--左" .. numUpLeft)
            tap1(x + 5, y + 30)
            numUpLeft = numUpLeft + 1
            if numUpLeft >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numUpLeft = 0
            end
        end
        x, y = findMultiColorInRegionFuzzy(0xdecfb5,
                                           "-198|-64|0xefe2ca,58|-12|0xe1d1b9",
                                           90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在上--右" .. numUpRight)
            tap1(x - 5, y + 30)
            numUpRight = numUpRight + 1
            if numUpRight >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numUpRight = 0
            end
        end

        x, y = findMultiColorInRegionFuzzy(0xdeceb5,
                                           "-58|10|0xe2d2b9,198|64|0xefe2ca",
                                           90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在下--左" .. numDownLeft)
            tap1(x + 5, y - 30)
            numDownLeft = numDownLeft + 1
            if numDownLeft >= 5 then
                screenClickNew(x, y, 0xdeceb5)
                numDownLeft = 0
            end
        end
        x, y = findMultiColorInRegionFuzzy(0xdecfb5,
                                           "58|63|0xefe2ca,-197|11|0xe1d1b9",
                                           90, 0, 0, 1135, 639)
        if x > 0 then
            debugA("指引在下--右" .. numDownRight)
            tap1(x - 5, y - 30)
            numDownRight = numDownRight + 1
            if numDownRight >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numDownRight = 0
            end
        end
        if isColor(1000, 6, 0x528ba5, 95) and isColor(1131, 52, 0x64a0bf, 95) and
            isColor(1058, 22, 0xc0c0c0, 95) then
            debugA("跳过任务")
            tap1(1058, 22)
        end
    end
end

-- 采集
function collect()
    if isInside() then
        if isColor(605, 583, 0xfcfdfe, 95) == false and
            isColor(621, 583, 0xf6fcfd, 95) == false then
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
        if isColor(502, 447, 0x31e605, 95) then -- 采集条--绿色
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

-- 去采集点
function goCollectPlace()
    if isInside() then
        tap1(1061, 95, 0x37cd12) -- 打开地图
        mSleep(1000)
        if numCollect == "采集点1" then
            tap1(714, 255, 0x3e454c) -- 采集点1
            tap1(1028, 255, 0x3f4550) -- 移动
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
        tap1(438, 384, 0x322709) -- 普通移动
        if isCollectBug == true then
            mSleep(3 * 1000)
            isCollectBug = false
        else
            mSleep(numGoCollectPlace * 1000)
        end
        gaiMuBiaoNewA(1, "采集")

    end
end

-- 战斗界面
function isWar()
    if isColor(177, 67, 0xc8c8c8, 95) and isColor(774, 31, 0xf7f7f7, 95) then
        -- debug("战斗界面")
        return true
    else
        return false
    end
end

-- 副本内
function isInside()
    if isWar() then
        if isColor(767, 142, 0xf9f9f9, 95) and isColor(769, 154, 0xf1f2f1, 95) then
            -- debug("副本内")
            return true
        end
    end
end

-- 副本外
function isOutside()
    if isWar() then
        if isColor(767, 142, 0xf9f9f9, 95) == false and
            isColor(769, 154, 0xf1f2f1, 95) == false then
            -- debug("副本外")
            return true
        end
    end
end

-- PK模式
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
    if pkMode() == "审判模式" or pkMode() == "结义模式" or pkMode() ==
        "杀戮模式" then
        tap1(40, 47) -- PK模式
        mSleep(1000)
        if isColor(25, 103, 0xa25f2f, 95) == false then
            tap1(40, 47) -- PK模式
            mSleep(1000)
        end
        tap1(130, 228, 0x6d6e75) -- 和平
        mSleep(1000)
        tap1(40, 47) -- PK模式
    end
end

-- 掉线检测
function checkDropline()
    if isColor(582, 261, 0x696969, 95) and isColor(920, 222, 0x500e04, 95) then
        for i = 1, 10, 1 do
            if isColor(582, 261, 0x696969, 95) == false and
                isColor(920, 222, 0x500e04, 95) == false then break end
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
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time ..
                      ".png")
        closeApp(appXiangMu)
        nowTime = os.time()
        timeXXX = nowTime
        -- zhuXiaoNew()
        return
    end
end

-- 定时检测
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
    if check4 ~= "测试" then doTarget3() end
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
    if isColor(240, 135, 0x3e1d19, 95) and isColor(747, 201, 0xd1b390, 95) and
        isColor(730, 211, 0xcdad88, 95) then
        debugC("Menu--sort没改")
        if muBiaoC ~= "烹饪" then
            tap1(67, 138) -- cooking
        end
    end
    if isColor(240, 135, 0x3e1d19, 95) and isColor(747, 201, 0xfe5656, 95) and
        isColor(730, 212, 0x684613, 95) then
        debugC("Menu--sort已改")
        if muBiaoC ~= "烹饪" then
            tap1(67, 138) -- cooking
        end
    end
    if isColor(499, 516, 0x323232, 95) and isColor(500, 554, 0x4b4b4b, 95) and
        isColor(641, 549, 0x4f4f4f, 95) then
        debugC("灰色cook")
        tap1(733, 97)
        tap1(1088, 141)
    end
    if isColor(532, 539, 0x9f9f9f, 95) and isColor(575, 535, 0xffffff, 95) and
        isColor(501, 536, 0x393939, 95) and isColor(664, 548, 0x575757, 95) then
        debugC("灰色Ovenisfull")
        tap1(733, 97)
        tap1(1088, 141)
    end
    if isColor(479, 543, 0xadadad, 95) and isColor(490, 515, 0x4c4c4c, 95) and
        isColor(559, 424, 0x73555b, 95) and isColor(566, 412, 0xe28a09, 95) then
        debugC("灰色cooking")
        tap1(733, 97)
        tap1(1088, 141)

    end
    if isColor(75, 52, 0xea4949, 95) and isColor(426, 26, 0x64434f, 95) and
        isColor(72, 41, 0xea8395, 95) and isColor(67, 138, 0x2b2b5c, 95) and
        checkCook == "烹饪" then -- 餐厅界面并且打勾选烹饪
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
    if isColor(413, 372, 0xe65340, 95) and isColor(638, 375, 0x78bf1b, 95) and
        isColor(417, 306, 0x38ad19, 95) and isColor(434, 293, 0x80dcdf, 95) then
        debugC("拒绝支援")
        tap1(638, 375, 0x78bf1b)
    end
    if isColor(425, 272, 0xcc483a, 95) and isColor(494, 358, 0x83ba5d, 95) and
        isColor(645, 388, 0x63a547, 95) then
        debugC("无法购买该商品")
        tap1(645, 388, 0x63a547)
    end
    if isColor(477, 319, 0xf8b841, 95) and isColor(499, 430, 0x686868, 95) and
        isColor(665, 320, 0xf8b841, 95) and isColor(640, 427, 0x6a6a6a, 95) then
        debugC("Server")
        tap1(486, 321, 0xf8b740)
    end
    if isColor(472, 317, 0x9b775a, 95) and isColor(498, 426, 0x73b153, 95) and
        isColor(650, 316, 0x9d785a, 95) and isColor(646, 440, 0x66a749, 95) then
        debugC("Server--OK")
        tap1(646, 440, 0x66a749)
    end
    if isColor(379, 260, 0xffe06b, 95) and isColor(397, 177, 0xa4ee4e, 95) and
        isColor(132, 610, 0xe25665, 95) then
        debugC("Loading 卡住")
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "Loading", "FFFFFF", "306090", "", 4, 0,
                     0, 50, 30);
        mSleep(500)
        for i = 1, 60, 1 do
            if isColor(379, 260, 0xffe06b, 95) == false then break end
            mSleep(1000)
            if i == 60 then closeApp(appXiangMu) end
        end
    end
    if isColor(56, 50, 0xbe3934, 95) and isColor(30, 68, 0xf7f4e7, 95) and
        isColor(1088, 143, 0xffffff, 95) then
        debugC("误开My home")
        tap1(1088, 143)
    end
    if isColor(92, 49, 0xb1e47d, 95) and isColor(95, 44, 0x8df3f7, 95) and
        isColor(58, 62, 0xd94b37, 95) and isColor(1058, 142, 0xffffff, 95) then
        debugC("误开Quest")
        tap1(1058, 142)
    end
    if isColor(109, 42, 0x31b2d0, 95) and isColor(123, 62, 0xfe859d, 95) and
        isColor(1026, 63, 0xffffff, 95) then
        debugC("误开Exchance")
        tap1(1026, 63)
    end
    if isColor(34, 37, 0x935a1e, 95) and isColor(23, 35, 0xe6d27e, 95) and
        isColor(1089, 141, 0xffffff, 95) then
        debugC("误开Box Shop")
        tap1(1089, 141)
    end
    if isColor(62, 31, 0xc22d00, 95) and isColor(59, 60, 0x148d6d, 95) and
        isColor(1089, 141, 0xffffff, 95) then
        debugC("误开Union Shop")
        tap1(1089, 141)
    end
    if isColor(64, 284, 0xf4e8b3, 95) and isColor(45, 313, 0xea505a, 95) and
        isColor(1086, 301, 0xffffff, 95) then
        debugC("误开Storage")
        tap1(1086, 301)
    end
    if isColor(256, 95, 0xffca56, 95) and isColor(285, 71, 0xf1eddd, 95) and
        isColor(851, 96, 0xffffff, 95) then
        debugC("误开Option")
        tap1(851, 96)
    end
    if isColor(263, 42, 0xfdda4e, 95) and isColor(292, 78, 0x895730, 95) and
        isColor(883, 65, 0xffffff, 95) then
        debugC("Quick")
        tap1(883, 65)
    end
    if isColor(46, 192, 0xd6a263, 95) and isColor(44, 211, 0xffebe6, 95) and
        isColor(71, 194, 0x7e5242, 95) then
        debugC("误开Friends")
        tap1(1085, 210, 0xffffff)
    end
    if isColor(20, 45, 0xd74427, 95) and isColor(29, 46, 0xfcfbfb, 95) and
        isColor(28, 30, 0xbe8966, 95) then
        debugC("误开shop")
        tap1(1087, 50, 0xffffff)
    end
    if isColor(41, 47, 0x8495b7, 95) and isColor(68, 28, 0xe13537, 95) and
        isColor(115, 42, 0x5c3d48, 95) then
        debugC("误开my house")
        tap1(1088, 141, 0xffffff)
    end
    if isColor(438, 507, 0x62a547, 95) and isColor(724, 107, 0xffffff, 95) and
        isColor(725, 94, 0x78595f, 95) then
        debugC("误开地块详细信息")
        tap1(724, 107)
    end
    if isColor(794, 530, 0x69a94b, 95) and isColor(868, 540, 0xc4956f, 95) then
        debugC("Hot sale")
        tap1(868, 540, 0xc4956f)
    end
    if isColor(144, 111, 0x7abf2e, 95) and isColor(166, 97, 0xf9d859, 95) and
        isColor(1034, 62, 0xffffff, 95) then
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
    if isColor(584, 90, 0xbd3935, 95) and isColor(860, 200, 0x6fae50, 95) and
        isColor(843, 200, 0xe4d9c3, 95) then
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
    if isColor(592, 451, 0x85bb5f, 95) and isColor(905, 476, 0x6dac4f, 95) and
        isColor(784, 468, 0xffffff, 95) then
        debugC("对话")
        tap1(784, 468, 0xffffff)
        tap1(423, 27, 0x79942f) -- 四叶草
        if isColor(1089, 46, 0xffffff, 95) then
            tap1(1089, 46)
            -- else
            --     runApp(appCalculator)
            --     lua_restart()
            --     mSleep(1000)
        end
    end
    -- if isColor(1046, 245, 0xd8420c, 95) and isColor(1074, 138, 0xaec816, 95) then
    -- debugC("邮箱红点")
    -- tap1(1080, 263, 0xe26060)
    -- end
    if isColor(109, 66, 0xd94344, 95) and isColor(167, 61, 0x5b3c47, 95) then
        debugC("邮箱界面")
        if isColor(957, 166, 0x73b052, 95) then
            debugC("OK")
            tap1(957, 166)
        elseif isColor(806, 20, 0xd8410c, 95) then
            debugC("支援红点")
            tap1(770, 42, 0xbbbcbd)
        elseif isColor(945, 18, 0xda450c, 95) then
            debugC("公告红点")
            tap1(911, 44, 0xbbbcbd)
        else
            debugC("关闭")
            tap1(1036, 67, 0xffffff)
        end
    end
end

-- 农场判断
function isFarm()
    if nowTime - timeDecideIsFarm >= 20 then
        timeDecideIsFarm = nowTime
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "isFarm", "FFFFFF", "306090", "", 4, 0,
                     0, 50, 30);
        mSleep(500)
        for i = 1, 120, 1 do
            bugFor()
            if isColor(34, 557, 0xec6f8e, 95) and isColor(59, 568, 0x7e5242, 95) and
                isColor(55, 583, 0xffe3d9, 95) then
                -- debugC("isFarm判断")
                break
            elseif isColor(1089, 46, 0xffffff, 95) and
                isColor(1104, 46, 0x73555b, 95) then
                -- debugC("右上角X")
                tap1(1089, 46)
            elseif isColor(600, 455, 0x81b95d, 95) and
                isColor(908, 479, 0x6baa4d, 95) then
                debugC("误开对话")
                tap1(600, 455)
            elseif isColor(75, 52, 0xea4949, 95) and
                isColor(426, 26, 0x64434f, 95) and isColor(72, 41, 0xea8395, 95) and
                checkCook == "烹饪" and muBiaoC == "烹饪" then
                return true
            else
                tap1(1135, 0)
            end
            mSleep(1000)
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50,
                     30);
        mSleep(500)
        if farmLong == 30 and isColor(1087, 530, 0xc0daa2, 95) and
            isColor(1095, 537, 0x96c572, 95) then -- 主动移动后
        elseif farmLong == 30 and isColor(1134, 629, 0x8ebb64, 95) and
            isColor(1127, 638, 0xa8d481, 95) then -- 主动移动前
        elseif farmLong == 28 and isColor(1070, 514, 0x8cb960, 95) and
            isColor(1124, 530, 0xa1d081, 95) then -- 主动移动后
        elseif farmLong == 28 and isColor(1124, 633, 0x8ec06d, 95) and
            isColor(1134, 628, 0xa4d282, 95) then -- 主动移动前
        elseif farmLong == 32 and isColor(119, 630, 0x94c36d, 95) and
            isColor(105, 630, 0x94c46f, 95) then -- 主动移动后
        elseif farmLong == 32 and isColor(105, 633, 0x96c672, 95) and
            isColor(96, 626, 0xa5d384, 95) then -- 主动移动前
        elseif farmLong == 34 and isColor(166, 601, 0x91bf67, 95) and
            isColor(169, 591, 0x9ccb73, 95) then -- 主动移动后
        elseif farmLong == 34 and isColor(110, 627, 0xb1c687, 95) and
            isColor(125, 612, 0x96c672, 95) then -- 主动移动前
        elseif farmLong == 26 and isColor(132, 117, 0xa9c193, 95) and
            isColor(1019, 201, 0x6c8c77, 95) then -- 主动移动后
        elseif farmLong == 26 and isColor(210, 200, 0xabc191, 95) and
            isColor(1130, 262, 0x558d71, 95) then -- 主动移动前
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

-- 找原点
function findHouse()
    if farmLong == 30 and isColor(1134, 629, 0x8ebb64, 95) and
        isColor(1127, 638, 0xa8d481, 95) then
        debugC("30x30初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30,
               {["step"] = 3, ["ms"] = 70, ["stop"] = 1})
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 28 and isColor(1124, 633, 0x8ec06d, 95) and
        isColor(1134, 628, 0xa4d282, 95) then
        debugC("28x28初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30,
               {["step"] = 3, ["ms"] = 70, ["stop"] = 1})
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 32 and isColor(105, 633, 0x96c672, 95) and
        isColor(96, 626, 0xa5d384, 95) then
        debugC("32x32初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30,
               {["step"] = 3, ["ms"] = 70, ["stop"] = 1})
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 34 and isColor(110, 627, 0xb1c687, 95) and
        isColor(125, 612, 0x96c672, 95) then
        debugC("34x34初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30,
               {["step"] = 3, ["ms"] = 70, ["stop"] = 1})
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 26 and isColor(210, 200, 0xabc191, 95) and
        isColor(1130, 262, 0x558d71, 95) then
        debugC("26x26初始画面")
        moveTo(567 - 130, 226 - 30, 484 - 130, 148 - 30,
               {["step"] = 3, ["ms"] = 70, ["stop"] = 1})
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    end
    tap(1135, 0)
    if isColor(477, 592, 0xebe3d2, 95) then
        debugC("误开实景界面1")
        tap1(477, 593)
    end
    if numOriginX == 0 then
        -- x, y = findMultiColorInRegionFuzzy(0xee4b48, "-3|2|0xe94941,4|2|0xed4b48,-2|-1|0x80b781,3|-1|0x80b67d", 90, 286, 44, 1130, 528, { orient = 2 })--房子
        x, y = findMultiColorInRegionFuzzy(0x50ff1e,
                                           "-1|1|0x51ff20,1|1|0x4fff20,0|-1|0x000000",
                                           90, 286, 44, 1130, 528, {orient = 2}) -- 树
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

-- 找农田
function findFarm()
    local x, y = findHouse()
    if x == 0 then
        return
    elseif x > 0 then
        farmLong = tonumber(farmLong)
        farmX = 567 / farmLong
        farmY = 284 / farmLong
        mSleep(100)
        for l = 1, 5, 1 do -- 种N轮
            k = 0

            ------------------种植------------------
            for j = rangeY1, rangeY2, 2 do
                for i = rangeX1, rangeX2, 2 do
                    realX1 = math.floor(x + (i - 1) * farmX - (j - 1) * farmX)
                    realY1 = math.floor(y + (j - 1) * farmY + (i - 1) * farmY +
                                            12)
                    k = k + 1
                    debugC(realX1 .. "," .. realY1 .. "," .. k)
                    if k == 1 then
                        tap1(realX1, realY1)
                        for m = 1, 50, 1 do
                            x0, y0 = findMultiColorInRegionFuzzy(0xede9e3,
                                                                 "2|0|0xfcb231",
                                                                 80, 496, 320,
                                                                 1135, 322)
                            if x0 > 0 then
                                local numStr =
                                    dmOcrText(index_dm_numTime, x0 - 500,
                                              y0 + 206, x0 - 500 + 118,
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
                        realX1 = math.floor(
                                     x + (i - 1) * farmX - (j - 1) * farmX)
                        realY1 = math.floor(
                                     y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    end
                    if i == rangeX2 then
                        realX2 = math.floor(
                                     x + (i - 1) * farmX - (j - 1) * farmX)
                        realY2 = math.floor(
                                     y + (j - 1) * farmY + (i - 1) * farmY + 12)
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
                        realX1 = math.floor(
                                     x + (i - 1) * farmX - (j - 1) * farmX)
                        realY1 = math.floor(
                                     y + (j - 1) * farmY + (i - 1) * farmY + 12)
                    end
                    if i == rangeX2 then
                        realX2 = math.floor(
                                     x + (i - 1) * farmX - (j - 1) * farmX)
                        realY2 = math.floor(
                                     y + (j - 1) * farmY + (i - 1) * farmY + 12)
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

-- doTarget3
function doTarget3()
    if numXiangMu ~= 3 and numXiangMu ~= 0 then return end
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
    elseif muBiaoC == "挂机" or muBiaoC == "种植" or muBiaoC ==
        "等待收割" or muBiaoC == "烹饪" then
        task3_guaJi()
    end
    -- debug("目标："..muBiao)
end

-- task3_主线
function task3_zhuXian() end

-- task3_支线
function task3_zhiXian() end

-- cook
function cook()
    if isColor(378, 564, 0xf96555, 95) and isColor(516, 509, 0x543842, 95) and
        isColor(491, 575, 0x2f4e94, 95) then
        debugC("烹饪失败--位置2")
        tap1(437, 560) -- clear2
    elseif isColor(638, 525, 0x7b717e, 95) and isColor(737, 558, 0x70a1d6, 95) and
        isColor(640, 594, 0x63484d, 95) and isColor(707, 497, 0xd0be9f, 95) then
        debugC("烹饪失败--位置3")
        tap1(737, 558) -- clear3
    elseif isColor(941, 525, 0x9fa4b5, 95) and isColor(943, 594, 0x543842, 95) and
        isColor(1009, 497, 0xd0be9f, 95) and isColor(1041, 558, 0x70a1d6, 95) then
        debugC("烹饪失败--位置4")
        tap1(1041, 558) -- clear4
    elseif isColor(87, 536, 0x563e43, 95) and isColor(108, 574, 0x79c01b, 95) and
        isColor(181, 548, 0xffffff, 95) then
        debugC("finished1--位置1")
        tap1(155, 556) -- finished1 
    elseif isColor(390, 536, 0x563e43, 95) and isColor(410, 573, 0x79c01b, 95) and
        isColor(483, 548, 0xffffff, 95) then
        debugC("finished2--位置2")
        tap1(483, 548) -- finished2
    elseif isColor(689, 544, 0x5252ce, 95) and isColor(713, 579, 0x6eba13, 95) and
        isColor(762, 548, 0xffffff, 95) and isColor(846, 565, 0x824820, 95) then
        debugC("finished3--位置3")
        tap1(784, 557) -- finished3
    elseif isColor(994, 544, 0x5252ce, 95) and isColor(1014, 576, 0x75bd18, 95) and
        isColor(989, 580, 0x563e43, 95) and isColor(1030, 559, 0x9bd135, 95) then
        debugC("finished4--位置4")
        tap1(1030, 559) -- finished4 
    elseif isColor(92, 565, 0x5ccdff, 95) and isColor(80, 548, 0xb24c02, 95) and
        isColor(186, 561, 0x2f4e94, 95) then
        debugC("Go Cook")
        tap1(155, 556)
    end
    if isColor(435, 545, 0x2f4e94, 95) and isColor(448, 566, 0xffffff, 95) and
        isColor(464, 555, 0x465f9c, 95) and isColor(486, 556, 0x98a3c3, 95) then
        debugC("烹饪失败 长时间没点--位置2")
        tap1(437, 560)
    end
    if isColor(536, 467, 0x433238, 95) and isColor(573, 455, 0x76b255, 95) and
        isColor(535, 465, 0x5e921a, 95) and isColor(573, 469, 0x265d00, 95) then
        -- if isColor(536,460,0x7ac01c,95) and isColor(565,455,0xffffff,95) and isColor(572,455,0x76b255,95) then
        debugC("烹饪完毕 点Ok 不管成功失败")
        tap1(572, 455)
    end
    if isColor(240, 135, 0x3e1d19, 95) and isColor(747, 201, 0xd1b390, 95) and
        isColor(730, 211, 0xcdad88, 95) then
        debugC("Menu")
        tap1(858, 205) -- SORt
        tap1(618, 168) -- 开放
    end
    if isColor(240, 135, 0x3e1d19, 95) and isColor(747, 201, 0xfe5656, 95) and
        isColor(730, 212, 0x684613, 95) then
        debugC("选套餐")
        for i = 1, 50, 1 do
            if isColor(5, 630, 0xcdc3af, 95) then
                debugC("拖动菜单")
                touchMoveXY(499, 631, 801, 631)
                -- touchMoveXY(801, 321, 499, 321)
                mSleep(1000)
            else
                break
            end
        end
        for i = 1, 50, 1 do
            x0, y0 = findMultiColorInRegionFuzzy(0x684613,
                                                 "0|-42|0x7e7078,0|-8|0xc27c19",
                                                 90, 0, 284, 1135, 328) -- 锁
            -- x0,y0 = findMultiColorInRegionFuzzy( 0x960000, "13|5|0xffffff,28|-7|0x920101,61|-3|0x960000", 90, 0, 372, 1135, 386)--料理中
            -- x0,y0 = findMultiColorInRegionFuzzy( 0x960000, "42|21|0xffffff,81|21|0x8a0f0f", 90, 0, 355, 1135, 400)--料理中
            if x0 > 0 then
                debugC("锁 右上角关闭")
                tap1(1089, 139) -- 右上角关闭
                gaiMuBiaoNewC(3, "")
                break
            else
                is2food = false
                if checkBingGan == "饼干冰淇淋" and is2food == false then
                    x, y = findMultiColorInRegionFuzzy(0xffe095,
                                                       "32|-11|0xff9683,2|32|0x543942,36|26|0x097aa2",
                                                       90, 0, 285, 1135, 477) -- 找饼干冰淇淋 记得改范围值 
                    if x > 0 then is2food = true end
                end
                if checkRice == "蛋包饭" and is2food == false then
                    x, y = findMultiColorInRegionFuzzy(0x83b73e,
                                                       "121|75|0xb32224,19|50|0xd8dfdb",
                                                       90, 0, 285, 1135, 477) -- 找蛋包饭 记得改范围值
                    if x > 0 then is2food = true end
                end
                if checkEgg == "参鸡汤" and is2food == false then
                    x, y = findMultiColorInRegionFuzzy(0xc3cc6c,
                                                       "75|21|0xa23b31,17|-68|0x6f3628",
                                                       90, 0, 285, 1135, 477) -- 找参鸡汤套餐
                    if x > 0 then is2food = true end
                end
                if checkZaoWuTaoCan == "早午套餐" and is2food == false then
                    x, y = findMultiColorInRegionFuzzy(0x9f4522,
                                                       "-8|-96|0xa2565c,-104|-101|0xc47951,40|-61|0x2d4d23",
                                                       90, 0, 285, 1135, 477) -- 找早午套餐 记得改范围值   
                    if x > 0 then is2food = true end
                end
                if checkGanLanYou == "橄榄油意大利面" and is2food ==
                    false then
                    x, y = findMultiColorInRegionFuzzy(0x48834a,
                                                       "-7|29|0xf7943a,30|71|0x2b5537,44|128|0xb0df7b",
                                                       90, 0, 285, 1135, 477) -- 找橄榄油意大利面 记得改范围值   
                    if x > 0 then is2food = true end
                end
                if x > 0 then
                    tap1(x, y) -- 坐标
                    tap1(557, 538, 0x70a1d6) -- Cook
                    mSleep(10000)
                    tap1(56, 152) -- Cooking
                    -- tap1(1089,139)--右上角关闭
                    -- gaiMuBiaoNewC(3, "") 
                    return
                else
                    -- 拖动
                    debugC("拖动菜单")
                    touchMoveXY(801, 631, 499, 631)
                    -- touchMoveXY(801, 321, 499, 321)
                    mSleep(1000)
                end
                if i >= 50 then
                    tap1(1089, 139) -- 右上角关闭
                    gaiMuBiaoNewC(3, "")
                    break
                end
            end
        end
    end
end

-- task3_挂机
function task3_guaJi()
    if muBiaoC == "挂机" then
        gaiMuBiaoNewC(2, "种植") ---
        debugC("改目标为种植2")
    elseif muBiaoC == "烹饪" then
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
            if isColor(610, 35, 0xb93056, 95) == false then -- 面板
                tap1(610, 35, 0xb93056)
            end
            if isColor(724, 106, 0xffffff, 95) and
                isColor(441, 495, 0x6aaa4c, 95) then
                debugC("误开剩余时间")
                tap1(724, 106)
            end
            k = 0
            local n = 0
            repeat
                n = n + 1
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "task3_guajiB", "FFFFFF",
                             "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for j = 3, 5, 2 do
                    for i = 1, farmLong - 1, 2 do
                        if isColor(723, 106, 0xffffff, 95) and
                            isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                            tap1(723, 106)
                        end
                        realX1 = math.floor(
                                     numOriginX + (i - 1) * farmX - (j - 1) *
                                         farmX)
                        realY1 = math.floor(
                                     numOriginY + (j - 1) * farmY + (i - 1) *
                                         farmY + 12)
                        k = k + 1
                        if isColor(724, 106, 0xffffff, 95) and
                            isColor(441, 495, 0x6aaa4c, 95) then
                            debugC("误开剩余时间")
                            tap1(724, 106)
                        end
                        -- debug(realX1 .. "," .. realY1 .. "," .. k)
                        if k == 1 then
                            checkFruit()
                            plant()
                        end
                        tap(realX1, realY1,
                            {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                        mSleep(1000)
                        if isColor(663, 621, 0x66a744, 95) == false then -- 已种完
                            break
                        end
                        if isColor(724, 107, 0xffffff, 95) then
                            tap1(724, 107) -- 误开
                        end
                        -- tap(realX1, realY1)
                    end
                end
            until isColor(664, 619, 0x68a844, 95) == false or n == 2 -- 已种完
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
            if watering() then return end
            x, y = findMultiColorInRegionFuzzy(0xd64428,
                                               "6|1|0x46222b,30|-4|0xba8859,36|-13|0xe6e6e6",
                                               90, 86, 96, 1045, 547)
            if x > 0 then
                debugC("援助")
                tap1(x, y)
                timeDecideIsFarm = nowTime
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xd64428,
                                               "6|1|0x46222b,16|28|0xf7dc6d,33|-5|0xc38e5e",
                                               90, 86, 96, 1045, 547)
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
            x, y = findMultiColorInRegionFuzzy(0xffffff,
                                               "-10|-10|0xffffff,9|-10|0xffffff",
                                               100, 86, 96, 1045, 547) -- 气泡
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
                fwShowButton("window1", "more", "task3_guaji", "FFFFFF",
                             "306090", "", 4, 0, 0, 50, 30);
                mSleep(500)
                for shou2bian = 1, 2, 1 do
                    for j = 5, 3, -2 do
                        for i = 1, farmLong - 1, 2 do
                            if isColor(723, 106, 0xffffff, 95) and
                                isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                                tap1(723, 106)
                            end
                            watering()
                            realX1 = math.floor(
                                         numOriginX + (i - 1) * farmX - (j - 1) *
                                             farmX)
                            realY1 = math.floor(
                                         numOriginY + (j - 1) * farmY + (i - 1) *
                                             farmY + 12)
                            -- debug("realX1 realY1:" .. realX1 .. "," .. realY1)

                            if isColor(1088, 46, 0xffffff, 95) then -- 误开种植界面
                                tap(1088, 46, {
                                    ["ms"] = 300,
                                    ["pic"] = "click_point_4_2.png"
                                })
                                mSleep(300)
                            end
                            tap(realX1, realY1,
                                {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                            -- tap(realX1, realY1)
                            -- debug("收割:" .. realX1 .. "," .. realY1)
                            mSleep(300)
                            if isColor(1088, 46, 0xffffff, 95) then -- 误开种界面
                                tap(1088, 46, {
                                    ["ms"] = 300,
                                    ["pic"] = "click_point_4_2.png"
                                })
                                mSleep(300)
                            end
                            if isColor(724, 106, 0xffffff, 95) then -- 误开剩余时间，有产品没成熟
                                tap(724, 106, {
                                    ["ms"] = 300,
                                    ["pic"] = "click_point_4_2.png"
                                })
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
                    timeXiangMu3 = nowTime + 60 * 60 * 24 -- 项目1已闲置时间
                    nowTime = os.time()
                    timeXXX = nowTime
                end
            end
        end
    end
end

-- 定时任务
function time_task()
    if nowTime - timeTap >= 5 then
        tap(1135, 0)
        timeTap = nowTime
    end
    if nowTime - timeTree >= 2 * 60 then tapTrees() end
end

-- 点击果树
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
                fwShowButton("window1", "more", "tapTreesB", "FFFFFF", "306090",
                             "", 4, 0, 0, 50, 30);
                mSleep(500)
                for i = 1, farmLong - 1, 2 do
                    if isColor(723, 106, 0xffffff, 95) and
                        isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                        tap1(723, 106)
                    end
                    watering()
                    realX1 = math.floor(numOriginX + (i - 1) * farmX - (1 - 1) *
                                            farmX)
                    realY1 = math.floor(numOriginY + (1 - 1) * farmY + (i - 1) *
                                            farmY + 12)
                    if isColor(realX1, realY1, 0x55ff25, 80) then -- 地为绿色
                        tap(realX1, realY1,
                            {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                        mSleep(1000)
                    end
                    if isColor(724, 106, 0xffffff, 95) then -- 果树信息
                        tap1(724, 106)
                    end
                end
                -- for j = 5, 3, -2 do
                --     for i = 1, farmLong - 1, 2 do
                --         realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) * farmX)
                --         realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) * farmY + 12)
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "tapTrees", "FFFFFF", "306090",
                             "", 4, 0, 0, 50, 30);
                mSleep(500)
                for i = 1, farmLong - 1, 2 do
                    if isColor(723, 106, 0xffffff, 95) and
                        isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                        tap1(723, 106)
                    end
                    watering()
                    realX1 = math.floor(numOriginX + (i - 1) * farmX - (5 - 1) *
                                            farmX)
                    realY1 = math.floor(numOriginY + (5 - 1) * farmY + (i - 1) *
                                            farmY + 12)
                    if isColor(realX1, realY1, 0x55ff25, 80) then -- 地为绿色
                        tap(realX1, realY1,
                            {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                        mSleep(1000)
                    end
                    if isColor(724, 106, 0xffffff, 95) then -- 果树信息
                        tap1(724, 106)
                    end
                end
                if Ccheck1 == "4排为树" then
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", "4排为树", "FFFFFF",
                                 "306090", "", 4, 0, 0, 50, 30);
                    mSleep(500)
                    for i = 1, farmLong - 1, 2 do
                        if isColor(723, 106, 0xffffff, 95) and
                            isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                            tap1(723, 106)
                        end
                        watering()
                        realX1 = math.floor(
                                     numOriginX + (i - 1) * farmX - (7 - 1) *
                                         farmX)
                        realY1 = math.floor(
                                     numOriginY + (7 - 1) * farmY + (i - 1) *
                                         farmY + 12)
                        if isColor(realX1, realY1, 0x55ff25, 80) then -- 地为绿色
                            tap(realX1, realY1,
                                {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                            mSleep(1000)
                        end
                        if isColor(724, 106, 0xffffff, 95) then -- 果树信息
                            tap1(724, 106)
                        end
                    end
                end
                if Ccheck2 == "5排为树" then
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", "5排为树", "FFFFFF",
                                 "306090", "", 4, 0, 0, 50, 30);
                    mSleep(500)
                    for i = 1, farmLong - 1, 2 do
                        if isColor(723, 106, 0xffffff, 95) and
                            isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                            tap1(723, 106)
                        end
                        watering()
                        realX1 = math.floor(
                                     numOriginX + (i - 1) * farmX - (9 - 1) *
                                         farmX)
                        realY1 = math.floor(
                                     numOriginY + (9 - 1) * farmY + (i - 1) *
                                         farmY + 12)
                        if isColor(realX1, realY1, 0x55ff25, 80) then -- 地为绿色
                            tap(realX1, realY1,
                                {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                            mSleep(1000)
                        end
                        if isColor(724, 106, 0xffffff, 95) then -- 果树信息
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

-- 渐开线
function jianKaiXian(x, y)
    touchDown(x, y)
    -- x,y = findMultiColorInRegionFuzzy( 0xffffff, "", 90, 91, 75, 1043, 554)
    mSleep(100)
    touchMove(90, 70)
    mSleep(20)
    for j = 0, 480, 15 do
        for i = 0, 950, 30 do
            touchMove(91 + i, 75 + j);
            -- 延迟
            mSleep(10);
        end
    end
    touchUp(1050, 560);
    mSleep(1000);
end

-- 浇水
function watering()
    x, y = findMultiColorInRegionFuzzy(0xffffff,
                                       "6|-21|0x63b7ed,14|2|0x66b8e7,22|3|0xffffff",
                                       90, 1, 91, 1031, 550) -- 浇水
    if x > 0 then
        -- debug("浇水1")
        tap(x, y, {["ms"] = 300})
        timeDecideIsFarm = nowTime
        return true
    else
        return false
    end
end

-- 出货
function sell()
    if isFarm() then
        if isSell == false then
            tap1(1077, 592, 0xd6915e) -- Tool Box
            mSleep(1000)
            tap1(618, 566, 0xc47b5c) -- sell
            mSleep(1000)
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellF", "FFFFFF", "306090", "", 4,
                         0, 0, 50, 30);
            mSleep(500)
            for i = 1, 10, 1 do
                if isColor(138, 350, 0x6fb644, 95) == false then -- 不为蔬菜
                    tap1(176, 358, 0xcfaf8b) -- all
                    tap1(333, 328, 0x6fb644) -- crop
                else
                    break
                end
                mSleep(1000)
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellE", "FFFFFF", "306090", "", 4,
                         0, 0, 50, 30);
            mSleep(500)
            for j = 0, 1, 1 do
                for i = 0, 8, 1 do
                    if isColor(723, 106, 0xffffff, 95) and
                        isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                        tap1(723, 106)
                    end
                    if isColor(59 + i * 118, 392 + j * 116, 0x543842, 95) then
                        local numStr = dmOcrText(index_dm_numNumber,
                                                 38 + i * 118, 405 + j * 116,
                                                 109 + i * 118, 426 + j * 116,
                                                 "DCD7D9,232826", 95)
                        numStr, num = string.gsub(numStr, "x", "")
                        numStr = tonumber(numStr)
                        if type(numStr) == "number" then
                            debugC("数量为" .. numStr)
                            if numStr >= 200 then
                                tap1(38 + i * 118, 405 + j * 116) -- 选中要卖的
                                tap1(567, 433, 0xe0e0e0) -- 一半
                                tap1(566, 525, 0x75b154) -- sell
                                mSleep(2000)
                            end
                        end
                    end
                end
            end
            -- local numStr1 = dmOcrText(index_dm_numNumber, 61, 405, 1049, 426, "DCD7D9,232826", 95)
            -- local numStr2 = dmOcrText(index_dm_numNumber, 61, 520, 1049, 544, "DCD7D9,232826", 95)
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellD", "FFFFFF", "306090", "", 4,
                         0, 0, 50, 30);
            mSleep(500)
            for i = 1, 10, 1 do
                if isColor(141, 363, 0xe6515a, 95) == false then -- 不为tree
                    tap1(176, 358, 0xcfaf8b) -- all
                    tap1(528, 325, 0xe6515a) -- tree
                else
                    break
                end
                mSleep(1000)
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellC", "FFFFFF", "306090", "", 4,
                         0, 0, 50, 30);
            mSleep(500)
            for j = 0, 1, 1 do
                for i = 0, 8, 1 do
                    if isColor(723, 106, 0xffffff, 95) and
                        isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                        tap1(723, 106)
                    end
                    if isColor(59 + i * 118, 392 + j * 116, 0x543842, 95) then
                        local numStr = dmOcrText(index_dm_numNumber,
                                                 38 + i * 118, 405 + j * 116,
                                                 109 + i * 118, 426 + j * 116,
                                                 "DCD7D9,232826", 95)
                        numStr, num = string.gsub(numStr, "x", "")
                        numStr = tonumber(numStr)
                        if type(numStr) == "number" then
                            debugC("数量为" .. numStr)
                            if numStr >= 200 then
                                tap1(38 + i * 118, 405 + j * 116) -- 选中要卖的
                                tap1(567, 433, 0xe0e0e0) -- 一半
                                tap1(566, 525, 0x75b154) -- sell
                                mSleep(2000)
                            end
                        end
                    end
                end
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellB", "FFFFFF", "306090", "", 4,
                         0, 0, 50, 30);
            mSleep(500)
            for i = 1, 10, 1 do
                if isColor(152, 368, 0xeb573c, 95) == false then -- 不为Special shop
                    tap1(176, 358, 0xcfaf8b) -- all
                    tap1(333, 456, 0xdb9d68) -- Special shop
                else
                    break
                end
                mSleep(1000)
            end
            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "SellA", "FFFFFF", "306090", "", 4,
                         0, 0, 50, 30);
            mSleep(500)
            for j = 0, 1, 1 do
                for i = 0, 8, 1 do
                    if isColor(59 + i * 118, 392 + j * 116, 0x543842, 95) then
                        local numStr = dmOcrText(index_dm_numNumber,
                                                 38 + i * 118, 405 + j * 116,
                                                 109 + i * 118, 426 + j * 116,
                                                 "DCD7D9,232826", 95)
                        numStr, num = string.gsub(numStr, "x", "")
                        numStr = tonumber(numStr)
                        if type(numStr) == "number" then
                            debugC("数量为" .. numStr)
                            if numStr >= 1 then
                                tap1(38 + i * 118, 405 + j * 116) -- 选中要卖的
                                tap1(703, 434, 0xd0d0d0) -- 全部
                                tap1(566, 525, 0x75b154) -- sell
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
             iphoneId .. " 目标1: " .. muBiaoC1 .. " 目标2: " .. muBiaoC2 ..
                 " 目标3: " .. muBiaoC3 .. " 目标4: " .. muBiaoC4 ..
                 "    操作:" .. tiaoShiNeiRong .. "   #" .. xiangMu ..
                 "#   [DATE]" .. "#    [LINE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast("目标1: " .. muBiaoC1 .. " 目标2: " .. muBiaoC2 ..
                  " 目标3: " .. muBiaoC3 .. " 目标4: " .. muBiaoC4 ..
                  "                操作:" .. tiaoShiNeiRong)
        mSleep(3000)
    end
end

-- 读时间
function loadTime(x1, y1, x2, y2)
    keepScreen(true);
    local numStr = dmOcrText(index_dm_lastTime, x1, y1, x2, y2, "786062,242820",
                             95)
    keepScreen(false)
    debugC("读取结果:" .. numStr)
    mSleep(200)
    local num1, num2 = string.find(numStr, "秒")
    local num3, num4 = string.find(numStr, "小")
    local num5, num6 = string.find(numStr, "分")

    if num1 ~= nil and num3 == nil and num5 == nil then -- 只有秒
        numStr, num = string.gsub(numStr, "秒", "")
        numStr = tonumber(numStr)
        debugC("转换结果" .. numStr)
    elseif num1 ~= nil and num3 == nil and num5 ~= nil then -- 有分有秒
        numStr, num = string.gsub(numStr, "秒", "")
        local data = strSplit(numStr, "分")
        numStr = tonumber(data[1]) * 60 + tonumber(data[2])
        debugC("转换结果" .. numStr)
    elseif num1 == nil and num5 ~= nil and num3 == nil then -- 只有分
        numStr, num = string.gsub(numStr, "分", "")
        numStr = tonumber(numStr) * 60
        debugC("转换结果" .. numStr)
    elseif num1 == nil and num5 == nil and num3 ~= nil then -- 只有小时
        numStr, num = string.gsub(numStr, "小时", "")
        numStr = tonumber(numStr) * 3600 + 60
        debugC("转换结果" .. numStr)
    elseif num1 == nil and num5 ~= nil and num3 ~= nil then -- 有小时和分
        numStr, num = string.gsub(numStr, "分", "")
        local data = strSplit(numStr, "小时")
        numStr = tonumber(data[1]) * 3600 + tonumber(data[2]) * 60 + 60
        debugC("转换结果" .. numStr)
    end
    return numStr
end

-- 扫描地块
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
                            realX1 = math.floor(
                                         numOriginX + (i - 1) * farmX - (j - 1) *
                                             farmX)
                            realY1 = math.floor(
                                         numOriginY + (j - 1) * farmY + (i - 1) *
                                             farmY + 12)
                            for k = 1, 60, 1 do
                                if isColor(663, 621, 0x66a744, 95) then -- done
                                    tap1(663, 621)
                                end
                                if isColor(realX1, realY1, 0x3688d1, 95) or
                                    isColor(realX1 + 2, realY1, 0x3486ce, 95) or
                                    isColor(realX1 - 2, realY1, 0x2f82c8, 95) or
                                    isColor(realX1, realY1 + 2, 0x3787d0, 95) or
                                    isColor(realX1, realY1 - 2, 0x3787d0, 95) then
                                    debugC("没地了")
                                    Ccheck0 = ""
                                    writeConfigNew2("Ccheck0", "")
                                    return
                                end
                                if isColor(1089, 47, 0xffffff, 95) == false then -- 不为shop
                                    tap(realX1, realY1, {
                                        ["ms"] = 300,
                                        ["pic"] = "click_point_4_2.png"
                                    })
                                    mSleep(200)
                                end
                                if isColor(537, 374, 0x80c321, 95) and
                                    isColor(591, 371, 0xffffff, 95) then -- 无法购买该商品
                                    tap1(537, 374, 0x80c321)
                                end
                                if isColor(724, 106, 0xffffff, 95) then -- 剩余时间
                                    -- table_tree[math.floor(j/2)+1][math.floor(i/2)+1]=loadTime(516, 400, 708, 427) + os.time();
                                    table_tree[#table_tree + 1] = loadTime(516,
                                                                           400,
                                                                           708,
                                                                           427) +
                                                                      os.time();
                                    writeFile(userPath() ..
                                                  "/res/table_tree.txt",
                                              table_tree, "w", 1) -- 将 table 内容存入文件，成功返回 true
                                    break
                                elseif k >= 60 then
                                    break
                                end
                                if isColor(20, 45, 0xd74427, 95) and
                                    isColor(29, 46, 0xfcfbfb, 95) and
                                    isColor(28, 30, 0xbe8966, 95) then
                                    debugC("shop")
                                    nowTime = os.time()
                                    if nowTime - timeLastShop >= 0 and nowTime -
                                        timeLastShop <= 30 then
                                        for l = 1, 10, 1 do
                                            debugC(
                                                "timeLastShop低于60秒: " ..
                                                    lastFruitX)
                                            mSleep(100)
                                            debugC(
                                                "采用lastFruitX: " ..
                                                    lastFruitX)
                                            timeLastShop = os.time()
                                            tap(lastFruitX, 380, {
                                                ["ms"] = 300,
                                                ["pic"] = "click_point_4_2.png"
                                            })
                                            mSleep(1000)
                                            if isColor(1089, 47, 0xffffff, 95) ==
                                                false then
                                                break
                                            end
                                        end
                                        tap(realX1, realY1, {
                                            ["ms"] = 300,
                                            ["pic"] = "click_point_4_2.png"
                                        })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then -- done
                                            tap1(663, 621)
                                        end
                                    else
                                        debugC(
                                            "timeLastShop高于60秒: " ..
                                                lastFruitX)
                                        tapBefore(1089, 47, 0xffffff) -- 关闭
                                        checkFruit()
                                        plantNew()
                                        timeLastShop = os.time()
                                        tap(realX1, realY1, {
                                            ["ms"] = 300,
                                            ["pic"] = "click_point_4_2.png"
                                        })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then -- done
                                            tap1(663, 621)
                                        end
                                    end
                                end
                            end
                            for k = 1, 100, 1 do
                                if isColor(724, 106, 0xffffff, 95) then -- 关闭剩余时间
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

-- 扫描树
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

                    local zhengShu, xiaoShu =
                        math.modf(numTree / (farmLong / 2))
                    if xiaoShu == 0 then
                        zhengShu = zhengShu - 1
                        numLastTreeRow = zhengShu + 1 -- 行
                        numLastTreeColumn = farmLong / 2 -- 列
                    else
                        numLastTreeRow = zhengShu + 1 -- 行
                        numLastTreeColumn = xiaoShu * (farmLong / 2) -- 列
                    end
                    for j = 1, 7, 2 do
                        -- table_tree[math.floor(j/2)+1]={}
                        for i = 1, farmLong - 1, 2 do
                            nowTime = os.time()
                            realX1 = math.floor(
                                         numOriginX + (i - 1) * farmX - (j - 1) *
                                             farmX)
                            realY1 = math.floor(
                                         numOriginY + (j - 1) * farmY + (i - 1) *
                                             farmY + 12)
                            for k = 1, 60, 1 do
                                if isColor(663, 621, 0x66a744, 95) then -- done
                                    tap1(663, 621)
                                end
                                if isColor(realX1, realY1, 0x3688d1, 95) or
                                    isColor(realX1 + 2, realY1, 0x3486ce, 95) or
                                    isColor(realX1 - 2, realY1, 0x2f82c8, 95) or
                                    isColor(realX1, realY1 + 2, 0x3787d0, 95) or
                                    isColor(realX1, realY1 - 2, 0x3787d0, 95) then
                                    debugC("没地了")
                                    Ccheck0 = ""
                                    writeConfigNew2("Ccheck0", "")
                                    return
                                end
                                if isColor(1089, 47, 0xffffff, 95) == false then -- 不为shop
                                    tap(realX1, realY1, {
                                        ["ms"] = 300,
                                        ["pic"] = "click_point_4_2.png"
                                    })
                                    mSleep(200)
                                end
                                if isColor(537, 374, 0x80c321, 95) and
                                    isColor(591, 371, 0xffffff, 95) then -- 无法购买该商品
                                    tap1(537, 374, 0x80c321)
                                end
                                if isColor(724, 106, 0xffffff, 95) then -- 剩余时间
                                    -- table_tree[math.floor(j/2)+1][math.floor(i/2)+1]=loadTime(516, 400, 708, 427) + os.time();
                                    table_tree[#table_tree + 1] = loadTime(516,
                                                                           400,
                                                                           708,
                                                                           427) +
                                                                      os.time();
                                    writeFile(userPath() ..
                                                  "/res/table_tree.txt",
                                              table_tree, "w", 1) -- 将 table 内容存入文件，成功返回 true
                                    break
                                elseif k >= 60 then
                                    break
                                end
                                if isColor(20, 45, 0xd74427, 95) and
                                    isColor(29, 46, 0xfcfbfb, 95) and
                                    isColor(28, 30, 0xbe8966, 95) then
                                    debugC("shop")
                                    nowTime = os.time()
                                    if nowTime - timeLastShop >= 0 and nowTime -
                                        timeLastShop <= 30 then
                                        for l = 1, 10, 1 do
                                            debugC(
                                                "timeLastShop低于60秒: " ..
                                                    lastFruitX)
                                            mSleep(100)
                                            debugC(
                                                "采用lastFruitX: " ..
                                                    lastFruitX)
                                            timeLastShop = os.time()
                                            tap(lastFruitX, 380, {
                                                ["ms"] = 300,
                                                ["pic"] = "click_point_4_2.png"
                                            })
                                            mSleep(1000)
                                            if isColor(1089, 47, 0xffffff, 95) ==
                                                false then
                                                break
                                            end
                                        end
                                        tap(realX1, realY1, {
                                            ["ms"] = 300,
                                            ["pic"] = "click_point_4_2.png"
                                        })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then -- done
                                            tap1(663, 621)
                                        end
                                    else
                                        debugC(
                                            "timeLastShop高于60秒: " ..
                                                lastFruitX)
                                        tapBefore(1089, 47, 0xffffff) -- 关闭
                                        checkFruit()
                                        plantNew()
                                        timeLastShop = os.time()
                                        tap(realX1, realY1, {
                                            ["ms"] = 300,
                                            ["pic"] = "click_point_4_2.png"
                                        })
                                        mSleep(1000)
                                        if isColor(663, 621, 0x66a744, 95) then -- done
                                            tap1(663, 621)
                                        end
                                    end
                                end
                            end
                            for k = 1, 100, 1 do
                                if isColor(724, 106, 0xffffff, 95) then -- 关闭剩余时间
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

-- 检查地块
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
                    numRowFruit = zhengShu + 1 -- 行
                    numColumnFruit = farmLong / 2 -- 列
                else
                    numRowFruit = zhengShu + 1 -- 行
                    numColumnFruit = xiaoShu * (farmLong / 2) -- 列
                end
                debugC("最小值行为:" .. numRowFruit .. "  列为: " ..
                           numColumnFruit)
                mSleep(100)
                -- lua_exit()
                break
            end
        end
        if isColor(34, 557, 0xec6f8e, 95) and isColor(59, 568, 0x7e5242, 95) and
            isColor(55, 583, 0xffe3d9, 95) then
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

                realX1 = math.floor(numOriginX + (i - 1) * farmX - (j - 1) *
                                        farmX)
                realY1 = math.floor(numOriginY + (j - 1) * farmY + (i - 1) *
                                        farmY + 12)
                for k = 1, 60, 1 do
                    if isColor(663, 621, 0x66a744, 95) then -- done
                        tap1(663, 621)
                    end
                    if isColor(realX1, realY1, 0x3688d1, 95) or
                        isColor(realX1 + 2, realY1, 0x3486ce, 95) or
                        isColor(realX1 - 2, realY1, 0x2f82c8, 95) or
                        isColor(realX1, realY1 + 2, 0x3787d0, 95) or
                        isColor(realX1, realY1 - 2, 0x3787d0, 95) then
                        debugC("没地了")
                        Ccheck0 = ""
                        writeConfigNew2("Ccheck0", "")
                        return
                    end
                    debugC("最快的坐标为: " .. realX1 .. "," .. realY1)
                    if isColor(1089, 47, 0xffffff, 95) == false then -- 不为shop
                        tap(realX1, realY1,
                            {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                        mSleep(200)
                    end
                    if isColor(537, 374, 0x80c321, 95) and
                        isColor(591, 371, 0xffffff, 95) then -- 无法购买该商品
                        tap1(537, 374, 0x80c321)
                    end
                    if isColor(724, 106, 0xffffff, 95) then -- 剩余时间
                        -- table_tree[math.floor(j/2)+1][math.floor(i/2)+1]=loadTime(516, 400, 708, 427) + os.time();
                        table_tree[numMinID] =
                            loadTime(516, 400, 708, 427) + os.time();
                        writeFile(userPath() .. "/res/table_tree.txt",
                                  table_tree, "w", 1) -- 将 table 内容存入文件，成功返回 true
                        break
                    elseif k >= 60 then
                        break
                    end
                    if isColor(20, 45, 0xd74427, 95) and
                        isColor(29, 46, 0xfcfbfb, 95) and
                        isColor(28, 30, 0xbe8966, 95) then
                        debugC("shop")
                        nowTime = os.time()
                        if nowTime - timeLastShop >= 0 and nowTime -
                            timeLastShop <= 30 then
                            for l = 1, 10, 1 do
                                debugC("timeLastShop低于60秒: " .. lastFruitX)
                                mSleep(100)
                                debugC("采用lastFruitX: " .. lastFruitX)
                                timeLastShop = os.time()
                                tap(lastFruitX, 380, {
                                    ["ms"] = 300,
                                    ["pic"] = "click_point_4_2.png"
                                })
                                mSleep(1000)
                                if isColor(1089, 47, 0xffffff, 95) == false then
                                    break
                                end
                            end
                            tap(realX1, realY1,
                                {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                            mSleep(1000)
                            if isColor(663, 621, 0x66a744, 95) then -- done
                                tap1(663, 621)
                            end
                        else
                            debugC("timeLastShop高于60秒: " .. lastFruitX)
                            tapBefore(1089, 47, 0xffffff) -- 关闭
                            checkFruit()
                            plantNew()
                            timeLastShop = os.time()
                            tap(realX1, realY1,
                                {["ms"] = 300, ["pic"] = "click_point_4_2.png"})
                            mSleep(1000)
                            if isColor(663, 621, 0x66a744, 95) then -- done
                                tap1(663, 621)
                            end
                        end
                    end
                end
                for k = 1, 100, 1 do
                    if isColor(724, 106, 0xffffff, 95) then -- 关闭剩余时间
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

-- 检查果实
function checkFruit()
    if checkGuoShi == "检查果实" then
        tap1(1077, 592, 0xd6915e) -- Tool Box
        mSleep(1000)
        debugC("sell")
        tap1(618, 566, 0xc47b5c) -- sell
        mSleep(1000)
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "checkFruit", "FFFFFF", "306090", "", 4,
                     0, 0, 50, 30);
        mSleep(500)
        for i = 1, 10, 1 do
            if isColor(138, 350, 0x6fb644, 95) == false then -- 不为蔬菜
                tap1(176, 358, 0xcfaf8b) -- all
                tap1(333, 328, 0x6fb644) -- crop
            else
                break
            end
            mSleep(1000)
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50,
                     30);
        mSleep(500)
        isZhiDingFruit = false
        for i = 1, 3, 1 do
            if checkTomato == "番茄" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x68a646,
                                                   "16|-10|0xef5138,43|7|0xf87b5b,46|27|0xef5138",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 3, y - 36,
                                             x + 75, y - 13, "DCD7D9,232826", 95)
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
                                                   "-10|33|0xebb956,38|34|0xf0404a,44|51|0xb81f2a",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 4, y - 14,
                                             x + 78, y + 10, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x99502a,
                                                   "-20|-15|0xf8e780,24|25|0x589a29",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 21, y - 29,
                                             x + 49, y - 6, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x589a29,
                                                   "-20|71|0x77337a,32|45|0xeb85eb",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 25, y - 4,
                                             x + 60, y + 22, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0xedd2c0,
                                                   "-12|71|0x99044e,20|44|0xc2af6f",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 15, y - 2,
                                             x + 60, y + 24, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0xfbe4ba,
                                                   "-6|29|0xef9527,61|22|0xd15705",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    debugC("南瓜x:" .. x .. " y:" .. y)
                    local numStr = dmOcrText(index_dm_numNumber, x + 15, y - 26,
                                             x + 72, y + 1, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x91396f,
                                                   "-2|-23|0x543e42,17|5|0x533842",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 27, y - 56,
                                             x + 37, y - 30, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x9c5600,
                                                   "-39|36|0x543842,16|8|0xffca70",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 20, y - 45,
                                             x + 40, y - 20, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x533842,
                                                   "-38|-11|0x853436,22|16|0x662121",
                                                   90, 3, 389, 1127, 614) -- 范围固定死了
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 17, y - 46,
                                             x + 45, y - 19, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("红豆:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "红豆"
                    end
                end
            end
            if checkHuaSheng == "花生" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xf3eee3,
                                                   "5|29|0x603d44,47|49|0x9b5e27,74|53|0x77461f",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 43, y + 7,
                                             x + 92, y + 33, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("花生:" .. numStr)
                    if numStr <= 80 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "花生"
                    end
                end
            end
            if checkXiaoMai == "小麦" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xf1ece2,
                                                   "38|39|0xc67c00,73|57|0x603d44,57|46|0xfbeac2",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 33, y + 7,
                                             x + 94, y + 31, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("小麦:" .. numStr)
                    if numStr <= 600 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "小麦"
                    end
                end
            end
            if checkLuoBo == "萝卜" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xf3eee3,
                                                   "22|12|0x285e00,20|22|0x7ac361,39|32|0xbe5600",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 43, y + 7,
                                             x + 92, y + 32, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("萝卜:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "萝卜"
                    end
                end
            end
            if checkYuMi == "玉米" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x4c5137,
                                                   "4|32|0xbb6d25,28|35|0x225100,24|12|0xd7822c",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 34, y - 30,
                                             x + 61, y + 3, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("玉米:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "玉米"
                    end
                end
            end
            if checkBaoXinCai == "包心菜" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x50883c,
                                                   "47|21|0xb4e06c,64|21|0x3f673b,52|7|0x457738",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 15, y - 37,
                                             x + 81, y + 3, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("包心菜:" .. numStr)
                    if numStr <= 600 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "包心菜"
                    end
                end
            end
            if checkHuangDou == "黄豆" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x608e69,
                                                   "0|28|0x659832,16|34|0xf0a609,18|39|0xbde486",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 31, y - 24,
                                             x + 65, y + 10, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("黄豆:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "黄豆"
                    end
                end
            end
            if checkYangCong == "洋葱" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x5db42f,
                                                   "14|25|0xc26305,39|53|0x623d3a,26|28|0xf39a16",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 34, y - 17,
                                             x + 62, y + 16, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("洋葱:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "洋葱"
                    end
                end
            end
            if checkBoHe == "薄荷" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x578551,
                                                   "55|57|0x998187,54|25|0x86c273,48|57|0x4a542f",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 16, y - 10,
                                             x + 80, y + 24, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("薄荷:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "薄荷"
                    end
                end
            end
            if checkLaJiao == "辣椒" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xfebb70,
                                                   "-34|20|0x73b32b,17|29|0xa21d26,33|-1|0x449a49",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 47, y - 36,
                                             x + 49, y + 1, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("辣椒:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "辣椒"
                    end
                end
            end
            if checkXunYiCao == "薰衣草" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x504b71,
                                                   "7|0|0x6e4c9b,7|13|0xa34edf,20|31|0x699936",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 22, y - 35,
                                             x + 74, y - 1, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("薰衣草:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "薰衣草"
                    end
                end
            end
            if checkBoLuo == "菠萝" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0x46662e,
                                                   "-3|20|0xd88d44,13|19|0xeec856,12|0|0x749538",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 39, y - 44,
                                             x + 57, y - 10, "DCD7D9,232826", 95)
                    numStr, num = string.gsub(numStr, "x", "")
                    numStr = tonumber(numStr)
                    debugC("菠萝:" .. numStr)
                    if numStr <= 40 then
                        isZhiDingFruit = true
                        strZhiDingFruit = "菠萝"
                    end
                end
            end
            if checkXiangCao == "香草" and isZhiDingFruit == false then
                x, y = findMultiColorInRegionFuzzy(0xf1ece2,
                                                   "41|44|0x778195,58|38|0x463039,51|57|0x0e0f13",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x - 1, y + 6,
                                             x + 96, y + 34, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x7dbe66,
                                                   "23|-9|0xc67c00,45|9|0x568344",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 24, y - 35,
                                             x + 80, y - 5, "DCD7D9,232826", 95)
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
                x, y = findMultiColorInRegionFuzzy(0x987c4c,
                                                   "19|23|0x8d714e,64|38|0xdfb879",
                                                   90, 3, 389, 1127, 614)
                if x > 0 then
                    local numStr = dmOcrText(index_dm_numNumber, x + 20, y - 26,
                                             x + 80, y + 5, "DCD7D9,232826", 95)
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
        tap1(1088, 303, 0xbebebd) -- 关闭
    end
end

-- 种植
function plant()
    tap1(396, 28, 0x77932d) -- 四叶草
    fwCloseView("window1", "more"); -- 关闭文字视图
    fwShowButton("window1", "more", "plantF", "FFFFFF", "306090", "", 4, 0, 0,
                 50, 30);
    mSleep(500)
    -- tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
    for l = 1, 10, 1 do
        if isColor(1088, 46, 0xffffff, 95) then
            break
        else
            tap1(396, 28, 0x77932d) -- 四叶草
        end
        mSleep(1000)
    end
    fwCloseView("window1", "more"); -- 关闭文字视图
    fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50, 30);
    mSleep(500)
    if isColor(262, 128, 0xf0404a, 95) == false then
        tap1(262, 128) -- 种植选项
    end
    -- if check4 ~= "测试" then
    if isZhiDingFruit == false then
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantD", "FFFFFF", "306090", "", 4, 0,
                     0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and
                isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                tap1(723, 106)
            elseif isColor(600, 455, 0x81b95d, 95) and
                isColor(908, 479, 0x6baa4d, 95) then
                debugC("误开对话")
                tap1(600, 455)
            end
            x0, y0 = findMultiColorInRegionFuzzy(0xede9e3, "2|0|0xfcb231", 80,
                                                 496, 320, 1135, 322)
            if x0 > 0 then
                local numStr = dmOcrText(index_dm_numTime, x0 - 500, y0 + 206,
                                         x0 - 500 + 118, y0 + 206 + 29,
                                         "785F5D,25281C", 90)
                debugC("读取结果:" .. numStr)
                mSleep(200)
                local num1, num2 = string.find(numStr, "秒")
                local num3, num4 = string.find(numStr, "小")
                local num5, num6 = string.find(numStr, "分")

                if num1 ~= nil and num3 == nil and num5 == nil then -- 只有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    numStr = tonumber(numStr)
                    debugC("转换结果" .. numStr)
                elseif num1 ~= nil and num3 == nil and num5 ~= nil then -- 有分有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    local data = strSplit(numStr, "分")
                    numStr = tonumber(data[1]) * 60 + tonumber(data[2])
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 == nil then -- 只有分
                    numStr, num = string.gsub(numStr, "分", "")
                    numStr = tonumber(numStr) * 60
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 == nil and num3 ~= nil then -- 只有小时
                    numStr, num = string.gsub(numStr, "小时", "")
                    numStr = tonumber(numStr) * 3600
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 ~= nil then -- 有小时和分
                    numStr, num = string.gsub(numStr, "分", "")
                    local data = strSplit(numStr, "小时")
                    numStr = tonumber(data[1]) * 3600 + tonumber(data[2]) * 60
                    debugC("转换结果" .. numStr)
                end
                timeCollectInterval = numStr
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantC", "FFFFFF", "306090",
                             "", 4, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    bugFor()
                    tap(x0 - 292, y0, {["ms"] = 300})
                    mSleep(1000)
                    if isColor(1089, 47, 0xffffff, 95) == false then
                        break
                    end
                end
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4,
                             0, 0, 50, 30);
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
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50,
                     30);
        mSleep(500)
    else
        if isColor(1, 629, 0x5f5a51, 95) == false then -- 滚动条不在左边
            tap1(1050, 204, 0x89663e) -- sort
            tap1(841, 104, 0xffffff) -- nosort
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantB", "FFFFFF", "306090", "", 4, 0,
                     0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and
                isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                tap1(723, 106)
            end
            if strZhiDingFruit == "番茄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x68a646,
                                                     "-1|15|0xf8b87b,34|19|0xef5138,34|-12|0x75ae4f",
                                                     90, 200, 493, 1122, 544)
                timeCollectInterval = 60
            elseif strZhiDingFruit == "草莓" then
                x0, y0 = findMultiColorInRegionFuzzy(0x307c2d,
                                                     "-9|21|0xe29d4e,36|20|0x3a8636,29|33|0xb81f2a",
                                                     90, 200, 500, 1122, 540)
                timeCollectInterval = 90
            elseif strZhiDingFruit == "向日葵" then
                x0, y0 = findMultiColorInRegionFuzzy(0x99502a,
                                                     "-8|-17|0xf7e683,-1|35|0x4b7e2f",
                                                     90, 200, 492, 1122, 546)
                timeCollectInterval = 60 * 10
            elseif strZhiDingFruit == "葡萄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x58942a,
                                                     "-12|51|0x77337a,23|31|0xeb85eb",
                                                     90, 200, 488, 1122, 549)
                timeCollectInterval = 60 * 110
            elseif strZhiDingFruit == "甘蔗" then
                x0, y0 = findMultiColorInRegionFuzzy(0xecd0bf,
                                                     "-9|51|0x95074e,20|21|0xc2af6f",
                                                     90, 200, 488, 1122, 543)
                timeCollectInterval = 60 * 20
            elseif strZhiDingFruit == "南瓜" then
                x0, y0 = findMultiColorInRegionFuzzy(0x6eb454,
                                                     "-21|19|0xf7ad2a,22|39|0xca5509",
                                                     90, 200, 493, 1122, 545)
                timeCollectInterval = 60 * 3
            elseif strZhiDingFruit == "水稻" then
                x0, y0 = findMultiColorInRegionFuzzy(0x498e40,
                                                     "17|-17|0xf2ac48,30|8|0x5ca454",
                                                     90, 200, 495, 1122, 522)
                timeCollectInterval = 60 * 5
            elseif strZhiDingFruit == "土豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0xbb976b,
                                                     "5|27|0xdfb879,38|41|0xd0ad71",
                                                     90, 200, 491, 1122, 534)
                timeCollectInterval = 60 * 45
            elseif strZhiDingFruit == "丁香" then
                x0, y0 = findMultiColorInRegionFuzzy(0x883969,
                                                     "-36|-25|0x5e9847,9|-2|0x89406d",
                                                     90, 200, 506, 1122, 533)
                timeCollectInterval = 60 * 82
            elseif strZhiDingFruit == "人参" then
                x0, y0 = findMultiColorInRegionFuzzy(0xb52734,
                                                     "26|2|0x446b3d,4|35|0x533842",
                                                     90, 200, 496, 1122, 533)
                timeCollectInterval = 60 * 210
            elseif strZhiDingFruit == "红豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0x543842,
                                                     "-26|-10|0x873436,8|14|0x60292c",
                                                     90, 200, 510, 1122, 536)
                timeCollectInterval = 60 * 75
            elseif strZhiDingFruit == "花生" then
                x0, y0 = findMultiColorInRegionFuzzy(0x804c21,
                                                     "-31|-7|0x533842,19|4|0x77461f,6|-20|0x533842",
                                                     90, 200, 496, 1122, 522)
                timeCollectInterval = 60 * 75
            elseif strZhiDingFruit == "小麦" then
                x0, y0 = findMultiColorInRegionFuzzy(0x5b3d45,
                                                     "11|39|0xc87e03,18|33|0xfdd596",
                                                     90, 200, 486, 1122, 527)
                timeCollectInterval = 45 * 1
            elseif strZhiDingFruit == "萝卜" then
                x0, y0 = findMultiColorInRegionFuzzy(0x285f01,
                                                     "7|0|0x78c05f,18|5|0xbe5600,15|17|0x563a42",
                                                     90, 200, 497, 1122, 516)
                timeCollectInterval = 60 * 75
            elseif strZhiDingFruit == "玉米" then
                x0, y0 = findMultiColorInRegionFuzzy(0x4a5d32,
                                                     "4|26|0xe1852d,10|40|0x284f07,20|10|0x619034",
                                                     90, 200, 504, 1122, 546)
                timeCollectInterval = 60 * 5
            elseif strZhiDingFruit == "包心菜" then
                x0, y0 = findMultiColorInRegionFuzzy(0x6aa73e,
                                                     "30|34|0x96c460,47|17|0x3e693b,30|-7|0x398b02",
                                                     90, 200, 496, 1122, 539)
                timeCollectInterval = 30 * 1
            elseif strZhiDingFruit == "黄豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0x5f8866,
                                                     "10|26|0xdca00b,8|44|0x90c457,14|5|0x609230",
                                                     90, 200, 499, 1122, 545)
                timeCollectInterval = 60 * 20
            elseif strZhiDingFruit == "洋葱" then
                x0, y0 = findMultiColorInRegionFuzzy(0x4f862b,
                                                     "9|-3|0x64b935,10|18|0x947a0f,2|50|0xa45614",
                                                     90, 200, 491, 1122, 546)
                timeCollectInterval = 60 * 25
            elseif strZhiDingFruit == "辣椒" then
                x0, y0 = findMultiColorInRegionFuzzy(0xe23d35,
                                                     "40|-14|0xa42427,39|-30|0x4d7447,19|7|0xfebf72",
                                                     90, 200, 489, 1122, 528)
                timeCollectInterval = 60 * 43
            elseif strZhiDingFruit == "薄荷" then
                x0, y0 = findMultiColorInRegionFuzzy(0x56734e,
                                                     "24|41|0x2d580e,32|47|0x5e8d33,41|42|0x553842",
                                                     90, 200, 489, 1122, 538)
                timeCollectInterval = 60 * 35
            elseif strZhiDingFruit == "薰衣草" then
                x0, y0 = findMultiColorInRegionFuzzy(0x504b72,
                                                     "0|10|0xaf4fed,21|14|0x8136c3,13|20|0x2a520a",
                                                     90, 200, 507, 1122, 529)
                timeCollectInterval = 60 * 135
            elseif strZhiDingFruit == "菠萝" then
                x0, y0 = findMultiColorInRegionFuzzy(0x71904d,
                                                     "20|-3|0x4c6b31,13|18|0xacdb7b,12|29|0xdd9547",
                                                     90, 200, 490, 1122, 524)
                timeCollectInterval = 60 * 287
            elseif strZhiDingFruit == "香草" then
                x0, y0 = findMultiColorInRegionFuzzy(0x505a6c,
                                                     "2|23|0x757f93,9|40|0x533842",
                                                     90, 200, 489, 1122, 531) -- X固定死 Y最小的-1 最大的+1
                timeCollectInterval = 60 * 60
            end
            if x0 > 0 then
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantA", "FFFFFF", "306090",
                             "", 4, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    tap(x0, y0, {["ms"] = 300})
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
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "", 4, 0, 0, 50,
                     30);
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

-- 种植
function plantNew()
    tap1(396, 28, 0x77932d) -- 四叶草
    -- tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
    fwCloseView("window1", "more"); -- 关闭文字视图
    fwShowButton("window1", "more", "plantNewE", "FFFFFF", "306090", "", 12, 0,
                 0, 50, 30);
    mSleep(500)
    for l = 1, 10, 1 do
        bugFor()
        if isColor(1088, 46, 0xffffff, 95) then
            break
        else
            tap1(396, 28, 0x77932d) -- 四叶草
        end
        mSleep(1000)
    end
    if isColor(262, 128, 0xf0404a, 95) == false then
        tap1(262, 128) -- 种植选项
    end
    if isZhiDingFruit == false then
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantNewD", "FFFFFF", "306090", "", 12,
                     0, 0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and
                isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                tap1(723, 106)
            end
            x0, y0 = findMultiColorInRegionFuzzy(0xede9e3, "2|0|0xfcb231", 80,
                                                 496, 320, 1135, 322)
            if x0 > 0 then
                local numStr = dmOcrText(index_dm_numTime, x0 - 500, y0 + 206,
                                         x0 - 500 + 118, y0 + 206 + 29,
                                         "785F5D,25281C", 90)
                debugC("读取结果:" .. numStr)
                mSleep(200)
                local num1, num2 = string.find(numStr, "秒")
                local num3, num4 = string.find(numStr, "小")
                local num5, num6 = string.find(numStr, "分")

                if num1 ~= nil and num3 == nil and num5 == nil then -- 只有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    numStr = tonumber(numStr)
                    debugC("转换结果" .. numStr)
                elseif num1 ~= nil and num3 == nil and num5 ~= nil then -- 有分有秒
                    numStr, num = string.gsub(numStr, "秒", "")
                    local data = strSplit(numStr, "分")
                    numStr = tonumber(data[1]) * 60 + tonumber(data[2])
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 == nil then -- 只有分
                    numStr, num = string.gsub(numStr, "分", "")
                    numStr = tonumber(numStr) * 60
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 == nil and num3 ~= nil then -- 只有小时
                    numStr, num = string.gsub(numStr, "小时", "")
                    numStr = tonumber(numStr) * 3600
                    debugC("转换结果" .. numStr)
                elseif num1 == nil and num5 ~= nil and num3 ~= nil then -- 有小时和分
                    numStr, num = string.gsub(numStr, "分", "")
                    local data = strSplit(numStr, "小时")
                    numStr = tonumber(data[1]) * 3600 + tonumber(data[2]) * 60
                    debugC("转换结果" .. numStr)
                end
                timeCollectInterval = numStr
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantNewC", "FFFFFF", "306090",
                             "", 12, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    bugFor()
                    tap(x0 - 292, y0, {["ms"] = 300})
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
        if isColor(1, 629, 0x5f5a51, 95) == false then -- 滚动条不在左边
            tap1(1050, 204, 0x89663e) -- sort
            tap1(841, 104, 0xffffff) -- nosort
        end
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "plantNewB", "FFFFFF", "306090", "", 12,
                     0, 0, 50, 30);
        mSleep(500)
        for m = 1, 50, 1 do
            bugFor()
            if isColor(723, 106, 0xffffff, 95) and
                isColor(738, 106, 0x73555b, 95) then -- 误开地块详细信息
                tap1(723, 106)
            end
            if strZhiDingFruit == "番茄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x68a646,
                                                     "-1|15|0xf8b87b,34|19|0xef5138,34|-12|0x75ae4f",
                                                     90, 200, 493, 1122, 544)
                timeCollectInterval = 60
            elseif strZhiDingFruit == "草莓" then
                x0, y0 = findMultiColorInRegionFuzzy(0x307c2d,
                                                     "-9|21|0xe29d4e,36|20|0x3a8636,29|33|0xb81f2a",
                                                     90, 200, 500, 1122, 540)
                timeCollectInterval = 90
            elseif strZhiDingFruit == "向日葵" then
                x0, y0 = findMultiColorInRegionFuzzy(0x99502a,
                                                     "-8|-17|0xf7e683,-1|35|0x4b7e2f",
                                                     90, 200, 492, 1122, 546)
                timeCollectInterval = 60 * 10
            elseif strZhiDingFruit == "葡萄" then
                x0, y0 = findMultiColorInRegionFuzzy(0x58942a,
                                                     "-12|51|0x77337a,23|31|0xeb85eb",
                                                     90, 200, 488, 1122, 549)
                timeCollectInterval = 60 * 110
            elseif strZhiDingFruit == "甘蔗" then
                x0, y0 = findMultiColorInRegionFuzzy(0xecd0bf,
                                                     "-9|51|0x95074e,20|21|0xc2af6f",
                                                     90, 200, 488, 1122, 543)
                timeCollectInterval = 60 * 20
            elseif strZhiDingFruit == "南瓜" then
                x0, y0 = findMultiColorInRegionFuzzy(0x6eb454,
                                                     "-21|19|0xf7ad2a,22|39|0xca5509",
                                                     90, 200, 493, 1122, 545)
                timeCollectInterval = 60 * 3
            elseif strZhiDingFruit == "水稻" then
                x0, y0 = findMultiColorInRegionFuzzy(0x498e40,
                                                     "17|-17|0xf2ac48,30|8|0x5ca454",
                                                     90, 200, 495, 1122, 522)
                timeCollectInterval = 60 * 5
            elseif strZhiDingFruit == "土豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0xbb976b,
                                                     "5|27|0xdfb879,38|41|0xd0ad71",
                                                     90, 200, 491, 1122, 534)
                timeCollectInterval = 60 * 45
            elseif strZhiDingFruit == "丁香" then
                x0, y0 = findMultiColorInRegionFuzzy(0x883969,
                                                     "-36|-25|0x5e9847,9|-2|0x89406d",
                                                     90, 200, 506, 1122, 533)
                timeCollectInterval = 60 * 82
            elseif strZhiDingFruit == "人参" then
                x0, y0 = findMultiColorInRegionFuzzy(0xb52734,
                                                     "26|2|0x446b3d,4|35|0x533842",
                                                     90, 200, 496, 1122, 533)
                timeCollectInterval = 60 * 210
            elseif strZhiDingFruit == "红豆" then
                x0, y0 = findMultiColorInRegionFuzzy(0x543842,
                                                     "-26|-10|0x873436,8|14|0x60292c",
                                                     90, 200, 510, 1122, 536)
                timeCollectInterval = 60 * 75
            elseif strZhiDingFruit == "香草" then
                x0, y0 = findMultiColorInRegionFuzzy(0x505a6c,
                                                     "2|23|0x757f93,9|40|0x533842",
                                                     90, 200, 489, 1122, 531)
                timeCollectInterval = 60 * 60
            end
            if x0 > 0 then
                -- luaExit()
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", "plantNewA", "FFFFFF", "306090",
                             "", 12, 0, 0, 50, 30);
                mSleep(500)
                for l = 1, 10, 1 do
                    bugFor()
                    tap(x0, y0, {["ms"] = 300})
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

-- 其它
function other()
    if findHouse() == 0 then
        return
    elseif findHouse() > 0 then
        x, y = findMultiColorInRegionFuzzy(0xd64428,
                                           "6|1|0x46222b,30|-4|0xba8859,36|-13|0xe6e6e6",
                                           90, 86, 96, 1045, 547)
        if x > 0 then
            debugC("援助")
            tap1(x, y)
            timeDecideIsFarm = nowTime
            return
        end
        x, y = findMultiColorInRegionFuzzy(0xd64428,
                                           "6|1|0x46222b,16|28|0xf7dc6d,33|-5|0xc38e5e",
                                           90, 86, 96, 1045, 547)
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
        x, y = findMultiColorInRegionFuzzy(0xffffff,
                                           "-10|-10|0xffffff,9|-10|0xffffff",
                                           100, 86, 96, 1045, 547) -- 气泡
        if x > 0 then
            debugC("气泡")
            tap1(x, y - 90)
            timeDecideIsFarm = nowTime
            return
        end
    end
end

-- 卡循环
function bugFor()
    if isColor(144, 108, 0x9bd124, 95) and isColor(1020, 63, 0x72555a, 95) and
        isColor(1034, 63, 0xffffff, 95) then
        debugC("Notice")
        tap1(1034, 63, 0xffffff)
    end
    if isColor(1088, 141, 0xffffff, 95) and isColor(1101, 141, 0x73555b, 95) then
        -- debugC("右上角X1")
        if isColor(75, 52, 0xea4949, 95) and isColor(426, 26, 0x64434f, 95) and
            isColor(72, 41, 0xea8395, 95) and checkCook == "烹饪" and muBiaoC ==
            "烹饪" then -- 餐厅界面,打勾选烹饪,目标为烹饪
            -- debugC("restaurant")    
        else
            tap1(1088, 141)
        end
    end
    if isColor(1037, 67, 0xffffff, 95) and isColor(1051, 67, 0x73555b, 95) then
        debugC("右上角X2")
        tap1(1037, 67)
    end
end
---------------项目4---------------
function main4()
    -- nowTime1 = os.time();
    nowTime = os.time();

    windowsDecide()
    if isLuaStart == false then
        timeXXX = nowTime
        return
    end
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))
    muBiaoZhuanHuanNewD() -- 公用 必须最优先
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
        debugD("哪个都没开")
        APP.isYiDengLu = 0
        runApp(appXiangMu)
        APP = APP1
        mSleep(5000)
        -- isTapTask = false
        -- writeJson("点任务", isTapTask)
    end
    m_iRunCount = m_iRunCount + 1

    -- autoVpn()
    autoUnlockDevice()
    test()
    checkNet()
    checkDefense()
    zongHe4()
    checkHungry()
    -- zongHe_zj()
    checkRed4()
    -- checkDropline()
    -- zhiYin()
    -- timeJianCe2()

    -- zongHe_Mult()
    -- zongHe_Screen()
    doTarget4()
    -- timeChongZhi()
    -- checkXXX()
    -- everyDayInit()
    -- checkXXX2()
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()
end

function debugD(tiaoShiNeiRong)
    -- wLog("192.168.1.34","#    [LINE]")
    if check1 == "网络调试" then
        wLog("192.168.1.34",
             iphoneId .. " 目标1: " .. muBiaoD1 .. " 目标2: " .. muBiaoD2 ..
                 " 目标3: " .. muBiaoD3 .. " 目标4: " .. muBiaoD4 ..
                 "    操作:" .. tiaoShiNeiRong .. "   #" .. xiangMu ..
                 "#   [DATE]" .. "#    [LINE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast("目标1: " .. muBiaoD1 .. " 目标2: " .. muBiaoD2 ..
                  " 目标3: " .. muBiaoD3 .. " 目标4: " .. muBiaoD4 ..
                  "                操作:" .. tiaoShiNeiRong)
        mSleep(3000)
    end
end
-- 目标转换--新D
function muBiaoZhuanHuanNewD(...)
    if muBiaoD4 ~= "" and muBiaoD4 ~= "无" then
        muBiaoD = muBiaoD4
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoD3 ~= "" and muBiaoD3 ~= "无" then
        muBiaoD = muBiaoD3
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoD2 ~= "" and muBiaoD2 ~= "无" then
        muBiaoD = muBiaoD2
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiaoD1 ~= "" and muBiaoD1 ~= "无" then
        muBiaoD = muBiaoD1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    else
        debugD("目标空")
        muBiaoD1 = ""
        muBiaoD = muBiaoD1
        writeConfigNew("muBiaoD1", muBiaoD1)
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    end

end

-- 改目标--新D
function gaiMuBiaoNewD(cs_num, cs_muBiao, ...)
    if cs_num == 1 then
        muBiaoD1 = cs_muBiao
        writeConfigNew("muBiaoD1", cs_muBiao)
        muBiaoZhuanHuanNewD()
        writeJson("目标D1", cs_muBiao)
    elseif cs_num == 2 then
        muBiaoD2 = cs_muBiao
        writeConfigNew("muBiaoD2", cs_muBiao)
        muBiaoZhuanHuanNewD()
        writeJson("目标D2", cs_muBiao)
    elseif cs_num == 3 then
        muBiaoD3 = cs_muBiao
        writeConfigNew("muBiaoD3", cs_muBiao)
        muBiaoZhuanHuanNewD()
        writeJson("目标D3", cs_muBiao)
    elseif cs_num == 4 then
        muBiaoD4 = cs_muBiao
        writeConfigNew("muBiaoD4", cs_muBiao)
        muBiaoZhuanHuanNewD()
        writeJson("目标D4", cs_muBiao)
    end
end
-- doTarget4
function doTarget4()
    if muBiaoD == "" then
        if numHaoLV_D == "小号" then
            gaiMuBiaoNewD(1, "主线")
        elseif numHaoLV_D == "成品号" then
            gaiMuBiaoNewD(1, "主线")
        elseif numHaoLV_D == "大号" then
            debugD("大号刷目标为挂机")
            gaiMuBiaoNewD(1, "挂机")
        end
    elseif muBiaoD == "挂机" then
        checkBackpack()
        findMonster()
    elseif muBiaoD == "跑图" then
        if map1 == "1" then
            runMap1()
        elseif map2 == "2" then
            runMap2()
        elseif map3 == "3" then
            runMap3()
        end
    elseif muBiaoD == "回城" then
        goHome()
    elseif muBiaoD == "sell" then
        sellD()
    elseif muBiaoD == "unsell" then
        unSell()
    elseif muBiaoD == "selling" then
        selling()
    elseif muBiaoD == "自杀" then
        killMyself()
    end
    -- debug("目标："..muBiao)
end

function zongHe4()
    if fightMenu() and muBiaoD == "挂机" then
        if check_skill_up == "技能上" and isColor(807, 467, 0xd8d5d0, 95) and
            isColor(807, 490, 0xbb8939, 95) then
            debugD("释放技能上")
            -- local temStr = ocrText(998, 237, 1071, 257, 0, "()0123456789,")
            -- debugD(temStr)
            if isColor(350, 62, 0x44bcf4, 95) == false and
                isColor(128, 89, 0x15b235, 80) and
                isColor(667, 113, 0x383421, 95) == false then
                debugD("血不足,放弃释放技能")
            else
                if check_monster0 == "任意怪" then
                    tap1(807, 483)
                    mSleep(7000)
                end
                if check_monster1 == "夏洛特花" then
                    if isColor(1038, 556, 0xa7a6a6, 95) and
                        isColor(1084, 556, 0xbbb9b9, 95) then
                        tap1(807, 483)
                        mSleep(7000)
                    end
                end
                if check_monster2 == "燃火兽" then
                    if isColor(1034, 556, 0x999898, 95) and
                        isColor(1018, 556, 0xb4b4b4, 95) then
                        tap1(807, 483)
                        mSleep(7000)
                    elseif isColor(1025, 556, 0x9d9793, 95) and
                        isColor(1039, 560, 0x968885, 95) then
                        tap1(807, 483)
                        mSleep(7000)
                    end
                end
                if check_monster3 == "陨石幽鬼" then
                    if isColor(1025, 557, 0xa5a2a2, 95) and
                        isColor(1040, 554, 0x787574, 95) then
                        tap1(807, 483)
                        mSleep(7000)
                    end
                end
            end
        elseif check_skill_left == "左" and isColor(748, 516, 0xfffdfe, 95) and
            isColor(759, 522, 0xe4406b, 95) then
            debugD("释放技能左")
            -- local temStr = ocrText(998, 237, 1071, 257, 0, "()0123456789,")
            -- debugD(temStr)
            if isColor(350, 62, 0x44bcf4, 95) == false and
                isColor(128, 89, 0x15b235, 80) and
                isColor(667, 113, 0x383421, 95) == false then
                debugD("血不足,放弃释放技能")
            else
                if check_monster0 == "任意怪" then
                    tap1(748, 516)
                    mSleep(8000)
                end
                if check_monster1 == "夏洛特花" then
                    if isColor(1038, 556, 0xa7a6a6, 95) and
                        isColor(1084, 556, 0xbbb9b9, 95) then
                        tap1(748, 516)
                        mSleep(8000)
                    end
                end
                if check_monster2 == "燃火兽" then
                    if isColor(1034, 556, 0x999898, 95) and
                        isColor(1018, 556, 0xb4b4b4, 95) then
                        tap1(748, 516)
                        mSleep(8000)
                    elseif isColor(1025, 556, 0x9d9793, 95) and
                        isColor(1039, 560, 0x968885, 95) then
                        tap1(748, 516)
                        mSleep(8000)
                    end
                end
                if check_monster3 == "陨石幽鬼" then
                    if isColor(1025, 557, 0xa5a2a2, 95) and
                        isColor(1040, 554, 0x787574, 95) then
                        tap1(748, 516)
                        mSleep(8000)
                    end
                end
            end
        elseif check_skill_right == "右" and isColor(861, 525, 0xfcfbf4, 95) and
            isColor(862, 517, 0xfbf2ce, 95) then
            debugD("释放技能右")
            -- local temStr = ocrText(998, 237, 1071, 257, 0, "()0123456789,")
            -- debugD(temStr)
            if isColor(350, 62, 0x44bcf4, 95) == false and
                isColor(128, 89, 0x15b235, 80) and
                isColor(667, 113, 0x383421, 95) == false then
                debugD("血不足,放弃释放技能")
            else
                if check_monster0 == "任意怪" then
                    tap1(861, 525)
                    mSleep(8000)
                end
                if check_monster1 == "夏洛特花" then
                    if isColor(1038, 556, 0xa7a6a6, 95) and
                        isColor(1084, 556, 0xbbb9b9, 95) then
                        tap1(861, 525)
                        mSleep(8000)
                    end
                end
                if check_monster2 == "燃火兽" then
                    if isColor(1034, 556, 0x999898, 95) and
                        isColor(1018, 556, 0xb4b4b4, 95) then
                        tap1(861, 525)
                        mSleep(8000)
                    elseif isColor(1025, 556, 0x9d9793, 95) and
                        isColor(1039, 560, 0x968885, 95) then
                        tap1(861, 525)
                        mSleep(8000)
                    end
                end
                if check_monster3 == "陨石幽鬼" then
                    if isColor(1025, 557, 0xa5a2a2, 95) and
                        isColor(1040, 554, 0x787574, 95) then
                        tap1(861, 525)
                        mSleep(8000)
                    end
                end
            end
        end
    end
    if isColor(414, 227, 0xecad3f, 95) and isColor(725, 416, 0xe3bc5e, 95) and
        isColor(724, 224, 0x906926, 95) then
        debugD("继续游戏")
        tap1(654, 359)
    end
    if isColor(376, 72, 0xa9a099, 95) and isColor(613, 73, 0xa8a098, 95) and
        isColor(762, 47, 0x004466, 95) then
        debugD("请求任务")
        tap1(762, 47)
    end
    if isColor(48, 95, 0xf8e656, 95) and isColor(1078, 508, 0xbb3021, 95) and
        isColor(516, 79, 0xdeb337, 95) then
        debugD("章节选择")
        tap1(1072, 75)
    end
    if isColor(184, 87, 0xffffff, 95) and isColor(1028, 146, 0x302b28, 95) and
        isColor(348, 90, 0xffffff, 95) and isColor(982, 99, 0xeeeeee, 95) then
        debugD("来自运营的通知")
        tap1(982, 99)
    end
    if isColor(487, 131, 0xd7d6d6, 95) and isColor(496, 137, 0x13110a, 95) and
        isColor(512, 141, 0x525150, 95) then
        debugD("您已力竭倒下")
        tap1(566, 333)
    end
    if isColor(487, 219, 0xd6d6d6, 95) and isColor(496, 229, 0x090805, 95) and
        isColor(512, 228, 0x515150, 95) then
        debugD("您已力竭倒下2")
        tap1(546, 313)
    end
    if isColor(503, 49, 0xfbedc8, 95) and isColor(860, 562, 0x8f6d29, 95) and
        isColor(577, 72, 0xe3bf71, 95) and isColor(492, 438, 0x783d13, 95) then
        debugD("我同意确认以上内容")
        tap1(741, 338)
    end
    if isColor(503, 49, 0xfbedc8, 95) and isColor(860, 562, 0x8f6d29, 95) and
        isColor(577, 72, 0xe3bf71, 95) and isColor(455, 437, 0xf17c26, 95) then
        debugD("返回安全的场所")
        if muBiaoD == "自杀" then gaiMuBiaoNewD(2, "sell") end
        tap1(445, 460)
        mSleep(2000)
    end
    if isColor(36, 36, 0xcba46c, 95) and isColor(303, 546, 0xd88d20, 95) and
        isColor(61, 543, 0xff0404, 95) then
        debugD("出发")
        tap1(925, 552)
    end
    if isColor(302, 272, 0xd2c38a, 95) and isColor(840, 359, 0x7e6f49, 95) and
        isColor(785, 323, 0x352210, 95) then
        debugD("无法与游戏服务器通信")
        tap1(596, 353)
    end
    if isColor(912, 35, 0x1a1613, 95) and isColor(949, 51, 0x0d0b09, 95) and
        isColor(782, 480, 0xe2e2e2, 95) and isColor(1064, 45, 0xf0f0f0, 95) then
        debugD("菜单")
        tap1(1064, 44)
    end
    if isColor(295, 88, 0xe3bf71, 95) and isColor(477, 54, 0x640f33, 95) and
        isColor(808, 125, 0x0d466f, 95) then
        debugD("操作回顾")
        tap1(808, 125)
    end
    if fightMenu() and muBiaoD == "挂机" and isColor(540, 516, 0xf7fcfc, 95) and
        isColor(540, 520, 0x7ee189, 95) and isColor(137, 134, 0x7ee191, 95) ==
        false and isColor(137, 132, 0xecf6f5, 95) == false and
        isColor(158, 135, 0x80d4a6, 95) == false and
        isColor(158, 128, 0x7fb191, 95) == false then
        debugD("回蓝")
        if isColor(667, 113, 0x383421, 95) and isColor(667, 122, 0x8a2626, 95) then -- 有目标

        else
            tap1(540, 516)
            mSleep(4000)
        end
    end
    if fightMenu() and muBiaoD == "挂机" and isColor(350, 62, 0x44bcf4, 95) ==
        false and isColor(128, 89, 0x15b235, 80) then
        debugD("回血")
        if isColor(667, 113, 0x383421, 95) and isColor(667, 122, 0x8a2626, 95) then -- 有目标
            if isColor(125, 67, 0xfd3333, 95) or isColor(127, 67, 0xb68300, 95) then -- 红血了或黄了
                tap1(594, 477)
            end
        else
            tap1(594, 477)
            mSleep(4000)
        end
    end
    if isColor(667, 114, 0x2d2b1b, 95) and isColor(659, 113, 0x7c342b, 95) and
        isColor(514, 90, 0xffcb26, 95) then
        debugD("怪物跑远了")
        tap1(667, 114)
    end
end

function checkRed4() end

-- 战斗界面
function fightMenu()
    if isColor(1004, 50, 0x008cb0, 95) and isColor(1021, 36, 0x057f63, 95) and
        isColor(1013, 36, 0xffef09, 95) then return true end
end

function findMonster()
    if fightMenu() then
        debugD("找怪")
        if isColor(667, 113, 0x383421, 95) and isColor(667, 122, 0x8b2726, 95) then
            debugD("有怪物目标")
        elseif isColor(350, 62, 0x44bcf4, 95) == false and
            isColor(128, 89, 0x15b235, 80) then
            debugD("血不满,不找怪")
        elseif (isColor(173,66,0x356ef8,80)==false and isColor(173,66,0xcd9d00,80)==false) or isColor(151,88,0x24bc3f,80)==false then
            debugD("血低或者蓝不足,不找怪")
        elseif numFangXiang == 1 then
            numPathStep = numPathStep + 1
            if numPathStep > upDown then
                numFangXiang = 2
                numPathStep = 0
            else
                up()
            end
            mSleep(1000)
        elseif numFangXiang == 2 then
            numPathStep = numPathStep + 1
            if numPathStep > upDown then
                numFangXiang = 3
                numPathStep = 0
            else
                down()
            end
            mSleep(1000)
        elseif numFangXiang == 3 then
            numPathStep = numPathStep + 1
            if numPathStep > leftRight then
                numFangXiang = 4
                numPathStep = 0
            else
                left()
            end
            mSleep(1000)
        elseif numFangXiang == 4 then
            numPathStep = numPathStep + 1
            if numPathStep > leftRight then
                numFangXiang = 1
                numPathStep = 0
            else
                right()
            end
            mSleep(1000)
        end
    end
end

mSleep(1000)
function up()
    -- local color1 = getColor(1054,150)
    -- local color2 = getColor(991,190)
    -- for i = 1, 10, 1 do
    --     moveTo(221, 343, 221, 343 - 100,
    --            {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    --     mSleep(1000)
    --     local color3 = getColor(1054,150)
    --     local color4 = getColor(991,190)
    -- if color1 ~= color3  or color2 ~= color4 then break end
    -- end
    moveTo(221, 343, 221, 343 - 100,
           {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    mSleep(300)
end

function down()
    -- local color1 = getColor(1054,150)
    -- local color2 = getColor(991,190)
    -- for i = 1, 10, 1 do
    --     moveTo(221, 343, 221, 343 + 100,
    --            {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    --     mSleep(1000)
    --     local color3 = getColor(1054,150)
    --     local color4 = getColor(991,190)
    -- if color1 ~= color3  or color2 ~= color4 then break end
    -- end
    moveTo(221, 343, 221, 343 + 100,
           {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    mSleep(300)
end

function left()
    -- local color1 = getColor(1054,150)
    -- local color2 = getColor(991,190)
    -- for i = 1, 10, 1 do
    --     moveTo(221, 343, 221 - 100, 343,
    --            {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    --     mSleep(1000)
    --     local color3 = getColor(1054,150)
    --     local color4 = getColor(991,190)
    -- if color1 ~= color3  or color2 ~= color4 then break end
    -- end
    moveTo(221, 343, 221 - 100, 343,
           {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    mSleep(300)
end

function right()
    -- local color1 = getColor(1054,150)
    -- local color2 = getColor(991,190)
    -- for i = 1, 10, 1 do
    --     moveTo(221, 343, 221 + 100, 343,
    --            {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    --     mSleep(1000)
    --     local color3 = getColor(1054,150)
    --     local color4 = getColor(991,190)
    -- if color1 ~= color3  or color2 ~= color4 then break end
    -- end
    moveTo(221, 343, 221 + 100, 343,
           {["step"] = 20, ["ms"] = 300, ["index"] = 5, ["stop"] = 1})
    mSleep(300)
end

function runMap1()
    if fightMenu() and isColor(1084, 389, 0xffffff, 95) then
        tap1(1077, 386)
        mSleep(2000)
        tap1(1077, 386)

        left()
        tap1(1077, 386)
        mSleep(2000)
        tap1(1077, 386)

        up()
        tap1(1077, 386)
        mSleep(5000)
        tap1(1077, 386)

        -- for i = 1, 5, 1 do
        --     up()
        --     up()
        --     left()
        -- end
        -- for i = 1, 4, 1 do left() end
        -- for i = 1, 25, 1 do up() end
        -- for i = 1, 16, 1 do left() end
        -- for i = 1, 12, 1 do up() end
        -- for i = 1, 1, 1 do right() end

        lua_exit()
    end
end
function runMap2()
    if fightMenu() and isColor(1084, 389, 0xffffff, 95) then
        tap1(1077, 386)
        mSleep(5300)
        tap1(1077, 386)

        left()
        tap1(1077, 386)
        mSleep(7000)
        tap1(1077, 386)

        up()
        tap1(1077, 386)
        mSleep(3750)
        tap1(1077, 386)

        left()
        tap1(1077, 386)
        mSleep(19000)
        tap1(1077, 386)

        up()
        tap1(1077, 386)
        mSleep(8500)
        tap1(1077, 386)

        left()
        tap1(1077, 386)
        mSleep(9000)
        tap1(1077, 386)


        moveTowards(221, 343,45,300,10);--(起点x,起点y,角度,长度,滑动速度小于50);   

        lua_exit()
    end
end

function goHome()
    if fightMenu() then

        for i = 1, 1, 1 do left() end
        for i = 1, 12, 1 do down() end
        for i = 1, 16, 1 do right() end
        for i = 1, 23, 1 do down() end
        for i = 1, 4, 1 do right() end
        for i = 1, 5, 1 do
            right()
            down()
            down()
        end
        lua_exit()

    end
end

function sellD()
    if fightMenu() then
        if isColor(1057, 509, 0xdb1b07, 95) and isColor(1053, 544, 0xffffff, 95) then
            debugD("npc对话按钮")
            gaiMuBiaoNewD(2, "selling")
        else
            runMap1()
            for i = 1, 5, 1 do right() end
            for i = 1, 22, 1 do up() end
            for i = 1, 3, 1 do right() end
            lua_exit()
        end

    end
end

function unSell()
    if fightMenu() then
        for i = 1, 3, 1 do left() end
        for i = 1, 22, 1 do down() end
        for i = 1, 5, 1 do left() end
        goHome()
        lua_exit()

    end

end
function selling()
    if isColor(1057, 509, 0xdb1b07, 95) and isColor(1053, 544, 0xffffff, 95) then
        debugD("npc对话按钮")
        tap1(1057, 509, 0xdb1b07)
        mSleep(2000)
        for i = 1, 30, 1 do
            if isColor(253, 528, 0xeab773, 95) and
                isColor(882, 585, 0xdaa752, 95) then
                debugD("对话框1")
                tap1(562, 552, 0x31312c)
            end
            if isColor(253, 483, 0xe4b15c, 95) and
                isColor(882, 490, 0xdaa752, 95) then
                debugD("对话框2")
                tap1(562, 552, 0x31312c)
            end
            if isColor(270, 503, 0x806e59, 95) and
                isColor(866, 545, 0x7e6b57, 95) then
                debugD("对话框3")
                tap1(562, 552, 0x31312c)
            end
            mSleep(1000)
            if isColor(114, 260, 0xf5eedb, 95) and
                isColor(408, 505, 0xfbeccd, 95) then
                debugD("药品商人--选择框")
                tap1(251, 257, 0xfffef3)
                break
            end
        end
        for i = 1, 30, 1 do
            if isColor(85, 405, 0xfbeccd, 95) and
                isColor(403, 488, 0xfbeccd, 95) then
                debugD("出售")
                tap1(248, 392, 0xe8e7dd)
                mSleep(1000)
                break
            end
            mSleep(1000)
        end
        for i = 1, 30, 1 do
            if isColor(762, 306, 0xad926e, 95) and
                isColor(963, 453, 0x1f1912, 95) then
                debugD("出售界面")
                if isColor(286, 119, 0xc4c4c4, 95) then
                    tap1(286, 119)
                end
                break
            end
            mSleep(1000)
        end
        for i = 1, 5, 1 do
            if isColor(508, 195, 0xffffff, 95) then
                tap1(508, 195)
                sellingExp2()
            end
            if isColor(506, 270, 0xffffff, 95) then
                tap1(508, 270)
                sellingExp2()
            end
            if isColor(505, 347, 0xffffff, 95) then
                tap1(508, 347)
                sellingExp2()
            end
            if isColor(507, 426, 0xffffff, 95) then
                tap1(508, 426)
                sellingExp2()
            end
            if isColor(506, 499, 0xffffff, 95) then
                tap1(508, 499)
                sellingExp2()
            end
            if isColor(975, 565, 0xdaac5d, 95) and
                isColor(507, 195, 0x85d800, 95) then
                debugD("出售按钮--亮了")
                tap1(975, 565, 0xdaac5d) -- 出售
                tap1(641, 477, 0xb5d456) -- 确定
                mSleep(1000)
                for j = 1, 30, 1 do
                    if isColor(514, 423, 0xdaac5d, 95) then
                        tap1(516, 423, 0x267f91) -- 确定
                        break
                    end
                    mSleep(1000)
                end
            else
                tap1(1069, 73, 0xf0f0f0) -- 关闭
                mSleep(1000)
                tap1(204, 471, 0xfffef3) -- 放弃
                break
            end
            mSleep(1000)
        end
        lua_exit()
    end
end
function sellingExp1()
    if isColor(600, 492, 0xaccf41, 95) and isColor(525, 491, 0xbf5d53, 95) then
        debugD("复数")
        x, y = findMultiColorInRegionFuzzy(0xfefefe,
                                           "-7|0|0x1f1912,8|0|0x1f1912", 90,
                                           445, 359, 688, 361)
        if x > 0 then touchMoveXY(x, 360, 677 + 100, 360) end
        -- touchMoveXY(483, 360, 677 + 100, 360)
        mSleep(500)
        tap1(644, 474, 0xc4dd78) -- 决定
        mSleep(500)
    end
end
function sellingExp2()
    if isColor(528, 433, 0xbf5d53, 95) and isColor(602, 429, 0xaccf41, 95) then
        debugD("复数")
        x, y = findMultiColorInRegionFuzzy(0xffffff,
                                           "-5|0|0x1f1912,5|0|0x1f1912", 90,
                                           478, 346, 656, 348)
        if x > 0 then touchMoveXY(x, 347, 656, 347) end
        -- touchMoveXY(483, 360, 677 + 100, 360)
        mSleep(500)
        tap1(619, 420, 0xc5dd7a) -- 决定
        mSleep(500)
    end
end

-- 检查背包
function checkBackpack()
    if muBiaoD == "挂机" and nowTime - timeCheckBackpack >= 10 * 60 and
        isColor(385, 67, 0x385ee1, 95) then
        timeCheckBackpack = nowTime
        debugD("检查背包--打开背包")
        tap1(972, 507, 0x5f5e5a)
        mSleep(1000)
        if isColor(69, 72, 0xf2f2f2, 95) then
            debugD("背包已打开")
            if isColor(269, 125, 0xceccc8, 95) then
                tap1(226, 131, 0x2f2820) -- 排序
            end
            local temStr1 = ocrText(393, 208, 472, 229, 0, "0123456789/")
            local temStr2 = ocrText(393, 277, 472, 300, 0, "0123456789/")
            local temStr3 = ocrText(393, 348, 472, 372, 0, "0123456789/")
            local temStr4 = ocrText(393, 420, 472, 445, 0, "0123456789/")
            local temStr5 = ocrText(393, 488, 472, 516, 0, "0123456789/")
            debugD("数量:" .. temStr1 .. "  " .. temStr2 .. "  " .. temStr3 ..
                       "  " .. temStr4 .. "  " .. temStr5 .. "  ")
            local num1, num2 = string.find(temStr1, "/")
            if num1 == nil then temStr1 = "0/1" end
            num1, num2 = string.find(temStr2, "/")
            if num1 == nil then temStr2 = "0/1" end
            num1, num2 = string.find(temStr3, "/")
            if num1 == nil then temStr3 = "0/1" end
            num1, num2 = string.find(temStr4, "/")
            if num1 == nil then temStr4 = "0/1" end
            num1, num2 = string.find(temStr5, "/")
            if num1 == nil then temStr5 = "0/1" end
            local newStr1 = temStr1:split("/")
            local newStr2 = temStr2:split("/")
            local newStr3 = temStr3:split("/")
            local newStr4 = temStr4:split("/")
            local newStr5 = temStr5:split("/")
            debugD("分母:" .. newStr1[2] .. "  " .. newStr2[2] .. "  " ..
                       newStr3[2] .. "  " .. newStr4[2] .. "  " .. newStr5[2] ..
                       "  ")
            newStr1[1] = tonumber(newStr1[1])
            newStr1[2] = tonumber(newStr1[2])
            newStr2[1] = tonumber(newStr2[1])
            newStr2[2] = tonumber(newStr2[2])
            newStr3[1] = tonumber(newStr3[1])
            newStr3[2] = tonumber(newStr3[2])
            newStr4[1] = tonumber(newStr4[1])
            newStr4[2] = tonumber(newStr4[2])
            newStr5[1] = tonumber(newStr5[1])
            newStr5[2] = tonumber(newStr5[2])

            if newStr1[2] > 10 and newStr1[2] < 100 and newStr1[1] / newStr1[2] >=
                0.8 then
                debugD("去卖1")
                vibratorNotice()
                -- gaiMuBiaoNewD(2, "自杀")
            end
            if newStr2[2] > 10 and newStr2[2] < 100 and newStr2[1] / newStr2[2] >=
                0.8 then
                debugD("去卖2")
                vibratorNotice()
                -- gaiMuBiaoNewD(2, "自杀")
            end
            if newStr3[2] > 10 and newStr3[2] < 100 and newStr3[1] / newStr3[2] >=
                0.8 then
                debugD("去卖3")
                vibratorNotice()
                -- gaiMuBiaoNewD(2, "自杀")
            end
            if newStr4[2] > 10 and newStr4[2] < 100 and newStr4[1] / newStr4[2] >=
                0.8 then
                debugD("去卖4")
                vibratorNotice()
                -- gaiMuBiaoNewD(2, "自杀")
            end
            if newStr5[2] > 10 and newStr5[2] < 100 and newStr5[1] / newStr5[2] >=
                0.8 then
                debugD("去卖5")
                -- gaiMuBiaoNewD(2, "自杀")
                vibratorNotice()
            end
            tap1(1071, 73, 0xf0f0f0) -- 关闭
        end
    end
end
-- 自杀
function killMyself()
    if fightMenu() then
        findMonster()
        tap1(859, 524, 0xfbe8ad)
    end
end
-- 自定义找多图
function findImages(picpath, degree, x1, y1, x2, y2, alpha, kind)
    local newPicpath = picpath:split(",") -- 将字符串 str 按照 `,`，分割并返回一个 table
    for i = 1, #newPicpath, 1 do
        x, y = findImageInRegionFuzzy(newPicpath[i], degree, x1, y1, x2, y2,
                                      alpha, kind);
        if x > 0 then return x, y, newPicpath[i] end
    end
    return 0, 0, ""
end
-- 检测饥饿度
function checkHungry()
    if check_hungry == "饥饿" and nowTime - timeHungry >= 2000 then
        if fightMenu() and muBiaoD == "挂机" and
            isColor(201, 88, 0x24bc3f, 95) == false and
            isColor(136, 136, 0xe1b517, 95) == false and
            isColor(158, 136, 0xe9c224, 95) == false and
            isColor(179, 136, 0xe4ba1c, 95) == false then
            debugD("吃一个食物")
            tap1(596, 559, 0xdfeaeb)
            timeHungry = nowTime
            mSleep(1000)
        end
    end
end
-- 检测网络
function checkNet()
    if nowTime - timeCheckNet >= 10 * 60 and fightMenu() then
        debugD("检测网络")
        tap1(970, 509, 0xfafafa)
        mSleep(1000)
        if isColor(69, 73, 0xf0f0f0, 95) then -- 背包已打开
            timeCheckNet = nowTime
            tap1(1071, 73, 0xf0f0f0) -- 关闭
            mSleep(1000)
        else
            if whoAmI() ~= 4 then
                os.execute(
                    "chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
            end
            mSleep(1000)
            respring()
            mSleep(10000)
            if whoAmI() ~= 4 then
                os.execute(
                    "chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
            end
            mSleep(1000)
        end
    end
    if nowTime - timeCheckNet >= 20 * 60 then
        closeApp(appXiangMu)
        timeCheckNet = nowTime
    end
end
-- 检测活性防御
function checkDefense()
    if fightMenu() and muBiaoD == "挂机" and isColor(135, 128, 0xb77325, 95) ==
        false and isColor(138, 132, 0x975d13, 95) == false and
        isColor(157, 128, 0xb4721b, 95) == false and
        isColor(160, 132, 0x9e651d, 95) == false and
        isColor(178, 128, 0xb5701e, 95) == false and
        isColor(181, 132, 0x9a6118, 95) == false then
        if isColor(647, 509, 0x7a3d00, 95) then -- 防御技能激活着
            tap1(647, 509)
        end
    end
end
-- test
function test()
    if check4 == "测试" and isTest == false then
        isTest = true
        os.execute("killall -9 SpringBoard");
        -- lua_exit()
    end
end
