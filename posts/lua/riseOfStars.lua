numLua = 20.8
toast("在线版本:" .. numLua)
local image_tsing = require("tsimg")
appXiangMu1 = "com.wemademax.riseofstars"
appXiangMu3 = "com.wemadeconnect.etgnft.everytown"


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

    isPirateSub = true --海盗减号
    isKaSearch = false -- 卡搜索
    isBuyLiZi = true -- 买粒子
    isLiZi = false -- 粒子
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
    isZhiDingFruit = false --指定种植水果

    strZhiDingFruit = ""

    timeTap = nowTime
    timeXiangMu3 = nowTime + 60 * 60 * 24 --项目1已闲置时间
    timeTree = nowTime --果树收割间隔
    timeDesk = nowTime --返回桌面
    timeDecideIsFarm = nowTime --决定是否判定是农场

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
        "check7,check8,check9,check10,check11,check12,check13,check14,check15,check16,check17,check18,check19,check20,check21,check22,check23,check24,check25"
        ,
        "联盟任务,大号,成品号,小号,不生产,不挖粒子,抢粒子,研究,生产加速,vip8,强制金属,强制矿物,强制氯气,2级粒子,自动切换梯子,活动,60海盗,买钛,库存"
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
    UICheck(4, "Ccheck1,Ccheck2", "4排为树,占位2", "0", -1, 0, "", 1, 3) -- 多选1
    UICheck(4, "checkGuoShi,checkTomato,checkCaoMei,checkSunflower", "检查果实,番茄,草莓,向日葵", "0", -1, 0,
        "", 0, 3) -- 多选1
    -- UIEdit(4, "rangeX1", "X1", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeY1", "Y1", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeX2", "X2", "", 15, "left", "95,158,160", "number", 120, 1) -- 编辑框
    -- UIEdit(4, "rangeY2", "Y2", "", 15, "left", "95,158,160", "number", 120, 0) -- 编辑框
    UIEdit(4, "farmLong", "边", "", 15, "left", "95,158,160", "number", 120, 0) -- 编辑框
    UILabel(4, "目标1 无,挂机", 10, "left",
        "72,61,139", -1, 0, "center") -- 标签
    UIEdit(4, "muBiaoC1", "目标1", "", 15, "left", "95,158,160", "default", 0, 0) -- 编辑框
    UILabel(4, "目标2 无,种植,等待收割", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(4, "muBiaoC2", "目标2", "", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(4, "目标3 无", 10, "left", "72,61,139"
        , -1, 0, "center")
    UIEdit(4, "muBiaoC3", "目标3", "", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(4, "目标4 无", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(4, "muBiaoC4", "目标4", "", 15, "left", "95,158,160", "default", 0, 0)
    UIShow()

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
            writeConfigNew("muBiaoA1", "天下")
            lua_exit()
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
    debugA(nowTime)
    if inside1() then
        if isColor(33, 493, 0xffffff, 95) and isColor(21, 474, 0x5ea7e8, 95) then
            debugA("free")
            tap1(33, 493)
        end
    end
    if isColor(454, 585, 0x284b73, 95) and isColor(477, 607, 0x284b73, 95) and isColor(911, 589, 0x3e5c7f, 95) then
        debugA("今天不再观看")
        tap1(911, 589, 0x3e5c7f)
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
            tap1(510, 592, 0x0c0c0e) --关闭
            isLiZi = true -- 粒子
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
    if isColor(158, 328, 0xf57508, 95) and isColor(771, 599, 0xf57508, 95) and isColor(561, 439, 0xf1fc6a, 95) then
        debugA("基地加成")
        if muBiaoA == mb_CaiJi then
            tap1(561, 439)
        else
            tap1(20, 20)
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
    if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        debugA("100 vip点数 单数")
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
        elseif check25 == "库存" and isColor(953, 303, 0x306090, 95) then
            debugA("机库--休息中")
            tap1(982, 276, 0x306090)
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
        x, y = findColorInRegionFuzzy(0x145e99, 100, 857, 133, 857, 539);
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
            x, y = findColorInRegionFuzzy(0x145e99, 100, 972, 145, 972, 587);
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
            x, y = findColorInRegionFuzzy(0x116eb9, 100, 196, 338, 664, 602)
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
            -- x, y = findColorInRegionFuzzy(0x116eb9, 100, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     tap1(x, y)
            -- else
            --     tap1(20, 20)
            -- end
            tap1(20, 20)
            -- timeRed = nowTime
        elseif isColor(396, 339, 0x1b7b55, 95) and isColor(247, 400, 0x7d8a96, 95) then
            debugA("航母活动--向上移位置了--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 100, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     tap1(x, y)
            -- else
            --     tap1(20, 20)
            -- end
            tap1(20, 20)
            -- timeRed = nowTime
        else
            x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0x1a293c", 90, 128, 95, 131, 590)
            if x ~= -1 then
                tap1(x, y)
            else
                tap1(20, 20)
            end
        end
    end
    if isColor(312, 77, 0xf5a801, 95) and isColor(308, 98, 0x0b4992, 95) and isColor(457, 438, 0xf27d00, 95) and
        isColor(511, 504, 0x1d6dba, 95) then
        debugA("道具信息--复数--使用")
        if muBiaoA == mb_5DaoJu then
            tap1(458, 438, 0xf27c00) -- 1个 
            tap1(511, 504)
            if num5DaoJu >= 5 then
                gaiMuBiaoNewA(2, "道具合成")
            end
        else
            if isColor(571, 191, 0x9fa0a0, 95) then -- 灰色全用
                tap1(511, 504)
            else -- 其它用一半
                tap1(570, 435)
                tap1(511, 504)
                mSleep(2000)
            end
        end
    end
    if isColor(312, 116, 0xf5a801, 95) and isColor(307, 127, 0xe0e0e0, 95) and isColor(486, 436, 0x114c8a, 95) and
        isColor(490, 455, 0x1c6ebb, 95) then
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
            if haoLV >= 3 and isTrade == false and isColor(42, 331, 0xd769c2, 95) then
                debugA("点击交易所")
                tap1(42, 331)
                return
            elseif haoLV >= 3 and isCheckLiZiNum == false and isColor(42, 331, 0xd769c2, 95) then
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
        elseif isColor(42, 331, 0xd769c2, 95) and isColor(48, 296, 0xffffff, 95) then
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
            if isColor(505, 110, 0x3e6b96, 95) == false then
                debugA("无航母")
                tap1(20, 20)
                if muBiaoA == mb_FixShip then
                    gaiMuBiaoNewA(3, "", mm_Wu)
                end
                return
            end
            if isColor(505, 110, 0x3e6b96, 95) -- 1号航母存在
                and isColor(440, 263, 0xffffff, 95) == false -- 没在充电
                and isColor(410, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(491, 119, 0xffffff, 95) == false --不是0级
                and isColor(440, 281, 0xffffff, 95) == false then -- 没在使用
                debugA("1号来充电吧")
                tap1(440, 263)
            elseif isColor(704, 110, 0x3e6b96, 95) -- 2号航母存在
                and isColor(639, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(609, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(690, 119, 0xffffff, 95) == false --不是0级
                and isColor(639, 281, 0xffffff, 95) == false then -- 没在使用
                debugA("2号来充电吧")
                tap1(639, 263)
            elseif isColor(902, 110, 0x3e6b96, 95) -- 3号航母存在
                and isColor(838, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(808, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(888, 119, 0xffffff, 95) == false --不是0级
                and isColor(838, 281, 0xffffff, 95) == false then -- 没在使用
                debugA("3号来充电吧")
                tap1(838, 263)
            elseif isColor(1079, 110, 0x3e6b96, 95) -- 4号航母存在
                and isColor(1036, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(1006, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(1087, 119, 0xffffff, 95) == false --不是0级
                and isColor(1036, 281, 0xffffff, 95) == false then -- 没在使用
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
        elseif isColor(42, 422, 0xa02ae0, 95) and isColor(38, 403, 0xffffff, 95) then
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
    if isColor(33, 45, 0xff6600, 95) and isColor(77, 149, 0x55aeff, 95) and isColor(1094, 559, 0x6e899b, 95) then
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
    elseif isColor(385, 129, 0x2ed4fc, 95) then
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
    elseif isColor(20, 297, 0x24c8e9, 95) or isColor(20, 295, 0x703a0d, 95) then
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
        elseif isColor(858, 106, 0x9d1111, 95) and check22 == "活动" and bRedOut2 == false then -- 1-2红点
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
        elseif isColor(993, 254, 0x9d1111, 95) then -- 2-3红点
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
        if isColor(1093, 82, 0x577ea6, 95) and isColor(1114, 59, 0x354f6a, 95) then
            tap1(1103, 68, 0x0d1828) -- 展开右上角
            tap1(681, 172, 0x1c2b3b) -- 主动技能
        end
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
    isLiZi = false -- 粒子
    isJustBack = true
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
                isLiZi = true
                tap1(172, 525) -- 搜索
            end
        elseif isColor(919, 373, 0xa43b40, 95) and isColor(1028, 386, 0xa43b40, 95) and isColor(643, 371, 0x00ace4, 95) then
            debugA("粒子--右")
            numSearch = numSearch + 1
            tap1(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                isLiZi = true
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
            isLiZi = true -- 粒子
            -- timeLiZi = nowTime
        elseif (isColor(634, 157, 0x38b3c8, 95) and isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95))
            or (isColor(634, 157, 0x38b3ca, 95) and isColor(550, 127, 0xffffff, 95) and isColor(596, 53, 0x5f9ede, 95)) then
            debugA("挖粒子,没航母,航母坏了")
            isShipBad = true
            isLiZi = true -- 粒子
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
            isLiZi = true -- 粒子


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
                isLiZi = false -- 粒子
                numTodayDigLiZi = numTodayDigLiZi - 1
                numDigLiZi = numDigLiZi - 1
            end
            writeJson("今日粒子次数", numTodayDigLiZi)
            writeJson("粒子总次数", numDigLiZi)

        elseif (isColor(634, 157, 0x38b3c8, 95) and isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95))
            or (isColor(634, 157, 0x38b3ca, 95) and isColor(550, 127, 0xffffff, 95) and isColor(596, 53, 0x5f9ede, 95)) then
            debugA("挖粒子,没航母,航母坏了")
            isFalseLiZi2 = false
            isShipBad = true
            isLiZi = true -- 粒子
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
        elseif isLiZi == false then
            tap1(925, 561, 0x1f101d) -- 粒子
            mSleep(1000)
            for i = 0, 1, 1 do
                -- if check20 == "2级粒子" and isFalseLiZi2 == false then
                if check20 == "2级粒子" then
                    if isColor(838, 366, 0xffffff, 95) then --1级
                        tap1(1059, 366) --  +  2级
                    end
                    -- elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    --     if isColor(867, 366, 0xffffff, 95) then --2级
                    --         tap1(785, 366) --  -  1级
                    --     end
                else
                    if isColor(867, 366, 0xffffff, 95) then --2级
                        tap1(785, 366) --  -  1级
                    end
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
        if isColor(210, 377, 0x00ace4, 95) and isColor(267, 378, 0x00798c, 95) and isColor(400, 376, 0xa43b40, 95) then
            debugA("粒子--左")
            numSearch = numSearch + 1
            tap1(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
                end
                tap1(172, 525) -- 搜索
            end
        elseif isColor(733, 377, 0x00ace4, 95) and isColor(798, 378, 0x00798c, 95) and isColor(934, 377, 0xa43b40, 95) then
            debugA("粒子--右")
            numSearch = numSearch + 1
            tap1(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
                end
                tap1(172, 525) -- 搜索
            end
        elseif isColor(125, 322, 0x6416c3, 95) and isColor(151, 305, 0x6918d9, 95) then
            debugA("粒子--左")
            numSearch = numSearch + 1
            tap1(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
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
            tap1(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debugA("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
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
        isLiZi = true
        return true
    end
    if haoLV <= 2 then
        isLiZi = true
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
                    isLiZi = true
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
                    isLiZi = true
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
                    isLiZi = true
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
                    isLiZi = true
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
        isLiZi = false
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
                            isLiZi = true
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
                                isLiZi = true
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
                        isLiZi = true
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
                        isLiZi = true
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
            elseif numXiangMu == 1 and nowTime - timeXiangMu1 >= 20 then
                debugA("项目1 => 项目3")
                numXiangMu = 3
                appXiangMu = "com.wemadeconnect.etgnft.everytown"

                -- local tempStrMuBiao1, tempStrMuBiao2, tempStrMuBiao3 = strMuBiao1, strMuBiao2, strMuBiao3
                -- strMuBiao1, strMuBiao2, strMuBiao3 = muBiaoA1, muBiaoA2, muBiaoA3
                -- writeJson("目标1暂存", strMuBiao1)
                -- writeJson("目标2暂存", strMuBiao2)
                -- writeJson("目标3暂存", strMuBiao3)

                -- gaiMuBiaoNewA(1, tempStrMuBiao1)
                -- gaiMuBiaoNewA(2, tempStrMuBiao2)
                -- gaiMuBiaoNewA(3, tempStrMuBiao3)
                timeXiangMu1 = nowTime + 60 * 60 * 24 --项目1已闲置时间
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
    if haoLV == 3 and check12 ~= "不挖粒子" and numLiZi >= 150000 then
        if isColor(0, 0, 0x904f6b, 95) or isColor(0, 0, 0x95445c, 95) or isColor(0, 0, 0x924963, 95) or
            isColor(0, 0, 0xd13f00, 95) or isColor(0, 0, 0x76151a, 95) or isColor(1135, 639, 0x6a060a, 95) or
            isColor(0, 0, 0xb00101, 95) then
            debugA("被攻击,秒数:" .. nowTime - timeBeAttack2)
            if isAttacked == false then
                isAttacked = true
                timeAttacked = nowTime
            end
            if nowDateTime.hour >= 8 then
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
    if (isColor(964, 581, 0xa55927, 95) and isColor(1018, 543, 0x744218, 95) and isColor(1058, 581, 0xffffff, 95)) or
        (isColor(964, 581, 0xa74f22, 95) and isColor(1018, 543, 0x7b3b15, 95) and isColor(1058, 581, 0xf5dddd, 95)) then
        debugA("基地内--战备")
        -- mSleep(3000)
        if muBiaoA == "战备" and isColor(928, 51, 0x960f11, 95) then
            debugA("瞭望塔")
            tap(887, 68)
            mSleep(2000)
            if isColor(161, 569, 0xf6e1e1, 95) then
                debugA("攻击2")
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 296, 0xf8e7e7, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "战备跑路")
                isAttacked = false
                timeAttacked = nowTime
            elseif isColor(151, 261, 0xfcf7f7, 80) then
                debugA("侦察")
                tap1(486, 82, 0xfcf6f6)
                mSleep(1000)
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 296, 0xf8e7e7, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "")
            elseif isColor(452, 247, 0xdec9c6, 95) then
                debugA("矿被打")
                tap1(486, 82, 0xfcf6f6)
                mSleep(1000)
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 296, 0xf8e7e7, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "")
            elseif isColor(160, 276, 0xfbf1f1, 80) then
                debugA("攻击")
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 296, 0xf8e7e7, 90) == false then
                        break
                    end
                    tap1(20, 20)
                    mSleep(1000)
                end
                gaiMuBiaoNewA(4, "战备跑路")
                isAttacked = false
                timeAttacked = nowTime
            else
                tap1(20, 20)
                for i = 1, 10, 1 do
                    if isColor(61, 296, 0xf8e7e7, 90) == false then
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
            --     gaiMuBiaoNew(4, "战备跑路")
            -- else
            --     tap1(20, 20)
            --     gaiMuBiaoNew(4, "")
            -- end
        elseif muBiaoA == "战备跑路" then
            debugA("展开菜单栏")
            tap1(1094, 80, 0x626e91) --展开
            mSleep(1000)
            tap1(687, 180, 0x6c7582) --主动技能
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
                tap1(573, 258, 0xd2a414) --使用技能--召回
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
            tap1(964, 581, 0xa74f22) --背包
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
        elseif isColor(1104, 130, 0x369469, 95) and isColor(1125, 106, 0x9e1111, 95) then
            debugA("航母--红点")
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
        debugA("领取1--新")
        tap1(1000, 281)
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
    else
        -- elseif bid == "" then
        debugC("哪个都没开")
        APP.isYiDengLu = 0
        runApp(appXiangMu)
        APP = APP1
        mSleep(1000 * 15)
    end
    m_iRunCount = m_iRunCount + 1

    -- local numStr1 = dmOcrText(index_dm_numNumber, 61, 405, 1049, 426, "DCD7D9,232826", 95)
    -- local numStr2 = dmOcrText(index_dm_numNumber, 61, 520, 1049, 544, "DCD7D9,232826", 95)
    -- debug(numStr1)
    -- mSleep(100)
    -- debug(numStr2)
    -- lua_exit()

    isFarm()
    zongHe3()
    time_task()
    sell()
    -- findFarm()
    findHouse()
    -- autoVpn()
    autoUnlockDevice()
    -- zongHe_Mult()
    -- zongHe_Screen()
    doTarget3()
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
    if isColor(522, 593, 0xebe3d2, 95) then
        debugC("误开实景界面")
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
        if isColor(34, 557, 0xec6f8e, 95) and isColor(59, 568, 0x7e5242, 95) and isColor(55, 583, 0xffe3d9, 95) then
            -- debug("isFarm判断")
        else
            tap1(1135, 0)
        end
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
            runApp("com.apple.calculator")
            mSleep(1000)
            return false
        end
        return true
    end
end

--找原点
function findHouse()
    if farmLong == 30 and isColor(1134, 629, 0x8ebb64, 95) and isColor(1127, 638, 0xa8d481, 95) then
        debugC("30x30初始画面")
        moveTo(567 - 30, 226 - 30, 484 - 30, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 28 and isColor(1124, 633, 0x8ec06d, 95) and isColor(1134, 628, 0xa4d282, 95) then
        debugC("28x28初始画面")
        moveTo(567 - 30, 226 - 30, 484 - 30, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 32 and isColor(105, 633, 0x96c672, 95) and isColor(96, 626, 0xa5d384, 95) then
        debugC("32x32初始画面")
        moveTo(567 - 30, 226 - 30, 484 - 30, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    elseif farmLong == 26 and isColor(210, 200, 0xabc191, 95) and isColor(1130, 262, 0x558d71, 95) then
        debugC("26x26初始画面")
        moveTo(567 - 30, 226 - 30, 484 - 30, 148 - 30, { ["step"] = 3, ["ms"] = 70, ["stop"] = 1 })
        numOriginX = 0
        numOriginY = 0
        writeJson("原点X", numOriginX)
        writeJson("原点Y", numOriginY)
    end
    if isColor(522, 593, 0xebe3d2, 95) then
        debugC("误开实景界面")
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
            runApp("com.apple.calculator")
            return 0, 0
        end
    else
        return numOriginX, numOriginY
    end
end

--找农田
function findFarm()
    local x, y = findHouse()
    if x > 0 then
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
                                touchMoveXY(801, 321, 499, 321)
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
    elseif muBiaoC == "挂机" or muBiaoC == "种植" or muBiaoC == "等待收割" then
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

-- task3_挂机
function task3_guaJi()
    if muBiaoC == "挂机" then
        gaiMuBiaoNewC(2, "种植")
        debugC("改目标为种植2")
    elseif muBiaoC == "种植" then
        if findHouse() > 0 then
            -- if nowTime - timeDecideIsFarm >= 20 then
            --     timeDecideIsFarm = nowTime
            --     if isFarm() then
            --     else
            --         return
            --     end
            -- end
            farmX = 567 / farmLong
            farmY = 284 / farmLong
            x0 = math.floor(568 / farmLong * 2)
            y0 = math.floor(284 / farmLong * 2)
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
                            if checkGuoShi == "检查果实" then
                                tap1(1077, 592, 0xd6915e) --Tool Box
                                mSleep(1000)
                                tap1(559, 572, 0xc47b5c) --sell
                                mSleep(1000)
                                for i = 1, 10, 1 do
                                    if isColor(138, 350, 0x6fb644, 95) == false then --不为蔬菜
                                        tap1(176, 358, 0xcfaf8b) --all
                                        tap1(333, 328, 0x6fb644) --crop
                                    else
                                        break
                                    end
                                    mSleep(1000)
                                end

                                isZhiDingFruit = false
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
                                tap1(1088, 303, 0xbebebd) --关闭
                            end

                            tap1(902, 587, 0xce4f37) --shop
                            tap1(895, 457, 0xe3806c) --shop
                            -- tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                            for l = 1, 10, 1 do
                                if isColor(1088, 46, 0xffffff, 95) then
                                    break
                                else
                                    tap1(902, 587, 0xce4f37) --shop
                                    tap1(895, 457, 0xe3806c) --shop
                                end
                                mSleep(1000)
                            end
                            if isColor(262, 128, 0xf0404a, 95) == false then
                                tap1(262, 128) --种植选项
                            end
                            if check4 ~= "测试" then
                                if isZhiDingFruit == false then
                                    for m = 1, 50, 1 do
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
                                            for l = 1, 10, 1 do
                                                tap(x0 - 292, y0, { ["ms"] = 300 })
                                                mSleep(1000)
                                                if isColor(1089, 47, 0xffffff, 95) == false then
                                                    break
                                                end
                                            end
                                            break
                                        else
                                            touchMoveXY(801, 321, 499, 321)
                                            mSleep(1000)
                                        end
                                    end
                                else
                                    if isColor(1, 629, 0x5f5a51, 95) == false then --滚动条不在左边
                                        tap1(1050, 204, 0x89663e) --sort
                                        tap1(944, 174, 0x4c94ff) --等级排序
                                    end
                                    for m = 1, 50, 1 do
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
                                            timeCollectInterval = 90
                                        end
                                        if x0 > 0 then
                                            -- luaExit()
                                            for l = 1, 10, 1 do
                                                tap(x0, y0, { ["ms"] = 300 })
                                                mSleep(1000)
                                                if isColor(1089, 47, 0xffffff, 95) == false then
                                                    break
                                                end
                                            end
                                            break
                                        else
                                            touchMoveXY(801, 321, 499, 321)
                                            mSleep(1000)
                                        end
                                    end
                                end
                            else
                                for l = 1, 10, 1 do
                                    tap(452, 398, { ["ms"] = 300 }) --卷心菜
                                    mSleep(1000)
                                    if isColor(1089, 47, 0xffffff, 95) == false then
                                        break
                                    end
                                end
                                mSleep(1000)
                                timeCollectInterval = 33
                            end
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
            runApp("com.apple.calculator")
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
        if findHouse() > 0 then
            if watering() then
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xffffff, "-10|-10|0xffffff,9|-10|0xffffff", 100, 86, 96, 1045, 547) --气泡
            if x > 0 then
                -- debug("气泡")
                tap1(x, y - 90)
                timeDecideIsFarm = nowTime
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xd64428, "23|-6|0xc28d5e,563|-429|0xffffff", 90, 86, 96, 1045, 547) --请求
            if x > 0 then
                -- debug("请求")
                tap1(x, y)
                tap1(x + 98, y - 32)
                timeDecideIsFarm = nowTime
                return
            end
            x, y = findMultiColorInRegionFuzzy(0xd64428, "23|-2|0xbf8b5c,23|-14|0xc08e5c,0|13|0xddb883", 90, 86, 96, 1045
                , 547) --援助
            if x > 0 then
                -- debug("援助")
                tap1(x, y)
                timeDecideIsFarm = nowTime
                return
            end
            if nowTime - timeCollect > 0 then
                findHouse()
                farmX = 567 / farmLong
                farmY = 284 / farmLong
                x0 = math.floor(568 / farmLong * 2)
                y0 = math.floor(284 / farmLong * 2)
                -- moveTowards(numOriginX - math.floor(farmX * 4), numOriginY + math.floor(farmY * 4), -26.56, 635)
                -- debug("farmX farmY x0 y0:" .. farmX .. "," .. farmY .. "," .. x0 .. "," .. y0)
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
                    debugC("项目3 => 项目1")
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
        tap1(1135, 0)
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
    if watering() == false then
        if findHouse() > 0 then
            farmX = 567 / farmLong
            farmY = 284 / farmLong
            x0 = math.floor(568 / farmLong * 2)
            y0 = math.floor(284 / farmLong * 2)
            for i = 1, farmLong - 1, 2 do
                if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                    tap1(723, 106)
                end
                watering()
                realX1 = math.floor(numOriginX + (i - 1) * farmX - (1 - 1) * farmX)
                realY1 = math.floor(numOriginY + (1 - 1) * farmY + (i - 1) * farmY + 12)
                if isColor(realX1, realY1, 0x55ff25, 95) then --地为绿色
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
            for i = 1, farmLong - 1, 2 do
                if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                    tap1(723, 106)
                end
                watering()
                realX1 = math.floor(numOriginX + (i - 1) * farmX - (5 - 1) * farmX)
                realY1 = math.floor(numOriginY + (5 - 1) * farmY + (i - 1) * farmY + 12)
                if isColor(realX1, realY1, 0x55ff25, 95) then --地为绿色
                    tap(realX1, realY1, { ["ms"] = 300, ["pic"] = "click_point_4_2.png" })
                    mSleep(1000)
                end
                if isColor(724, 106, 0xffffff, 95) then --果树信息
                    tap1(724, 106)
                end
            end
            if Ccheck1 == "4排为树" then
                for i = 1, farmLong - 1, 2 do
                    if isColor(723, 106, 0xffffff, 95) and isColor(738, 106, 0x73555b, 95) then --误开地块详细信息
                        tap1(723, 106)
                    end
                    watering()
                    realX1 = math.floor(numOriginX + (i - 1) * farmX - (7 - 1) * farmX)
                    realY1 = math.floor(numOriginY + (7 - 1) * farmY + (i - 1) * farmY + 12)
                    if isColor(realX1, realY1, 0x55ff25, 95) then --地为绿色
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
            for i = 1, 10, 1 do
                if isColor(138, 350, 0x6fb644, 95) == false then --不为蔬菜
                    tap1(176, 358, 0xcfaf8b) --all
                    tap1(333, 328, 0x6fb644) --crop
                else
                    break
                end
                mSleep(1000)
            end
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
            for i = 1, 10, 1 do
                if isColor(141, 363, 0xe6515a, 95) == false then --不为tree
                    tap1(176, 358, 0xcfaf8b) --all
                    tap1(528, 325, 0xe6515a) --tree
                else
                    break
                end
                mSleep(1000)
            end
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
            for i = 1, 10, 1 do
                if isColor(152, 368, 0xeb573c, 95) == false then --不为Special shop
                    tap1(176, 358, 0xcfaf8b) --all
                    tap1(333, 456, 0xdb9d68) --Special shop
                else
                    break
                end
                mSleep(1000)
            end
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
